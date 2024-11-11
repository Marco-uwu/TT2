-- MySQL dump 10.13  Distrib 8.0.39, for Linux (aarch64)
--
-- Host: localhost    Database: estaciones_carga
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estaciones`
--

DROP TABLE IF EXISTS `estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_regla` int NOT NULL DEFAULT '1',
  `nombre` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` enum('Disponible','No disponible','Fuera de servicio') NOT NULL DEFAULT 'Fuera de servicio',
  `dir_mac` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dir_mac` (`dir_mac`),
  KEY `id_regla` (`id_regla`),
  CONSTRAINT `estaciones_ibfk_1` FOREIGN KEY (`id_regla`) REFERENCES `reglas_medicion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES (1,1,'Estacion ESCOM','GV33+VF Ciudad de México, Cd. de México','Disponible','RTQ1RjAxN0Y5NjAz'),(2,1,'Estacion ESIME','FVX8+6J Ciudad de México, Cd. de México','Fuera de servicio','NjQ1RDg2MUREMTdC'),(3,1,'Estación ESIA','GV37+J4 Ciudad de México, Cd. de México','No disponible','NjQ1RDg2MUREMTdX');
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediciones`
--

DROP TABLE IF EXISTS `mediciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(5,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estacion` int DEFAULT NULL,
  `id_tipo_medicion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estacion` (`id_estacion`),
  KEY `id_tipo_medicion` (`id_tipo_medicion`),
  CONSTRAINT `mediciones_ibfk_1` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id`),
  CONSTRAINT `mediciones_ibfk_2` FOREIGN KEY (`id_tipo_medicion`) REFERENCES `tipos_medicion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediciones`
--

LOCK TABLES `mediciones` WRITE;
/*!40000 ALTER TABLE `mediciones` DISABLE KEYS */;
INSERT INTO `mediciones` VALUES (1,220.50,'2024-11-11 04:38:38',1,1),(2,221.00,'2024-11-11 04:38:38',1,2),(3,219.80,'2024-11-11 04:38:38',1,3),(4,220.20,'2024-11-11 04:38:38',1,4),(5,220.70,'2024-11-11 04:38:38',1,5),(6,10.50,'2024-11-11 04:38:38',1,6),(7,10.70,'2024-11-11 04:38:38',1,7),(8,25.30,'2024-11-11 04:38:38',1,8);
/*!40000 ALTER TABLE `mediciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros_medicion`
--

DROP TABLE IF EXISTS `parametros_medicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros_medicion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_regla` int NOT NULL,
  `id_tipo_medicion` int NOT NULL,
  `valor_min` decimal(5,2) NOT NULL,
  `valor_ide` decimal(5,2) NOT NULL,
  `valor_max` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_medicion` (`id_tipo_medicion`),
  KEY `id_regla` (`id_regla`),
  CONSTRAINT `parametros_medicion_ibfk_1` FOREIGN KEY (`id_tipo_medicion`) REFERENCES `tipos_medicion` (`id`),
  CONSTRAINT `parametros_medicion_ibfk_2` FOREIGN KEY (`id_regla`) REFERENCES `reglas_medicion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_medicion`
--

LOCK TABLES `parametros_medicion` WRITE;
/*!40000 ALTER TABLE `parametros_medicion` DISABLE KEYS */;
INSERT INTO `parametros_medicion` VALUES (1,1,1,10.00,11.00,12.00),(2,1,2,10.00,11.00,12.00),(3,1,3,100.00,120.00,140.00),(4,1,4,10.00,11.00,12.00),(5,1,5,10.00,11.00,12.00),(6,1,6,16.00,20.00,30.00),(7,1,7,16.00,20.00,30.00),(8,1,8,0.00,25.00,45.00);
/*!40000 ALTER TABLE `parametros_medicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglas_medicion`
--

DROP TABLE IF EXISTS `reglas_medicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reglas_medicion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas_medicion`
--

LOCK TABLES `reglas_medicion` WRITE;
/*!40000 ALTER TABLE `reglas_medicion` DISABLE KEYS */;
INSERT INTO `reglas_medicion` VALUES (1,'GENERAL');
/*!40000 ALTER TABLE `reglas_medicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_medicion`
--

DROP TABLE IF EXISTS `tipos_medicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_medicion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `tipo_medicion` enum('V','I','T','N/A') NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_medicion`
--

LOCK TABLES `tipos_medicion` WRITE;
/*!40000 ALTER TABLE `tipos_medicion` DISABLE KEYS */;
INSERT INTO `tipos_medicion` VALUES (1,'voltaje_1','V'),(2,'voltaje_2','V'),(3,'voltaje_3','V'),(4,'voltaje_4','V'),(5,'voltaje_5','V'),(6,'intensidad_1','I'),(7,'intensidad_2','I'),(8,'temperatura','T');
/*!40000 ALTER TABLE `tipos_medicion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-10 22:41:50
