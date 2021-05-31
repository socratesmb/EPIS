const pool = require('../database/database');
const helpers = require('../controllers/helper');

const model = {};

let alerta = {
    tipo: '',
    mensaje: ''
};

//-------- Seccion de Grupos, creacion y vista de los grupos --------------
//#region 
model.lg_peticion = async (req, res) => {
    const ListaEntidades = await pool.query("select * from entidad where id_Entidad != 1");
    console.log(ListaEntidades);
    res.render('Visitante/lg_peticiones.html', { ListaEntidades });
};
//#endregion


model.vista_peticion = async (req, res) => {
    
    const Entidad = await pool.query('select entidad.nombre, entidad.Correo_Electronico from entidad where id_entidad =' + req.body.Registraduria);
    const ListaProducto = await pool.query("select * from lista_productos where Estado_Producto = 'DISPONIBLE';")
    console.log(Entidad);

    res.render('Visitante/peticiones.html', {alerta, Entidad, ListaProducto});
}

module.exports = model;