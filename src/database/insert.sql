use epis;

/*CREACION DE INSERT MANUALES*/

INSERT INTO `identificacion` (`id_Identificacion`, `Tipo`, `Estado`) VALUES
(1, 'CEDULA DE CIUDADANIA', 'ACTIVO'),
(2, 'TARJETA DE IDENTIFICACION', 'ACTIVO'); 

INSERT INTO `menu` (`id_Menu`, `Icono`, `Nombre`, `Ruta`, `Orden`) VALUES
(default, 'fa fa-home', 'Inicio', '/supadmin/home', 1),
(default, 'fa fa-users', 'Registro', '/supadmin/registro', 2),
(default, 'fa fa-desktop', 'Inicio', '/admin/inicio', 1),
(default, 'fa fa-archive', 'Bodega', '/admin/bodega', 2),
(default, 'fa fa-dropbox', 'Inventario', '/admin/inventario', 3),
(default, 'fa fa-file', 'Peticiones', '/admin/peticiones', 4),
(default, 'fa fa-cog', 'Acciones', '#accio', 5),
(default, 'fa fa-times', 'Restricciones', '/admin/restricciones', 6),
(default, 'fa fa-times', 'Registros', '/admin/registros', 7),
(default, 'fa fa-times', 'Adiciones', '/admin/adiciones', 8);

INSERT INTO `rol` (`id_Rol`, `Nombre`, `Tipo`) VALUES
(default, 'SUPER ADMINISTRADOR', 1),
(default, 'EMPLEADO', 1),
(default, 'PASANTE', 2);

INSERT INTO `permisos` (`id_Permisos`, `Rol_Id_Rol`, `Menu_Id_Menu`) VALUES
(default, 1, 1),
(default, 1, 2),
(default, 2, 3),
(default, 2, 4),
(default, 2, 5),
(default, 2, 6),
(default, 2, 7),
(default, 2, 8),
(default, 2, 9),
(default, 2, 10),
(default, 3, 3),
(default, 3, 4),
(default, 3, 5),
(default, 3, 6);

INSERT INTO `entidad` (`id_Entidad`, `Nombre`, `Nit`, `Telefono`, `Direccion`, `Correo_Electronico`, `Estado`, `Municipio`, `Tipo`) VALUES
(default, 'Registraduria de Florencia Caqueta', '899999040-40', '321000111', 'A 15-110, Cl. 15 #15-2', 'registra@gmail.com', 'ACTIVA', 'FLORENCIA','PRINCIPAL');

INSERT INTO `persona` (`id_Persona`, `Identificacion_id_Identificacion`, `Identificacion`, `Nombre`, `Apellido`, `Correo_Electronico`, `Telefono`) VALUES
(default, 1, 1117546877, 'Socrates', 'Berrio', 'soc.martinez@udla.edu.co', '3212586973');

INSERT INTO `registro_ep` (`Id_Registro_EP`, `Fecha`, `Estado`, `Entidad_Id_Entidad`, `Persona_Id_Persona`, `Rol_Id_Rol`) VALUES
(default, '2020-06-03 11:11:11', 'ACTIVA', 1, 1, 1);

/*CREACION DE VISTAS*/
Create or replace view Consultar_Entidad as Select entidad.Id_Entidad as Id_Entidad, entidad.Nombre as Nombre_Entidad ,entidad.Nit as Nit, entidad.Municipio as Municipio, entidad.Estado as Estado
from entidad;

CREATE OR REPLACE VIEW `Menu_Usuarios` AS select Entidad.Id_Entidad AS Id_Entidad, persona.Id_Persona AS Id_Persona, rol.Nombre AS Nombre_Rol, Menu.Nombre AS Menu, Menu.Icono AS Icono_Menu, Menu.Ruta AS Rutas_Menu, Menu.orden as Orden_Menu
from persona 
inner join registro_ep on registro_ep.Persona_Id_Persona = persona.Id_Persona
inner join entidad on entidad.Id_Entidad = registro_ep.Entidad_Id_Entidad
inner join rol on rol.Id_Rol = registro_ep.Rol_Id_Rol
inner join permisos on permisos.Rol_Id_Rol = rol.Id_Rol
inner join menu on menu.Id_Menu = permisos.Menu_Id_Menu
ORDER BY Menu='Inicio' desc, Menu;

create or replace view `Variables_Usuario` as 
select usuario.Id_Usuario as Id_Usuario ,entidad.Id_Entidad as Id_entidad, entidad.Nombre as Nombre_Entidad, entidad.Nit as Nit_Entidad, persona.Id_Persona as Id_Empleado, concat(persona.Nombre, ' ', persona.Apellido) as Nombre_Usuario, persona.Identificacion as Ident_Usuario, rol.Nombre as Tipo_Usuario
from usuario
inner join persona on persona.Id_Persona = usuario.Persona_Id_Persona 
inner join registro_ep on registro_ep.Persona_Id_Persona = persona.Id_Persona 
inner join entidad on entidad.Id_Entidad = registro_ep.Entidad_Id_Entidad 
inner join rol on rol.Id_Rol = registro_ep.Rol_Id_Rol 
where registro_ep.Estado = 'ACTIVA' and entidad.Estado = 'ACTIVA';

create or replace view  `Lista_Usuarios` as
select concat(persona.nombre,' ', persona.apellido) as Nombre_User, rol.Nombre as Tipo_Usuario, persona.Identificacion as Ident_User, persona.Correo_Electronico as Correo_Usuario, persona.Telefono as Telefono_User, registro_ep.Estado as Estado_Usuario
from persona
inner join registro_ep on registro_ep.Persona_id_Persona = persona.id_Persona
inner join rol on rol.id_Rol = registro_ep.Rol_id_Rol;

create or replace view `Datos_Usuarios` as 
select persona.id_Persona as Id_User, persona.Nombre as Nombre, persona.Apellido as Apellido, identificacion.Tipo as TIdentificacion, persona.identificacion as Identificacion, persona.Telefono as Telefono, persona.Correo_Electronico as Correo, rol.Nombre as TipoUsuario
from persona
inner join identificacion on identificacion.id_Identificacion = persona.Identificacion_id_Identificacion
inner join registro_ep on registro_ep.Persona_Id_Persona = persona.Id_Persona  
inner join rol on rol.Id_Rol = registro_ep.Rol_Id_Rol; 

create or replace view  `Lista_Productos` as
select tipo_producto.Nombre as Tipo_Producto, producto.Cod_Producto as Codigo_Producto, producto.Nombre as Nombre_Producto, producto.Cantidad_Producto as Cantidad_Producto, producto.Descripcion as Descripcion_Producto, producto.Estado as Estado_Producto, proveedor.Nombre as Nombre_Proveedor
from producto
inner join tipo_producto on tipo_producto.id_Tipo_Producto = producto.Tipo_Producto_id_Tipo_Producto 
inner join proveedor on proveedor.id_Proveedor = producto.Proveedor_id_Proveedor;

create or replace view  `Lista_Restricciones` as
select producto.Nombre as Nombre_Producto, producto.Cod_Producto as Codigo_Producto, restricciones.id_Restricciones as Id_Restriccion, restricciones.Cantidad as Cantidad_Restriccion, restricciones.Detalle as Detalle_Restriccion ,restricciones.Estado as Estado_Restriccion
from restricciones
inner join producto on producto.id_Producto = restricciones.Producto_id_Producto;

create or replace view  `Lista_Productos_Peticiones` as
select producto.id_Producto as Id_Producto, tipo_producto.Nombre as Tipo_Producto, producto.Cod_Producto as Codigo_Producto, producto.Nombre as Nombre_Producto, producto.Cantidad_Producto as Cantidad_Producto, restricciones.Cantidad as Limite_Pedido, restricciones.Estado as Estado_Restriccion
from producto
inner join tipo_producto on tipo_producto.id_Tipo_Producto = producto.Tipo_Producto_id_Tipo_Producto 
left join restricciones on restricciones.Producto_id_Producto = producto.id_Producto 
where producto.Estado = 'DISPONIBLE';

create or replace view `lista_peticiones` as 
select pedidos.id_Pedidos as Id_Peticion, pedidos.Fecha_Pedido as Fecha_Peticion, Entidad.Nombre as Registraduria, pedidos.Estado as Estado_Peticion
from pedidos
inner join entidad on entidad.id_Entidad = pedidos.Entidad_id_Entidad;

SET GLOBAL log_bin_trust_function_creators = 1;
delimiter //
create procedure Registro_Usuarios(IN NombreUsuario VARCHAR(65), ApellidoUsuario VARCHAR(65), Tidentificacion INT, Identificacion VARCHAR(65), TelefonoUsuario VARCHAR(65), CorreoUsuario VARCHAR(65), Contrasena VARCHAR(65), TipoUsuario INT) 
not deterministic
begin 			
	declare Id_Entidad int;
	declare Id_Persona int;
	
	set Id_Entidad = 1;

	INSERT INTO `persona` (`id_Persona`, `Identificacion_id_Identificacion`, `Identificacion`, `Nombre`, `Apellido`, `Correo_Electronico`, `Telefono`) VALUES
	(default, Tidentificacion, Identificacion, NombreUsuario, ApellidoUsuario, CorreoUsuario, TelefonoUsuario);

	select persona.id_Persona into Id_Persona from persona where persona.Identificacion = Identificacion;
		
	INSERT INTO `registro_ep` (`d_Registro_EP`, `Fecha`, `Estado`, `Entidad_id_Entidad`, `Persona_id_Persona`, `Rol_Id_Rol`) VALUES
	(default, now(), 'ACTIVA', Id_Entidad, Id_Persona, TipoUsuario);
	
	INSERT INTO `usuario` (`id_Usuario`, `Usuario`, `Password`, `Persona_id_Persona`) VALUES
	(default, Identificacion, Contrasena, Id_Persona);
			
end;
//

create procedure `Registro_Productos` (IN Tipo_Producto INT, Codigo_Producto VARCHAR(65), Nombre_Producto VARCHAR(65), Descripcion_Producto VARCHAR(250), Bodega_1 INT, Bodega_2 INT) 
not deterministic
begin 			
	declare Cantidad int;
	declare Id_Product int;
	
	set Cantidad = Bodega_1 + Bodega_2;

	INSERT INTO `producto` (`id_Producto`, `Tipo_Producto_id_Tipo_Producto`, `Cod_Producto`, `Nombre`, `Cantidad`, `Descripcion`, `Estado`, `Proovedor_id_Proveedor`) VALUES
	(default, Tipo_Producto, Codigo_Producto, Nombre_Producto, Cantidad, Descripcion_Producto, 'DISPONIBLE', 1);

	select producto.id_Producto into Id_Product from producto where producto.Cod_Producto = Codigo_Producto;
		
	if Bodega_1 > 0 then
	insert into `inventario` (`id_Inventario`,`Cod_Inventario`,`Cantidad`,`Fecha_Registro`,`Bodega_id_Bodega`, `Producto_id_Producto`) values
	(default, Codigo_Producto, Bodega_1, now(), 1, Id_Product);
	end if;	
	
	if Bodega_2 > 0 then
	insert into `inventario` (`id_Inventario`,`Cod_Inventario`,`Cantidad`,`Fecha_Registro`,`Bodega_id_Bodega`, `Producto_id_Producto`) values
	(default, Codigo_Producto, Bodega_2, now(), 2, Id_Product);
	end if;
			
end;
 
/*async function Lista_Inventario() {

    const Arreglo1 = await pool.query("select * from lista_productos");
    const Arreglo2 = await pool.query("select id_producto, count(*) as ciclos from lista_productos group by Id_Producto");

    for (let i = 0; i < Arreglo1.length; i++) {
        for (let j = 1; j < Arreglo1.length; j++) {
            if (Arreglo1[i].Id_Producto == Arreglo1[j].Id_Producto) {
                if (Arreglo1[i].Nombre_Bodega == "INSUMOS RAPIDOS" && Arreglo1[i].Nombre_Bodega != Arreglo1[j].Nombre_Bodega) {
                    console.log("Entro aca: " + i + " - " + j + " - Nombre: " + Arreglo1[i].Nombre_Producto + " - Bodega1: " + Arreglo1[i].Nombre_Bodega + " - Inventario: " + Arreglo1[i].Inventario_Bodega + " - Bodega2: " + Arreglo1[j].Nombre_Bodega + " - Inventario: " + Arreglo1[j].Inventario_Bodega)
                    console.log('Paso0');
                    await pool.query("INSERT INTO `Temp_Inventarios` (`Id_Producto`, `Tipo_Producto`, `Codigo_Producto`, `Nombre_Producto`, `Cantidad_Producto`, `Id_Inventario1`, `Inventario_Bodega1`, `Id_Inventario2`, `Inventario_Bodega2`) values (" + Arreglo1[i].Id_Producto + ", '" + Arreglo1[i].Tipo_Producto + "', '" + Arreglo1[i].Codigo_Producto + "', '" + Arreglo1[i].Nombre_Producto + "', " + Arreglo1[i].Cantidad_Producto + ", " + Arreglo1[i].Id_Inventario + ", " + Arreglo1[i].Inventario_Bodega + ", " + Arreglo1[j].Id_Inventario + ", " + Arreglo1[j].Inventario_Bodega + ")");
                };
            };
        };
        for (let k = 0; k < Arreglo2.length; k++) {
            if (Arreglo2[k].Id_Producto == Arreglo1[i].Id_Producto && Arreglo2[k].ciclos == 1) {
                console.log("Pasa aca: " + i + " - " + k + " - Nombre: " + Arreglo1[i].Nombre_Producto + " - Bodega1: " + Arreglo1[i].Nombre_Bodega + " - Inventario: " + Arreglo1[i].Inventario_Bodega);
                if (Arreglo1[i].Nombre_Bodega == 'INSUMOS RAPIDOS') {
                    console.log('Paso1');
                    await pool.query("INSERT INTO `Temp_Inventarios` (`Id_Producto`, `Tipo_Producto`, `Codigo_Producto`, `Nombre_Producto`, `Cantidad_Producto`, `Id_Inventario1`, `Inventario_Bodega1`, `Id_Inventario2`, `Inventario_Bodega2`) values (" + Arreglo1[i].Id_Producto + ", '" + Arreglo1[i].Tipo_Producto + "', '" + Arreglo1[i].Codigo_Producto + "', '" + Arreglo1[i].Nombre_Producto + "', " + Arreglo1[i].Cantidad_Producto + ", " + Arreglo1[i].Id_Inventario + ", " + Arreglo1[i].Inventario_Bodega + ", 0, 0)");
                }if (Arreglo1[i].Nombre_Bodega == 'BODEGA') {
                    console.log('Paso2');
                    await pool.query("INSERT INTO `Temp_Inventarios` (`Id_Producto`, `Tipo_Producto`, `Codigo_Producto`, `Nombre_Producto`, `Cantidad_Producto`, `Id_Inventario1`, `Inventario_Bodega1`, `Id_Inventario2`, `Inventario_Bodega2`) values (" + Arreglo1[i].Id_Producto + ", '" + Arreglo1[i].Tipo_Producto + "', '" + Arreglo1[i].Codigo_Producto + "', '" + Arreglo1[i].Nombre_Producto + "', " + Arreglo1[i].Cantidad_Producto + ", 0, 0, " + Arreglo1[i].Id_Inventario + ", " + Arreglo1[i].Inventario_Bodega + ")");
                }
            };
        }
    };

}*/

select Tipo_Producto, Id_Producto, Codigo_Producto, Nombre_Producto, Cantidad_Producto, Descripcion_Producto, Estado_Producto,
	max(if(Nombre_Bodega = 'INSUMOS RAPIDOS', Id_Inventario , 0)) as Id_Inv1,
	max(if(Nombre_Bodega = 'INSUMOS RAPIDOS', Inventario_Bodega , 0)) as Inv_bodega1,
	max(if(Nombre_Bodega = 'BODEGA', Id_Inventario , 0)) as Id_Inv2, 
	max(if(Nombre_Bodega = 'BODEGA', Inventario_Bodega , 0)) as Inv_bodega2 
from lista_productos
where Estado_Producto = 'DISPONIBLE'
group by Tipo_Producto, Id_Producto, Codigo_Producto, Nombre_Producto, Cantidad_Producto, Descripcion_Producto, Estado_Producto;

create procedure `Actualizar_Inventario` (IN Id_Inven INT, Valor_Inventario INT) 
not deterministic
begin 			
	declare Valor1 int;
	declare Cantidad int;
	declare Id_Producto int;
	
	select inventario.Producto_id_Producto into Id_Producto from inventario where inventario.id_Inventario = Id_Inven;

	select producto.Cantidad_Producto into Valor1 from producto where producto.id_Producto = Id_Producto;

	set Cantidad = Valor1 - Valor_Inventario;

	update producto set producto.Cantidad_Producto = Cantidad where producto.id_Producto = Id_Producto;
	update inventario set inventario.Cantidad = Valor_Inventario where inventario.id_Inventario = Id_Inven;
			
end;

#trigger
delimiter //
create trigger Estado_Producto_Dis
before update on producto
for each row
begin
	if new.Cantidad_Producto > 0 then 
	set new.Estado = 'DISPONIBLE';
	end if;
end;
//

delimiter //
create trigger Estado_Producto_Ago
before update on producto
for each row
begin 
	if new.Cantidad_Producto = 0 then 
	set new.Estado = 'AGOTADO'; 
	end if;
end;
//