const pool = require('../database/database');
const randomstring = require('randomstring');
const helpers = require('../controllers/helper');

const model = {};

// -------------- Seccion de Arreglos para Datos -----------
//#region 

let alerta = {
    tipo: '',
    mensaje: ''
};

let variables1 = {
    Ruta_Form: '/admin/registro_productos/crear',
    Titulo: 'Registro Producto',
    Boton: 'Registrar Producto'
};

let Productos = {
    Tipo_Producto: '',
    Codigo_Producto: '',
    Nombre_Producto: '',
    Descripcion_Producto: '',
    Bodega1: '0',
    Bodega2: '0'
}

let Id_Produc = '';

let variables2 = {
    Ruta_Form: '/admin/adiciones/crear/tipo_producto',
    Titulo: 'Registro Tipo Productos',
    Boton: 'Registrar Tipo Producto'
}

let id_TProducto = '';

let Tipo_Producto = {
    Nombre: '',
    Descripcion: ''
}

let variables3 = {
    Ruta_Form: '/admin/adiciones/crear/proveedor',
    Titulo: 'Registro Proveedor',
    Boton: 'Registrar Proveedor'
}

let id_Prov = '';

let Proveedor = {
    Nombre: '',
    Nit: '',
    Direccion: '',
    Telefono: ''
}

//#endregion

// ----- Cargar Vista Principal de Inicio de Session -----
model.inicio = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    res.render('Admin/inicio.html', { datos, menu });
};

// --------- Seccion para peticiones y atenderlas --------
//#region 

model.peticiones = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    res.render('Admin/peticiones.html', { datos, menu, alerta });

    LimpiarVariables();
};
//#endregion

//----- Seccion para Registros de Productos -----
//#region 

model.productos = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;


    const ListaTProductos = await pool.query('select * from tipo_producto where tipo_producto.Estado = "ACTIVO"');
    const ListaBodegas = await pool.query('select * from bodega where Estado = "ACTIVA" and Entidad_id_Entidad = ' + datos.Id_Entidad);
    const ListaProductos = await pool.query('select distinct(Id_Producto), Tipo_Producto, Codigo_Producto, Nombre_Producto, Cantidad_Producto, Descripcion_Producto, Estado_Producto from lista_productos');

    res.render('Admin/registros.html', { datos, menu, alerta, variables1, Productos, ListaTProductos, ListaBodegas, ListaProductos });
    LimpiarVariables();
};

model.registrar_producto = async (req, res) => {
    ArrayLista = req.body;
    console.log(ArrayLista);

    await pool.query("call Registro_Productos(" + req.body.TProducto + ", '" + req.body.CodigoProducto + "', '" + req.body.NombreProducto + "', '" + req.body.DescripcionProducto + "', " + req.body.Id_1 + ", " + req.body.Id_2 + ")", (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'error' + err.sqlMessage
            };
            res.redirect('/admin/registros');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'Producto Creado Correctamente'
            };
            res.redirect('/admin/registros');
        }
    });
}

model.buscar_producto = async (req, res) => {
    const { Id_Producto } = req.params;
    Id_Produc = Id_Producto;
    console.log('LLego aca' + Id_Produc + Id_Producto)
    await pool.query("select * from lista_productos where Id_Producto =" + Id_Producto, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: err
            };

            res.redirect('/admin/registros');
        } else {
            console.log(result)
            console.log(result.length)

            if (result.length == 2) {
                if (result[0].Nombre_Bodega == 'INSUMOS RAPIDOS' && result[1].Nombre_Bodega == 'BODEGA') {
                    Productos = {
                        Tipo_Producto: result[0].Tipo_Producto,
                        Codigo_Producto: result[0].Codigo_Producto,
                        Nombre_Producto: result[0].Nombre_Producto,
                        Descripcion_Producto: result[0].Descripcion_Producto,
                        Bodega1: result[0].Inventario_Bodega,
                        Bodega2: result[1].Inventario_Bodega
                    }
                } if (result[0].Nombre_Bodega == 'BODEGA' && result[1].Nombre_Bodega == 'INSUMOS RAPIDOS') {
                    Productos = {
                        Tipo_Producto: result[0].Tipo_Producto,
                        Codigo_Producto: result[0].Codigo_Producto,
                        Nombre_Producto: result[0].Nombre_Producto,
                        Descripcion_Producto: result[0].Descripcion_Producto,
                        Bodega1: result[1].Inventario_Bodega,
                        Bodega2: result[0].Inventario_Bodega
                    }
                }

            }
            if (result.length == 1) {
                if (result[0].Nombre_Bodega == 'INSUMOS RAPIDOS') {
                    Productos = {
                        Tipo_Producto: result[0].Tipo_Producto,
                        Codigo_Producto: result[0].Codigo_Producto,
                        Nombre_Producto: result[0].Nombre_Producto,
                        Descripcion_Producto: result[0].Descripcion_Producto,
                        Bodega1: result[0].Inventario_Bodega,
                        Bodega2: '0'
                    }
                } if (result[0].Nombre_Bodega == 'BODEGA') {
                    Productos = {
                        Tipo_Producto: result[0].Tipo_Producto,
                        Codigo_Producto: result[0].Codigo_Producto,
                        Nombre_Producto: result[0].Nombre_Producto,
                        Descripcion_Producto: result[0].Descripcion_Producto,
                        Bodega1: '0',
                        Bodega2: result[0].Inventario_Bodega
                    }
                }

            }

            variables1 = {
                Ruta_Form: '/admin/registro_productos/actualizar',
                Titulo: 'Actualizacion de Producto',
                Boton: 'Actualizar Producto'
            };

            console.log(Productos)

            res.redirect('/admin/registros');
        }
    });
}

model.actualizar_producto = async (req, res) => {
    console.log("Id del Producto: " + Id_Produc);
    await pool.query("call Actualizacion_Producto(" + req.body.TProducto + ", '" + req.body.CodigoProducto + "', '" + req.body.NombreProducto + "', '" + req.body.DescripcionProducto + "', " + req.body.Id_1 + ", " + req.body.Id_2 + ", " + Id_Produc + ");", (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error En el Proceso' + err.sql
            }
            res.redirect('/admin/registros');
        } else {
            console.log(result)
            LimpiarVariables();
            Id_Produc = '';
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Producto Se Modifico Correctamente'
            }
            res.redirect('/admin/registros');
        }
    });
}

model.cancelar_registro = async (req, res) => {
    LimpiarVariables();
    res.redirect('/admin/registros');
}
//#endregion

//----- Seccion para Registro de Proveedor, Tipo Productos
//#region 
model.adiciones = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const ListaTProductos = await pool.query('select * from tipo_producto');
    const ListaProveedor = await pool.query('select * from proveedor');

    res.render('Admin/adiciones.html', { datos, menu, alerta, variables2, variables3, ListaTProductos, ListaProveedor, Tipo_Producto, Proveedor });

    LimpiarVariables2();
}

model.registro_tipo_producto = async (req, res) => {
    datos = req.session.datos;

    await pool.query("INSERT INTO `tipo_producto` (`id_Tipo_Producto`, `Nombre`, `Descripcion`, `Estado`) values (default, '" + req.body.NombreTProducto + "', '" + req.body.DescripcionTProducto + "', 'ACTIVO')", async (err, result) => {
        if (err) {
            console.log(err);
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al registrar el Tipo de Producto' + err
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result);
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Tipo de Producto Fue Creado Correctamente'
            }
            res.redirect('/admin/adiciones');
        }
    });
}

model.buscar_tipo_producto = async (req, res) => {
    const { id_Tipo_Producto } = req.params;
    id_TProducto = id_Tipo_Producto;
    console.log("Id del Tipo Producto En Busqueda: " + id_TProducto);
    await pool.query('select * from tipo_producto where id_Tipo_Producto =' + id_Tipo_Producto, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al Consultar el Tipo de Producto' + err
            }
            LimpiarVariables2();
            res.redirect('/admin/adiciones');
        } else {
            console.log(result);

            Tipo_Producto = {
                Nombre: result[0].Nombre,
                Descripcion: result[0].Descripcion
            }

            variables2 = {
                Ruta_Form: '/admin/adiciones/actualizar/tipo_producto',
                Titulo: 'Actualizar Tipo Producto',
                Boton: 'Actualizar Tipo Producto'
            };

            res.redirect('/admin/adiciones');
        }
    });
}

model.actualizar_tipo_producto = async (req, res) => {
    console.log("Id del Tipo Producto: " + id_TProducto);
    await pool.query("update tipo_producto set tipo_producto.Nombre = '" + req.body.NombreTProducto + "', tipo_producto.Descripcion = '" + req.body.DescripcionTProducto + "' where tipo_producto.id_Tipo_Producto = " + id_TProducto, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error En el Proceso' + err.sql
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result)
            LimpiarVariables();
            id_TProducto = '';
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Tipo de Producto Fue Modificado Correctamente'
            }
            res.redirect('/admin/adiciones');
        }
    });
}

model.cambio_estado_tipo_producto = async (req, res) => {
    const { id_Tipo_Producto } = req.params;

    let estado = await pool.query("select tipo_producto.Estado from tipo_producto where tipo_producto.id_Tipo_Producto =" + id_Tipo_Producto);

    if (estado[0].Estado == 'ACTIVO') {
        await pool.query("update tipo_producto set tipo_producto.Estado = 'INACTIVO' where tipo_producto.id_Tipo_Producto = " + id_Tipo_Producto, (err, result) => {
            if (err) {
                console.log(err)
                alerta = {
                    tipo: 'peligro',
                    mensaje: 'Error En El Proceso' + err.sql
                }
                res.redirect('/admin/adiciones');
            } else {
                console.log(result)
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'El Tipo de Producto se Desactivado Correctamente'
                }
                res.redirect('/admin/adiciones');
            }
        });
    } else {
        await pool.query("update tipo_producto set tipo_producto.Estado = 'ACTIVO' where tipo_producto.id_Tipo_Producto = " + id_Tipo_Producto, (err, result) => {
            if (err) {
                console.log(err)
                alerta = {
                    tipo: 'peligro',
                    mensaje: 'Error En El Proceso' + err.sql
                }
                res.redirect('/admin/adiciones');
            } else {
                console.log(result)
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'El Tipo de Producto se Activo Correctamente'
                }
                res.redirect('/admin/adiciones');
            }
        });
    };
}
//----- Subseccion para proveedor -----
model.registro_proveedor = async (req, res) => {
    datos = req.session.datos;

    await pool.query("INSERT INTO `proveedor` (`id_Proveedor`, `Nombre`, `Nit`, `Direccion`, `Telefono`, `Estado`) values (default, '" + req.body.NombreProveedor + "', '" + req.body.NitProveedor + "', '" + req.body.DireccionProveedor + "', '" + req.body.TelefonoProveedor + "', 'ACTIVO')", async (err, result) => {
        if (err) {
            console.log(err);
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al Registrar Proveedor' + err.sql
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result);
            alerta = {
                tipo: 'correcto',
                mensaje: 'Proveedor Registrado Correctamente'
            }
            res.redirect('/admin/adiciones');
        }
    });
}

model.buscar_proveedor = async (req, res) => {
    const { id_Proveedor } = req.params;
    id_Prov = id_Proveedor;
    console.log("Id del Proveedor en consulta: " + id_Prov);
    await pool.query('select * from proveedor where id_Proveedor =' + id_Proveedor, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al Consultar el Proveedor' + err.sql
            }
            LimpiarVariables2();
            res.redirect('/admin/adiciones');
        } else {
            console.log(result);

            Proveedor = {
                Nombre: result[0].Nombre,
                Nit: result[0].Nit,
                Direccion: result[0].Direccion,
                Telefono: result[0].Telefono
            }

            variables3 = {
                Ruta_Form: '/admin/adiciones/actualizar/proveedor',
                Titulo: 'Actualizar Proveedor',
                Boton: 'Actualizar Proveedor'
            };

            res.redirect('/admin/adiciones');
        }
    });
}

model.actualizar_proveedor = async (req, res) => {
    console.log("Id del Proveedor: " + id_Prov);
    await pool.query("update proveedor set proveedor.Nombre = '" + req.body.NombreProveedor + "', proveedor.Nit = '" + req.body.NitProveedor + "', proveedor.Direccion = '" + req.body.DireccionProveedor + "', proveedor.Telefono = '" + req.body.TelefonoProveedor + "' where proveedor.id_Proveedor = " + id_Prov, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error En el Proceso' + err.sql
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result)
            LimpiarVariables();
            id_Prov = '';
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Proveedor Se Modifico Correctamente'
            }
            res.redirect('/admin/adiciones');
        }
    });
}

model.cambio_estado_proveedor = async (req, res) => {
    const { id_Proveedor } = req.params;

    let estado = await pool.query("select proveedor.Estado from proveedor where proveedor.id_Proveedor = " + id_Proveedor);

    if (estado[0].Estado == 'ACTIVO') {
        await pool.query("update proveedor set proveedor.Estado = 'INACTIVO' where proveedor.id_Proveedor = " + id_Proveedor, (err, result) => {
            if (err) {
                console.log(err)
                alerta = {
                    tipo: 'peligro',
                    mensaje: 'Error En El Proceso' + err.sql
                }
                res.redirect('/admin/adiciones');
            } else {
                console.log(result)
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'El Proveedor se Desactivado Correctamente'
                }
                res.redirect('/admin/adiciones');
            }
        });
    } else {
        await pool.query("update proveedor set proveedor.Estado = 'ACTIVO' where proveedor.id_Proveedor = " + id_Proveedor, (err, result) => {
            if (err) {
                console.log(err)
                alerta = {
                    tipo: 'peligro',
                    mensaje: 'Error En El Proceso' + err.sql
                }
                res.redirect('/admin/adiciones');
            } else {
                console.log(result)
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'El Proveedor se Activo Correctamente'
                }
                res.redirect('/admin/adiciones');
            }
        });
    };
}

model.adiciones_cancelar = async (req, res) => {
    LimpiarVariables2();
    res.redirect('/admin/adiciones');
}
//#endregion

//------- Funciones de Limpieza de Variables ----------
//#region 
function LimpiarVariables() {
    variables1 = {
        Ruta_Form: '/admin/registro_productos/crear',
        Titulo: 'Registro Producto',
        Boton: 'Registrar Producto'
    };

    Productos = {
        Tipo_Producto: '',
        Codigo_Producto: '',
        Nombre_Producto: '',
        Descripcion_Producto: '',
        Bodega1: '0',
        Bodega2: '0'
    }

    alerta = {
        tipo: '',
        mensaje: ''
    };
}

function LimpiarVariables2() {
    variables2 = {
        Ruta_Form: '/admin/adiciones/crear/tipo_producto',
        Titulo: 'Registro Tipo Productos',
        Boton: 'Registrar Tipo'
    }

    variables3 = {
        Ruta_Form: '/admin/adiciones/crear/proveedor',
        Titulo: 'Registro Proveedor',
        Boton: 'Registrar Proveedor'
    }


    Tipo_Producto = {
        Nombre: '',
        Descripcion: ''
    }

    Proveedor = {
        Nombre: '',
        Nit: '',
        Direccion: '',
        Telefono: ''
    }

    alerta = {
        tipo: '',
        mensaje: ''
    };
}
//#endregion

module.exports = model;
