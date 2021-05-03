// Modelo para proteger las vistas y solo dar acceso por autenticacion correcta.

module.exports = {
    isLoggedInSA(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.NombreRol == 'SUPER ADMIN') {
            return next();
        }
        return res.redirect('/');
    },
    isLoggedInEM(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.NombreRol == 'EMPLEADO') {
            return next();
        }
        return res.redirect('/');
    }, isLoggedInPA(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.NombreRol == 'PASANTE') {
            return next();
        }
        return res.redirect('/');
    },
    isLoggedIn(req, res, next) {
        if (req.isAuthenticated() && req.session.datos.NombreRol == "SUPER ADMIN" || req.session.datos.NombreRol == "EMPLEADO"
        || req.session.datos.NombreRol == "PASANTE") {
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