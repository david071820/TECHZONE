-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 190.90.160.172    Database: credicel_BD_ELECTRONICA_TECH_ZONE
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.21-MariaDB-cll-lve

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena información sobre las categorías de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (12,'Accesorios'),(18,'Almacenamiento'),(15,'Audio'),(6,'Auriculares'),(10,'Cámaras'),(11,'Componentes PC'),(7,'Discos Duros'),(20,'Fotografía'),(8,'Impresoras'),(1,'Laptops'),(4,'Monitores'),(19,'Oficina'),(14,'Periféricos'),(17,'Redes'),(9,'Routers'),(2,'Smartphones'),(13,'Software'),(3,'Tablets'),(5,'Teclados y Ratones'),(16,'Video');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena información sobre los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','juan.perez@email.com','123-456-7890','Calle 123, Ciudad'),(2,'María','Gómez','maria.gomez@email.com','987-654-3210','Avenida 456, Pueblo'),(3,'Carlos','Rodríguez','carlos.rodriguez@email.com','555-123-4567','Carrera 789, Villa'),(4,'Laura','López','laura.lopez@email.com','111-222-3333','Transversal 10, Barrio'),(5,'Pedro','Martínez','pedro.martinez@email.com','444-555-6666','Diagonal 20, Sector'),(6,'Ana','Sánchez','ana.sanchez@email.com','777-888-9999','Circular 30, Urbanización'),(7,'Luis','Ramírez','luis.ramirez@email.com','222-333-4444','Manzana 40, Conjunto'),(8,'Sofía','Torres','sofia.torres@email.com','666-777-8888','Lote 50, Parcela'),(9,'Diego','Díaz','diego.diaz@email.com','333-444-5555','Andador 60, Etapa'),(10,'Isabel','Flores','isabel.flores@email.com','888-999-0000','Pasaje 70, Zona'),(11,'Ricardo','Castro','ricardo.castro@email.com','123-987-6543','Bloque 80, Unidad'),(12,'Elena','Ruiz','elena.ruiz@email.com','456-789-0123','Edificio 90, Piso'),(13,'Javier','Moreno','javier.moreno@email.com','789-012-3456','Apartamento 100, Torre'),(14,'Carmen','Álvarez','carmen.alvarez@email.com','012-345-6789','Casa 110, Sector'),(15,'Miguel','Jiménez','miguel.jimenez@email.com','345-678-9012','Local 120, Centro'),(16,'Paula','García','paula.garcia@email.com','678-901-2345','Oficina 130, Edificio'),(17,'Andrés','Hernández','andres.hernandez@email.com','901-234-5678','Bodega 140, Parque'),(18,'Valentina','Pérez','valentina.perez@email.com','234-567-8901','Galpón 150, Polígono'),(19,'Daniel','Romero','daniel.romero@email.com','567-890-1234','Nave 160, Área'),(20,'Lucía','Soto','lucia.soto@email.com','890-123-4567','Módulo 170, Complejo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_idx` (`pedido_id`),
  KEY `producto_idx` (`producto_id`),
  CONSTRAINT `pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena información detallada sobre los productos incluidos en cada pedido';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
INSERT INTO `detalles_pedido` VALUES (1,1,1,1,1200.00),(2,1,2,2,900.00),(3,2,3,1,1100.00),(4,2,4,1,400.00),(5,3,5,2,100.00),(6,3,6,1,90.00),(7,4,7,1,350.00),(8,4,8,1,200.00),(9,5,9,1,150.00),(10,5,10,1,120.00),(11,6,11,1,2500.00),(12,6,12,1,1300.00),(13,7,13,1,1100.00),(14,7,14,1,950.00),(15,8,15,1,500.00),(16,8,16,1,150.00),(17,9,17,1,120.00),(18,9,18,1,300.00),(19,10,19,1,100.00),(20,10,20,1,200.00);
/*!40000 ALTER TABLE `detalles_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `detalles_pedidos_completos`
--

DROP TABLE IF EXISTS `detalles_pedidos_completos`;
/*!50001 DROP VIEW IF EXISTS `detalles_pedidos_completos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_pedidos_completos` AS SELECT 
 1 AS `id`,
 1 AS `nombre_cliente`,
 1 AS `apellido_cliente`,
 1 AS `nombre_producto`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `fecha_pedido`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `direccion_envio` varchar(255) NOT NULL,
  `fecha_envio` date NOT NULL,
  `empresa_envio` varchar(100) NOT NULL,
  `numero_seguimiento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pediditos_idx` (`pedido_id`),
  CONSTRAINT `pediditos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena la informacion de los envios realizados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,1,'Calle 123, Ciudad','2023-10-27','DHL','1234567890'),(2,2,'Avenida 456, Pueblo','2023-10-28','FedEx','0987654321'),(3,3,'Carrera 789, Villa','2023-10-29','UPS','1357924680'),(4,4,'Transversal 10, Barrio','2023-10-30','Correos de México','2468013579'),(5,5,'Diagonal 20, Sector','2023-10-31','Estafeta','9876501234'),(6,6,'Circular 30, Urbanización','2023-11-01','DHL','4321098765'),(7,7,'Manzana 40, Conjunto','2023-11-02','FedEx','5678901234'),(8,8,'Lote 50, Parcela','2023-11-03','UPS','0123456789'),(9,9,'Andador 60, Etapa','2023-11-04','Correos de México','9012345678'),(10,10,'Pasaje 70, Zona','2023-11-05','Estafeta','8901234567'),(11,11,'Bloque 80, Unidad','2023-11-06','DHL','7890123456'),(12,12,'Edificio 90, Piso','2023-11-07','FedEx','6789012345'),(13,13,'Apartamento 100, Torre','2023-11-08','UPS','5678901234'),(14,14,'Casa 110, Sector','2023-11-09','Correos de México','4567890123'),(15,15,'Local 120, Centro','2023-11-10','Estafeta','3456789012'),(16,16,'Oficina 130, Edificio','2023-11-11','DHL','2345678901'),(17,17,'Bodega 140, Parque','2023-11-12','FedEx','1234567890'),(18,18,'Galpón 150, Polígono','2023-11-13','UPS','0987654321'),(19,19,'Nave 160, Área','2023-11-14','Correos de México','9876543210'),(20,20,'Módulo 170, Complejo','2023-11-15','Estafeta','8765432109');
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad_ingreso` int(11) DEFAULT NULL,
  `cantidad_salida` int(11) DEFAULT NULL,
  `fecha_movimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_idx` (`producto_id`),
  CONSTRAINT `productitco` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena la informacion detallada del inventario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,100,50,'2023-10-26'),(2,2,150,100,'2023-10-27'),(3,3,50,30,'2023-10-28'),(4,4,30,20,'2023-10-29'),(5,5,120,80,'2023-10-30'),(6,6,130,90,'2023-10-31'),(7,7,80,40,'2023-11-01'),(8,8,100,60,'2023-11-02'),(9,9,50,25,'2023-11-03'),(10,10,110,70,'2023-11-04'),(11,11,25,15,'2023-11-05'),(12,12,90,45,'2023-11-06'),(13,13,140,95,'2023-11-07'),(14,14,70,35,'2023-11-08'),(15,15,30,18,'2023-11-09'),(16,16,115,75,'2023-11-10'),(17,17,125,85,'2023-11-11'),(18,18,78,38,'2023-11-12'),(19,19,95,55,'2023-11-13'),(20,20,62,22,'2023-11-14');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `fecha_pago` date NOT NULL,
  `pagoscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`pedido_id`),
  KEY `pedidito_idx` (`pedido_id`),
  CONSTRAINT `pedidito` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena la informacion de los pagos realizados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,2100.00,'Tarjeta de crédito','2023-10-26',NULL),(2,2,1500.00,'PayPal','2023-10-27',NULL),(3,3,190.00,'Tarjeta de débito','2023-10-28',NULL),(4,4,550.00,'Transferencia bancaria','2023-10-29',NULL),(5,5,270.00,'Tarjeta de crédito','2023-10-30',NULL),(6,6,3800.00,'PayPal','2023-10-31',NULL),(7,7,2050.00,'Tarjeta de débito','2023-11-01',NULL),(8,8,650.00,'Transferencia bancaria','2023-11-02',NULL),(9,9,420.00,'Tarjeta de crédito','2023-11-03',NULL),(10,10,320.00,'PayPal','2023-11-04',NULL),(11,11,2500.00,'Tarjeta de débito','2023-11-05',NULL),(12,12,1300.00,'Transferencia bancaria','2023-11-06',NULL),(13,13,1100.00,'Tarjeta de crédito','2023-11-07',NULL),(14,14,950.00,'PayPal','2023-11-08',NULL),(15,15,500.00,'Tarjeta de débito','2023-11-09',NULL),(16,16,150.00,'Transferencia bancaria','2023-11-10',NULL),(17,17,120.00,'Tarjeta de crédito','2023-11-11',NULL),(18,18,300.00,'PayPal','2023-11-12',NULL),(19,19,100.00,'Tarjeta de débito','2023-11-13',NULL),(20,20,200.00,'Transferencia bancaria','2023-11-14',NULL);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_idx` (`cliente_id`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena información sobre los pedidos realizados por los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2023-10-26','Enviado'),(2,2,'2023-10-27','Pendiente'),(3,3,'2023-10-28','Entregado'),(4,4,'2023-10-29','Enviado'),(5,5,'2023-10-30','Pendiente'),(6,6,'2023-10-31','Entregado'),(7,7,'2023-11-01','Enviado'),(8,8,'2023-11-02','Pendiente'),(9,9,'2023-11-03','Entregado'),(10,10,'2023-11-04','Enviado'),(11,11,'2023-11-05','Pendiente'),(12,12,'2023-11-06','Entregado'),(13,13,'2023-11-07','Enviado'),(14,14,'2023-11-08','Pendiente'),(15,15,'2023-11-09','Entregado'),(16,16,'2023-11-10','Enviado'),(17,17,'2023-11-11','Pendiente'),(18,18,'2023-11-12','Entregado'),(19,19,'2023-11-13','Enviado'),(20,20,'2023-11-14','Pendiente');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_idx` (`categoria_id`),
  KEY `proveedor_idx` (`proveedor_id`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena información sobre los productos disponibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Laptop Dell XPS 13',NULL,1200.00,50,1,1),(2,'Smartphone Samsung Galaxy S21',NULL,900.00,100,2,2),(3,'Tablet iPad Pro 12.9',NULL,1100.00,30,3,3),(4,'Monitor LG 27UL850-W',NULL,400.00,20,4,4),(5,'Teclado Logitech MX Keys',NULL,100.00,80,5,5),(6,'Mouse Logitech MX Master 3',NULL,90.00,90,5,5),(7,'Auriculares Sony WH-1000XM4',NULL,350.00,40,6,6),(8,'Disco Duro SSD Samsung 970 EVO',NULL,200.00,60,7,7),(9,'Impresora HP LaserJet Pro M15w',NULL,150.00,25,8,8),(10,'Router TP-Link Archer AX50',NULL,120.00,70,9,9),(11,'Cámara Canon EOS R6',NULL,2500.00,15,10,10),(12,'Laptop HP Spectre x360',NULL,1300.00,45,1,11),(13,'Smartphone iPhone 13 Pro',NULL,1100.00,95,2,12),(14,'Tablet Samsung Galaxy Tab S7',NULL,950.00,35,3,13),(15,'Monitor Asus ROG Swift PG279QZ',NULL,500.00,18,4,14),(16,'Teclado Corsair K95 RGB Platinum',NULL,150.00,75,5,15),(17,'Mouse Razer DeathAdder V2 Pro',NULL,120.00,85,5,16),(18,'Auriculares Bose QuietComfort 35 II',NULL,300.00,38,6,17),(19,'Disco Duro HDD Seagate Barracuda',NULL,100.00,55,7,18),(20,'Impresora Epson EcoTank ET-2720',NULL,200.00,22,8,19);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contacto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena la informacion de los proveedores de los productos\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Dell','contacto@dell.com'),(2,'Samsung','contacto@samsung.com'),(3,'Apple','contacto@apple.com'),(4,'LG','contacto@lg.com'),(5,'Logitech','contacto@logitech.com'),(6,'Sony','contacto@sony.com'),(7,'Western Digital','contacto@wd.com'),(8,'HP','contacto@hp.com'),(9,'TP-Link','contacto@tplink.com'),(10,'Canon','contacto@canon.com'),(11,'Asus','contacto@asus.com'),(12,'Microsoft','contacto@microsoft.com'),(13,'Lenovo','contacto@lenovo.com'),(14,'Acer','contacto@acer.com'),(15,'Corsair','contacto@corsair.com'),(16,'Razer','contacto@razer.com'),(17,'Bose','contacto@bose.com'),(18,'Seagate','contacto@seagate.com'),(19,'Epson','contacto@epson.com'),(20,'Kingston','contacto@kingston.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resenas_productos`
--

DROP TABLE IF EXISTS `resenas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resenas_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_resena` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productico_idx` (`producto_id`),
  KEY `clientecito_idx` (`cliente_id`),
  CONSTRAINT `clientecito` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productico` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Almacena las reseñas de los clientes sobre los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resenas_productos`
--

LOCK TABLES `resenas_productos` WRITE;
/*!40000 ALTER TABLE `resenas_productos` DISABLE KEYS */;
INSERT INTO `resenas_productos` VALUES (1,1,1,5,'Excelente laptop, muy rápida.','2023-10-27'),(2,2,2,4,'Buen smartphone, la cámara es genial.','2023-10-28'),(3,3,3,5,'La mejor tablet que he tenido.','2023-10-29'),(4,4,4,4,'Monitor de gran calidad, colores vivos.','2023-10-30'),(5,5,5,5,'Teclado muy cómodo para escribir.','2023-10-31'),(6,6,6,4,'Mouse preciso y ergonómico.','2023-11-01'),(7,7,7,5,'Auriculares con excelente cancelación de ruido.','2023-11-02'),(8,8,8,4,'SSD muy rápido, mejora el rendimiento del PC.','2023-11-03'),(9,9,9,5,'Impresora láser eficiente y rápida.','2023-11-04'),(10,10,10,4,'Router con buena cobertura y velocidad.','2023-11-05'),(11,11,11,5,'Cámara con calidad de imagen profesional.','2023-11-06'),(12,12,12,4,'Laptop con diseño elegante y buen rendimiento.','2023-11-07'),(13,13,13,5,'Smartphone con la mejor cámara del mercado.','2023-11-08'),(14,14,14,4,'Tablet con pantalla y rendimiento excepcionales.','2023-11-09'),(15,15,15,5,'Monitor para gamers con alta tasa de refresco.','2023-11-10'),(16,16,16,4,'Teclado mecánico con retroiluminación RGB.','2023-11-11'),(17,17,17,5,'Mouse inalámbrico con alta precisión.','2023-11-12'),(18,18,18,4,'Auriculares con sonido nítido y cómodos.','2023-11-13'),(19,19,19,5,'Disco duro HDD con gran capacidad de almacenamiento.','2023-11-14'),(20,20,20,4,'Impresora EcoTank con bajo costo de tinta.','2023-11-15');
/*!40000 ALTER TABLE `resenas_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `resumen_ventas_categoria`
--

DROP TABLE IF EXISTS `resumen_ventas_categoria`;
/*!50001 DROP VIEW IF EXISTS `resumen_ventas_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `resumen_ventas_categoria` AS SELECT 
 1 AS `nombre_categoria`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'credicel_BD_ELECTRONICA_TECH_ZONE'
--

--
-- Dumping routines for database 'credicel_BD_ELECTRONICA_TECH_ZONE'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`credicel_estudiantes_221024`@`%` FUNCTION `calcular_iva`(precio DECIMAL(10, 2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE iva DECIMAL(10, 2);
    SET iva = precio * 0.19;
    RETURN iva;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_nombre_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`credicel_estudiantes_221024`@`%` FUNCTION `obtener_nombre_cliente`(cliente_id_input INT) RETURNS varchar(255) CHARSET latin1 COLLATE latin1_swedish_ci
    DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(255);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_completo
    FROM clientes
    WHERE id = cliente_id_input;
    RETURN nombre_completo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcular_total_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`credicel_estudiantes_221024`@`%` PROCEDURE `calcular_total_pedido`(
    IN pedido_id_input INT,
    OUT total_pedido DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(cantidad * precio_unitario) INTO total_pedido
    FROM detalles_pedido
    WHERE pedido_id = pedido_id_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`credicel_estudiantes_221024`@`%` PROCEDURE `insertar_cliente`(
    IN nombre_cliente VARCHAR(255),
    IN apellido_cliente VARCHAR(255),
    IN email_cliente VARCHAR(255),
    IN telefono_cliente VARCHAR(50),
    IN direccion_cliente VARCHAR(255)
)
BEGIN
    INSERT INTO clientes (nombre, apellido, email, telefono, direccion)
    VALUES (nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, direccion_cliente);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `detalles_pedidos_completos`
--

/*!50001 DROP VIEW IF EXISTS `detalles_pedidos_completos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`credicel_estudiantes_221024`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_pedidos_completos` AS select `p`.`id` AS `id`,`c`.`nombre` AS `nombre_cliente`,`c`.`apellido` AS `apellido_cliente`,`pr`.`nombre_producto` AS `nombre_producto`,`dp`.`cantidad` AS `cantidad`,`dp`.`precio_unitario` AS `precio_unitario`,`p`.`fecha_pedido` AS `fecha_pedido`,`p`.`estado` AS `estado` from (((`pedidos` `p` join `clientes` `c` on(`p`.`cliente_id` = `c`.`id`)) join `detalles_pedido` `dp` on(`p`.`id` = `dp`.`pedido_id`)) join `producto` `pr` on(`dp`.`producto_id` = `pr`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resumen_ventas_categoria`
--

/*!50001 DROP VIEW IF EXISTS `resumen_ventas_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`credicel_estudiantes_221024`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `resumen_ventas_categoria` AS select `c`.`nombre_categoria` AS `nombre_categoria`,sum(`dp`.`cantidad` * `dp`.`precio_unitario`) AS `total_ventas` from ((`detalles_pedido` `dp` join `producto` `p` on(`dp`.`producto_id` = `p`.`id`)) join `categorias` `c` on(`p`.`categoria_id` = `c`.`id`)) group by `c`.`nombre_categoria` */;
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

-- Dump completed on 2025-03-24 12:47:11
