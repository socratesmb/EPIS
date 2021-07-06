-- -----------------------------------------------------
-- Schema epis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `epis` DEFAULT CHARACTER SET utf8 ;
USE `epis` ;

-- -----------------------------------------------------
-- Table `epis`.`entidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`entidad` (
  `id_Entidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(150) NOT NULL,
  `Nit` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(25) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Correo_Electronico` VARCHAR(100) NOT NULL,
  `Estado` ENUM('ACTIVA', 'INACTIVA') NOT NULL,
  `Municipio` VARCHAR(45) NOT NULL,
  `Tipo` ENUM('PRINCIPAL', 'SEDE') NOT NULL,
  PRIMARY KEY (`id_Entidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`bodega` (
  `id_Bodega` INT NOT NULL AUTO_INCREMENT,
  `Cod_Bodega` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Tipo_Bodega` ENUM('GRANDE', 'PEQUEÑA') NOT NULL,
  `Estado` ENUM('ACTIVA', 'INACTIVA') NOT NULL,
  `Entidad_id_Entidad` INT NOT NULL,
  PRIMARY KEY (`id_Bodega`),
  INDEX `fk_Bodega_Entidad1_idx` (`Entidad_id_Entidad` ASC) VISIBLE,
  CONSTRAINT `fk_Bodega_Entidad1`
    FOREIGN KEY (`Entidad_id_Entidad`)
    REFERENCES `epis`.`entidad` (`id_Entidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`identificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`identificacion` (
  `id_Identificacion` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Estado` ENUM('ACTIVO', 'INACTIVO') NOT NULL,
  PRIMARY KEY (`id_Identificacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`proveedor` (
  `id_Proveedor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Nit` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Estado` ENUM('ACTIVO', 'INACTIVO') CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id_Proveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`tipo_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`tipo_producto` (
  `id_Tipo_Producto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(250) NOT NULL,
  `Estado` ENUM('ACTIVO', 'INACTIVO') CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id_Tipo_Producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`producto` (
  `id_Producto` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Producto_id_Tipo_Producto` INT NOT NULL,
  `Cod_Producto` VARCHAR(65) CHARACTER SET 'utf8' NOT NULL,
  `Nombre` VARCHAR(65) CHARACTER SET 'utf8' NOT NULL,
  `Cantidad_Producto` INT NOT NULL,
  `Descripcion` VARCHAR(250) CHARACTER SET 'utf8' NOT NULL,
  `Estado` ENUM('DISPONIBLE', 'AGOTADO') NOT NULL,
  `Proveedor_id_Proveedor` INT NOT NULL,
  PRIMARY KEY (`id_Producto`),
  INDEX `fk_Producto_Tipo_Producto1_idx` (`Tipo_Producto_id_Tipo_Producto` ASC) VISIBLE,
  INDEX `fk_Producto_Proveedor1_idx` (`Proveedor_id_Proveedor` ASC) INVISIBLE,
  CONSTRAINT `fk_Producto_Proveedor1`
    FOREIGN KEY (`Proveedor_id_Proveedor`)
    REFERENCES `epis`.`proveedor` (`id_Proveedor`),
  CONSTRAINT `fk_Producto_Tipo_Producto1`
    FOREIGN KEY (`Tipo_Producto_id_Tipo_Producto`)
    REFERENCES `epis`.`tipo_producto` (`id_Tipo_Producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`inventario` (
  `id_Inventario` INT NOT NULL AUTO_INCREMENT,
  `Cod_Inventario` VARCHAR(45) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Fecha_Registro` TIMESTAMP NOT NULL,
  `Bodega_id_Bodega` INT NOT NULL,
  `Producto_id_Producto` INT NOT NULL,
  PRIMARY KEY (`id_Inventario`),
  INDEX `fk_Inventario_Bodega1_idx` (`Bodega_id_Bodega` ASC) INVISIBLE,
  INDEX `fk_Inventario_Inventario1` (`Producto_id_Producto` ASC) VISIBLE,
  CONSTRAINT `fk_Inventario_Bodega1`
    FOREIGN KEY (`Bodega_id_Bodega`)
    REFERENCES `epis`.`bodega` (`id_Bodega`),
  CONSTRAINT `fk_Inventario_Inventario1`
    FOREIGN KEY (`Producto_id_Producto`)
    REFERENCES `epis`.`producto` (`id_Producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`menu` (
  `id_Menu` INT NOT NULL AUTO_INCREMENT,
  `Icono` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ruta` TEXT NOT NULL,
  `Orden` INT NOT NULL,
  PRIMARY KEY (`id_Menu`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`pedidos` (
  `id_Pedidos` INT NOT NULL AUTO_INCREMENT,
  `Entidad_id_Entidad` INT NOT NULL,
  `Fecha_Pedido` TIMESTAMP NOT NULL,
  `Fecha_Atendido` TIMESTAMP NULL DEFAULT NULL,
  `Observaciones` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Estado` ENUM('PENDIENTE', 'COMPLETADA', 'CANCELADA') CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id_Pedidos`),
  INDEX `fk_Pedidos_Entidad1_idx` (`Entidad_id_Entidad` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Entidad1`
    FOREIGN KEY (`Entidad_id_Entidad`)
    REFERENCES `epis`.`entidad` (`id_Entidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`rol` (
  `id_Rol` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Tipo` ENUM('ADMIN', 'PROFESIONAL', 'PASANTE') NOT NULL,
  PRIMARY KEY (`id_Rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`permisos` (
  `id_Permisos` INT NOT NULL AUTO_INCREMENT,
  `Rol_id_Rol` INT NOT NULL,
  `Menu_id_Menu` INT NOT NULL,
  PRIMARY KEY (`id_Permisos`),
  INDEX `fk_Permisos_Menu1_idx` (`Menu_id_Menu` ASC) VISIBLE,
  INDEX `fk_Permisos_Rol1_idx` (`Rol_id_Rol` ASC) VISIBLE,
  CONSTRAINT `fk_Permisos_Menu1`
    FOREIGN KEY (`Menu_id_Menu`)
    REFERENCES `epis`.`menu` (`id_Menu`),
  CONSTRAINT `fk_Permisos_Rol1`
    FOREIGN KEY (`Rol_id_Rol`)
    REFERENCES `epis`.`rol` (`id_Rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`persona` (
  `id_Persona` INT NOT NULL AUTO_INCREMENT,
  `Identificacion_id_Identificacion` INT NOT NULL,
  `Identificacion` VARCHAR(65) NOT NULL,
  `Nombre` VARCHAR(65) NOT NULL,
  `Apellido` VARCHAR(65) NOT NULL,
  `Correo_Electronico` VARCHAR(65) NOT NULL,
  `Telefono` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`id_Persona`),
  INDEX `fk_Persona_Identificacion1_idx` (`Identificacion_id_Identificacion` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Identificacion1`
    FOREIGN KEY (`Identificacion_id_Identificacion`)
    REFERENCES `epis`.`identificacion` (`id_Identificacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`registro_ep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`registro_ep` (
  `id_Registro_EP` INT NOT NULL AUTO_INCREMENT,
  `Fecha` TIMESTAMP NOT NULL,
  `Estado` ENUM('ACTIVA', 'INACTIVA') NOT NULL,
  `Entidad_id_Entidad` INT NOT NULL,
  `Persona_id_Persona` INT NOT NULL,
  `Rol_id_Rol` INT NOT NULL,
  PRIMARY KEY (`id_Registro_EP`),
  INDEX `fk_Registro_EP_Entidad1_idx` (`Entidad_id_Entidad` ASC) VISIBLE,
  INDEX `fk_Registro_EP_Persona1_idx` (`Persona_id_Persona` ASC) VISIBLE,
  INDEX `fk_Registro_EP_Rol1_idx` (`Rol_id_Rol` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_EP_Entidad1`
    FOREIGN KEY (`Entidad_id_Entidad`)
    REFERENCES `epis`.`entidad` (`id_Entidad`),
  CONSTRAINT `fk_Registro_EP_Persona1`
    FOREIGN KEY (`Persona_id_Persona`)
    REFERENCES `epis`.`persona` (`id_Persona`),
  CONSTRAINT `fk_Registro_EP_Rol1`
    FOREIGN KEY (`Rol_id_Rol`)
    REFERENCES `epis`.`rol` (`id_Rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`registro_pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`registro_pedidos` (
  `id_Registro_Pedidos` INT NOT NULL AUTO_INCREMENT,
  `producto_id_Producto` INT NOT NULL,
  `pedidos_id_Pedidos` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`id_Registro_Pedidos`),
  INDEX `fk_Registro_Pedidos_producto1_idx` (`producto_id_Producto` ASC) VISIBLE,
  INDEX `fk_Registro_Pedidos_pedidos1_idx` (`pedidos_id_Pedidos` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Pedidos_pedidos1`
    FOREIGN KEY (`pedidos_id_Pedidos`)
    REFERENCES `epis`.`pedidos` (`id_Pedidos`),
  CONSTRAINT `fk_Registro_Pedidos_producto1`
    FOREIGN KEY (`producto_id_Producto`)
    REFERENCES `epis`.`producto` (`id_Producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`restricciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`restricciones` (
  `id_Restricciones` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` INT NOT NULL,
  `Detalle` VARCHAR(250) NOT NULL,
  `Estado` ENUM('ACTIVA', 'INACTIVA') NOT NULL,
  `Producto_id_Producto` INT NOT NULL,
  PRIMARY KEY (`id_Restricciones`),
  INDEX `fk_Restricciones_Producto1_idx` (`Producto_id_Producto` ASC) VISIBLE,
  CONSTRAINT `fk_Restricciones_Producto1`
    FOREIGN KEY (`Producto_id_Producto`)
    REFERENCES `epis`.`producto` (`id_Producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`sessions` (
  `session_id` VARCHAR(128) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NOT NULL,
  `expires` INT UNSIGNED NOT NULL,
  `data` MEDIUMTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL DEFAULT NULL,
  PRIMARY KEY (`session_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `epis`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`usuario` (
  `id_Usuario` INT NOT NULL AUTO_INCREMENT,
  `Usuario` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(65) NOT NULL,
  `Persona_id_Persona` INT NOT NULL,
  PRIMARY KEY (`id_Usuario`),
  INDEX `fk_Usuario_Persona_idx` (`Persona_id_Persona` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Persona`
    FOREIGN KEY (`Persona_id_Persona`)
    REFERENCES `epis`.`persona` (`id_Persona`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb3;

USE `epis` ;

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`consultar_entidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`consultar_entidad` (`Id_Entidad` INT, `Nombre_Entidad` INT, `Nit` INT, `Municipio` INT, `Estado` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`datos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`datos_usuarios` (`Id_User` INT, `Nombre` INT, `Apellido` INT, `TIdentificacion` INT, `Identificacion` INT, `Telefono` INT, `Correo` INT, `TipoUsuario` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`lista_peticiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`lista_peticiones` (`Id_Peticion` INT, `Fecha_Peticion` INT, `Registraduria` INT, `Estado_Peticion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`lista_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`lista_productos` (`Tipo_Producto` INT, `Id_Producto` INT, `Codigo_Producto` INT, `Nombre_Producto` INT, `Cantidad_Producto` INT, `Descripcion_Producto` INT, `Estado_Producto` INT, `Id_Inventario` INT, `Inventario_Bodega` INT, `Nombre_Bodega` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`lista_productos_peticiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`lista_productos_peticiones` (`Id_Producto` INT, `Tipo_Producto` INT, `Codigo_Producto` INT, `Nombre_Producto` INT, `Cantidad_Producto` INT, `Limite_Pedido` INT, `Estado_Restriccion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`lista_registro_pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`lista_registro_pedidos` (`Id_Registro` INT, `Id_Producto` INT, `Id_Pedido` INT, `Tipo_Producto` INT, `Nombre_Producto` INT, `Codigo_Producto` INT, `Cantidad_Pedido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`lista_restricciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`lista_restricciones` (`Nombre_Producto` INT, `Codigo_Producto` INT, `Id_Restriccion` INT, `Cantidad_Restriccion` INT, `Detalle_Restriccion` INT, `Estado_Restriccion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`lista_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`lista_usuarios` (`Id_User` INT, `Nombre_User` INT, `Tipo_Usuario` INT, `Ident_User` INT, `Correo_Usuario` INT, `Telefono_User` INT, `Estado_Usuario` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`menu_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`menu_usuarios` (`Id_Entidad` INT, `Id_Persona` INT, `Nombre_Rol` INT, `Menu` INT, `Icono_Menu` INT, `Rutas_Menu` INT, `Orden_Menu` INT);

-- -----------------------------------------------------
-- Placeholder table for view `epis`.`variables_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epis`.`variables_usuario` (`Id_Usuario` INT, `Id_Entidad` INT, `Nombre_Entidad` INT, `Nit_Entidad` INT, `Id_Empleado` INT, `Nombre_Usuario` INT, `Ident_Usuario` INT, `Tipo_Usuario` INT);

-- -----------------------------------------------------
-- procedure Actualizacion_Producto
-- -----------------------------------------------------

DELIMITER $$
USE `epis`$$
CREATE PROCEDURE `Actualizacion_Producto`(IN Tipo_Producto INT, Codigo_Producto VARCHAR(65), Nombre_Producto VARCHAR(65), Descripcion_Producto VARCHAR(250), Bodega1 INT, Bodega2 INT, Id_Producto INT)
begin 		
	declare Cantidads int;
	
	set Cantidads = bodega1 + bodega2;
	
	update producto set producto.Tipo_Producto_id_Tipo_Producto = Tipo_Producto, producto.Cod_Producto = Codigo_Producto, producto.Nombre = Nombre_Producto, producto.Descripcion = Descripcion_Producto, producto.Cantidad_Producto = Cantidads where producto.id_Producto = Id_Producto;

	if Bodega1 != 0 then
	update inventario set inventario.Cantidad = Bodega1 where inventario.Producto_id_Producto = Id_Producto and inventario.Bodega_id_Bodega = 1;
	end if;

	if Bodega2 != 0 then
	update inventario set inventario.Cantidad = Bodega2 where inventario.Producto_id_Producto = Id_Producto and inventario.Bodega_id_Bodega = 2;
	end if;

end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Actualizar_Inventario
-- -----------------------------------------------------

DELIMITER $$
USE `epis`$$
CREATE PROCEDURE `Actualizar_Inventario`(IN Id_Inven INT, Valor_Inventario INT)
begin 			
	declare Valor1 int;
	declare Valor2 int;
	declare Valor3 int;
	declare Cantidad int;
	declare Id_Producto int;
	
	select inventario.Producto_id_Producto into Id_Producto from inventario where inventario.id_Inventario = Id_Inven;

	select producto.Cantidad_Producto into Valor1 from producto where producto.id_Producto = Id_Producto;

	select inventario.Cantidad into Valor2 from inventario where inventario.id_Inventario = Id_Inven;
	
	set Valor3 = Valor2 - Valor_Inventario;

	set Cantidad = Valor1 - Valor3;

	update producto set producto.Cantidad_Producto = Cantidad where producto.id_Producto = Id_Producto;

	update inventario set inventario.Cantidad = Valor_Inventario where inventario.id_Inventario = Id_Inven;
			
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Despacho_Unitario_Producto
-- -----------------------------------------------------

DELIMITER $$
USE `epis`$$
CREATE PROCEDURE `Despacho_Unitario_Producto`(IN Id_Producto INT, Id_Inventario INT, Cantidad_Inventario INT, Cantidad_Pedido INT)
begin 			
	declare Resta int;
	declare CanProducto int;
	declare Cantidad int;	
	
	set Resta = Cantidad_Inventario - Cantidad_Pedido;
	
	select producto.Cantidad_Producto into CanProducto from producto where producto.id_Producto = Id_Producto;
	
	set Cantidad = CanProducto - Cantidad_Pedido;

	update inventario set inventario.Cantidad = Resta where inventario.id_Inventario = Id_Inventario;

	update producto set producto.Cantidad_Producto = Cantidad where producto.id_Producto = Id_Producto;
			
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Registro_Productos
-- -----------------------------------------------------

DELIMITER $$
USE `epis`$$
CREATE PROCEDURE `Registro_Productos`(IN Tipo_Producto INT, Codigo_Producto VARCHAR(65), Nombre_Producto VARCHAR(65), Descripcion_Producto VARCHAR(250), Bodega_1 INT, Bodega_2 INT)
begin 			
	declare Cantidad int;
	declare Id_Product int;
	
	set Cantidad = Bodega_1 + Bodega_2;

	INSERT INTO `producto` (`id_Producto`, `Tipo_Producto_id_Tipo_Producto`, `Cod_Producto`, `Nombre`, `Cantidad_Producto`, `Descripcion`, `Estado`, `Proveedor_id_Proveedor`) VALUES
	(default, Tipo_Producto, Codigo_Producto, Nombre_Producto, Cantidad, Descripcion_Producto, 'DISPONIBLE', 1);

	select producto.id_Producto into Id_Product from producto where producto.Cod_Producto = Codigo_Producto;
		
	if Bodega_1 > 0 then
	insert into `inventario` (`id_Inventario`, `Cod_Inventario`, `Cantidad`, `Fecha_Registro`,`Bodega_id_Bodega`, `Producto_id_Producto`) values
	(default, Codigo_Producto, Bodega_1, now(), 1, Id_Product);
	end if;	
	
	if Bodega_2 > 0 then
	insert into `inventario` (`id_Inventario`, `Cod_Inventario`, `Cantidad`, `Fecha_Registro`,`Bodega_id_Bodega`, `Producto_id_Producto`) values
	(default, Codigo_Producto, Bodega_2, now(), 2, Id_Product);
	end if;
			
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Registro_Usuarios
-- -----------------------------------------------------

DELIMITER $$
USE `epis`$$
CREATE PROCEDURE `Registro_Usuarios`(IN NombreUsuario VARCHAR(65), ApellidoUsuario VARCHAR(65), Tidentificacion INT, Identifica VARCHAR(65), TelefonoUsuario VARCHAR(65), CorreoUsuario VARCHAR(65), Contrasena VARCHAR(65), TipoUsuario INT)
begin 			
	declare Id_Entidad int;
	declare Id_Persona int;
	
	set Id_Entidad = 1;

	INSERT INTO `persona` (`id_Persona`, `Identificacion_id_Identificacion`, `Identificacion`, `Nombre`, `Apellido`, `Correo_Electronico`, `Telefono`) VALUES
	(default, Tidentificacion, Identifica, NombreUsuario, ApellidoUsuario, CorreoUsuario, TelefonoUsuario);

	select persona.id_Persona into Id_Persona from persona where persona.Identificacion = Identifica;
		
	INSERT INTO `registro_ep` (`id_Registro_EP`, `Fecha`, `Estado`, `Entidad_id_Entidad`, `Persona_id_Persona`, `Rol_Id_Rol`) VALUES
	(default, now(), 'ACTIVA', Id_Entidad, Id_Persona, TipoUsuario);
	
	INSERT INTO `usuario` (`id_Usuario`, `Usuario`, `Password`, `Persona_id_Persona`) VALUES
	(default, Identifica, Contrasena, Id_Persona);
			
end$$

DELIMITER ;

-- -----------------------------------------------------
-- View `epis`.`consultar_entidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`consultar_entidad`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`consultar_entidad` AS select `epis`.`entidad`.`id_Entidad` AS `Id_Entidad`,`epis`.`entidad`.`Nombre` AS `Nombre_Entidad`,`epis`.`entidad`.`Nit` AS `Nit`,`epis`.`entidad`.`Municipio` AS `Municipio`,`epis`.`entidad`.`Estado` AS `Estado` from `epis`.`entidad`;

-- -----------------------------------------------------
-- View `epis`.`datos_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`datos_usuarios`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`datos_usuarios` AS select `epis`.`persona`.`id_Persona` AS `Id_User`,`epis`.`persona`.`Nombre` AS `Nombre`,`epis`.`persona`.`Apellido` AS `Apellido`,`epis`.`identificacion`.`Tipo` AS `TIdentificacion`,`epis`.`persona`.`Identificacion` AS `Identificacion`,`epis`.`persona`.`Telefono` AS `Telefono`,`epis`.`persona`.`Correo_Electronico` AS `Correo`,`epis`.`rol`.`Nombre` AS `TipoUsuario` from (((`epis`.`persona` join `epis`.`identificacion` on((`epis`.`identificacion`.`id_Identificacion` = `epis`.`persona`.`Identificacion_id_Identificacion`))) join `epis`.`registro_ep` on((`epis`.`registro_ep`.`Persona_id_Persona` = `epis`.`persona`.`id_Persona`))) join `epis`.`rol` on((`epis`.`rol`.`id_Rol` = `epis`.`registro_ep`.`Rol_id_Rol`)));

-- -----------------------------------------------------
-- View `epis`.`lista_peticiones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`lista_peticiones`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`lista_peticiones` AS select `epis`.`pedidos`.`id_Pedidos` AS `Id_Peticion`,date_format(`epis`.`pedidos`.`Fecha_Pedido`,'%Y-%m-%d %r') AS `Fecha_Peticion`,`epis`.`entidad`.`Nombre` AS `Registraduria`,`epis`.`pedidos`.`Estado` AS `Estado_Peticion` from (`epis`.`pedidos` join `epis`.`entidad` on((`epis`.`entidad`.`id_Entidad` = `epis`.`pedidos`.`Entidad_id_Entidad`)));

-- -----------------------------------------------------
-- View `epis`.`lista_productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`lista_productos`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`lista_productos` AS select `epis`.`tipo_producto`.`Nombre` AS `Tipo_Producto`,`epis`.`producto`.`id_Producto` AS `Id_Producto`,`epis`.`producto`.`Cod_Producto` AS `Codigo_Producto`,`epis`.`producto`.`Nombre` AS `Nombre_Producto`,`epis`.`producto`.`Cantidad_Producto` AS `Cantidad_Producto`,`epis`.`producto`.`Descripcion` AS `Descripcion_Producto`,`epis`.`producto`.`Estado` AS `Estado_Producto`,`epis`.`inventario`.`id_Inventario` AS `Id_Inventario`,`epis`.`inventario`.`Cantidad` AS `Inventario_Bodega`,`epis`.`bodega`.`Nombre` AS `Nombre_Bodega` from (((`epis`.`inventario` join `epis`.`bodega` on((`epis`.`bodega`.`id_Bodega` = `epis`.`inventario`.`Bodega_id_Bodega`))) join `epis`.`producto` on((`epis`.`producto`.`id_Producto` = `epis`.`inventario`.`Producto_id_Producto`))) join `epis`.`tipo_producto` on((`epis`.`tipo_producto`.`id_Tipo_Producto` = `epis`.`producto`.`Tipo_Producto_id_Tipo_Producto`)));

-- -----------------------------------------------------
-- View `epis`.`lista_productos_peticiones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`lista_productos_peticiones`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`lista_productos_peticiones` AS select `epis`.`producto`.`id_Producto` AS `Id_Producto`,`epis`.`tipo_producto`.`Nombre` AS `Tipo_Producto`,`epis`.`producto`.`Cod_Producto` AS `Codigo_Producto`,`epis`.`producto`.`Nombre` AS `Nombre_Producto`,`epis`.`producto`.`Cantidad_Producto` AS `Cantidad_Producto`,`epis`.`restricciones`.`Cantidad` AS `Limite_Pedido`,`epis`.`restricciones`.`Estado` AS `Estado_Restriccion` from ((`epis`.`producto` join `epis`.`tipo_producto` on((`epis`.`tipo_producto`.`id_Tipo_Producto` = `epis`.`producto`.`Tipo_Producto_id_Tipo_Producto`))) left join `epis`.`restricciones` on((`epis`.`restricciones`.`Producto_id_Producto` = `epis`.`producto`.`id_Producto`))) where (`epis`.`producto`.`Estado` = 'DISPONIBLE');

-- -----------------------------------------------------
-- View `epis`.`lista_registro_pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`lista_registro_pedidos`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`lista_registro_pedidos` AS select `epis`.`registro_pedidos`.`id_Registro_Pedidos` AS `Id_Registro`,`epis`.`registro_pedidos`.`producto_id_Producto` AS `Id_Producto`,`epis`.`registro_pedidos`.`pedidos_id_Pedidos` AS `Id_Pedido`,`epis`.`tipo_producto`.`Nombre` AS `Tipo_Producto`,`epis`.`producto`.`Nombre` AS `Nombre_Producto`,`epis`.`producto`.`Cod_Producto` AS `Codigo_Producto`,`epis`.`registro_pedidos`.`Cantidad` AS `Cantidad_Pedido` from ((`epis`.`registro_pedidos` join `epis`.`producto` on((`epis`.`producto`.`id_Producto` = `epis`.`registro_pedidos`.`producto_id_Producto`))) join `epis`.`tipo_producto` on((`epis`.`tipo_producto`.`id_Tipo_Producto` = `epis`.`producto`.`Tipo_Producto_id_Tipo_Producto`)));

-- -----------------------------------------------------
-- View `epis`.`lista_restricciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`lista_restricciones`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`lista_restricciones` AS select `epis`.`producto`.`Nombre` AS `Nombre_Producto`,`epis`.`producto`.`Cod_Producto` AS `Codigo_Producto`,`epis`.`restricciones`.`id_Restricciones` AS `Id_Restriccion`,`epis`.`restricciones`.`Cantidad` AS `Cantidad_Restriccion`,`epis`.`restricciones`.`Detalle` AS `Detalle_Restriccion`,`epis`.`restricciones`.`Estado` AS `Estado_Restriccion` from (`epis`.`restricciones` join `epis`.`producto` on((`epis`.`producto`.`id_Producto` = `epis`.`restricciones`.`Producto_id_Producto`)));

-- -----------------------------------------------------
-- View `epis`.`lista_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`lista_usuarios`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`lista_usuarios` AS select `epis`.`persona`.`id_Persona` AS `Id_User`,concat(`epis`.`persona`.`Nombre`,' ',`epis`.`persona`.`Apellido`) AS `Nombre_User`,`epis`.`rol`.`Nombre` AS `Tipo_Usuario`,`epis`.`persona`.`Identificacion` AS `Ident_User`,`epis`.`persona`.`Correo_Electronico` AS `Correo_Usuario`,`epis`.`persona`.`Telefono` AS `Telefono_User`,`epis`.`registro_ep`.`Estado` AS `Estado_Usuario` from ((`epis`.`persona` join `epis`.`registro_ep` on((`epis`.`registro_ep`.`Persona_id_Persona` = `epis`.`persona`.`id_Persona`))) join `epis`.`rol` on((`epis`.`rol`.`id_Rol` = `epis`.`registro_ep`.`Rol_id_Rol`)));

-- -----------------------------------------------------
-- View `epis`.`menu_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`menu_usuarios`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`menu_usuarios` AS select `epis`.`entidad`.`id_Entidad` AS `Id_Entidad`,`epis`.`persona`.`id_Persona` AS `Id_Persona`,`epis`.`rol`.`Nombre` AS `Nombre_Rol`,`epis`.`menu`.`Nombre` AS `Menu`,`epis`.`menu`.`Icono` AS `Icono_Menu`,`epis`.`menu`.`Ruta` AS `Rutas_Menu`,`epis`.`menu`.`Orden` AS `Orden_Menu` from (((((`epis`.`persona` join `epis`.`registro_ep` on((`epis`.`registro_ep`.`Persona_id_Persona` = `epis`.`persona`.`id_Persona`))) join `epis`.`entidad` on((`epis`.`entidad`.`id_Entidad` = `epis`.`registro_ep`.`Entidad_id_Entidad`))) join `epis`.`rol` on((`epis`.`rol`.`id_Rol` = `epis`.`registro_ep`.`Rol_id_Rol`))) join `epis`.`permisos` on((`epis`.`permisos`.`Rol_id_Rol` = `epis`.`rol`.`id_Rol`))) join `epis`.`menu` on((`epis`.`menu`.`id_Menu` = `epis`.`permisos`.`Menu_id_Menu`))) order by (`epis`.`menu`.`Nombre` = 'Inicio') desc,`epis`.`menu`.`Orden`;

-- -----------------------------------------------------
-- View `epis`.`variables_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `epis`.`variables_usuario`;
USE `epis`;
CREATE  OR REPLACE  VIEW `epis`.`variables_usuario` AS select `epis`.`usuario`.`id_Usuario` AS `Id_Usuario`,`epis`.`entidad`.`id_Entidad` AS `Id_Entidad`,`epis`.`entidad`.`Nombre` AS `Nombre_Entidad`,`epis`.`entidad`.`Nit` AS `Nit_Entidad`,`epis`.`persona`.`id_Persona` AS `Id_Empleado`,concat(`epis`.`persona`.`Nombre`,' ',`epis`.`persona`.`Apellido`) AS `Nombre_Usuario`,`epis`.`persona`.`Identificacion` AS `Ident_Usuario`,`epis`.`rol`.`Nombre` AS `Tipo_Usuario` from ((((`epis`.`usuario` join `epis`.`persona` on((`epis`.`persona`.`id_Persona` = `epis`.`usuario`.`Persona_id_Persona`))) join `epis`.`registro_ep` on((`epis`.`registro_ep`.`Persona_id_Persona` = `epis`.`persona`.`id_Persona`))) join `epis`.`entidad` on((`epis`.`entidad`.`id_Entidad` = `epis`.`registro_ep`.`Entidad_id_Entidad`))) join `epis`.`rol` on((`epis`.`rol`.`id_Rol` = `epis`.`registro_ep`.`Rol_id_Rol`))) where ((`epis`.`registro_ep`.`Estado` = 'ACTIVA') and (`epis`.`entidad`.`Estado` = 'ACTIVA'));
USE `epis`;

DELIMITER $$
USE `epis`$$
CREATE
TRIGGER `epis`.`Estado_Producto_Ago`
BEFORE UPDATE ON `epis`.`producto`
FOR EACH ROW
begin 
	if new.Cantidad_Producto = 0 then 
	set new.Estado = 'AGOTADO'; 
	end if;
end$$

USE `epis`$$
CREATE
TRIGGER `epis`.`Estado_Producto_Dis`
BEFORE UPDATE ON `epis`.`producto`
FOR EACH ROW
begin
	if new.Cantidad_Producto > 0 then 
	set new.Estado = 'DISPONIBLE';
	end if;
end$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
