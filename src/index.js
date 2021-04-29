const express = require('express');
const morgan = require('morgan');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash');
const mysqlsession = require('express-mysql-session')(session);

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
app.use(express.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use(passport.session());


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

// Archivos estaticos
app.use(express.static(path.join(__dirname, 'public')));

// Iniciar Servidor
app.listen(app.get('port'), () => {
    console.log(`servidor en linea en puerto: ${app.get('port')}`);
});

// Metodo para usar el error 404 y cargar los demas errores
app.use(error404);