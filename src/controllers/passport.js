const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database/database');
const helpers = require('./helper');

// ------------ Variables de Usuario Estaticas -------------

let Persona = {
    Id_Usuario: '',
    Id_Entidad: '',
    Nombre_Entidad: '',
    Nit_Entidad: '',
    Id_Empleado: '',
    Nombre_Usuario: '',
    Ident_Usuario: '',
    Tipo_Usuario: ''
};

// ------------- Iniciar Sesion ------------ 
passport.use('local.signin', new LocalStrategy({
    usernameField: 'Usuario',
    passwordField: 'Password',
    passReqToCallback: true
}, async (req, Usuario, Password, done) => {
    await pool.query('select * from usuario where usuario.Usuario = ?', [Usuario], async (err, resul) => {
        if (err) {
            done(true, null);
        } else {
            if (resul[0]) {
                const user = resul[0];
                const validaUser = await helpers.macthPassword(Password, user.Password);
                if (validaUser) {
                    console.log('entro')
                    await pool.query("select * from variables_usuario where Id_Usuario = ?", [user.id_Usuario], async (err, result) => {
                        if (err) {
                            console.log(err);
                            done(null, null, true);
                        } else {
                            if (result.length < 1) {
                            } else {
                                Persona = {
                                    Id_Usuario: result[0].Id_Usuario,
                                    Id_Entidad: result[0].Id_Entidad,
                                    Nombre_Entidad: result[0].Nombre_Entidad,
                                    Nit_Entidad: result[0].Nit_Entidad,
                                    Id_Empleado: result[0].Id_Empleado,
                                    Nombre_Usuario: result[0].Nombre_Usuario,
                                    Ident_Usuario: result[0].Ident_Usuario,
                                    Tipo_Usuario: result[0].Tipo_Usuario
                                };
                                req.session.datos = Persona;
                                await pool.query("insert into aud_conexion values (null, '" + req.session.datos.Nombre_Usuario + "', user(), now())");
                                done(false, user);
                            }
                        }
                    });
                } else {
                    console.log('no entro')
                    done(true, null, null);
                }
            } else {
                console.log('no hizo')
                done(true, null, null);
            }
        }
    });
}));

// -------- Registrar un SuperUsuario ------------
passport.use('local.signup', new LocalStrategy({
    usernameField: 'Usuario',
    passwordField: 'Password',
    passReqToCallback: true
}, async (req, Usuario, Password, done) => {
    let newUser = {
        Usuario,
        Password
    };
    console.log('Datos ingresdaos');
    console.log(newUser);
    newUser.Password = await helpers.encryptPassword(Password);
    //Guardamos Datos    
    const consulta = "INSERT INTO usuario (id_Usuario, Usuario, Password, Persona_id_Persona) values (default,'" + newUser.Usuario + "','" + newUser.Password + "', '1');";
    console.log(consulta)
    const result = await pool.query(consulta);
    newUser.id = result.insertId;
    console.log('Resultao del id')
    console.log(newUser.id)
    return done(null, newUser);
}));

// ------ Codificar el Usuario --------
passport.serializeUser((user, done) => {
    console.log('Entro a serializar el usuario');
    done(null, user);
});

// ----- Descodificar el usuario ------
passport.deserializeUser(async (id, done) => {
    await pool.query('select * from usuario where id_Usuario = ?', [id.id_Usuario], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            done(null, result);
        }
    });
});