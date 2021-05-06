const passport = require('passport');
const Strategy = require('passport-local').Strategy;

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
passport.use('local.signin', new Strategy({
    usernameField: 'Usuario',
    passwordField: 'Password',
    passReqToCallback: true
}, async (req, Usuario, Password, done) => {
    const row = await pool.query('select * from usuario where usuario.Usuario = ?', [Usuario]);
    console.log("Resultado de Busqueda");
    console.log(row.length);
    if (row.length > 0) {
        const user = row[0];
        console.log("Datos de Consulta");
        console.log(user)
        console.log(user.id_Usuario)
        const validaUser = await helpers.macthPassword(Password, user.Password);
        if (validaUser) {
            console.log('entro')
            await pool.query("select * from variables_usuario where Id_Usuario = ?", [user.id_Usuario], async (err, result) => {
                if (err) {
                    console.log(err);
                    done(null, false);
                } else {
                    if (result.length < 1) {
                        console.log("no encontro nada");
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
                        console.log(Persona)
                        done(null, user);
                    }
                }
            });
        } else {
            console.log('no entro')
            done(null, false);
        }
    } else {
        console.log('no hizo')
        done(null, false);
    }
}));

// -------- Registrar un SuperUsuario ------------
passport.use('local.signup', new Strategy({
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
    await pool.query('select * from usuario where id_Usuario = ?', [id.id], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            done(null, result);
        }
    });
});