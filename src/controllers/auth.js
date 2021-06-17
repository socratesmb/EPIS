// Modelo para proteger las vistas y solo dar acceso por autenticacion correcta.

module.exports = {
    isLoggedInSA(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.Tipo_Usuario == 'SUPER ADMINISTRADOR') {
            return next();
        }
        return res.redirect('/');
    },
    isLoggedInEM(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.Tipo_Usuario == 'EMPLEADO') {
            return next();
        }
        return res.redirect('/');
    }, isLoggedInEN(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.Tipo_Usuario == 'ENTIDAD') {
            return next();
        }
        return res.redirect('/');
    },
    isLoggedIn(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.Tipo_Usuario == "SUPER ADMINISTRADOR" || req.session.datos.Tipo_Usuario == "EMPLEADO" || req.session.datos.Tipo_Usuario == "PASANTE") {
            return next();
        }
        return res.redirect('/');
    },
    isNotLoggedIn(req, res, next) {
        if (!req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/');
    }
};