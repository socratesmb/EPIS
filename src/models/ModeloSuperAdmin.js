const pool = require('../database/database');
const helpers = require('../controllers/helper');
const randomstring = require('randomstring');
const { body } = require('express-validator');

const model = {};

// -------------- Seccion de Arreglos para Datos -----------------
//#region 
let alerta = {
    tipo: '',
    mensaje: ''
};
 
let Persona = {
    Nombre: '',
    Apellidos: '',
    TipoIdentificacion: '',
    Identificacion: '',
    Telefono: '',
    Correo: '',
    Contraseña: '',
    TipoUsuario: '',
    Estado: ''
};

let variables = {
    Ruta_Form: '/supadmin/regis_user',
    Titulo: 'Registro Usuario',
    Boton: 'Registrar Usuario'
};

let Id_Usuario = '';
//#endregion

// ----- Seccion Cargar Vista de Creacion Super Admin -----

model.origen = async (req, res) => {
    res.render('creacion.html');
}

// ----- Cargar Vista Principal de Inicio de Session -----
model.inicio = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    console.log("ID de la sesion: " + req.sessionID);
    console.log(req.session);

    res.render('SuperAdmin/inicio.html', { datos, menu });
};


//--------- Modelo para Cargar Vista y Procesos de Usuarios ----------------
//#region 

model.usuarios = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const identif = await pool.query("select * from identificacion");
    const rol = await pool.query("select * from rol");
    const tusuario = await pool.query("select * from lista_usuarios");

    res.render('SuperAdmin/entidades.html', { datos, menu, alerta, identif, rol, variables, tusuario, Persona });

    LimpiarVariables();
};

model.registro_usuario = async (req, res) => {

    const valid = await pool.query("select * from persona where persona.Identificacion = " + req.body.IdentificacionUsuario);

    if (valid.length > 0) {
        alerta = {
            tipo: 'inseguro',
            mensaje: 'El Usuario Ya Esta Registrado En El Sistema, No Se Puede Registrar Un Usuario 2 Veces'
        };
        res.redirect('/supadmin/registro');

    } else {
        var password = req.body.PasswordUsuario;
        var contrasena = await helpers.encryptPassword(password);
        console.log('Contrase Ingresada:' + password);
        console.log('Contrase cifrada:' + contrasena);


        await pool.query("call Registro_Usuarios('" + req.body.NombreUsuario + "', '" + req.body.ApellidoUsuario + "', " + req.body.TIdentificacion + ", '" + req.body.IdentificacionUsuario + "', '" + req.body.TelefonoPersona + "', '" + req.body.CorreoPersona + "', '" + req.body.contrasena + "', " + req.body.TipoUsuario + ");", (err, result) => {
            if (err) {
                console.log(err)
                alerta = {
                    tipo: 'peligro',
                    mensaje: err
                }; 

                res.redirect('/supadmin/registro');
            } else {
                console.log('Resultado de la creacion de la entidad: ' + result);

                alerta = {
                    tipo: 'correcto',
                    mensaje: 'Nuevo Usuario Creado Correctamente'
                };

                res.redirect('/supadmin/registro');
            }
        });
    };
};

model.buscar_usuario = async (req, res) => {
    const { Id_User } = req.params;
    Id_Usuario = Id_User;
    console.log('LLego aca' + Id_Usuario + Id_User)
    await pool.query("select * from datos_usuarios where Id_User = " + Id_User, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: err
            };

            res.redirect('/supadmin/registro');
        } else {
            console.log(result)

            Persona = {
                Nombre: result[0].Nombre,
                Apellidos: result[0].Apellido,
                TipoIdentificacion: result[0].TIdentificacion,
                Identificacion: result[0].Identificacion,
                Telefono: result[0].Telefono,
                Correo: result[0].Correo,
                Contraseña: 'xxxx',
                TipoUsuario: result[0].TipoUsuario,
                Estado: 'disabled'
            };

            variables = {
                Ruta_Form: '/supadmin/actualizar_usuario',
                Titulo: 'Actualizacion de Usuario',
                Boton: 'Actualizar Usuario'
            }

            res.redirect('/supadmin/registro');
        }
    });
};

model.actualizar_usuario = async (req, res) => {
    console.log("Id del Usuario " + Id_Usuario);

    let ccs = await pool.query("select persona.Identificacion, usuario.id_Usuario from persona inner join usuario on usuario.Persona_id_Persona = persona.id_Persona where persona.id_Persona = " + Id_Usuario);

    await pool.query("update persona set persona.Nombre = '" + req.body.NombreUsuario + "', persona.Apellido = '" + req.body.ApellidoUsuario + "', persona.Identificacion_id_Identificacion = " + req.body.TIdentificacion + ", persona.Identificacion = '" + req.body.IdentificacionUsuario + "' ,persona.Correo_Electronico = '" + req.body.CorreoPersona + "', persona.Telefono = '" + req.body.TelefonoPersona + "' where persona.id_Persona = " + Id_Usuario, async (err, result) => {
        if (err) {
            console.log(err)
            Id_Usuario = '';
            LimpiarVariables();
            alerta = {
                tipo: 'peligro',
                mensaje: "No Se Pudo Actualizar El Usuario" + err
            };
            res.redirect('/supadmin/registro');
        } else {
            if (ccs[0].Identificacion != req.body.IdentificacionUsuario) {
                await pool.query("update usuario set usuario.Usuario = '" + req.body.IdentificacionUsuario + "' where usuario.id_Usuario = " + ccs[0].id_Usuario);
                Id_Usuario = '';
                LimpiarVariables();
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'Datos Modificados Correctamente Y Usuario se modifico'
                };
            } else {
                Id_Usuario = '';
                LimpiarVariables();
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'Datos Modificados Correctamente'
                };
            }
            res.redirect('/supadmin/registro');
        }
    });

};

model.desactivar_usuario = async (req, res) => {
    const { Id_User } = req.params;

    await pool.query("update registro_ep set registro_ep.Estado = 'INACTIVA' where registro_ep.Persona_id_Persona =" + Id_User, (err, result) => {
        if (err) {
            console.log(err)
            Id_Usuario = '';
            LimpiarVariables();
            alerta = {
                tipo: 'peligro',
                mensaje: err
            };

            res.redirect('/supadmin/registro');
        } else {
            Id_Usuario = '';
            LimpiarVariables();
            alerta = {
                tipo: 'correcto',
                mensaje: 'Usuario Desactivado Correctamente'
            };
            res.redirect('/supadmin/registro');
        }
    })
};

model.cancelar_usuario = async (req, res) => {
    LimpiarVariables();
    Id_Usuario = '';
    res.redirect('/supadmin/registro');
};

//#endregion

// --------- Seccion para ver bodega y sus productos ----------
//#region 
model.bodega = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const ArrayBodegas = await pool.query('select * from bodega where Entidad_id_Entidad =' + datos.Id_Entidad + ' and bodega.Estado = "ACTIVA";');

    res.render('SuperAdmin/bodega.html', { datos, menu, alerta, ArrayBodegas });

    LimpiarVariables();
};

model.crear_bodega = async (req, res) => {
    datos = req.session.datos;

    await pool.query("insert into `bodega` (`id_Bodega`, `Cod_Bodega`, `Nombre`, `Tipo_Bodega`, `Estado`, `Entidad_id_Entidad`) values (default, '" + req.body.CodigoBodega + "', '" + req.body.NombreBodega + "', '" + req.body.TipoBodega + "', 'ACTIVA', " + datos.Id_Entidad + ");", (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'error' + err
            };
            res.redirect('/supadmin/bodega');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'Bodega Creada Correctamente'
            };
            res.redirect('/supadmin/bodega');
        }
    });
};

model.desactivar_bodega = async (req, res) => {
    const { id_Bodega } = req.params;
    await pool.query("update bodega set bodega.Estado = 'INACTIVA' where bodega.id_Bodega =" + id_Bodega, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'error' + err
            };
            res.redirect('/supadmin/bodega');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'Bodega Desactivada'
            };
            res.redirect('/supadmin/bodega');
        }
    });
}

model.ver_bodega = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const { Id_Grupo } = req.params;
    IDG = Id_Grupo;

    const ArrayEstudiantes = await pool.query("select * from Lista_Estudiantes_Grupos where Id_Grupo = " + Id_Grupo);

    res.render('Docente/listagrupos.html', { datos, menu, ArrayEstudiantes, alerta });
    LimpiarVariables();
}
//#endregion

//------- Funciones de Limpieza de Variables ----------
//#region 
function LimpiarVariables() {
    alerta = {
        tipo: '',
        mensaje: ''
    };

    variables = {
        Ruta_Form: '/supadmin/regis_user',
        Titulo: 'Registro Usuario',
        Boton: 'Registrar Usuario'
    };

    Persona = {
        Nombre: '',
        Apellidos: '',
        TipoIdentificacion: '',
        Identificacion: '',
        Telefono: '',
        Correo: '',
        Contraseña: '',
        TipoUsuario: '',
        Estado: ''
    };

};
//#endregion
module.exports = model;