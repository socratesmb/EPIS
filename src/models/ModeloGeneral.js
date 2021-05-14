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

let Id_Anim = '';
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

// ------- Modelo para CargarVista Modelos3D y Objetos Partes Individuales ----------
//#region 
model.inicio = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    console.log(datos);

    const Lista_Animales = await pool.query("select * from lista_animales where Estado_Animal = 'ACTIVO' and Id_Entidad = 1 or Id_Entidad = " + datos.Id_Entidad);

    console.log(Lista_Animales)

    res.render('Generales/inicio.html', { datos, menu, alerta, Lista_Animales });
};

model.Cargar_Modelo3D = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const { Id_Animal } = req.params;
    const { Id_Hueso } = req.params;

    if (Id_Hueso == 0) {
        const reults = await pool.query("select Id_Huesos from Lista_Modelos3D where Id_Animal = " + Id_Animal + " limit 1;");
        Id_Anim = reults[0].Id_Huesos;
    } else {
        Id_Anim = Id_Hueso;
    }

    const List_Ani = await pool.query("select * from Lista_Modelos3D where Id_Animal = " + Id_Animal);
    const Datos_Huesos = await pool.query("select * from Lista_Modelos3D where Id_Animal = " + Id_Animal + " and Id_Huesos = " + Id_Anim);

    res.render('Generales/especie.html', { datos, menu, List_Ani, Datos_Huesos });
};
//#endregion

//-------- Modelo para Crear y Registrar Modelos3D y sus partes -----------------
//#region 
model.Modelo3D = async (req, res) => {
    datos = req.session.datos;
    menu = req.session.menu;

    const lista_animales = await pool.query("select * from Lista_Partes_Animales where id_entidad = " + datos.Id_Entidad);
    const sele_t_animal = await pool.query("select Id_Animal, N_Cientifico from lista_animales where id_entidad =" + datos.Id_Entidad);

    res.render('Generales/modelos3d.html', { datos, menu, alerta, lista_animales, sele_t_animal });
    LimpiarVariables();
};

model.Registro_Animal = async (req, res) => {
    datos = req.session.datos;
    await pool.query("select Registro_Animal('" + req.body.NombreAnimal + "','" + req.body.NombreCAnimal + "', '" + req.body.DescripcionAnimal + "', " + datos.Id_Entidad + ") as resultado;", (err, result) => {
        if (err) {
            alerta = {
                tipo: 'peligro',
                mensaje: 'error' + err
            };
            console.log(err)
            res.redirect('/supadmin/modelos');
        } else {
            if (result[0].resultado == 0) {
                alerta = {
                    tipo: 'inseguro',
                    mensaje: 'El Animal Ya Esta Registrado En El Sistema, Porfavor Verifique'
                };
                res.redirect('/supadmin/modelos');
            } else {
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'Nuevo Animal Registrado Exitosamente'
                };
                res.redirect('/supadmin/modelos');
            }
        }
    });
};

model.Resgistro_Hueso = async (req, res) => {
    datos = req.session.datos;
    await pool.query("select registro_parte_animal(" + req.body.IdAnimal + ", '" + req.body.NombreHueso + "', '" + req.body.DescripcionHueso + "', '" + req.body.CaracteristicasAnimal + "', '" + req.body.RutaHueso + "') as resultado;", (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'error' + err
            };
            res.redirect('/supadmin/modelos');
        } else {
            console.log(result)
            if (result[0].resultado == 0) {
                alerta = {
                    tipo: 'inseguro',
                    mensaje: 'El Hueso o Parte de Animal que Intenta Ingresar Ya Esta Cargado en el Sistema'
                };
                res.redirect('/supadmin/modelos');
            } else {
                alerta = {
                    tipo: 'correcto',
                    mensaje: 'Nueva Parte de Animal Cargada Exitosamente'
                };
                res.redirect('/supadmin/modelos');
            }
        }
    });
};

model.Desactivar_Hueso = async (req, res) => {
    const { Id_Hueso } = req.params;
    await pool.query("update huesos set huesos.Estado = 'INACTIVO' where huesos.Id_Huesos =" + Id_Hueso, (err, result) => {
        if (err) {
            console.log(err)
            alerta = {
                tipo: 'peligro',
                mensaje: 'error' + err
            };
            res.redirect('/supadmin/modelos');
        } else {
            alerta = {
                tipo: 'correcto',
                mensaje: 'Nueva Parte de Animal Desactivada'
            };
            res.redirect('/supadmin/modelos');
        }
    });
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
