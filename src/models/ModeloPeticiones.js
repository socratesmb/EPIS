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
    const ListaEntidades = await pool.query("select * from lista_usuarios where Id_User > 4 order by Id_User;");
    console.log(ListaEntidades)
    res.render('Visitante/lg_peticiones.html', { ListaEntidades });
};

model.vista_peticion = async (req, res) => {
    datos = req.session.datos;
    
    const ListaProducto = await pool.query("select * from lista_productos_peticiones");    
    res.render('Visitante/peticiones.html', { alerta, datos, ListaProducto });
}

model.envio_peticion = async (req, res) => {
    
    console.log(req.body);
    const variables = req.body;
    const cantidad = await pool.query('select count(*) as numero from lista_productos_peticiones');

    for (let i = 1; i <= cantidad[0].numero; i++) {
        let id_producto = '';
        let no_pedido = '';
        let estado = '';
        console.log('Cilo: ' + i + ' ---------------')
        const var1 = variables[i];

        if (var1.length == 3) {

            for (let j = 0; j < var1.length; j++) {
                if (j == 0) {
                    id_producto = var1[j];
                } if (j == 1) {
                    no_pedido = var1[j];
                } if (j == 2) {
                    estado = var1[j];
                }
            };

        };
        if (no_pedido != '') {
            console.log('Id_Producto: ' + id_producto + ' | No_Pedido: ' + no_pedido + ' | Estado: ' + estado);
        }
    }
}
//#endregion


module.exports = model;