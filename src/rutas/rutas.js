const express = require('express');
const rutas = express.Router();
const passport = require('passport');

// ---------- Controladores --------------
const controlSuperAdmin = require('../models/ModeloSuperAdmin');
const controlAdmin = require('../models/ModeloAdministrador');
const controlGeneral = require('../models/ModeloGeneral');
const controlValidacion = require('../controllers/validate');
const controlPedidos = require('../models/ModeloPeticiones');

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

// ------- Seccion de Super Administrador -------
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

// ------- Seccion Vistas Generales -------
//#region 
//----- Modelo para Cagar la Vista de Perfil -----
rutas.get('/perfil', controlGeneral.perfil);

//----- Modelo para actualizar datos del perfil -----
rutas.post('/perfil/actualizar_perfil', controlGeneral.perfil_update);

//----- Modelo para modificar la contraseña -----
rutas.post('/perfil/actualizar_password', controlGeneral.password_update);

//#endregion

// ------- Seccion de Administrador -------
//#region 

// ------- Modelo para cargar vista de inicio administrador --------
//#region 
rutas.get('/admin/inicio', controlAdmin.inicio);
//#endregion

//----- Subseccion de peticiones -----
//#region 
//----- Modelo para el proceso de peticiones y despacho -------
rutas.get('/admin/peticiones', controlAdmin.peticiones);
//#endregion

// ----- Subseccion de de inventario --------
//#region

//-----Modelo para cargar la vista de inventario-----
rutas.get('/admin/inventario', controlAdmin.inventario);

//-----Modelo para restar un valor de inventario-----
rutas.post('/admin/inventario/restar', controlAdmin.restar_inventario);

//#endregion

//----- Subseccion para registros de productos ------
//#region 
//-----Modelo para cargar vista de registro de productos -------
rutas.get('/admin/registros', controlAdmin.productos);

//-----Modelo para registrar un producto nuevo ------
rutas.post('/admin/registro_productos/crear', controlAdmin.registrar_producto);

//-----Modelo para buscar un producto registrado por id ------
rutas.get('/admin/registro_productos/buscar/:Id_Producto', controlAdmin.buscar_producto);

//-----Modelo para actualizar el producto una vez modificado -----
rutas.post('/admin/registro_productos/actualizar', controlAdmin.actualizar_producto);

//-----Modelo para cancelar los procesos en modificaciones-----
rutas.get('/admin/registros/cancelar', controlAdmin.cancelar_registro);
//#endregion

//----- Subseccion para restricciones de productos -----
//#region 
rutas.get('/admin/restricciones', controlAdmin.restricciones);

rutas.post('/admin/resstricciones/crear', controlAdmin.registrar_restriccion);

rutas.get('/admin/restricciones/buscar/:Id_Restriccion', controlAdmin.buscar_restriccion);

rutas.post('/admin/restricciones/actualizar', controlAdmin.actualizar_restriccion);

rutas.get('/admin/restricciones/cambio/:Id_Restriccion', controlAdmin.cambio_estado_restriccion);

rutas.get('/admin/restricciones/cancelar', controlAdmin.cancelar_restriccion);
//#endregion

//----- Subseccion para adiciones de proveedor y tipos de productos ------
//#region 
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
//#endregion

//-----------------------------------------
//#endregion

// ------- Seccion de Peticiones -------
//#region 

rutas.get('/public/peticiones/login', controlPedidos.lg_peticion);

rutas.post('/public/peticiones/sigin', controlValidacion.inicio);

rutas.get('/public/peticiones/index', controlPedidos.vista_peticion);

rutas.post('/public/peticion/solicitud', controlPedidos.envio_peticion);
//#endregion

module.exports = rutas;