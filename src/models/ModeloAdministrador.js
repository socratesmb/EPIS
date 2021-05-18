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

// --------- Seccion para ver bodega y sus productos ----------
//#region 
model.bodega = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const ArrayBodegas = await pool.query('select * from bodega where Entidad_id_Entidad =' + datos.Id_Entidad + ' and bodega.Estado = "ACTIVA";');

    res.render('Admin/bodega.html', { datos, menu, alerta, ArrayBodegas });

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
            res.redirect('/admin/bodega');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'Bodega Creada Correctamente'
            };
            res.redirect('/admin/bodega');
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
            res.redirect('/admin/bodega');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'Bodega Desactivada'
            };
            res.redirect('/admin/bodega');
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

// --------- Seccion para peticiones y atenderlas --------
//#region 

model.peticiones = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    //const ListaPedidos = await pool.query('select * from Lista_Docente where Id_Entidad = ' + datos.Id_Entidad);

    res.render('Admin/peticiones.html', { datos, menu, alerta });

    LimpiarVariables();
};

model.registro_docente = async (req, res) => {
    datos = req.session.datos;
    var contrasena = await helpers.encryptPassword(req.body.Identificacion);

    await pool.query("call Registro_Docente('" + req.body.NombreDocente + "', '" + req.body.ApellidoDocente + "', " + req.body.Identificacion + ", '" + req.body.Correo + "', " + datos.Id_Entidad + ", '" + contrasena + "')", async (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al registrar el Usuario' + err
            }
            res.redirect('/admin/adiciones');
        } else {
            //correo.RegistroUsuario(req.body.Correo, req.body.Identificacion, req.body.Identificacion);
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Usuario Ha Sido Creado, Por favor Revisar Correo Electronico'
            }
            res.redirect('/admin/adiciones');
        }
    });
};

model.buscar_docente = async (req, res) => {
    const { Id_Persona } = req.params;
    Id_Docente = Id_Persona;
    await pool.query('select persona.Nombre, persona.Apellido, persona.Identificacion, persona.Correo_Electronico from persona where persona.Id_Persona = ' + Id_Persona, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al Consultar el Usuario' + err
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result);

            Docente = {
                Nombre: result[0].Nombre,
                Apellido: result[0].Apellido,
                Identificacion: result[0].Identificacion,
                Correo: result[0].Correo_Electronico
            }

            variables = {
                Ruta_Form: '/admin/docente/actualizacion',
                Titulo: 'Actualizar Docente',
                Boton: 'Actualizar Docente'
            };

            res.redirect('/admin/adiciones');
        }
    });

};

model.actualizar_docente = async (req, res) => {
    console.log("Id del Docente: " + Id_Docente);
    await pool.query("update persona set persona.Nombre = '" + req.body.NombreDocente + "', persona.Apellido = '" + req.body.ApellidoDocente + "', persona.Identificacion = " + req.body.Identificacion + ", persona.Correo_Electronico = '" + req.body.Correo + "' where persona.Id_Persona = " + Id_Docente, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error En el Proceso' + err
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result)
            LimpiarVariables();
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Docente fue Modificado Correctamente'
            }
            res.redirect('/admin/adiciones');
        }
    });
};

model.desactivar_docente = async (req, res) => {
    const { Id_Persona } = req.params;
    await pool.query("update registro_pe set registro_pe.Estado = 'INACTIVO' where registro_pe.Persona_Id_Persona = " + Id_Persona, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'Error al registrar el Usuario' + err
            }
            res.redirect('/admin/adiciones');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Docente fue Desactivado'
            }
            res.redirect('/admin/adiciones');
        }
    });
};

model.Cancelar_Docente = async (req, res) => {
    LimpiarVariables();
    res.redirect('/admin/adiciones');
};
//#endregion

//----- Seccion para Registros de Productos -----
//#region 

model.registros_productos = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const ListaBodegas = await pool.query('select * from bodega where Estado = "ACTIVA" and Entidad_id_Entidad = ' + datos.Id_Entidad);

    res.render('Admin/registros.html', { datos, menu, alerta, ListaBodegas, variables1 });
};

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
    variables = {
        Ruta_Form: '/admin/docente/creacion',
        Titulo: 'Registro Docente',
        Boton: 'Registrar Docente'
    };

    alerta = {
        tipo: '',
        mensaje: ''
    };

    Id_Persona = '';
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
