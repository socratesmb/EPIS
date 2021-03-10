const express = require('express');
const morgan = require('morgan');
const path = require('path');
const session = require('express-session');
const validator = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const mysqlsession = require('express-mysql-session')(session);
var bodyParser = require('body-parser');

//Coneccion con la bases de datos
const { database } = require('./keys');


// Inicializacion de procesos
const app = express();
require('./controllers/passport');

// Importar rutas para uso general
const routes = require('./rutas/rutas');

// Configuracion
app.set('port', 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

// Middlewares
app.use(session({
    secret: 'SocratesMB',
    resave: false,
    saveUninitialized: false,
    store: new mysqlsession(database)
}));
app.use(flash());
app.use(morgan('dev'));
app.use(passport.initialize());
app.use(passport.session());
app.use(validator());


// Variables Globales
app.use((req, res, next) => {
    app.locals.message = req.flash('message');
    app.locals.success = req.flash('success');
    app.locals.user = req.user;
    next();
});

// Rutas
app.use(routes);

// Funcion para mostrar el error 404
function error404(req, res, next) {
    let error = new Error();
    error.status = 404
    res.render('./partials/404.html');
    next();
};

// Funcion para capturar los errores
function logErrors(err, req, res, next) {
    console.error(err.stack, 'Error');
    next(err);
} 

function clientErrorHandler(err, req, res, next) {
    if (req.xhr) {
        res.status(500).send({ error: 'Something failed!' });
    } else {
        next(err);
    }
}

function errorHandler(err, req, res, next) {
    res.status(500);
    res.redirect('/');
}

// Archivos estaticos
app.use(express.static(path.join(__dirname, 'public')));

// Iniciar Servidor
app.listen(app.get('port'), () => {
    console.log(`servidor en linea en puerto: ${app.get('port')}`);
});

// Metodo para usar el error 404 y cargar los demas errores
app.use(error404);
app.use(logErrors);
app.use(clientErrorHandler);
app.use(errorHandler);