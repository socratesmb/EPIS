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
    res.render('Visitante/lg_peticiones.html', { ListaEntidades });
};

model.vista_peticion = async (req, res) => {
    datos = req.session.datos;
    console.log("ID de la sesion: " + req.sessionID);
    console.log(req.session);
    const ListaProducto = await pool.query("select * from lista_productos_peticiones");
    res.render('Visitante/peticiones.html', { alerta, datos, ListaProducto });
    LimpiarVariables();
}

model.envio_peticion = async (req, res) => {
    datos = req.session.datos;
    console.log(datos);
    console.log(req.body);
    const variables = req.body;
    const cantidad = await pool.query('select count(*) as numero from lista_productos_peticiones');

    const Can_Reg = await pool.query("select count(*) as cantidad from pedidos where pedidos.Entidad_id_Entidad = " + datos.Id_Entidad + " and pedidos.Estado = 'PENDIENTE';");

    if (Can_Reg[0].cantidad > 1) {
        alerta = {
            tipo: 'inseguro',
            mensaje: '¡Tiene mas de 1 peticion en proceso no puede realizar mas hasta que no sean atendidas!'
        }
        res.redirect('/public/peticiones/index');
    } else {
        await pool.query("insert into `pedidos` (`id_Pedidos`,`Entidad_id_Entidad`,`Fecha_Pedido`,`Fecha_Atendido`,`Observaciones`, `Estado`) values (default, " + datos.Id_Entidad + ", now(), '0000-00-00 00:00:00', '' , 'PENDIENTE')");

        const id_Pedido = await pool.query("select max(id_Pedidos) as id_Pedido from pedidos where pedidos.Entidad_id_Entidad = " + datos.Id_Entidad + " and pedidos.Estado = 'PENDIENTE';")

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
                await pool.query("insert into `registro_pedidos` (`id_Registro_Pedidos`,`producto_id_Producto`,`pedidos_id_Pedidos`,`Cantidad`) values (default, " + id_producto + ", " + id_Pedido[0].id_Pedido + ", " + no_pedido + ")");
            }
        };
        alerta = {
            tipo: 'correcto',
            mensaje: 'Su Peticion Fue Creada Correctamente'
        }
        res.redirect('/public/peticiones/index');
    }

}
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