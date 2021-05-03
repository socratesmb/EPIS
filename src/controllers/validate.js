const passport = require('passport');
const pool = require('../database/database');

const model = {};

let alerta = {
    tipo: '',
    mensaje: ''
};

model.inicio = (req, res, next) => {
    passport.authenticate('local.signin', (error, user, data) => {
        if (error) {
            alerta = {
                tipo: 'inseguro',
                mensaje: 'Usuario o Contraseña Incorrecto'
            }
            res.render('index.html', { alerta });
        } else {
            if (data) {
                alerta = {
                    tipo: 'inseguro',
                    mensaje: 'El Usuario Esta Inactivo'
                }
                res.render('index.html', { alerta });
            } else {
                req.logIn(user, async (err) => {
                    if (err) {
                        return next(err);
                    } else {
                        //Registro del menu y guardado en cache
                        req.session.menu = await pool.query("select * from menu_usuarios where menu_usuarios.Id_Entidad = " + req.session.datos.Id_Entidad + " and menu_usuarios.Id_Persona = " + req.session.datos.Id_Usuario);

                        if (req.session.datos.Tipo_Usuario == 'SUPER ADMINISTRADOR') {
                            return res.redirect('/supadmin/home');

                        } if (req.session.datos.Tipo_Usuario == 'EMPLEADO') {
                            return res.redirect('/admin/inicio');

                        } if (req.session.datos.Tipo_Usuario == 'PASANTE') {
                            return res.redirect('/admin/inicio');

                        };
                    }
                });
            }
        }
    })(req, res, next);
};

model.salir = (req, res) => {
    req.session.destroy(() => {
        req.logOut();
        res.redirect('/');
    });
};

module.exports = model;