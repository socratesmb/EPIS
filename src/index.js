const express = require('express');
const path = require('path');
const morgan = require('morgan');
const session = require('express-session');
const mysqlsession = require('express-mysql-session')(session);
const passport = require('passport');
var methodOverride = require('method-override');

//carga de archivos
const fileUpload = require('express-fileupload')

//modulo para las alertas
const flash = require('connect-flash');

const { database } = require('./keys');
// inicilizando
const app = express();
require('./controllers/passport');

// importar rutas
const routes = require('./rutas/rutas');

// configuracion
app.set('port', 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

var sqlsession = new mysqlsession(database);

// middlewares
app.use(session({
  secret: 'SocratesMB',
  name: 'CookieSession',
  resave: false,
  saveUninitialized: false,
  store: sqlsession,
  cookie: {
    secure: false,
    maxAge: 36000000,
    httpOnly: false,
  }
}));

app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use(passport.session());
app.use(methodOverride());


// Variables Globales
app.use((req, res, next) => {
  app.locals.success = req.flash('mensaje');
  app.locals.user = req.user;
  next();
});

// rutas
app.use(routes);

//cargar archivos
app.use(fileUpload());

//funcion para mostrar el error 404
function error404(req, res, next) {
  let error = new Error();
  error.status = 404
  res.render('./Partials/404.html');
  next();
}
// Funcion para capturar los errores
function logErrors(err, req, res, next) {
  console.error(err.stack, 'asd');
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

//Archivos estaticos
app.use(express.static(path.join(__dirname, 'public')));

// Starting Server
app.listen(app.get('port'), () => {
  console.log(`servidor en linea en puerto: ${app.get('port')}`);
});

//metodo para usar el error 404
app.use(error404);
app.use(logErrors);
app.use(clientErrorHandler);
app.use(errorHandler);