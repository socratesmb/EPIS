const pool = require('../database/database');
const randomstring = require('randomstring');
const helpers = require('../controllers/helper');

const model = {};

// -------------- Seccion de Arreglos para Datos
//#region 
let alerta = {
    tipo: '',
    mensaje: ''
};

let Perfil = {
    Nombre: '',
    Apellido: '',
    No_Documento: '',
    Correo: '',
    Telefono: '',
    Usuario: '',
    Entidad: '',
    Tipo_Usuario: ''
}
//#endregion

//------------ Seccion para Cargar Vista Principal y Accion de cerrar session -----------

model.salir = (req, res) => {
    req.session.destroy(() => {
        req.logOut();
        res.clearCookie('CookieSession');
        res.status(200);
        res.redirect('/');
    });
};

//------------- Seccion de Login, Registro y Recuperacion de Password ---------------
//#region 
model.login = async (req, res) => {
    res.render('login.html', { alerta });
    LimpiarVariables();
};

model.recovery = async (req, res) => {
    res.render('recovery.html', { alerta });
    LimpiarVariables();
};

model.registro = async (req, res) => {
    const entidades = await pool.query("select entidad.Id_Entidad as Id_Entidad, entidad.Nombre as Nombre_Entidad from entidad");
    const identi = await pool.query("select * from identificacion where identificacion.Estado = 'ACTIVO'");

    res.render('registro.html', { alerta, entidades, identi });
};

model.recuperar_password = async (req, res) => {
    console.log(req.body.email);
    console.log(req.body.identificacion);

    await pool.query("select persona.Correo_Electronico, usuario.Id_Usuario from persona inner join usuario on usuario.Persona_Id_Persona = persona.Id_Persona where persona.Correo_Electronico = '" + req.body.email + "' and persona.Identificacion = " + req.body.identificacion, async (err, result) => {
        if (err) {
            alerta = {
                tipo: 'inseguro',
                mensaje: 'El Usuario No Esta Registrado En Sistema',
            }
            res.redirect('/recovery');
        } else {
            console.log(result)
            if (result[0].Correo_Electronico == req.body.email) {
                var newpassword = randomstring.generate(6);
                var contrasena = await helpers.encryptPassword(newpassword);

                await pool.query("update usuario set usuario.Password = '" + contrasena + "' where usuario.Id_Usuario =" + result[0].Id_Usuario, async (erro, reulta) => {
                    if (err) {
                        console.log("Fallo de Modificacion" + err);
                    } else {
                        //correo.PasswordCorreo(req.body.email, req.body.identificacion, newpassword);

                        alerta = {
                            tipo: 'correcto',
                            mensaje: 'El Usuario y Contraseña Fue Enviado al Correo, Porfavor Revise en Spam o Correo No Deseado',
                        }
                        res.redirect('/recovery');
                    }
                });
            }
        }
    });

};

model.registro_usuario = async (req, res) => {
    var contrasena = await helpers.encryptPassword(req.body.ContraseñaRegistro);

    await pool.query("call Registro_Usuario('" + req.body.NombreRegistro + "', '" + req.body.ApellidoRegistro + "', " + req.body.TipoDocumento + ", " + req.body.NumeroDocumento + ", '" + req.body.CorreoPerfil + "', " + req.body.Entidad + ", '" + contrasena + "')", async (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al registrar el Usuario' + err
            }
            res.redirect('/registro');
        } else {
            //correo.RegistroUsuario(req.body.CorreoPerfil, req.body.NumeroDocumento, req.body.ContraseñaRegistro);
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Usuario Ha Sido Creado, Por favor Revise Su Correo En Sección De Spam O No Deseados.'
            }
            res.redirect('/registro');
        }
    });
};
//#endregion

//------------ Seccion de Perfil, Actualizacion y Cambio de Password --------------
//#region 

model.perfil = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const consulta = await pool.query("select persona.Nombre as Nombre, persona.Apellido as Apellido, persona.Identificacion as No_Documento, persona.Correo_Electronico as Correo, persona.Telefono as Telefono, usuario.Usuario as Usuario, entidad.Nombre as Entidad, rol.Nombre as TipoUsuario from persona inner join usuario on usuario.Persona_id_Persona = persona.id_Persona inner join registro_ep on registro_ep.Persona_id_Persona = persona.id_Persona inner join entidad on entidad.id_Entidad = registro_ep.Entidad_id_Entidad inner join rol on rol.id_Rol = registro_ep.Rol_id_Rol where persona.id_Persona =" + datos.Id_Empleado);

    Perfil = {
        Nombre: consulta[0].Nombre,
        Apellido: consulta[0].Apellido,
        No_Documento: consulta[0].No_Documento,
        Correo: consulta[0].Correo,
        Telefono: consulta[0].Telefono,
        Usuario: consulta[0].Usuario,
        Entidad: consulta[0].Entidad,
        Tipo_Usuario: consulta[0].TipoUsuario
    }

    res.render('General/perfil.html', { datos, menu, Perfil, alerta });
    LimpiarVariables();
};

model.perfil_update = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    console.log(datos);

    await pool.query("update persona set persona.Nombre = '" + req.body.NombrePerfil + "', persona.Apellido = '" + req.body.ApellidoPerfil + "', persona.Correo_Electronico = '" + req.body.CorreoPerfil + "', persona.Telefono = '" + req.body.TelefonoPerfil + "' where persona.id_Persona =  " + datos.Id_Empleado, (err, result) => {
        if (err) {
            alerta = {
                tipo: 'peligro',
                mensaje: 'No Se Puedo Actualizar Los Datos'
            };
            res.redirect('/perfil');
        } else {
            alerta = {
                tipo: 'correcto',
                mensaje: 'Actualización Exitosa'
            };
            res.redirect('/perfil');
        }
    });
}

model.password_update = async (req, res) => {
    datos = req.session.datos;

    await pool.query("select usuario.Password from usuario where usuario.id_Usuario = " + datos.Id_Usuario, async (err, result) => {
        console.log(result)
        if (err) {
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error en el proceso'
            }
            res.redirect('/perfil');
        } else {
            const pass = req.body.ContraseñaPerfil;

            const validaUser = await helpers.macthPassword(pass, result[0].Password);
            console.log(validaUser)
            if (validaUser) {
                var newpassword = req.body.ContraNuevaPerfil;
                var contrasena = await helpers.encryptPassword(newpassword);
                await pool.query("update usuario set usuario.Password = '" + contrasena + "' where usuario.id_Usuario = " + datos.Id_Usuario, (err, result) => {
                    if (err) {
                        alerta = {
                            tipo: 'peligro',
                            mensaje: 'Error al Cambiar la Contraseña' + err
                        }
                        console.log(err)
                        res.redirect('/perfil');
                    } else {
                        alerta = {
                            tipo: 'correcto',
                            mensaje: 'Contraseña Modificada Correctamante'
                        }
                        res.redirect('/perfil');
                    }
                });
            } else {
                alerta = {
                    tipo: 'inseguro',
                    mensaje: 'Contraseña Incorrecta'
                }
                res.redirect('/perfil');
            }
        }
    })
};
//#endregion

//------- Funciones de Limpieza de Variables ----------
//#region 
function LimpiarVariables() {
    alerta = {
        tipo: '',
        mensaje: ''
    }
}
//#endregion

module.exports = model;
