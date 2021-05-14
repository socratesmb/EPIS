const express = require('express');
const rutas = express.Router();
const passport = require('passport');

// ---------- Controladores --------------
const controlSuperAdmin = require('../models/ModeloSuperAdmin');
const controlAdmin = require('../models/ModeloAdministrador');
const controlGeneral = require('../models/ModeloGeneral');
const controlValidacion = require('../controllers/validate');
const controlDocen = require('../models/ModeloPasante');
const controlValidate = require('../models/ModeloEmpleado');

//--------- Seccion Del Super Administrador ----------------
//#region 

//------------ Ruta para la creacion del super admin ------------
rutas.get('/0101/creacion', controlSuperAdmin.origen);

// -------- Ruta para enviar datos a la creacion del SA ---------
rutas.post('/0101/add', passport.authenticate('local.signup', {
    successRedirect: '/0101/creacion',
    failureRedirect: '/',
    failureFlash: true
}));
//#endregion

//--------- Seccion para el Inicion de Sesion ------------
//#region 
//----- Carga Vista Principal Login ----- 
rutas.get('/', controlGeneral.login);

//----- Metodo para iniciar sesion ------
rutas.post('/signin', controlValidacion.inicio);

//----- Cerrar sesion y salir -----
rutas.get('/salir', controlGeneral.salir);

//#endregion

rutas.get('/hola', (req, res) => {
    res.render('index.html');
})

// ------- Seccion de Super Administrador -------------
//#region 
//----- Cargar Vista Inicio -----
rutas.get('/supadmin/home', controlSuperAdmin.inicio);

//----- Cargar Vista Registro Usuarios -----
rutas.get('/supadmin/registro', controlSuperAdmin.usuarios);

//----- Modelo para registrar un nuevo usuario -----
rutas.post('/supadmin/regis_user', controlSuperAdmin.registro_usuario);

//----- Modelo para buscar un usuario -----
rutas.get('/supadmin/buscar_usuario/:Id_User', controlSuperAdmin.buscar_usuario);

//----- Modelo para actualizar un usuario -----
rutas.post('/supadmin/actualizar_usuario', controlSuperAdmin.actualizar_usuario);

//----- Modelo para desactivar un usuario -----
rutas.get('/supadmin/desactivar_usuario/:Id_User', controlSuperAdmin.desactivar_usuario);

//----- Modelo para cancelar procesos ----- 
rutas.get('/supadmin/cancelar', controlSuperAdmin.cancelar_usuario);
//#endregion


/* ------- Seccion de Administrador -------------

rutas.get('/admin/inicio', controlGeneral.inicio);

rutas.get('/admin/empresa', controlAdmin.empresa);

rutas.post('/admin/empresa/actualizar', controlAdmin.actualizar_entidad);

rutas.get('/admin/docentes', controlAdmin.docente);

rutas.post('/admin/docente/creacion', controlAdmin.registro_docente);

rutas.get('/admin/docente/buscar_docente/:Id_Persona', controlAdmin.buscar_docente);

rutas.post('/admin/docente/actualizacion', controlAdmin.actualizar_docente);

rutas.get('/admin/docente/bloquear_docente/:Id_Persona', controlAdmin.desactivar_docente);

rutas.get('/admin/cancelar', controlAdmin.Cancelar_Docente);

rutas.get('/admin/modelos', controlGeneral.Modelo3D);
// ------- Seccion de Docente --------------

rutas.get('/docente/grupos', controlDocen.grupos);

rutas.post('/docente/grupos/agregar', controlDocen.agregar_grupos);

rutas.get('/docente/grupos/ver/:Id_Grupo', controlDocen.lista_grupos);

rutas.get('/docente/grupos/eliminar/:Id_Grupo', controlDocen.desactivar_grupo);

rutas.get('/docente/grupos/estudiante/:Id_InsGrupo', controlDocen.quitar_estudiante);

rutas.get('/docente/actividades', controlDocen.actividades);

rutas.post('/docente/actividades/guardar', controlDocen.guardar_actividad);

rutas.get('/docente/informes', controlDocen.informes);

rutas.get('/docente/informes/ver/:Id_Grupo', controlDocen.info_notas);

// ------- Seccion de Estudiante --------------

rutas.get('/models/inicio', controlGeneral.inicio);

rutas.get('/estudiante/actividades', controlEstud.actividades);

rutas.post('/estudiante/grupos/agregar', controlEstud.registro_grupo);

rutas.get('/estudiante/grupos/salir/:Id_Grupo', controlEstud.salir_grupo);

rutas.get('/estudiante/grupos/ver/:Id_Grupo', controlEstud.cargar_actividad);

rutas.post('/estudiante/actividades/guardar', controlEstud.guardar_actividad);

*/

// ------- Seccion Vistas Generales -------------

rutas.get('/perfil', controlGeneral.perfil);

rutas.post('/perfil/actualizar_perfil', controlGeneral.perfil_update);

rutas.post('/perfil/actualizar_password', controlGeneral.password_update);

/*
rutas.get('/recovery', controlGeneral.recovery);

rutas.post('/send/recovery', controlGeneral.recuperar_password);

rutas.get('/registro', controlGeneral.registro);

rutas.post('/crear/usuario', controlGeneral.registro_usuario);

rutas.get('/modelo3d/animal/:Id_Animal/:Id_Hueso', controlGeneral.Cargar_Modelo3D);
*/

//-----------------------------------------

module.exports = rutas;