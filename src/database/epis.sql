-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: epis
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aud_conexion`
--

DROP TABLE IF EXISTS `aud_conexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aud_conexion` (
  `id_Aud_Conexion` int NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tiempo` timestamp NOT NULL,
  PRIMARY KEY (`id_Aud_Conexion`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_conexion`
--

LOCK TABLES `aud_conexion` WRITE;
/*!40000 ALTER TABLE `aud_conexion` DISABLE KEYS */;
INSERT INTO `aud_conexion` VALUES (1,'Socrates Berrio','root@localhost','2021-07-06 16:05:21'),(2,'Laura Dayana','root@localhost','2021-07-06 16:05:56'),(3,'Laura Milena Fajardo Valencia','root@localhost','2021-07-06 16:07:02'),(4,'Registraduria El Doncello','root@localhost','2021-07-06 16:16:59'),(5,'Laura Milena Fajardo Valencia','root@localhost','2021-07-06 16:24:53'),(6,'Registraduria El Doncello','root@localhost','2021-07-06 16:25:21'),(7,'Laura Milena Fajardo Valencia','root@localhost','2021-07-06 16:28:39'),(8,'Registraduria El Doncello','root@localhost','2021-07-06 16:29:10'),(9,'Registraduria El Paujil','root@localhost','2021-07-06 19:27:23'),(10,'Laura Milena Fajardo Valencia','root@localhost','2021-07-06 19:31:33'),(11,'Laura Milena Fajardo Valencia','root@localhost','2021-09-02 15:58:31'),(12,'Laura Milena Fajardo Valencia','root@localhost','2021-09-02 18:39:45'),(13,'Laura Milena Fajardo Valencia','root@localhost','2021-09-02 18:41:44'),(14,'Registraduria El Paujil','root@localhost','2021-09-02 18:42:21'),(15,'Laura Milena Fajardo Valencia','root@localhost','2021-09-02 18:43:05'),(16,'Registraduria El Paujil','root@localhost','2021-09-02 18:43:27'),(17,'Laura Milena Fajardo Valencia','root@localhost','2021-09-27 21:37:35'),(18,'Laura Milena Fajardo Valencia','root@localhost','2021-09-28 19:48:26'),(19,'Laura Milena Fajardo Valencia','root@localhost','2021-10-01 20:27:36'),(20,'Registraduria Belen de los Andaquies','root@localhost','2021-10-01 20:32:23'),(21,'Laura Milena Fajardo Valencia','root@localhost','2021-10-01 20:35:29'),(22,'Registraduria Belen de los Andaquies','root@localhost','2021-10-01 20:39:34'),(23,'Registraduria Cartagena del Chaira','root@localhost','2021-10-01 20:40:06'),(24,'Registraduria El Doncello','root@localhost','2021-10-01 20:40:13'),(25,'Laura Milena Fajardo Valencia','root@localhost','2021-10-03 03:28:31'),(26,'Laura Milena Fajardo Valencia','root@localhost','2021-10-03 22:53:03'),(27,'Laura Milena Fajardo Valencia','root@localhost','2021-10-03 22:58:30'),(28,'Registraduria Morelia','root@localhost','2021-10-03 23:08:18'),(29,'Laura Milena Fajardo Valencia','root@localhost','2021-10-03 23:08:50'),(30,'Registraduria Solano','root@localhost','2021-10-03 23:18:41'),(31,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 00:39:05'),(32,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 13:29:33'),(33,'Registraduria El Doncello','root@localhost','2021-10-04 13:31:54'),(34,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 13:37:54'),(35,'Registraduria El Doncello','root@localhost','2021-10-04 13:57:40'),(36,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 14:05:11'),(37,'Socrates Berrio','root@localhost','2021-10-04 14:10:41'),(38,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 15:47:38'),(39,'Registraduria Milan','root@localhost','2021-10-04 15:57:52'),(40,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 16:01:39'),(41,'Registraduria Milan','root@localhost','2021-10-04 16:04:09'),(42,'Socrates Berrio','root@localhost','2021-10-04 16:04:31'),(43,'Laura Milena Fajardo Valencia','root@localhost','2021-10-04 16:08:21');
/*!40000 ALTER TABLE `aud_conexion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_inventario`
--

DROP TABLE IF EXISTS `aud_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aud_inventario` (
  `id_Aud_Inventario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `tiempo` timestamp NOT NULL,
  `cambios` text NOT NULL,
  PRIMARY KEY (`id_Aud_Inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_inventario`
--

LOCK TABLES `aud_inventario` WRITE;
/*!40000 ALTER TABLE `aud_inventario` DISABLE KEYS */;
INSERT INTO `aud_inventario` VALUES (1,'root@localhost','2021-07-06 16:07:59','Cod_Inventario: 8080, Cantidad: 10, Fecha_Registro:2021-07-06 11:07:59'),(2,'root@localhost','2021-07-06 16:08:27','Cod_Inventario: 8080, Cantidad: 10, Fecha_Registro:2021-07-06 11:07:59 -- POR:  Cantidad: 8'),(3,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 3102020, Cantidad: 2 -- POR: Cantidad: 1, Fecha_Registro:2021-05-19 11:02:45'),(4,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 6101007, Cantidad: 7 -- POR: Cantidad: 4, Fecha_Registro:2021-05-19 15:19:23'),(5,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 7002020, Cantidad: 7 -- POR: Cantidad: 5, Fecha_Registro:2021-05-21 16:06:32'),(6,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 13343, Cantidad: 25 -- POR: Cantidad: 22, Fecha_Registro:2021-06-30 10:21:55'),(7,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 2300271, Cantidad: 30 -- POR: Cantidad: 28, Fecha_Registro:2021-06-30 10:23:15'),(8,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 4111009, Cantidad: 5 -- POR: Cantidad: 4, Fecha_Registro:2021-06-30 10:25:52'),(9,'root@localhost','2021-07-06 19:32:36','Cod_Inventario: 40050, Cantidad: 5 -- POR: Cantidad: 4, Fecha_Registro:2021-06-30 10:27:55'),(10,'root@localhost','2021-09-02 18:40:03','Cod_Inventario: 13343, Cantidad: 22 -- POR: Cantidad: 15, Fecha_Registro:2021-06-30 10:21:55'),(11,'root@localhost','2021-09-02 18:41:55','Cod_Inventario: 13343, Cantidad: 15 -- POR: Cantidad: 10, Fecha_Registro:2021-06-30 10:21:55'),(12,'root@localhost','2021-09-02 18:43:17','Cod_Inventario: 3102020, Cantidad: 2 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 11:02:45'),(13,'root@localhost','2021-09-02 18:43:17','Cod_Inventario: 5178, Cantidad: 4 -- POR: Cantidad: 1, Fecha_Registro:2021-05-19 15:20:16'),(14,'root@localhost','2021-09-02 18:43:17','Cod_Inventario: 2300271, Cantidad: 28 -- POR: Cantidad: 24, Fecha_Registro:2021-06-30 10:23:15'),(15,'root@localhost','2021-10-01 20:28:47','Cod_Inventario: 7002020, Cantidad: 5 -- POR: Cantidad: 3, Fecha_Registro:2021-05-21 16:06:32'),(16,'root@localhost','2021-10-01 20:29:40','Cod_Inventario: 6101007, Cantidad: 4 -- POR: Cantidad: 3, Fecha_Registro:2021-05-19 15:19:23'),(17,'root@localhost','2021-10-01 20:37:01','Cod_Inventario: 3102020, Cantidad: 1 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 11:02:45'),(18,'root@localhost','2021-10-01 20:37:01','Cod_Inventario: 6101007, Cantidad: 3 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 15:19:23'),(19,'root@localhost','2021-10-01 20:37:02','Cod_Inventario: 5178, Cantidad: 3 -- POR: Cantidad: 1, Fecha_Registro:2021-05-19 15:20:16'),(20,'root@localhost','2021-10-01 20:37:02','Cod_Inventario: 4111009, Cantidad: 5 -- POR: Cantidad: 3, Fecha_Registro:2021-06-30 10:25:52'),(21,'root@localhost','2021-10-01 20:37:20','Cod_Inventario: 15022, Cantidad: 3 -- POR: Cantidad: 0, Fecha_Registro:2021-06-30 10:27:00'),(22,'root@localhost','2021-10-01 20:39:08','Cod_Inventario: 15022, Cantidad: 0 -- POR: Cantidad: 8, Fecha_Registro:2021-06-30 10:27:00'),(23,'root@localhost','2021-10-03 23:02:47','Cod_Inventario: TH20, Cantidad: 18, Fecha_Registro:2021-10-03 18:02:47'),(24,'root@localhost','2021-10-03 23:03:58','Cod_Inventario: TH20, Cantidad: 18 -- POR: Cantidad: 12, Fecha_Registro:2021-10-03 18:02:47'),(25,'root@localhost','2021-10-03 23:06:05','Cod_Inventario: 2300271, Cantidad: 24 -- POR: Cantidad: 14, Fecha_Registro:2021-06-30 10:23:15'),(26,'root@localhost','2021-10-03 23:06:23','Cod_Inventario: 1355, Cantidad: 2 -- POR: Cantidad: 1, Fecha_Registro:2021-05-19 15:18:18'),(27,'root@localhost','2021-10-03 23:10:59','Cod_Inventario: 5178, Cantidad: 1 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 15:20:16'),(28,'root@localhost','2021-10-03 23:10:59','Cod_Inventario: 2300271, Cantidad: 14 -- POR: Cantidad: 10, Fecha_Registro:2021-06-30 10:23:15'),(29,'root@localhost','2021-10-03 23:10:59','Cod_Inventario: 15022, Cantidad: 8 -- POR: Cantidad: 3, Fecha_Registro:2021-06-30 10:27:00'),(30,'root@localhost','2021-10-04 13:42:13','Cod_Inventario: 3102020, Cantidad: 0 -- POR: Cantidad: 20, Fecha_Registro:2021-05-19 11:02:45'),(31,'root@localhost','2021-10-04 13:47:39','Cod_Inventario: TH20, Cantidad: 12 -- POR: Cantidad: 16, Fecha_Registro:2021-10-03 18:02:47'),(32,'root@localhost','2021-10-04 13:48:23','Cod_Inventario: 3102020, Cantidad: 20 -- POR: Cantidad: 15, Fecha_Registro:2021-05-19 11:02:45'),(33,'root@localhost','2021-10-04 13:48:35','Cod_Inventario: 3102020, Cantidad: 15 -- POR: Cantidad: 12, Fecha_Registro:2021-05-19 11:02:45'),(34,'root@localhost','2021-10-04 13:49:33','Cod_Inventario: 5178, Cantidad: 1 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 15:20:16'),(35,'root@localhost','2021-10-04 13:52:44','Cod_Inventario: 1355, Cantidad: 2 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 15:18:18'),(36,'root@localhost','2021-10-04 13:52:44','Cod_Inventario: 7002020, Cantidad: 3 -- POR: Cantidad: 2, Fecha_Registro:2021-05-21 16:06:32'),(37,'root@localhost','2021-10-04 13:52:44','Cod_Inventario: 40050, Cantidad: 4 -- POR: Cantidad: 3, Fecha_Registro:2021-06-30 10:27:55'),(38,'root@localhost','2021-10-04 14:05:41','Cod_Inventario: 3102020, Cantidad: 12 -- POR: Cantidad: 11, Fecha_Registro:2021-05-19 11:02:45'),(39,'root@localhost','2021-10-04 14:05:41','Cod_Inventario: 13343, Cantidad: 10 -- POR: Cantidad: 9, Fecha_Registro:2021-06-30 10:21:55'),(40,'root@localhost','2021-10-04 14:06:51','Cod_Inventario: 2457, Cantidad: 10, Fecha_Registro:2021-10-04 09:06:51'),(41,'root@localhost','2021-10-04 14:06:51','Cod_Inventario: 2457, Cantidad: 5, Fecha_Registro:2021-10-04 09:06:51'),(42,'root@localhost','2021-10-04 14:07:21','Cod_Inventario: 2457, Cantidad: 10 -- POR: Cantidad: 20, Fecha_Registro:2021-10-04 09:06:51'),(43,'root@localhost','2021-10-04 14:07:21','Cod_Inventario: 2457, Cantidad: 5 -- POR: Cantidad: 5, Fecha_Registro:2021-10-04 09:06:51'),(44,'root@localhost','2021-10-04 14:08:17','Cod_Inventario: 2457, Cantidad: 20 -- POR: Cantidad: 15, Fecha_Registro:2021-10-04 09:06:51'),(45,'root@localhost','2021-10-04 14:09:04','Cod_Inventario: 15022, Cantidad: 3 -- POR: Cantidad: 0, Fecha_Registro:2021-06-30 10:27:00'),(46,'root@localhost','2021-10-04 15:54:08','Cod_Inventario: 15022, Cantidad: 0 -- POR: Cantidad: 7, Fecha_Registro:2021-06-30 10:27:00'),(47,'root@localhost','2021-10-04 15:54:46','Cod_Inventario: 15022, Cantidad: 7 -- POR: Cantidad: 4, Fecha_Registro:2021-06-30 10:27:00'),(48,'root@localhost','2021-10-04 16:03:20','Cod_Inventario: 1355, Cantidad: 1 -- POR: Cantidad: 0, Fecha_Registro:2021-05-19 15:18:18'),(49,'root@localhost','2021-10-04 16:03:20','Cod_Inventario: 15022, Cantidad: 4 -- POR: Cantidad: 2, Fecha_Registro:2021-06-30 10:27:00'),(50,'root@localhost','2021-10-04 16:03:20','Cod_Inventario: 40050, Cantidad: 3 -- POR: Cantidad: 1, Fecha_Registro:2021-06-30 10:27:55');
/*!40000 ALTER TABLE `aud_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_pedidos`
--

DROP TABLE IF EXISTS `aud_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aud_pedidos` (
  `id_Aud_Pedidos` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `tiempo` timestamp NOT NULL,
  `cambios` text NOT NULL,
  PRIMARY KEY (`id_Aud_Pedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_pedidos`
--

LOCK TABLES `aud_pedidos` WRITE;
/*!40000 ALTER TABLE `aud_pedidos` DISABLE KEYS */;
INSERT INTO `aud_pedidos` VALUES (1,'root@localhost','2021-07-06 16:18:17','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:18:17, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(2,'root@localhost','2021-07-06 16:25:02','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:18:17, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(3,'root@localhost','2021-07-06 16:26:16','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:26:16, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(4,'root@localhost','2021-07-06 16:27:16','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:27:16, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(5,'root@localhost','2021-07-06 16:28:50','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:27:16, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(6,'root@localhost','2021-07-06 16:28:57','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:26:16, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(7,'root@localhost','2021-07-06 16:30:25','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:30:25, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(8,'root@localhost','2021-07-06 19:27:56','Entidad_id_Entidad: 8, Fecha_Pedido : 2021-07-06 14:27:56, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(9,'root@localhost','2021-07-06 19:31:52','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-07-06 11:30:25, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(10,'root@localhost','2021-07-06 19:32:36','Entidad_id_Entidad: 8, Fecha_Pedido : 2021-07-06 14:27:56, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(11,'root@localhost','2021-09-02 18:42:47','Entidad_id_Entidad: 8, Fecha_Pedido : 2021-09-02 13:42:47, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(12,'root@localhost','2021-09-02 18:43:17','Entidad_id_Entidad: 8, Fecha_Pedido : 2021-09-02 13:42:47, Fecha_Atendido: 2021-09-02 13:43:17, Estado: PENDIENTE'),(13,'root@localhost','2021-10-01 20:35:04','Entidad_id_Entidad: 4, Fecha_Pedido : 2021-10-01 15:35:04, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(14,'root@localhost','2021-10-01 20:37:02','Entidad_id_Entidad: 4, Fecha_Pedido : 2021-10-01 15:35:04, Fecha_Atendido: 2021-10-01 15:37:02, Estado: PENDIENTE'),(15,'root@localhost','2021-10-03 23:08:38','Entidad_id_Entidad: 11, Fecha_Pedido : 2021-10-03 18:08:38, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(16,'root@localhost','2021-10-03 23:10:59','Entidad_id_Entidad: 11, Fecha_Pedido : 2021-10-03 18:08:38, Fecha_Atendido: 2021-10-03 18:10:59, Estado: PENDIENTE'),(17,'root@localhost','2021-10-03 23:23:05','Entidad_id_Entidad: 14, Fecha_Pedido : 2021-10-03 18:23:05, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(18,'root@localhost','2021-10-04 13:52:44','Entidad_id_Entidad: 14, Fecha_Pedido : 2021-10-03 18:23:05, Fecha_Atendido: 2021-10-04 08:52:44, Estado: PENDIENTE'),(19,'root@localhost','2021-10-04 14:04:46','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-10-04 09:04:46, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(20,'root@localhost','2021-10-04 14:05:41','Entidad_id_Entidad: 7, Fecha_Pedido : 2021-10-04 09:04:46, Fecha_Atendido: 2021-10-04 09:05:41, Estado: PENDIENTE'),(21,'root@localhost','2021-10-04 16:01:16','Entidad_id_Entidad: 10, Fecha_Pedido : 2021-10-04 11:01:16, Fecha_Atendido: 0000-00-00 00:00:00, Estado: PENDIENTE'),(22,'root@localhost','2021-10-04 16:03:20','Entidad_id_Entidad: 10, Fecha_Pedido : 2021-10-04 11:01:16, Fecha_Atendido: 2021-10-04 11:03:20, Estado: PENDIENTE');
/*!40000 ALTER TABLE `aud_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_productos`
--

DROP TABLE IF EXISTS `aud_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aud_productos` (
  `id_Aud_Productos` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `tiempo` timestamp NOT NULL,
  `cambios` text NOT NULL,
  PRIMARY KEY (`id_Aud_Productos`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_productos`
--

LOCK TABLES `aud_productos` WRITE;
/*!40000 ALTER TABLE `aud_productos` DISABLE KEYS */;
INSERT INTO `aud_productos` VALUES (1,'root@localhost','2021-07-06 16:07:59','Id_Producto: 17, Cod_Producto : 8080, Nombre: CAMARA, Cantidad_Producto: 10, Estado: DISPONIBLE, inf_registro : 3'),(2,'root@localhost','2021-07-06 16:08:27','Id_Producto: 17, Cod_Producto : 8080, Nombre: CAMARA, Cantidad_Producto: 10, Estado: DISPONIBLE, inf_registro : 3'),(3,'root@localhost','2021-07-06 19:32:36','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 4, Estado: DISPONIBLE, inf_registro : 1'),(4,'root@localhost','2021-07-06 19:32:36','Id_Producto: 3, Cod_Producto : 6101007, Nombre: ALCOHOL ANTICEPTICO, Cantidad_Producto: 7, Estado: DISPONIBLE, inf_registro : 2'),(5,'root@localhost','2021-07-06 19:32:36','Id_Producto: 5, Cod_Producto : 7002020, Nombre: TECLADO MECANICO, Cantidad_Producto: 7, Estado: DISPONIBLE, inf_registro : 3'),(6,'root@localhost','2021-07-06 19:32:36','Id_Producto: 12, Cod_Producto : 13343, Nombre: ESPONJILLA BRILLO, Cantidad_Producto: 25, Estado: DISPONIBLE, inf_registro : 1'),(7,'root@localhost','2021-07-06 19:32:36','Id_Producto: 13, Cod_Producto : 2300271, Nombre: BLOIGRAFO C/TAPA KILOMETRICO, Cantidad_Producto: 30, Estado: DISPONIBLE, inf_registro : 2'),(8,'root@localhost','2021-07-06 19:32:36','Id_Producto: 14, Cod_Producto : 4111009, Nombre: DETERGENTE POLVO FLORAL, Cantidad_Producto: 10, Estado: DISPONIBLE, inf_registro : 1'),(9,'root@localhost','2021-07-06 19:32:36','Id_Producto: 16, Cod_Producto : 40050, Nombre: MOUSE PEQUEÑO, Cantidad_Producto: 5, Estado: DISPONIBLE, inf_registro : 3'),(10,'root@localhost','2021-09-02 18:40:03','Id_Producto: 12, Cod_Producto : 13343, Nombre: ESPONJILLA BRILLO, Cantidad_Producto: 22, Estado: DISPONIBLE, inf_registro : 1'),(11,'root@localhost','2021-09-02 18:41:55','Id_Producto: 12, Cod_Producto : 13343, Nombre: ESPONJILLA BRILLO, Cantidad_Producto: 15, Estado: DISPONIBLE, inf_registro : 1'),(12,'root@localhost','2021-09-02 18:43:17','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 1'),(13,'root@localhost','2021-09-02 18:43:17','Id_Producto: 4, Cod_Producto : 5178, Nombre: AZUCAR REFINADA, Cantidad_Producto: 7, Estado: DISPONIBLE, inf_registro : 1'),(14,'root@localhost','2021-09-02 18:43:17','Id_Producto: 13, Cod_Producto : 2300271, Nombre: BLOIGRAFO C/TAPA KILOMETRICO, Cantidad_Producto: 28, Estado: DISPONIBLE, inf_registro : 2'),(15,'root@localhost','2021-10-01 20:28:47','Id_Producto: 5, Cod_Producto : 7002020, Nombre: TECLADO MECANICO, Cantidad_Producto: 5, Estado: DISPONIBLE, inf_registro : 3'),(16,'root@localhost','2021-10-01 20:29:40','Id_Producto: 3, Cod_Producto : 6101007, Nombre: ALCOHOL ANTICEPTICO, Cantidad_Producto: 4, Estado: DISPONIBLE, inf_registro : 2'),(17,'root@localhost','2021-10-01 20:37:01','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 1, Estado: DISPONIBLE, inf_registro : 1'),(18,'root@localhost','2021-10-01 20:37:01','Id_Producto: 3, Cod_Producto : 6101007, Nombre: ALCOHOL ANTICEPTICO, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 2'),(19,'root@localhost','2021-10-01 20:37:02','Id_Producto: 4, Cod_Producto : 5178, Nombre: AZUCAR REFINADA, Cantidad_Producto: 4, Estado: DISPONIBLE, inf_registro : 1'),(20,'root@localhost','2021-10-01 20:37:02','Id_Producto: 14, Cod_Producto : 4111009, Nombre: DETERGENTE POLVO FLORAL, Cantidad_Producto: 9, Estado: DISPONIBLE, inf_registro : 1'),(21,'root@localhost','2021-10-01 20:37:20','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 2'),(22,'root@localhost','2021-10-01 20:39:08','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 0, Estado: AGOTADO, inf_registro : 2'),(23,'root@localhost','2021-10-03 23:02:47','Id_Producto: 18, Cod_Producto : TH20, Nombre: MONITORES PLANOS, Cantidad_Producto: 18, Estado: DISPONIBLE, inf_registro : 3'),(24,'root@localhost','2021-10-03 23:03:58','Id_Producto: 18, Cod_Producto : TH20, Nombre: MONITORES PLANOS, Cantidad_Producto: 18, Estado: DISPONIBLE, inf_registro : 3'),(25,'root@localhost','2021-10-03 23:06:05','Id_Producto: 13, Cod_Producto : 2300271, Nombre: BLOIGRAFO C/TAPA KILOMETRICO, Cantidad_Producto: 24, Estado: DISPONIBLE, inf_registro : 2'),(26,'root@localhost','2021-10-03 23:06:23','Id_Producto: 2, Cod_Producto : 1355, Nombre: BISTURI PLASTICO GRANDE, Cantidad_Producto: 4, Estado: DISPONIBLE, inf_registro : 1'),(27,'root@localhost','2021-10-03 23:10:59','Id_Producto: 4, Cod_Producto : 5178, Nombre: AZUCAR REFINADA, Cantidad_Producto: 2, Estado: DISPONIBLE, inf_registro : 1'),(28,'root@localhost','2021-10-03 23:10:59','Id_Producto: 13, Cod_Producto : 2300271, Nombre: BLOIGRAFO C/TAPA KILOMETRICO, Cantidad_Producto: 14, Estado: DISPONIBLE, inf_registro : 2'),(29,'root@localhost','2021-10-03 23:10:59','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 8, Estado: DISPONIBLE, inf_registro : 2'),(30,'root@localhost','2021-10-04 13:42:13','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 0, Estado: AGOTADO, inf_registro : 1'),(31,'root@localhost','2021-10-04 13:47:39','Id_Producto: 18, Cod_Producto : TH21, Nombre: MONITORES PLANOS, Cantidad_Producto: 12, Estado: DISPONIBLE, inf_registro : 3'),(32,'root@localhost','2021-10-04 13:48:23','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 20, Estado: DISPONIBLE, inf_registro : 1'),(33,'root@localhost','2021-10-04 13:48:35','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 15, Estado: DISPONIBLE, inf_registro : 1'),(34,'root@localhost','2021-10-04 13:49:33','Id_Producto: 4, Cod_Producto : 5178, Nombre: AZUCAR REFINADA, Cantidad_Producto: 1, Estado: DISPONIBLE, inf_registro : 1'),(35,'root@localhost','2021-10-04 13:52:44','Id_Producto: 2, Cod_Producto : 1355, Nombre: BISTURI PLASTICO GRANDE, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 1'),(36,'root@localhost','2021-10-04 13:52:44','Id_Producto: 5, Cod_Producto : 7002020, Nombre: TECLADO MECANICO, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 3'),(37,'root@localhost','2021-10-04 13:52:44','Id_Producto: 16, Cod_Producto : 40050, Nombre: MOUSE PEQUEÑO, Cantidad_Producto: 4, Estado: DISPONIBLE, inf_registro : 3'),(38,'root@localhost','2021-10-04 14:05:41','Id_Producto: 1, Cod_Producto : 3102020, Nombre: CAJA DE CAFE, Cantidad_Producto: 12, Estado: DISPONIBLE, inf_registro : 1'),(39,'root@localhost','2021-10-04 14:05:41','Id_Producto: 12, Cod_Producto : 13343, Nombre: ESPONJILLA BRILLO, Cantidad_Producto: 10, Estado: DISPONIBLE, inf_registro : 1'),(40,'root@localhost','2021-10-04 14:06:51','Id_Producto: 19, Cod_Producto : 2457, Nombre: LIMPIDO, Cantidad_Producto: 15, Estado: DISPONIBLE, inf_registro : 1'),(41,'root@localhost','2021-10-04 14:07:21','Id_Producto: 19, Cod_Producto : 2457, Nombre: LIMPIDO, Cantidad_Producto: 15, Estado: DISPONIBLE, inf_registro : 1'),(42,'root@localhost','2021-10-04 14:08:17','Id_Producto: 19, Cod_Producto : 2457, Nombre: LIMPIDO, Cantidad_Producto: 25, Estado: DISPONIBLE, inf_registro : 1'),(43,'root@localhost','2021-10-04 14:09:04','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 2'),(44,'root@localhost','2021-10-04 15:54:08','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 0, Estado: AGOTADO, inf_registro : 2'),(45,'root@localhost','2021-10-04 15:54:46','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 7, Estado: DISPONIBLE, inf_registro : 2'),(46,'root@localhost','2021-10-04 16:03:20','Id_Producto: 2, Cod_Producto : 1355, Nombre: BISTURI PLASTICO GRANDE, Cantidad_Producto: 1, Estado: DISPONIBLE, inf_registro : 1'),(47,'root@localhost','2021-10-04 16:03:20','Id_Producto: 15, Cod_Producto : 15022, Nombre: PITA NATURAL, Cantidad_Producto: 4, Estado: DISPONIBLE, inf_registro : 2'),(48,'root@localhost','2021-10-04 16:03:20','Id_Producto: 16, Cod_Producto : 40050, Nombre: MOUSE PEQUEÑO, Cantidad_Producto: 3, Estado: DISPONIBLE, inf_registro : 3');
/*!40000 ALTER TABLE `aud_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_restricciones`
--

DROP TABLE IF EXISTS `aud_restricciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aud_restricciones` (
  `id_Aud_Restricciones` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `tiempo` timestamp NOT NULL,
  `cambios` text NOT NULL,
  PRIMARY KEY (`id_Aud_Restricciones`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_restricciones`
--

LOCK TABLES `aud_restricciones` WRITE;
/*!40000 ALTER TABLE `aud_restricciones` DISABLE KEYS */;
INSERT INTO `aud_restricciones` VALUES (1,'root@localhost','2021-07-06 16:12:33','Cantidad: 1, Detalle: SOLO SE PERMITE 1 PRODUCTO POR PEDIDO POR SER ELECTRONICO, Estado: ACTIVA, Producto_id_Producto: 17'),(2,'root@localhost','2021-07-06 16:14:15','Cantidad: 1--Por: Cantidad: 2, Detalle: SOLO SE PERMITE 1 PRODUCTO POR PEDIDO POR SER ELECTRONICO, Estado: ACTIVA, Producto_id_Producto: 17'),(3,'root@localhost','2021-10-01 20:31:20','Cantidad: 8--Por: Cantidad: 3, Detalle:  Solo se permite un maximo de 8 productos  por peticion  , Estado: ACTIVA, Producto_id_Producto: 4'),(4,'root@localhost','2021-10-03 23:13:21','Cantidad: 3, Detalle: CADA ENTIDAD TIENE PERMITDO AGREGAR MAXIMO 3 MONITORES A SU PETICION, Estado: ACTIVA, Producto_id_Producto: 18'),(5,'root@localhost','2021-10-03 23:13:52','Cantidad: 2--Por: Cantidad: 1, Detalle:  SOLO SE PERMITE 1 PRODUCTO POR PEDIDO POR SER ELECTRONICO , Estado: ACTIVA, Producto_id_Producto: 17'),(6,'root@localhost','2021-10-03 23:14:09','Cantidad: 1--Por: Cantidad: 1, Detalle:   SOLO SE PERMITE 1 PRODUCTO POR PEDIDO POR SER ELECTRONICO  , Estado: ACTIVA, Producto_id_Producto: 17'),(7,'root@localhost','2021-10-03 23:14:20','Cantidad: 1--Por: Cantidad: 1, Detalle:   SOLO SE PERMITE 1 PRODUCTO POR PEDIDO POR SER ELECTRONICO  , Estado: INACTIVA, Producto_id_Producto: 17'),(8,'root@localhost','2021-10-04 13:53:56','Cantidad: 3, Detalle: Lorem Ipsum is simply dummy text of the printing and typesetting industry., Estado: ACTIVA, Producto_id_Producto: 15'),(9,'root@localhost','2021-10-04 15:56:41','Cantidad: 5--Por: Cantidad: 5, Detalle:  Lorem Ipsum is simply dummy text of the printing and typesetting industry. , Estado: ACTIVA, Producto_id_Producto: 3'),(10,'root@localhost','2021-10-04 15:56:54','Cantidad: 5--Por: Cantidad: 5, Detalle:  Lorem Ipsum is simply dummy text of the printing and typesetting industry. , Estado: INACTIVA, Producto_id_Producto: 3');
/*!40000 ALTER TABLE `aud_restricciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodega` (
  `id_Bodega` int NOT NULL AUTO_INCREMENT,
  `Cod_Bodega` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Tipo_Bodega` enum('GRANDE','PEQUEÑA') NOT NULL,
  `Estado` enum('ACTIVA','INACTIVA') NOT NULL,
  `Entidad_id_Entidad` int NOT NULL,
  PRIMARY KEY (`id_Bodega`),
  KEY `fk_Bodega_Entidad1_idx` (`Entidad_id_Entidad`),
  CONSTRAINT `fk_Bodega_Entidad1` FOREIGN KEY (`Entidad_id_Entidad`) REFERENCES `entidad` (`id_Entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (1,'BD-01','INSUMOS RAPIDOS','PEQUEÑA','ACTIVA',1),(2,'BD-02','BODEGA','GRANDE','ACTIVA',1);
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `consultar_entidad`
--

DROP TABLE IF EXISTS `consultar_entidad`;
/*!50001 DROP VIEW IF EXISTS `consultar_entidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consultar_entidad` AS SELECT 
 1 AS `Id_Entidad`,
 1 AS `Nombre_Entidad`,
 1 AS `Nit`,
 1 AS `Municipio`,
 1 AS `Estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `datos_usuarios`
--

DROP TABLE IF EXISTS `datos_usuarios`;
/*!50001 DROP VIEW IF EXISTS `datos_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_usuarios` AS SELECT 
 1 AS `Id_User`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `TIdentificacion`,
 1 AS `Identificacion`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `TipoUsuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `entidad`
--

DROP TABLE IF EXISTS `entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad` (
  `id_Entidad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Nit` varchar(45) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Estado` enum('ACTIVA','INACTIVA') NOT NULL,
  `Municipio` varchar(45) NOT NULL,
  `Tipo` enum('PRINCIPAL','SEDE') NOT NULL,
  PRIMARY KEY (`id_Entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad`
--

LOCK TABLES `entidad` WRITE;
/*!40000 ALTER TABLE `entidad` DISABLE KEYS */;
INSERT INTO `entidad` VALUES (1,'Registraduria de Florencia Caqueta','899999040-4','321000111','A 15-110, Cl. 15 #15-2','registra@gmail.com','ACTIVA','FLORENCIA','PRINCIPAL'),(2,'Registraduria Alabania','899999040-4','3168328273','Calle 5 No. 3-24 Barrio Centro','albaniacaqueta@registraduria.gov.co','ACTIVA','ALBANIA','SEDE'),(4,'Registraduria Belen de los Andaquies','899999040-4','3112540424','Carrera 6 No 5-47 Barrio Cincuentario','belendelosandaquies@registraduria.gov.co','ACTIVA','BELEN','SEDE'),(5,'Registraduria Cartagena del Chaira','899999040-4','3168323236','Calle 3 No. 2-15 Barrio Centro','cartagenadelchaira@registraduria.gov.co','ACTIVA','CARTAGENA','SEDE'),(6,'Registraduria Curillo','899999040-4','3173642997','Calle 10 No. 3-19 Barrio Centro','curillocaqueta@registraduria.gov.co','ACTIVA','CURILLO','SEDE'),(7,'Registraduria El Doncello','899999040-4','3166934964','Calle 3 No. 5-44 Barrio Simon Bolivar','eldoncellocaqueta@registraduria.gov.co','ACTIVA','DONCELLO','SEDE'),(8,'Registraduria El Paujil','899999040-4','3183597026','Calle 5 No. 3-29','elpaujilcaqueta@registraduria.gov.co','ACTIVA','PAUJIL','SEDE'),(9,'Registraduria La Montañita','899999040-4','4300099','Calle 6 No. 4-43 Barrio El Centro','lamontanitacaqueta@registraduria.gov.co','ACTIVA','MONTAÑITA','SEDE'),(10,'Registraduria Milan','899999040-4','4351646 - Ext 103','Cra 7 No. 3-44','milancaqueta@registraduria.gov.co','ACTIVA','MILAN','SEDE'),(11,'Registraduria Morelia','899999040-4','3188432103','Calle 3 No. 2-16 / 24','moreliacaqueta@registraduria.gov.co','ACTIVA','MORELIA','SEDE'),(12,'Registraduria Puerto Rico','899999040-4','3168323694','Calle 4 No. 4-43 Carrio El Comercio','puertoricocaqueta@registraduria.gov.co','ACTIVA','PUERTO RICO','SEDE'),(13,'Registraduria San Jose del Fragua','899999040-4','3162700192','Cra 6 No 4-06','sanjosedelfragua@registraduria.gov.co','ACTIVA','SAN JOSE DEL FRAGUA','SEDE'),(14,'Registraduria Solano','899999040-4','3153438114','Cra 4 No. 6-58','solanocaqueta@registraduria.gov.co','ACTIVA','SOLANO','SEDE'),(15,'Registraduria Solita','899999040-4','4351646 - Ext 103','Cra 4 No. 2-25','solitacaqueta@registraduria.gov.co','ACTIVA','SOLITA','SEDE'),(16,'Registraduria Valparaiso','899999040-4','3165211549','Calle 11 No. 5-18','valparaisocaqueta@registraduria.gov.co','ACTIVA','VALPARAISO','SEDE');
/*!40000 ALTER TABLE `entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificacion`
--

DROP TABLE IF EXISTS `identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identificacion` (
  `id_Identificacion` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  `Estado` enum('ACTIVO','INACTIVO') NOT NULL,
  PRIMARY KEY (`id_Identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificacion`
--

LOCK TABLES `identificacion` WRITE;
/*!40000 ALTER TABLE `identificacion` DISABLE KEYS */;
INSERT INTO `identificacion` VALUES (1,'CEDULA DE CIUDADANIA','ACTIVO'),(2,'TARJETA DE IDENTIFICACION','ACTIVO');
/*!40000 ALTER TABLE `identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_Inventario` int NOT NULL AUTO_INCREMENT,
  `Cod_Inventario` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  `Fecha_Registro` timestamp NOT NULL,
  `Bodega_id_Bodega` int NOT NULL,
  `Producto_id_Producto` int NOT NULL,
  PRIMARY KEY (`id_Inventario`),
  KEY `fk_Inventario_Bodega1_idx` (`Bodega_id_Bodega`) /*!80000 INVISIBLE */,
  KEY `fk_Inventario_Inventario1` (`Producto_id_Producto`),
  CONSTRAINT `fk_Inventario_Bodega1` FOREIGN KEY (`Bodega_id_Bodega`) REFERENCES `bodega` (`id_Bodega`),
  CONSTRAINT `fk_Inventario_Inventario1` FOREIGN KEY (`Producto_id_Producto`) REFERENCES `producto` (`id_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'3102020',11,'2021-05-19 16:02:45',1,1),(2,'3102020',0,'2021-05-19 16:02:45',2,1),(3,'1355',0,'2021-05-19 20:18:18',1,2),(4,'1355',0,'2021-05-19 20:18:18',2,2),(5,'6101007',0,'2021-05-19 20:19:23',1,3),(6,'5178',0,'2021-05-19 20:20:16',1,4),(7,'5178',0,'2021-05-19 20:20:16',2,4),(8,'7002020',2,'2021-05-21 21:06:32',2,5),(15,'13343',9,'2021-06-30 15:21:55',1,12),(16,'2300271',10,'2021-06-30 15:23:15',2,13),(17,'4111009',3,'2021-06-30 15:25:52',1,14),(18,'4111009',4,'2021-06-30 15:25:52',2,14),(19,'15022',2,'2021-06-30 15:27:00',1,15),(20,'40050',1,'2021-06-30 15:27:55',2,16),(21,'8080',8,'2021-07-06 16:07:59',2,17),(22,'TH20',16,'2021-10-03 23:02:47',2,18),(23,'2457',15,'2021-10-04 14:06:51',1,19),(24,'2457',5,'2021-10-04 14:06:51',2,19);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lista_peticiones`
--

DROP TABLE IF EXISTS `lista_peticiones`;
/*!50001 DROP VIEW IF EXISTS `lista_peticiones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_peticiones` AS SELECT 
 1 AS `Id_Peticion`,
 1 AS `Fecha_Peticion`,
 1 AS `Registraduria`,
 1 AS `Estado_Peticion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_productos`
--

DROP TABLE IF EXISTS `lista_productos`;
/*!50001 DROP VIEW IF EXISTS `lista_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_productos` AS SELECT 
 1 AS `Tipo_Producto`,
 1 AS `Id_Producto`,
 1 AS `Codigo_Producto`,
 1 AS `Nombre_Producto`,
 1 AS `Cantidad_Producto`,
 1 AS `Descripcion_Producto`,
 1 AS `Inf_Bodega`,
 1 AS `Estado_Producto`,
 1 AS `Id_Inventario`,
 1 AS `Inventario_Bodega`,
 1 AS `Nombre_Bodega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_productos_peticiones`
--

DROP TABLE IF EXISTS `lista_productos_peticiones`;
/*!50001 DROP VIEW IF EXISTS `lista_productos_peticiones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_productos_peticiones` AS SELECT 
 1 AS `Id_Producto`,
 1 AS `Tipo_Producto`,
 1 AS `Codigo_Producto`,
 1 AS `Nombre_Producto`,
 1 AS `Cantidad_Producto`,
 1 AS `Limite_Pedido`,
 1 AS `Estado_Restriccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_registro_pedidos`
--

DROP TABLE IF EXISTS `lista_registro_pedidos`;
/*!50001 DROP VIEW IF EXISTS `lista_registro_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_registro_pedidos` AS SELECT 
 1 AS `Id_Registro`,
 1 AS `Id_Producto`,
 1 AS `Id_Pedido`,
 1 AS `Tipo_Producto`,
 1 AS `Nombre_Producto`,
 1 AS `Codigo_Producto`,
 1 AS `Cantidad_Pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_restricciones`
--

DROP TABLE IF EXISTS `lista_restricciones`;
/*!50001 DROP VIEW IF EXISTS `lista_restricciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_restricciones` AS SELECT 
 1 AS `Nombre_Producto`,
 1 AS `Codigo_Producto`,
 1 AS `Id_Restriccion`,
 1 AS `Cantidad_Restriccion`,
 1 AS `Detalle_Restriccion`,
 1 AS `Estado_Restriccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_usuarios`
--

DROP TABLE IF EXISTS `lista_usuarios`;
/*!50001 DROP VIEW IF EXISTS `lista_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_usuarios` AS SELECT 
 1 AS `Id_User`,
 1 AS `Nombre_User`,
 1 AS `Tipo_Usuario`,
 1 AS `Ident_User`,
 1 AS `Correo_Usuario`,
 1 AS `Telefono_User`,
 1 AS `Estado_Usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_Menu` int NOT NULL AUTO_INCREMENT,
  `Icono` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Ruta` text NOT NULL,
  `Orden` int NOT NULL,
  PRIMARY KEY (`id_Menu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'fa fa-home','Inicio','/supadmin/home',1),(2,'fa fa-users','Registro','/supadmin/registro',2),(3,'fa fa-desktop','Inicio','/admin/inicio',1),(4,'fa fa-archive','Bodega','/supadmin/bodega',3),(5,'fa fa-dropbox','Inventario','/admin/inventario',3),(6,'fa fa-file','Peticiones','/admin/peticiones',4),(7,'fa fa-cog','Acciones','#accio',5),(8,'fa fa-times','Restricciones','/admin/restricciones',6),(9,'fa fa-plus','Registro Productos','/admin/registros',2),(10,'fa fa-times','Adiciones','/admin/adiciones',7);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `menu_usuarios`
--

DROP TABLE IF EXISTS `menu_usuarios`;
/*!50001 DROP VIEW IF EXISTS `menu_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menu_usuarios` AS SELECT 
 1 AS `Id_Entidad`,
 1 AS `Id_Persona`,
 1 AS `Nombre_Rol`,
 1 AS `Menu`,
 1 AS `Icono_Menu`,
 1 AS `Rutas_Menu`,
 1 AS `Orden_Menu`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_Pedidos` int NOT NULL AUTO_INCREMENT,
  `Entidad_id_Entidad` int NOT NULL,
  `Fecha_Pedido` timestamp NOT NULL,
  `Fecha_Atendido` timestamp NULL DEFAULT NULL,
  `Observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Estado` enum('PENDIENTE','COMPLETADA','CANCELADA') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_Pedidos`),
  KEY `fk_Pedidos_Entidad1_idx` (`Entidad_id_Entidad`),
  CONSTRAINT `fk_Pedidos_Entidad1` FOREIGN KEY (`Entidad_id_Entidad`) REFERENCES `entidad` (`id_Entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,10,'2021-06-08 19:16:20','2021-06-09 15:19:32','','COMPLETADA'),(2,11,'2021-06-09 15:53:43','2021-06-19 15:19:32','','COMPLETADA'),(3,10,'2021-06-18 15:55:04','2021-06-18 16:13:17','','COMPLETADA'),(4,9,'2021-06-18 16:18:50','2021-06-18 16:23:09','','CANCELADA'),(5,7,'2021-07-06 16:18:17','2021-07-06 16:25:02','','CANCELADA'),(6,7,'2021-07-06 16:26:16','2021-07-06 16:28:57','','CANCELADA'),(7,7,'2021-07-06 16:27:16','2021-07-06 16:28:50','','CANCELADA'),(8,7,'2021-07-06 16:30:25','2021-07-06 19:31:52','','CANCELADA'),(9,8,'2021-07-06 19:27:56','2021-07-06 19:32:36','','COMPLETADA'),(10,8,'2021-09-02 18:42:47','2021-09-02 18:43:17','','COMPLETADA'),(11,4,'2021-10-01 20:35:04','2021-10-01 20:37:02','','COMPLETADA'),(12,11,'2021-10-03 23:08:38','2021-10-03 23:10:59','','COMPLETADA'),(13,14,'2021-10-03 23:23:05','2021-10-04 13:52:44','','COMPLETADA'),(14,7,'2021-10-04 14:04:46','2021-10-04 14:05:41','','COMPLETADA'),(15,10,'2021-10-04 16:01:16','2021-10-04 16:03:20','','COMPLETADA');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id_Permisos` int NOT NULL AUTO_INCREMENT,
  `Rol_id_Rol` int NOT NULL,
  `Menu_id_Menu` int NOT NULL,
  PRIMARY KEY (`id_Permisos`),
  KEY `fk_Permisos_Menu1_idx` (`Menu_id_Menu`),
  KEY `fk_Permisos_Rol1_idx` (`Rol_id_Rol`),
  CONSTRAINT `fk_Permisos_Menu1` FOREIGN KEY (`Menu_id_Menu`) REFERENCES `menu` (`id_Menu`),
  CONSTRAINT `fk_Permisos_Rol1` FOREIGN KEY (`Rol_id_Rol`) REFERENCES `rol` (`id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,1,1),(2,1,2),(3,2,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,3,3),(11,3,4),(12,3,5),(13,3,6),(14,2,10),(15,4,1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_Persona` int NOT NULL AUTO_INCREMENT,
  `Identificacion_id_Identificacion` int NOT NULL,
  `Identificacion` varchar(65) NOT NULL,
  `Nombre` varchar(65) NOT NULL,
  `Apellido` varchar(65) NOT NULL,
  `Correo_Electronico` varchar(65) NOT NULL,
  `Telefono` varchar(65) NOT NULL,
  PRIMARY KEY (`id_Persona`),
  KEY `fk_Persona_Identificacion1_idx` (`Identificacion_id_Identificacion`),
  CONSTRAINT `fk_Persona_Identificacion1` FOREIGN KEY (`Identificacion_id_Identificacion`) REFERENCES `identificacion` (`id_Identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1,'1117546877','Socrates','Berrio','soc.martinez@udla.edu.co','3212586973'),(4,1,'900304060','Laura Milena','Fajardo Valencia','lmfajardo@registraduria.com','3212004050'),(5,1,'899999041','Registraduria','Albania','albaniacaqueta@registraduria.gov.co','3168328273'),(6,1,'899999042','Registraduria','Belen de los Andaquies','belendelosandaquies@registraduria.gov.co','3112540424'),(7,1,'899999043','Registraduria','Cartagena del Chaira','cartagenadelchaira@registraduria.gov.co','3168323236'),(8,1,'899999044','Registraduria','Curillo','curillocaqueta@registraduria.gov.co','3173642997'),(9,1,'899999045','Registraduria','El Doncello','eldoncellocaqueta@registraduria.gov.co','3166934964'),(10,1,'899999046','Registraduria','El Paujil','elpaujilcaqueta@registraduria.gov.co','3183597026'),(11,1,'899999047','Registraduria','La Montañita','lamontanitacaqueta@registraduria.gov.co','4300099'),(12,1,'899999048','Registraduria','Milan','milancaqueta@registraduria.gov.co','4351646 - Ext 103'),(13,1,'899999049','Registraduria','Morelia','moreliacaqueta@registraduria.gov.co','3188432103'),(14,1,'899999050','Registraduria','Puerto Rico','puertoricocaqueta@registraduria.gov.co','3168323694'),(15,1,'899999051','Registraduria','San Jose del Fragua','sanjosedelfragua@registraduria.gov.co','3162700192'),(16,1,'899999052','Registraduria','Solano','solanocaqueta@registraduria.gov.co','3153438114'),(17,1,'899999053','Registraduria','Solita','solitacaqueta@registraduria.gov.co','4351646 - Ext 103'),(18,1,'899999054','Registraduria','Valparaiso','valparaisocaqueta@registraduria.gov.co','3165211549');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_Producto` int NOT NULL AUTO_INCREMENT,
  `Tipo_Producto_id_Tipo_Producto` int NOT NULL,
  `Cod_Producto` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Nombre` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Cantidad_Producto` int NOT NULL,
  `Descripcion` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Estado` enum('DISPONIBLE','AGOTADO') NOT NULL,
  `inf_registro` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Proveedor_id_Proveedor` int NOT NULL,
  PRIMARY KEY (`id_Producto`),
  KEY `fk_Producto_Tipo_Producto1_idx` (`Tipo_Producto_id_Tipo_Producto`),
  KEY `fk_Producto_Proveedor1_idx` (`Proveedor_id_Proveedor`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Producto_Proveedor1` FOREIGN KEY (`Proveedor_id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`),
  CONSTRAINT `fk_Producto_Tipo_Producto1` FOREIGN KEY (`Tipo_Producto_id_Tipo_Producto`) REFERENCES `tipo_producto` (`id_Tipo_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,3,'3102020','CAJA DE CAFE',11,'CAFE MOLIDO EMPRESARIAL ET/PLATEADA SELLO ROJO BOLSA 500GR','DISPONIBLE','1',1),(2,1,'1355','BISTURI PLASTICO GRANDE',0,'18MM UND','AGOTADO','1',1),(3,2,'6101007','ALCOHOL ANTICEPTICO',0,'FRASCO*1000CC','AGOTADO','2',1),(4,3,'5178','AZUCAR REFINADA',0,'SOBRE 5GR INCAUCA PQT*200 BL','AGOTADO','1',1),(5,4,'7002020','TECLADO MECANICO',2,'TECLADO PARA USO DE OFICINA','DISPONIBLE','3',1),(12,2,'13343','ESPONJILLA BRILLO',9,'PAQ 6 TASK','DISPONIBLE','1',1),(13,1,'2300271','BLOIGRAFO C/TAPA KILOMETRICO',10,'TINTA NEGRA MATE','DISPONIBLE','2',1),(14,2,'4111009','DETERGENTE POLVO FLORAL',7,'ULTREX BOLSA 1000GR','DISPONIBLE','1',1),(15,3,'15022','PITA NATURAL',2,'1 KILLO ROLLO','DISPONIBLE','2',1),(16,4,'40050','MOUSE PEQUEÑO',1,'INALAMBRICO NEGRO','DISPONIBLE','3',1),(17,4,'8080','CAMARA',8,'720P LOGITECH','DISPONIBLE','3',1),(18,4,'TH21','MONITORES PLANOS',16,'24 PULGADAS DE COLOR NEGRO','DISPONIBLE','3',1),(19,2,'2457','LIMPIDO',20,'ADSA','DISPONIBLE','1',1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Nit` varchar(45) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'SUMIMAS SAS','830001338-1','Clle 15 No 15-20 Barrio Centro','3005112020','ACTIVO');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_ep`
--

DROP TABLE IF EXISTS `registro_ep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_ep` (
  `id_Registro_EP` int NOT NULL AUTO_INCREMENT,
  `Fecha` timestamp NOT NULL,
  `Estado` enum('ACTIVA','INACTIVA') NOT NULL,
  `Entidad_id_Entidad` int NOT NULL,
  `Persona_id_Persona` int NOT NULL,
  `Rol_id_Rol` int NOT NULL,
  PRIMARY KEY (`id_Registro_EP`),
  KEY `fk_Registro_EP_Entidad1_idx` (`Entidad_id_Entidad`),
  KEY `fk_Registro_EP_Persona1_idx` (`Persona_id_Persona`),
  KEY `fk_Registro_EP_Rol1_idx` (`Rol_id_Rol`),
  CONSTRAINT `fk_Registro_EP_Entidad1` FOREIGN KEY (`Entidad_id_Entidad`) REFERENCES `entidad` (`id_Entidad`),
  CONSTRAINT `fk_Registro_EP_Persona1` FOREIGN KEY (`Persona_id_Persona`) REFERENCES `persona` (`id_Persona`),
  CONSTRAINT `fk_Registro_EP_Rol1` FOREIGN KEY (`Rol_id_Rol`) REFERENCES `rol` (`id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_ep`
--

LOCK TABLES `registro_ep` WRITE;
/*!40000 ALTER TABLE `registro_ep` DISABLE KEYS */;
INSERT INTO `registro_ep` VALUES (1,'2021-05-03 16:11:11','ACTIVA',1,1,1),(3,'2021-05-12 21:53:02','ACTIVA',1,4,2),(4,'2021-06-08 16:11:11','ACTIVA',2,5,4),(5,'2021-06-08 16:11:11','ACTIVA',4,6,4),(6,'2021-06-08 16:11:11','ACTIVA',5,7,4),(7,'2021-06-08 16:11:11','ACTIVA',6,8,4),(8,'2021-06-08 16:11:11','ACTIVA',7,9,4),(9,'2021-06-08 16:11:11','ACTIVA',8,10,4),(10,'2021-06-08 16:11:11','ACTIVA',9,11,4),(11,'2021-06-08 16:11:11','ACTIVA',10,12,4),(12,'2021-06-08 16:11:11','ACTIVA',11,13,4),(13,'2021-06-08 16:11:11','ACTIVA',12,14,4),(14,'2021-06-08 16:11:11','ACTIVA',13,15,4),(15,'2021-06-08 16:11:11','ACTIVA',14,16,4),(16,'2021-06-08 16:11:11','ACTIVA',15,17,4),(17,'2021-06-08 16:11:11','ACTIVA',16,18,4);
/*!40000 ALTER TABLE `registro_ep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_pedidos`
--

DROP TABLE IF EXISTS `registro_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_pedidos` (
  `id_Registro_Pedidos` int NOT NULL AUTO_INCREMENT,
  `producto_id_Producto` int NOT NULL,
  `pedidos_id_Pedidos` int NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`id_Registro_Pedidos`),
  KEY `fk_Registro_Pedidos_producto1_idx` (`producto_id_Producto`),
  KEY `fk_Registro_Pedidos_pedidos1_idx` (`pedidos_id_Pedidos`),
  CONSTRAINT `fk_Registro_Pedidos_pedidos1` FOREIGN KEY (`pedidos_id_Pedidos`) REFERENCES `pedidos` (`id_Pedidos`),
  CONSTRAINT `fk_Registro_Pedidos_producto1` FOREIGN KEY (`producto_id_Producto`) REFERENCES `producto` (`id_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_pedidos`
--

LOCK TABLES `registro_pedidos` WRITE;
/*!40000 ALTER TABLE `registro_pedidos` DISABLE KEYS */;
INSERT INTO `registro_pedidos` VALUES (1,1,1,2),(2,3,1,3),(3,5,1,5),(4,1,2,1),(5,2,2,2),(6,4,2,4),(7,2,3,2),(8,4,3,3),(9,2,4,4),(10,3,4,5),(11,5,4,2),(12,2,5,4),(13,4,5,7),(14,2,6,4),(15,3,6,5),(16,2,7,4),(17,3,7,5),(18,2,8,4),(19,4,8,7),(20,1,9,1),(21,3,9,3),(22,5,9,2),(23,12,9,3),(24,13,9,2),(25,14,9,1),(26,16,9,1),(27,1,10,2),(28,4,10,3),(29,13,10,4),(30,1,11,1),(31,3,11,3),(32,4,11,2),(33,14,11,2),(34,4,12,1),(35,13,12,4),(36,15,12,5),(37,2,13,2),(38,5,13,1),(39,16,13,1),(40,1,14,1),(41,12,14,1),(42,2,15,1),(43,15,15,2),(44,16,15,2);
/*!40000 ALTER TABLE `registro_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restricciones`
--

DROP TABLE IF EXISTS `restricciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restricciones` (
  `id_Restricciones` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int NOT NULL,
  `Detalle` varchar(250) NOT NULL,
  `Estado` enum('ACTIVA','INACTIVA') NOT NULL,
  `Producto_id_Producto` int NOT NULL,
  PRIMARY KEY (`id_Restricciones`),
  KEY `fk_Restricciones_Producto1_idx` (`Producto_id_Producto`),
  CONSTRAINT `fk_Restricciones_Producto1` FOREIGN KEY (`Producto_id_Producto`) REFERENCES `producto` (`id_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restricciones`
--

LOCK TABLES `restricciones` WRITE;
/*!40000 ALTER TABLE `restricciones` DISABLE KEYS */;
INSERT INTO `restricciones` VALUES (3,3,'  Solo se permite un maximo de 8 productos  por peticion   ','ACTIVA',4),(4,2,'No es permitido despachar mas de 3 productos de cafe ','ACTIVA',1),(6,5,' Lorem Ipsum is simply dummy text of the printing and typesetting industry. ','ACTIVA',3),(8,1,'  SOLO SE PERMITE 1 PRODUCTO POR PEDIDO POR SER ELECTRONICO  ','ACTIVA',17),(9,3,'CADA ENTIDAD TIENE PERMITDO AGREGAR MAXIMO 3 MONITORES A SU PETICION','ACTIVA',18),(10,3,'Lorem Ipsum is simply dummy text of the printing and typesetting industry.','ACTIVA',15);
/*!40000 ALTER TABLE `restricciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_Rol` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` enum('ADMIN','PROFESIONAL','PASANTE') NOT NULL,
  PRIMARY KEY (`id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'SUPER ADMINISTRADOR','ADMIN'),(2,'EMPLEADO','ADMIN'),(3,'PASANTE','PROFESIONAL'),(4,'ENTIDAD','ADMIN');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `id_Tipo_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_Tipo_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'PAPELERIA','PRODUCTOS COMO LAPICES, RESMAS DE PAPEL O INSTRUMENTOS PARA IMPRESION O ESCRIBIR','ACTIVO'),(2,'ASEO','PRODUCTOS PARA LA LIMPIEZA E HIGENE','ACTIVO'),(3,'CAFETERIA','PRODUCTOS DE CONSUMO PERSONAL','ACTIVO'),(4,'ELECTRONICOS','PRODUCTOS DE RELACIONADOS CON ELEMENTOS ELECTRICOS DESDE TONER HASTA TECLADOS Y MOUSES','ACTIVO');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `Password` varchar(65) NOT NULL,
  `Persona_id_Persona` int NOT NULL,
  PRIMARY KEY (`id_Usuario`),
  KEY `fk_Usuario_Persona_idx` (`Persona_id_Persona`),
  CONSTRAINT `fk_Usuario_Persona` FOREIGN KEY (`Persona_id_Persona`) REFERENCES `persona` (`id_Persona`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'1117546877','$2a$10$9l3ZKHCicEQIHB9v..h5TONqeHPJ8N9Sy8rgu4cskSmg.OoJC8Vfy',1),(2,'900304060','$2a$10$CtEG7BFaE724RmQoaNv3PePlOWPkPdcwBRXcBi078mvAC4NO3t45W',4),(3,'899999041','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',5),(4,'899999042','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',6),(5,'899999043','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',7),(6,'899999044','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',8),(7,'899999045','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',9),(8,'899999046','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',10),(9,'899999047','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',11),(10,'899999048','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',12),(11,'899999049','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',13),(12,'899999050','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',14),(13,'899999051','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',15),(14,'899999052','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',16),(15,'899999053','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',17),(16,'899999054','$2a$10$mtDkUKtRrxfN5XJn621dI.2FmwRMub4ugru5qXDFJZbAXN3R2TyKq',18);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `variables_usuario`
--

DROP TABLE IF EXISTS `variables_usuario`;
/*!50001 DROP VIEW IF EXISTS `variables_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `variables_usuario` AS SELECT 
 1 AS `Id_Usuario`,
 1 AS `Id_Entidad`,
 1 AS `Nombre_Entidad`,
 1 AS `Nit_Entidad`,
 1 AS `Id_Empleado`,
 1 AS `Nombre_Usuario`,
 1 AS `Ident_Usuario`,
 1 AS `Tipo_Usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `consultar_entidad`
--

/*!50001 DROP VIEW IF EXISTS `consultar_entidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultar_entidad` AS select `entidad`.`id_Entidad` AS `Id_Entidad`,`entidad`.`Nombre` AS `Nombre_Entidad`,`entidad`.`Nit` AS `Nit`,`entidad`.`Municipio` AS `Municipio`,`entidad`.`Estado` AS `Estado` from `entidad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datos_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `datos_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_usuarios` AS select `persona`.`id_Persona` AS `Id_User`,`persona`.`Nombre` AS `Nombre`,`persona`.`Apellido` AS `Apellido`,`identificacion`.`Tipo` AS `TIdentificacion`,`persona`.`Identificacion` AS `Identificacion`,`persona`.`Telefono` AS `Telefono`,`persona`.`Correo_Electronico` AS `Correo`,`rol`.`Nombre` AS `TipoUsuario` from (((`persona` join `identificacion` on((`identificacion`.`id_Identificacion` = `persona`.`Identificacion_id_Identificacion`))) join `registro_ep` on((`registro_ep`.`Persona_id_Persona` = `persona`.`id_Persona`))) join `rol` on((`rol`.`id_Rol` = `registro_ep`.`Rol_id_Rol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_peticiones`
--

/*!50001 DROP VIEW IF EXISTS `lista_peticiones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_peticiones` AS select `pedidos`.`id_Pedidos` AS `Id_Peticion`,date_format(`pedidos`.`Fecha_Pedido`,'%Y-%m-%d %r') AS `Fecha_Peticion`,`entidad`.`Nombre` AS `Registraduria`,`pedidos`.`Estado` AS `Estado_Peticion` from (`pedidos` join `entidad` on((`entidad`.`id_Entidad` = `pedidos`.`Entidad_id_Entidad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_productos`
--

/*!50001 DROP VIEW IF EXISTS `lista_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_productos` AS select `tipo_producto`.`Nombre` AS `Tipo_Producto`,`producto`.`id_Producto` AS `Id_Producto`,`producto`.`Cod_Producto` AS `Codigo_Producto`,`producto`.`Nombre` AS `Nombre_Producto`,`producto`.`Cantidad_Producto` AS `Cantidad_Producto`,`producto`.`Descripcion` AS `Descripcion_Producto`,`producto`.`inf_registro` AS `Inf_Bodega`,`producto`.`Estado` AS `Estado_Producto`,`inventario`.`id_Inventario` AS `Id_Inventario`,`inventario`.`Cantidad` AS `Inventario_Bodega`,`bodega`.`Nombre` AS `Nombre_Bodega` from (((`inventario` join `bodega` on((`bodega`.`id_Bodega` = `inventario`.`Bodega_id_Bodega`))) join `producto` on((`producto`.`id_Producto` = `inventario`.`Producto_id_Producto`))) join `tipo_producto` on((`tipo_producto`.`id_Tipo_Producto` = `producto`.`Tipo_Producto_id_Tipo_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_productos_peticiones`
--

/*!50001 DROP VIEW IF EXISTS `lista_productos_peticiones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_productos_peticiones` AS select `producto`.`id_Producto` AS `Id_Producto`,`tipo_producto`.`Nombre` AS `Tipo_Producto`,`producto`.`Cod_Producto` AS `Codigo_Producto`,`producto`.`Nombre` AS `Nombre_Producto`,`producto`.`Cantidad_Producto` AS `Cantidad_Producto`,`restricciones`.`Cantidad` AS `Limite_Pedido`,`restricciones`.`Estado` AS `Estado_Restriccion` from ((`producto` join `tipo_producto` on((`tipo_producto`.`id_Tipo_Producto` = `producto`.`Tipo_Producto_id_Tipo_Producto`))) left join `restricciones` on((`restricciones`.`Producto_id_Producto` = `producto`.`id_Producto`))) where (`producto`.`Estado` = 'DISPONIBLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_registro_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `lista_registro_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_registro_pedidos` AS select `registro_pedidos`.`id_Registro_Pedidos` AS `Id_Registro`,`registro_pedidos`.`producto_id_Producto` AS `Id_Producto`,`registro_pedidos`.`pedidos_id_Pedidos` AS `Id_Pedido`,`tipo_producto`.`Nombre` AS `Tipo_Producto`,`producto`.`Nombre` AS `Nombre_Producto`,`producto`.`Cod_Producto` AS `Codigo_Producto`,`registro_pedidos`.`Cantidad` AS `Cantidad_Pedido` from ((`registro_pedidos` join `producto` on((`producto`.`id_Producto` = `registro_pedidos`.`producto_id_Producto`))) join `tipo_producto` on((`tipo_producto`.`id_Tipo_Producto` = `producto`.`Tipo_Producto_id_Tipo_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_restricciones`
--

/*!50001 DROP VIEW IF EXISTS `lista_restricciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_restricciones` AS select `producto`.`Nombre` AS `Nombre_Producto`,`producto`.`Cod_Producto` AS `Codigo_Producto`,`restricciones`.`id_Restricciones` AS `Id_Restriccion`,`restricciones`.`Cantidad` AS `Cantidad_Restriccion`,`restricciones`.`Detalle` AS `Detalle_Restriccion`,`restricciones`.`Estado` AS `Estado_Restriccion` from (`restricciones` join `producto` on((`producto`.`id_Producto` = `restricciones`.`Producto_id_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `lista_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_usuarios` AS select `persona`.`id_Persona` AS `Id_User`,concat(`persona`.`Nombre`,' ',`persona`.`Apellido`) AS `Nombre_User`,`rol`.`Nombre` AS `Tipo_Usuario`,`persona`.`Identificacion` AS `Ident_User`,`persona`.`Correo_Electronico` AS `Correo_Usuario`,`persona`.`Telefono` AS `Telefono_User`,`registro_ep`.`Estado` AS `Estado_Usuario` from ((`persona` join `registro_ep` on((`registro_ep`.`Persona_id_Persona` = `persona`.`id_Persona`))) join `rol` on((`rol`.`id_Rol` = `registro_ep`.`Rol_id_Rol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menu_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `menu_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_usuarios` AS select `entidad`.`id_Entidad` AS `Id_Entidad`,`persona`.`id_Persona` AS `Id_Persona`,`rol`.`Nombre` AS `Nombre_Rol`,`menu`.`Nombre` AS `Menu`,`menu`.`Icono` AS `Icono_Menu`,`menu`.`Ruta` AS `Rutas_Menu`,`menu`.`Orden` AS `Orden_Menu` from (((((`persona` join `registro_ep` on((`registro_ep`.`Persona_id_Persona` = `persona`.`id_Persona`))) join `entidad` on((`entidad`.`id_Entidad` = `registro_ep`.`Entidad_id_Entidad`))) join `rol` on((`rol`.`id_Rol` = `registro_ep`.`Rol_id_Rol`))) join `permisos` on((`permisos`.`Rol_id_Rol` = `rol`.`id_Rol`))) join `menu` on((`menu`.`id_Menu` = `permisos`.`Menu_id_Menu`))) order by (`menu`.`Nombre` = 'Inicio') desc,`menu`.`Orden` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `variables_usuario`
--

/*!50001 DROP VIEW IF EXISTS `variables_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `variables_usuario` AS select `usuario`.`id_Usuario` AS `Id_Usuario`,`entidad`.`id_Entidad` AS `Id_Entidad`,`entidad`.`Nombre` AS `Nombre_Entidad`,`entidad`.`Nit` AS `Nit_Entidad`,`persona`.`id_Persona` AS `Id_Empleado`,concat(`persona`.`Nombre`,' ',`persona`.`Apellido`) AS `Nombre_Usuario`,`persona`.`Identificacion` AS `Ident_Usuario`,`rol`.`Nombre` AS `Tipo_Usuario` from ((((`usuario` join `persona` on((`persona`.`id_Persona` = `usuario`.`Persona_id_Persona`))) join `registro_ep` on((`registro_ep`.`Persona_id_Persona` = `persona`.`id_Persona`))) join `entidad` on((`entidad`.`id_Entidad` = `registro_ep`.`Entidad_id_Entidad`))) join `rol` on((`rol`.`id_Rol` = `registro_ep`.`Rol_id_Rol`))) where ((`registro_ep`.`Estado` = 'ACTIVA') and (`entidad`.`Estado` = 'ACTIVA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-05 14:20:13
