const express = require('express');
const rutas = express.Router();
const passport = require('passport');

//----------- Gestor de Seguridad en Rutas -----------
const { isLoggedInSA, isLoggedInEM, isLoggedInEN, isLoggedIn, isNotLoggedIn } = require('../controllers/auth');

// ---------- Controladores --------------
const controlSuperAdmin = require('../models/ModeloSuperAdmin');
const controlAdmin = require('../models/ModeloAdministrador');
const controlGeneral = require('../models/ModeloGeneral');
const controlValidacion = require('../controllers/validate');
const controlPedidos = require('../models/ModeloPeticiones');

//--------- Seccion Del Origen ----------------
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
rutas.get('/', isNotLoggedIn, controlGeneral.login);

//----- Metodo para iniciar sesion ------
rutas.post('/signin', isNotLoggedIn, controlValidacion.inicio);

//----- Cerrar sesion y salir -----
rutas.get('/salir', controlGeneral.salir);

//#endregion

// ------- Seccion de Super Administrador -------
//#region 
//----- Cargar Vista Inicio -----
rutas.get('/supadmin/home', isLoggedInSA, controlSuperAdmin.inicio);

//----- Cargar Vista Registro Usuarios -----
rutas.get('/supadmin/registro', isLoggedInSA, controlSuperAdmin.usuarios);

//----- Modelo para registrar un nuevo usuario -----
rutas.post('/supadmin/regis_user', isLoggedInSA, controlSuperAdmin.registro_usuario);

//----- Modelo para buscar un usuario -----
rutas.get('/supadmin/buscar_usuario/:Id_User', isLoggedInSA, controlSuperAdmin.buscar_usuario);

//----- Modelo para actualizar un usuario -----
rutas.post('/supadmin/actualizar_usuario', isLoggedInSA, controlSuperAdmin.actualizar_usuario);

//----- Modelo para desactivar un usuario -----
rutas.get('/supadmin/desactivar_usuario/:Id_User', isLoggedInSA, controlSuperAdmin.desactivar_usuario);

//----- Modelo para cancelar procesos ----- 
rutas.get('/supadmin/cancelar', isLoggedInSA, controlSuperAdmin.cancelar_usuario);

//----- Modelo para ver vista de bodega -----
rutas.get('/supadmin/bodega', isLoggedInSA, controlSuperAdmin.bodega);

//----- Modelo para agregar una bodega nueva -----
rutas.post('/supadmin/bodega/agregar', isLoggedInSA, controlSuperAdmin.crear_bodega);

//----- Modelo para desactivar un bodega -----
rutas.get('/supadmin/bodega/eliminar/:id_Bodega', isLoggedInSA, controlSuperAdmin.desactivar_bodega);
//#endregion

// ------- Seccion Vistas Generales -------
//#region 
//----- Modelo para Cagar la Vista de Perfil -----
rutas.get('/perfil', isLoggedIn, controlGeneral.perfil);

//----- Modelo para actualizar datos del perfil -----
rutas.post('/perfil/actualizar_perfil', isLoggedIn, controlGeneral.perfil_update);

//----- Modelo para modificar la contraseña -----
rutas.post('/perfil/actualizar_password', isLoggedIn, controlGeneral.password_update);

//#endregion

// ------- Seccion de Administrador -------
//#region 

// ------- Modelo para cargar vista de inicio administrador --------
//#region 
rutas.get('/admin/inicio', isLoggedInEM, controlAdmin.inicio);
//#endregion

//----- Subseccion de peticiones -----
//#region 
//----- Modelo para el proceso de peticiones y despacho -------
rutas.get('/admin/peticiones', isLoggedInEM, controlAdmin.peticiones);

rutas.get('/admin/peticiones/ver/:Id_Peticion', isLoggedInEM, controlAdmin.ver_peticion);

rutas.get('/admin/peticiones/atender/:Id_Peticion', isLoggedInEM, controlAdmin.despachar_peticion);

rutas.get('/admin/peticiones/cancelar/:Id_Peticion', isLoggedInEM, controlAdmin.cancelar_pedido);

rutas.post('/admin/peticiones/lista_pedidos/restar', isLoggedInEM, controlAdmin.editar_registro_pedido);

//#endregion

// ----- Subseccion de de inventario --------
//#region

//-----Modelo para cargar la vista de inventario-----
rutas.get('/admin/inventario', isLoggedInEM, controlAdmin.inventario);

//-----Modelo para restar un valor de inventario-----
rutas.post('/admin/inventario/restar', isLoggedInEM, controlAdmin.restar_inventario);

//#endregion

//----- Subseccion para registros de productos ------
//#region 
//-----Modelo para cargar vista de registro de productos -------
rutas.get('/admin/registros', isLoggedInEM, controlAdmin.productos);

//-----Modelo para registrar un producto nuevo ------
rutas.post('/admin/registro_productos/crear', isLoggedInEM, controlAdmin.registrar_producto);

//-----Modelo para buscar un producto registrado por id ------
rutas.get('/admin/registro_productos/buscar/:Id_Producto', isLoggedInEM, controlAdmin.buscar_producto);

//-----Modelo para actualizar el producto una vez modificado -----
rutas.post('/admin/registro_productos/actualizar', isLoggedInEM, controlAdmin.actualizar_producto);

//-----Modelo para cancelar los procesos en modificaciones-----
rutas.get('/admin/registros/cancelar', isLoggedInEM, controlAdmin.cancelar_registro);
//#endregion

//----- Subseccion para restricciones de productos -----
//#region 
rutas.get('/admin/restricciones', isLoggedInEM, controlAdmin.restricciones);

rutas.post('/admin/resstricciones/crear', isLoggedInEM, controlAdmin.registrar_restriccion);

rutas.get('/admin/restricciones/buscar/:Id_Restriccion', isLoggedInEM, controlAdmin.buscar_restriccion);

rutas.post('/admin/restricciones/actualizar', isLoggedInEM, controlAdmin.actualizar_restriccion);

rutas.get('/admin/restricciones/cambio/:Id_Restriccion', isLoggedInEM, controlAdmin.cambio_estado_restriccion);

rutas.get('/admin/restricciones/cancelar', isLoggedInEM, controlAdmin.cancelar_restriccion);
//#endregion

//----- Subseccion para adiciones de proveedor y tipos de productos ------
//#region 
rutas.get('/admin/adiciones', isLoggedInEM, controlAdmin.adiciones);

rutas.post('/admin/adiciones/crear/tipo_producto', isLoggedInEM, controlAdmin.registro_tipo_producto);

rutas.get('/admin/adiciones/tproductos/buscar/:id_Tipo_Producto', isLoggedInEM, controlAdmin.buscar_tipo_producto);

rutas.post('/admin/adiciones/actualizar/tipo_producto', isLoggedInEM, controlAdmin.actualizar_tipo_producto);

rutas.get('/admin/adiciones/tproductos/borrar/:id_Tipo_Producto', isLoggedInEM, controlAdmin.cambio_estado_tipo_producto);


rutas.post('/admin/adiciones/crear/proveedor', isLoggedInEM, controlAdmin.registro_proveedor);

rutas.get('/admin/adiciones/proveedor/buscar/:id_Proveedor', isLoggedInEM, controlAdmin.buscar_proveedor);

rutas.post('/admin/adiciones/actualizar/proveedor', isLoggedInEM, controlAdmin.actualizar_proveedor);

rutas.get('/admin/adiciones/proveedor/borrar/:id_Proveedor', isLoggedInEM, controlAdmin.cambio_estado_proveedor);

rutas.get('/admin/adiciones/cancelar', isLoggedInEM, controlAdmin.adiciones_cancelar);
//#endregion

//-----------------------------------------
//#endregion

// ------- Seccion de Peticiones Publicas-------
//#region 

rutas.get('/public/peticiones/login', isNotLoggedIn, controlPedidos.lg_peticion);

rutas.post('/public/peticiones/sigin', isNotLoggedIn, controlValidacion.inicio);

rutas.get('/public/peticiones/index', isLoggedInEN, controlPedidos.vista_peticion);

rutas.post('/public/peticion/solicitud', isLoggedInEN, controlPedidos.envio_peticion);
//#endregion

module.exports = rutas;