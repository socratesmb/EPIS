const express = require('express');
const rutas = express.Router();
const passport = require('passport');

// ---------- Controladores --------------
const controlSuperAdmin = require('../models/ModeloSuperAdmin');
const controlAdmin = require('../models/ModeloAdministrador');
const controlGeneral = require('../models/ModeloGeneral');
const controlValidacion = require('../controllers/validate');
const controlPasante = require('../models/ModeloPasante');

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

//----- Modelo para ver vista de bodega -----
rutas.get('/supadmin/bodega', controlSuperAdmin.bodega);

//----- Modelo para agregar una bodega nueva -----
rutas.post('/supadmin/bodega/agregar', controlSuperAdmin.crear_bodega);

//----- Modelo para desactivar un bodega -----
rutas.get('/supadmin/bodega/eliminar/:id_Bodega', controlSuperAdmin.desactivar_bodega);
//#endregion

// ------- Seccion Vistas Generales -------------
//#region 
//----- Modelo para Cagar la Vista de Perfil -----
rutas.get('/perfil', controlGeneral.perfil);

//----- Modelo para actualizar datos del perfil -----
rutas.post('/perfil/actualizar_perfil', controlGeneral.perfil_update);

//----- Modelo para modificar la contraseña -----
rutas.post('/perfil/actualizar_password', controlGeneral.password_update);

//#endregion

// ------- Seccion de Administrador -------------

rutas.get('/admin/inicio', controlAdmin.inicio);

//----- Subseccion de peticiones -----
rutas.get('/admin/peticiones', controlAdmin.peticiones);


//----- Subseccion para registros de productos ------
rutas.get('/admin/registros', controlAdmin.productos);

rutas.post('/admin/registro_productos/crear', controlAdmin.registrar_producto);

rutas.get('/admin/registro_productos/buscar/:Id_Producto', controlAdmin.buscar_producto);

rutas.post('/admin/registro_productos/actualizar', controlAdmin.actualizar_producto);

rutas.get('/admin/registros/cancelar', controlAdmin.cancelar_registro);

//----- Subseccion para adiciones de proveedor y tipos de productos ------
rutas.get('/admin/adiciones', controlAdmin.adiciones);

rutas.post('/admin/adiciones/crear/tipo_producto', controlAdmin.registro_tipo_producto);

rutas.get('/admin/adiciones/tproductos/buscar/:id_Tipo_Producto', controlAdmin.buscar_tipo_producto);

rutas.post('/admin/adiciones/actualizar/tipo_producto', controlAdmin.actualizar_tipo_producto);

rutas.get('/admin/adiciones/tproductos/borrar/:id_Tipo_Producto', controlAdmin.cambio_estado_tipo_producto);


rutas.post('/admin/adiciones/crear/proveedor', controlAdmin.registro_proveedor);

rutas.get('/admin/adiciones/proveedor/buscar/:id_Proveedor', controlAdmin.buscar_proveedor);

rutas.post('/admin/adiciones/actualizar/proveedor', controlAdmin.actualizar_proveedor);

rutas.get('/admin/adiciones/proveedor/borrar/:id_Proveedor', controlAdmin.cambio_estado_proveedor);

rutas.get('/admin/adiciones/cancelar', controlAdmin.adiciones_cancelar);
//-----------------------------------------

module.exports = rutas;