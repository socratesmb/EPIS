const express = require('express');
const rutas = express.Router();

const pool = require('../database/database');
const passport = require('passport');

// ---------- Controladores --------------
const controlValidacion = require('../controllers/validate');
const controlSuperAdmin = require('../models/ModeloSuperAdmin');
const controlAdmin = require('../models/ModeloAdministrador');
const controlDocen = require('../models/ModeloPasante');
const controlEstud = require('../models/ModeloEmpleado');
const controlGeneral = require('../models/ModeloGeneral');

// --------- Seccion Protegida de Creacion Usuario ----------------

rutas.get('/admin/creacion', (req, res) => {
    res.render('creacion.html');
}); 

rutas.post('/add', passport.authenticate('local.signup', {
    successRedirect: '/admin/creacion',
    failureRedirect: '/',
    failureFlash: true
}));

// ---- Carga Vista Principal ------
rutas.get('/', (req, res) => {
    res.render('index.html');
});

// --------- Modeleo para cerrar sesion y salir ---------
rutas.get('/salir', controlValidacion.salir);

// ----- Cargar Vista de Login, Inicio de Sesion --------
rutas.get('/login', controlGeneral.login);

rutas.post('/signin', controlValidacion.inicio);


// ------- Seccion de Super Administrador -------------

rutas.get('/supadmin/home', controlGeneral.inicio);

rutas.get('/supadmin/entidades', controlSuperAdmin.entidades);

// ------- Seccion de Administrador -------------

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


// ------- Seccion Vistas Generales -------------

rutas.get('/perfil', controlGeneral.perfil);

rutas.post('/actualizar_perfil', controlGeneral.perfil_update);

rutas.post('/actualizar_password', controlGeneral.password_update);

rutas.get('/recovery', controlGeneral.recovery);

rutas.post('/send/recovery', controlGeneral.recuperar_password);

rutas.get('/registro', controlGeneral.registro);

rutas.post('/crear/usuario', controlGeneral.registro_usuario);

rutas.get('/modelo3d/animal/:Id_Animal/:Id_Hueso', controlGeneral.Cargar_Modelo3D);

//-----------------------------------------

// Para ver las respuestas de los estudiantes en docentes
rutas.get('/Grupos', (req, res) => {
    res.render('grupos.html');
});

//Para estudiantes responder
rutas.get('/cuestionario', (req, res) => {
    res.render('cuestionario.html');
});

//Para crear la preguntas de docentes
rutas.get('/preguntas', (req, res) => {
    res.render('preguntas.html');
});
module.exports = rutas;