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

let variables = {
    Ruta_Form: '/admin/docente/creacion',
    Titulo: 'Registro Docente',
    Boton: 'Registrar Docente'
};

let Docente = {
    Nombre: '',
    Apellido: '',
    Identificacion: '',
    Correo: ''
}

let Id_Docente = '';
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

// --------- Seccion de vista docente, actualizacion y desactivacion ----------------
//#region 

model.docente = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const ListaDocente = await pool.query('select * from Lista_Docente where Id_Entidad = ' + datos.Id_Entidad);

    res.render('Administrador/docente.html', { datos, menu, alerta, variables, ListaDocente, Docente });

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
            res.redirect('/admin/docentes');
        } else {
            //correo.RegistroUsuario(req.body.Correo, req.body.Identificacion, req.body.Identificacion);
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Usuario Ha Sido Creado, Por favor Revisar Correo Electronico'
            }
            res.redirect('/admin/docentes');
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
            res.redirect('/admin/docentes');
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

            res.redirect('/admin/docentes');
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
            res.redirect('/admin/docentes');
        } else {
            console.log(result)
            LimpiarVariables();
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Docente fue Modificado Correctamente'
            }
            res.redirect('/admin/docentes');
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
            res.redirect('/admin/docentes');
        } else {
            console.log(result)
            alerta = {
                tipo: 'correcto',
                mensaje: 'El Docente fue Desactivado'
            }
            res.redirect('/admin/docentes');
        }
    });
};

model.Cancelar_Docente = async (req, res) => {
    LimpiarVariables();
    res.redirect('/admin/docentes');
};
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

    Docente = {
        Nombre: '',
        Apellido: '',
        Identificacion: '',
        Correo: ''
    };

    Id_Persona = '';
}
//#endregion

module.exports = model;
