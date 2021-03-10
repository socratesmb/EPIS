use epis;

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
(default, 'fa fa-times', 'Registros', '/admin/registros', 7);

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