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


 