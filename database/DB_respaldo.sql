-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: localhost    Database: estaciones_carga
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.20.04.1

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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-14 06:02:32.466329'),(2,'auth','0001_initial','2024-11-14 06:02:32.527362'),(3,'admin','0001_initial','2024-11-14 06:02:32.549411'),(4,'admin','0002_logentry_remove_auto_add','2024-11-14 06:02:32.562426'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-14 06:02:32.574837'),(6,'contenttypes','0002_remove_content_type_name','2024-11-14 06:02:32.589038'),(7,'auth','0002_alter_permission_name_max_length','2024-11-14 06:02:32.600986'),(8,'auth','0003_alter_user_email_max_length','2024-11-14 06:02:32.621215'),(9,'auth','0004_alter_user_username_opts','2024-11-14 06:02:32.633638'),(10,'auth','0005_alter_user_last_login_null','2024-11-14 06:02:32.652162'),(11,'auth','0006_require_contenttypes_0002','2024-11-14 06:02:32.666629'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-14 06:02:32.686631'),(13,'auth','0008_alter_user_username_max_length','2024-11-14 06:02:32.699713'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-14 06:02:32.711974'),(15,'auth','0010_alter_group_name_max_length','2024-11-14 06:02:32.730036'),(16,'auth','0011_update_proxy_permissions','2024-11-14 06:02:32.745815'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-14 06:02:32.759889'),(18,'inicio','0001_initial','2024-11-14 06:02:32.771812'),(19,'sessions','0001_initial','2024-11-14 06:02:32.792985');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

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
  `estado` enum('Disponible','No disponible','Fuera de servicio','En mantenimiento') NOT NULL DEFAULT 'Fuera de servicio',
  `dir_mac` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dir_mac` (`dir_mac`),
  KEY `id_regla` (`id_regla`),
  CONSTRAINT `estaciones_ibfk_1` FOREIGN KEY (`id_regla`) REFERENCES `reglas_medicion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES (1,1,'Estacion ESCOM','https://maps.app.goo.gl/unj27d9cYA1ng7r59','Disponible','RTQ1RjAxN0Y5NjAz'),(2,1,'Estacion ESIME','https://maps.app.goo.gl/jKLh46eTctsxe6ng8','Fuera de servicio','NjQ1RDg2MUREMTdC'),(3,1,'Estación ESIA','https://maps.app.goo.gl/8JNuRnLcUaUNcR4X7','No disponible','NjQ1RDg2MUREMTdX'),(4,1,'Estacion ESCA','https://maps.app.goo.gl/C8gFh3uWF1U4q57U9','En mantenimiento','RTQ1RjAxN0Y5NjAw');
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
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediciones`
--

LOCK TABLES `mediciones` WRITE;
/*!40000 ALTER TABLE `mediciones` DISABLE KEYS */;
INSERT INTO `mediciones` VALUES (1,220.50,'2024-11-11 04:38:38',1,1),(2,221.00,'2024-11-11 04:38:38',1,2),(3,219.80,'2024-11-11 04:38:38',1,3),(4,220.20,'2024-11-11 04:38:38',1,4),(5,220.70,'2024-11-11 04:38:38',1,5),(6,10.50,'2024-11-11 04:38:38',1,6),(7,10.70,'2024-11-11 04:38:38',1,7),(8,25.30,'2024-11-11 04:38:38',1,8),(9,0.06,'2024-11-11 04:47:17',1,1),(10,0.06,'2024-11-11 04:47:17',1,2),(11,10.37,'2024-11-11 04:47:17',1,3),(12,127.50,'2024-11-11 04:47:17',1,4),(13,0.91,'2024-11-11 04:47:17',1,5),(14,0.29,'2024-11-11 04:47:17',1,6),(15,0.01,'2024-11-11 04:47:17',1,7),(16,21.99,'2024-11-11 04:47:17',1,8),(17,0.06,'2024-11-11 04:48:40',1,1),(18,0.06,'2024-11-11 04:48:40',1,2),(19,10.37,'2024-11-11 04:48:40',1,3),(20,127.50,'2024-11-11 04:48:40',1,4),(21,0.91,'2024-11-11 04:48:40',1,5),(22,0.29,'2024-11-11 04:48:40',1,6),(23,0.01,'2024-11-11 04:48:41',1,7),(24,21.99,'2024-11-11 04:48:41',1,8),(25,0.06,'2024-11-12 02:48:46',1,1),(26,0.06,'2024-11-12 02:48:46',1,2),(27,10.37,'2024-11-12 02:48:46',1,3),(28,127.50,'2024-11-12 02:48:46',1,4),(29,0.91,'2024-11-12 02:48:46',1,5),(30,0.29,'2024-11-12 02:48:46',1,6),(31,0.01,'2024-11-12 02:48:46',1,7),(32,21.99,'2024-11-12 02:48:46',1,8),(33,0.06,'2024-11-12 02:52:02',1,1),(34,0.06,'2024-11-12 02:52:02',1,2),(35,10.37,'2024-11-12 02:52:02',1,3),(36,127.50,'2024-11-12 02:52:02',1,4),(37,0.91,'2024-11-12 02:52:02',1,5),(38,0.29,'2024-11-12 02:52:02',1,6),(39,0.01,'2024-11-12 02:52:02',1,7),(40,21.99,'2024-11-12 02:52:02',1,8),(41,0.06,'2024-11-12 02:54:17',1,1),(42,0.06,'2024-11-12 02:54:17',1,2),(43,10.37,'2024-11-12 02:54:17',1,3),(44,127.50,'2024-11-12 02:54:17',1,4),(45,0.91,'2024-11-12 02:54:17',1,5),(46,0.29,'2024-11-12 02:54:17',1,6),(47,0.01,'2024-11-12 02:54:17',1,7),(48,21.99,'2024-11-12 02:54:17',1,8),(49,0.06,'2024-11-12 02:56:57',1,1),(50,0.06,'2024-11-12 02:56:57',1,2),(51,10.37,'2024-11-12 02:56:57',1,3),(52,127.50,'2024-11-12 02:56:57',1,4),(53,0.91,'2024-11-12 02:56:57',1,5),(54,0.29,'2024-11-12 02:56:57',1,6),(55,0.01,'2024-11-12 02:56:57',1,7),(56,21.99,'2024-11-12 02:56:57',1,8),(57,0.06,'2024-11-12 02:58:03',1,1),(58,0.06,'2024-11-12 02:58:03',1,2),(59,10.37,'2024-11-12 02:58:03',1,3),(60,127.50,'2024-11-12 02:58:03',1,4),(61,0.91,'2024-11-12 02:58:03',1,5),(62,0.29,'2024-11-12 02:58:03',1,6),(63,0.01,'2024-11-12 02:58:03',1,7),(64,21.99,'2024-11-12 02:58:03',1,8),(65,0.06,'2024-11-12 03:00:19',1,1),(66,0.06,'2024-11-12 03:00:19',1,2),(67,10.37,'2024-11-12 03:00:19',1,3),(68,127.50,'2024-11-12 03:00:19',1,4),(69,0.91,'2024-11-12 03:00:19',1,5),(70,0.29,'2024-11-12 03:00:19',1,6),(71,0.01,'2024-11-12 03:00:19',1,7),(72,21.99,'2024-11-12 03:00:19',1,8),(73,0.06,'2024-11-12 03:01:54',1,1),(74,0.06,'2024-11-12 03:01:54',1,2),(75,10.37,'2024-11-12 03:01:54',1,3),(76,127.50,'2024-11-12 03:01:54',1,4),(77,0.91,'2024-11-12 03:01:54',1,5),(78,0.29,'2024-11-12 03:01:54',1,6),(79,0.01,'2024-11-12 03:01:54',1,7),(80,21.99,'2024-11-12 03:01:54',1,8),(81,0.06,'2024-11-12 03:02:10',1,1),(82,0.06,'2024-11-12 03:02:10',1,2),(83,10.37,'2024-11-12 03:02:10',1,3),(84,127.50,'2024-11-12 03:02:10',1,4),(85,0.91,'2024-11-12 03:02:10',1,5),(86,0.29,'2024-11-12 03:02:10',1,6),(87,0.01,'2024-11-12 03:02:10',1,7),(88,21.99,'2024-11-12 03:02:10',1,8),(89,0.06,'2024-11-12 03:02:22',1,1),(90,0.06,'2024-11-12 03:02:23',1,2),(91,10.37,'2024-11-12 03:02:23',1,3),(92,127.50,'2024-11-12 03:02:23',1,4),(93,0.91,'2024-11-12 03:02:23',1,5),(94,0.29,'2024-11-12 03:02:23',1,6),(95,0.01,'2024-11-12 03:02:23',1,7),(96,21.99,'2024-11-12 03:02:23',1,8),(97,0.06,'2024-11-12 03:02:43',1,1),(98,0.06,'2024-11-12 03:02:43',1,2),(99,10.37,'2024-11-12 03:02:43',1,3),(100,127.50,'2024-11-12 03:02:43',1,4),(101,0.91,'2024-11-12 03:02:43',1,5),(102,0.29,'2024-11-12 03:02:43',1,6),(103,0.01,'2024-11-12 03:02:43',1,7),(104,21.99,'2024-11-12 03:02:43',1,8),(105,0.06,'2024-11-12 03:03:17',1,1),(106,0.06,'2024-11-12 03:03:17',1,2),(107,10.37,'2024-11-12 03:03:17',1,3),(108,127.50,'2024-11-12 03:03:17',1,4),(109,0.91,'2024-11-12 03:03:17',1,5),(110,0.29,'2024-11-12 03:03:17',1,6),(111,0.01,'2024-11-12 03:03:17',1,7),(112,21.99,'2024-11-12 03:03:17',1,8),(113,0.06,'2024-11-12 03:05:00',1,1),(114,0.06,'2024-11-12 03:05:00',1,2),(115,10.37,'2024-11-12 03:05:00',1,3),(116,127.50,'2024-11-12 03:05:00',1,4),(117,0.91,'2024-11-12 03:05:00',1,5),(118,0.29,'2024-11-12 03:05:00',1,6),(119,0.01,'2024-11-12 03:05:00',1,7),(120,21.99,'2024-11-12 03:05:00',1,8),(121,0.06,'2024-11-12 03:07:33',1,1),(122,0.06,'2024-11-12 03:07:33',1,2),(123,10.37,'2024-11-12 03:07:33',1,3),(124,127.50,'2024-11-12 03:07:33',1,4),(125,0.91,'2024-11-12 03:07:33',1,5),(126,0.29,'2024-11-12 03:07:33',1,6),(127,0.01,'2024-11-12 03:07:33',1,7),(128,21.99,'2024-11-12 03:07:33',1,8),(129,0.06,'2024-11-12 03:27:01',1,1),(130,0.06,'2024-11-12 03:27:01',1,2),(131,10.37,'2024-11-12 03:27:01',1,3),(132,127.50,'2024-11-12 03:27:01',1,4),(133,0.91,'2024-11-12 03:27:01',1,5),(134,0.29,'2024-11-12 03:27:01',1,6),(135,0.01,'2024-11-12 03:27:01',1,7),(136,21.99,'2024-11-12 03:27:01',1,8),(137,0.06,'2024-11-12 03:30:06',1,1),(138,0.06,'2024-11-12 03:30:06',1,2),(139,10.37,'2024-11-12 03:30:06',1,3),(140,127.50,'2024-11-12 03:30:06',1,4),(141,0.91,'2024-11-12 03:30:06',1,5),(142,0.29,'2024-11-12 03:30:06',1,6),(143,0.01,'2024-11-12 03:30:06',1,7),(144,21.99,'2024-11-12 03:30:06',1,8),(145,0.06,'2024-11-12 03:56:42',1,1),(146,0.06,'2024-11-12 03:56:42',1,2),(147,10.37,'2024-11-12 03:56:42',1,3),(148,127.50,'2024-11-12 03:56:42',1,4),(149,0.91,'2024-11-12 03:56:43',1,5),(150,0.29,'2024-11-12 03:56:43',1,6),(151,0.01,'2024-11-12 03:56:43',1,7),(152,21.99,'2024-11-12 03:56:43',1,8),(153,0.06,'2024-11-12 03:59:13',1,1),(154,0.06,'2024-11-12 03:59:13',1,2),(155,10.37,'2024-11-12 03:59:13',1,3),(156,127.50,'2024-11-12 03:59:13',1,4),(157,0.91,'2024-11-12 03:59:13',1,5),(158,0.29,'2024-11-12 03:59:13',1,6),(159,0.01,'2024-11-12 03:59:13',1,7),(160,21.99,'2024-11-12 03:59:13',1,8),(161,0.06,'2024-11-12 04:04:43',1,1),(162,0.06,'2024-11-12 04:04:43',1,2),(163,10.37,'2024-11-12 04:04:43',1,3),(164,127.50,'2024-11-12 04:04:43',1,4),(165,0.91,'2024-11-12 04:04:43',1,5),(166,0.29,'2024-11-12 04:04:43',1,6),(167,0.01,'2024-11-12 04:04:43',1,7),(168,21.99,'2024-11-12 04:04:43',1,8),(169,0.06,'2024-11-12 04:13:14',1,1),(170,0.06,'2024-11-12 04:13:14',1,2),(171,10.37,'2024-11-12 04:13:14',1,3),(172,127.50,'2024-11-12 04:13:14',1,4),(173,0.91,'2024-11-12 04:13:14',1,5),(174,0.29,'2024-11-12 04:13:14',1,6),(175,0.01,'2024-11-12 04:13:14',1,7),(176,21.99,'2024-11-12 04:13:14',1,8),(177,0.06,'2024-11-12 04:14:15',1,1),(178,0.06,'2024-11-12 04:14:15',1,2),(179,10.37,'2024-11-12 04:14:15',1,3),(180,127.50,'2024-11-12 04:14:15',1,4),(181,0.91,'2024-11-12 04:14:15',1,5),(182,0.29,'2024-11-12 04:14:15',1,6),(183,0.01,'2024-11-12 04:14:15',1,7),(184,21.99,'2024-11-12 04:14:15',1,8),(185,0.06,'2024-11-12 04:14:23',1,1),(186,0.06,'2024-11-12 04:14:23',1,2),(187,10.37,'2024-11-12 04:14:23',1,3),(188,127.50,'2024-11-12 04:14:23',1,4),(189,0.91,'2024-11-12 04:14:23',1,5),(190,0.29,'2024-11-12 04:14:23',1,6),(191,0.01,'2024-11-12 04:14:23',1,7),(192,21.99,'2024-11-12 04:14:23',1,8),(193,0.06,'2024-11-12 04:16:49',1,1),(194,0.06,'2024-11-12 04:16:49',1,2),(195,10.37,'2024-11-12 04:16:49',1,3),(196,127.50,'2024-11-12 04:16:49',1,4),(197,0.91,'2024-11-12 04:16:49',1,5),(198,0.29,'2024-11-12 04:16:49',1,6),(199,0.01,'2024-11-12 04:16:49',1,7),(200,21.99,'2024-11-12 04:16:49',1,8),(201,0.06,'2024-11-12 04:19:39',1,1),(202,0.06,'2024-11-12 04:19:39',1,2),(203,10.37,'2024-11-12 04:19:39',1,3),(204,127.50,'2024-11-12 04:19:39',1,4),(205,0.91,'2024-11-12 04:19:39',1,5),(206,0.29,'2024-11-12 04:19:39',1,6),(207,0.01,'2024-11-12 04:19:39',1,7),(208,21.99,'2024-11-12 04:19:39',1,8),(209,0.06,'2024-11-12 04:23:16',1,1),(210,0.06,'2024-11-12 04:23:16',1,2),(211,10.37,'2024-11-12 04:23:16',1,3),(212,127.50,'2024-11-12 04:23:16',1,4),(213,0.91,'2024-11-12 04:23:16',1,5),(214,0.29,'2024-11-12 04:23:16',1,6),(215,0.01,'2024-11-12 04:23:16',1,7),(216,21.99,'2024-11-12 04:23:16',1,8),(217,0.06,'2024-11-12 04:23:23',1,1),(218,0.06,'2024-11-12 04:23:23',1,2),(219,10.37,'2024-11-12 04:23:23',1,3),(220,127.50,'2024-11-12 04:23:23',1,4),(221,0.91,'2024-11-12 04:23:23',1,5),(222,0.29,'2024-11-12 04:23:23',1,6),(223,0.01,'2024-11-12 04:23:23',1,7),(224,21.99,'2024-11-12 04:23:23',1,8),(225,0.06,'2024-11-12 04:26:22',1,1),(226,0.06,'2024-11-12 04:26:22',1,2),(227,10.37,'2024-11-12 04:26:22',1,3),(228,127.50,'2024-11-12 04:26:22',1,4),(229,0.91,'2024-11-12 04:26:22',1,5),(230,0.29,'2024-11-12 04:26:22',1,6),(231,0.01,'2024-11-12 04:26:22',1,7),(232,21.99,'2024-11-12 04:26:22',1,8),(233,0.06,'2024-11-12 04:26:32',1,1),(234,0.06,'2024-11-12 04:26:32',1,2),(235,10.37,'2024-11-12 04:26:32',1,3),(236,127.50,'2024-11-12 04:26:32',1,4),(237,0.91,'2024-11-12 04:26:32',1,5),(238,0.29,'2024-11-12 04:26:32',1,6),(239,0.01,'2024-11-12 04:26:32',1,7),(240,21.99,'2024-11-12 04:26:32',1,8),(241,0.06,'2024-11-12 04:39:56',1,1),(242,0.06,'2024-11-12 04:39:56',1,2),(243,10.37,'2024-11-12 04:39:56',1,3),(244,127.50,'2024-11-12 04:39:56',1,4),(245,0.91,'2024-11-12 04:39:56',1,5),(246,0.29,'2024-11-12 04:39:56',1,6),(247,0.01,'2024-11-12 04:39:56',1,7),(248,21.99,'2024-11-12 04:39:56',1,8),(249,0.06,'2024-11-12 04:41:21',1,1),(250,0.06,'2024-11-12 04:41:21',1,2),(251,10.37,'2024-11-12 04:41:21',1,3),(252,127.50,'2024-11-12 04:41:21',1,4),(253,0.91,'2024-11-12 04:41:21',1,5),(254,0.29,'2024-11-12 04:41:21',1,6),(255,0.01,'2024-11-12 04:41:21',1,7),(256,21.99,'2024-11-12 04:41:21',1,8),(257,0.06,'2024-11-12 04:42:05',1,1),(258,0.06,'2024-11-12 04:42:05',1,2),(259,10.37,'2024-11-12 04:42:05',1,3),(260,127.50,'2024-11-12 04:42:05',1,4),(261,0.91,'2024-11-12 04:42:05',1,5),(262,0.29,'2024-11-12 04:42:05',1,6),(263,0.01,'2024-11-12 04:42:05',1,7),(264,21.99,'2024-11-12 04:42:05',1,8),(265,0.06,'2024-11-12 05:16:42',1,1),(266,0.06,'2024-11-12 05:16:42',1,2),(267,10.37,'2024-11-12 05:16:42',1,3),(268,127.50,'2024-11-12 05:16:42',1,4),(269,0.91,'2024-11-12 05:16:42',1,5),(270,0.29,'2024-11-12 05:16:42',1,6),(271,0.01,'2024-11-12 05:16:42',1,7),(272,21.99,'2024-11-12 05:16:42',1,8),(273,0.06,'2024-11-12 05:20:45',1,1),(274,0.06,'2024-11-12 05:20:45',1,2),(275,10.37,'2024-11-12 05:20:45',1,3),(276,127.50,'2024-11-12 05:20:45',1,4),(277,0.91,'2024-11-12 05:20:45',1,5),(278,0.29,'2024-11-12 05:20:45',1,6),(279,0.01,'2024-11-12 05:20:45',1,7),(280,21.99,'2024-11-12 05:20:45',1,8),(281,0.06,'2024-11-12 05:31:39',1,1),(282,0.06,'2024-11-12 05:31:39',1,2),(283,10.37,'2024-11-12 05:31:39',1,3),(284,127.50,'2024-11-12 05:31:39',1,4),(285,0.91,'2024-11-12 05:31:39',1,5),(286,0.29,'2024-11-12 05:31:39',1,6),(287,0.01,'2024-11-12 05:31:39',1,7),(288,21.99,'2024-11-12 05:31:39',1,8),(289,0.06,'2024-11-12 05:37:18',1,1),(290,0.06,'2024-11-12 05:37:18',1,2),(291,10.37,'2024-11-12 05:37:18',1,3),(292,127.50,'2024-11-12 05:37:18',1,4),(293,0.91,'2024-11-12 05:37:18',1,5),(294,0.29,'2024-11-12 05:37:18',1,6),(295,0.01,'2024-11-12 05:37:18',1,7),(296,21.99,'2024-11-12 05:37:18',1,8),(297,0.06,'2024-11-12 05:38:23',1,1),(298,0.06,'2024-11-12 05:38:23',1,2),(299,10.37,'2024-11-12 05:38:23',1,3),(300,127.50,'2024-11-12 05:38:23',1,4),(301,0.91,'2024-11-12 05:38:23',1,5),(302,0.29,'2024-11-12 05:38:23',1,6),(303,0.01,'2024-11-12 05:38:23',1,7),(304,21.99,'2024-11-12 05:38:23',1,8),(305,0.06,'2024-11-12 05:47:45',1,1),(306,0.06,'2024-11-12 05:47:45',1,2),(307,10.37,'2024-11-12 05:47:45',1,3),(308,127.50,'2024-11-12 05:47:45',1,4),(309,0.91,'2024-11-12 05:47:45',1,5),(310,0.29,'2024-11-12 05:47:45',1,6),(311,0.01,'2024-11-12 05:47:45',1,7),(312,21.99,'2024-11-12 05:47:45',1,8),(313,0.06,'2024-11-12 05:50:51',1,1),(314,0.06,'2024-11-12 05:50:51',1,2),(315,10.37,'2024-11-12 05:50:51',1,3),(316,127.50,'2024-11-12 05:50:51',1,4),(317,0.91,'2024-11-12 05:50:51',1,5),(318,0.29,'2024-11-12 05:50:51',1,6),(319,0.01,'2024-11-12 05:50:51',1,7),(320,21.99,'2024-11-12 05:50:51',1,8),(321,0.06,'2024-11-12 06:01:30',1,1),(322,0.06,'2024-11-12 06:01:30',1,2),(323,10.37,'2024-11-12 06:01:30',1,3),(324,127.50,'2024-11-12 06:01:30',1,4),(325,0.91,'2024-11-12 06:01:30',1,5),(326,0.29,'2024-11-12 06:01:30',1,6),(327,0.01,'2024-11-12 06:01:30',1,7),(328,21.99,'2024-11-12 06:01:30',1,8),(329,0.06,'2024-11-12 06:02:27',1,1),(330,0.06,'2024-11-12 06:02:27',1,2),(331,10.37,'2024-11-12 06:02:27',1,3),(332,127.50,'2024-11-12 06:02:27',1,4),(333,0.91,'2024-11-12 06:02:27',1,5),(334,0.29,'2024-11-12 06:02:27',1,6),(335,0.01,'2024-11-12 06:02:27',1,7),(336,21.99,'2024-11-12 06:02:27',1,8),(337,10.05,'2024-11-12 06:06:16',1,1),(338,11.98,'2024-11-12 06:06:16',1,2),(339,11.23,'2024-11-12 06:06:16',1,3),(340,127.55,'2024-11-12 06:06:16',1,4),(341,10.05,'2024-11-12 06:06:16',1,5),(342,20.35,'2024-11-12 06:06:16',1,6),(343,21.78,'2024-11-12 06:06:16',1,7),(344,21.99,'2024-11-12 06:06:16',1,8),(345,5.05,'2024-11-12 06:06:45',1,1),(346,11.98,'2024-11-12 06:06:45',1,2),(347,11.23,'2024-11-12 06:06:45',1,3),(348,127.55,'2024-11-12 06:06:45',1,4),(349,10.05,'2024-11-12 06:06:45',1,5),(350,20.35,'2024-11-12 06:06:45',1,6),(351,21.78,'2024-11-12 06:06:45',1,7),(352,21.99,'2024-11-12 06:06:45',1,8),(353,5.05,'2024-11-12 06:12:12',1,1),(354,11.98,'2024-11-12 06:12:12',1,2),(355,11.23,'2024-11-12 06:12:12',1,3),(356,127.55,'2024-11-12 06:12:12',1,4),(357,10.05,'2024-11-12 06:12:12',1,5),(358,20.35,'2024-11-12 06:12:12',1,6),(359,21.78,'2024-11-12 06:12:12',1,7),(360,21.99,'2024-11-12 06:12:12',1,8),(361,0.06,'2024-11-12 06:12:29',1,1),(362,0.06,'2024-11-12 06:12:29',1,2),(363,10.37,'2024-11-12 06:12:29',1,3),(364,127.50,'2024-11-12 06:12:29',1,4),(365,0.91,'2024-11-12 06:12:29',1,5),(366,0.29,'2024-11-12 06:12:29',1,6),(367,0.01,'2024-11-12 06:12:29',1,7),(368,21.99,'2024-11-12 06:12:29',1,8),(369,11.35,'2024-11-12 06:13:50',1,1),(370,11.98,'2024-11-12 06:13:50',1,2),(371,11.23,'2024-11-12 06:13:50',1,3),(372,127.55,'2024-11-12 06:13:50',1,4),(373,10.05,'2024-11-12 06:13:50',1,5),(374,20.35,'2024-11-12 06:13:50',1,6),(375,21.78,'2024-11-12 06:13:50',1,7),(376,21.99,'2024-11-12 06:13:50',1,8),(377,11.35,'2024-11-12 06:18:29',1,1),(378,11.98,'2024-11-12 06:18:29',1,2),(379,11.23,'2024-11-12 06:18:29',1,3),(380,127.55,'2024-11-12 06:18:29',1,4),(381,10.05,'2024-11-12 06:18:29',1,5),(382,20.35,'2024-11-12 06:18:29',1,6),(383,21.78,'2024-11-12 06:18:29',1,7),(384,21.99,'2024-11-12 06:18:29',1,8),(385,5.05,'2024-11-12 06:18:40',1,1),(386,11.98,'2024-11-12 06:18:40',1,2),(387,11.23,'2024-11-12 06:18:40',1,3),(388,127.55,'2024-11-12 06:18:40',1,4),(389,10.05,'2024-11-12 06:18:40',1,5),(390,20.35,'2024-11-12 06:18:40',1,6),(391,21.78,'2024-11-12 06:18:40',1,7),(392,21.99,'2024-11-12 06:18:40',1,8),(393,5.05,'2024-11-12 06:21:46',1,1),(394,11.98,'2024-11-12 06:21:46',1,2),(395,11.23,'2024-11-12 06:21:46',1,3),(396,127.55,'2024-11-12 06:21:46',1,4),(397,10.05,'2024-11-12 06:21:46',1,5),(398,20.35,'2024-11-12 06:21:46',1,6),(399,21.78,'2024-11-12 06:21:46',1,7),(400,21.99,'2024-11-12 06:21:46',1,8),(401,5.05,'2024-11-12 06:22:16',1,1),(402,11.98,'2024-11-12 06:22:16',1,2),(403,11.23,'2024-11-12 06:22:16',1,3),(404,127.55,'2024-11-12 06:22:16',1,4),(405,10.05,'2024-11-12 06:22:16',1,5),(406,20.35,'2024-11-12 06:22:16',1,6),(407,21.78,'2024-11-12 06:22:16',1,7),(408,21.99,'2024-11-12 06:22:16',1,8),(409,5.05,'2024-11-12 06:23:46',1,1),(410,11.98,'2024-11-12 06:23:46',1,2),(411,11.23,'2024-11-12 06:23:46',1,3),(412,127.55,'2024-11-12 06:23:46',1,4),(413,10.05,'2024-11-12 06:23:46',1,5),(414,20.35,'2024-11-12 06:23:46',1,6),(415,21.78,'2024-11-12 06:23:46',1,7),(416,21.99,'2024-11-12 06:23:46',1,8),(417,11.35,'2024-11-12 06:23:56',1,1),(418,11.98,'2024-11-12 06:23:56',1,2),(419,11.23,'2024-11-12 06:23:56',1,3),(420,127.55,'2024-11-12 06:23:56',1,4),(421,10.05,'2024-11-12 06:23:56',1,5),(422,20.35,'2024-11-12 06:23:56',1,6),(423,21.78,'2024-11-12 06:23:56',1,7),(424,21.99,'2024-11-12 06:23:56',1,8),(425,11.35,'2024-11-12 06:24:54',1,1),(426,11.98,'2024-11-12 06:24:54',1,2),(427,11.23,'2024-11-12 06:24:54',1,3),(428,127.55,'2024-11-12 06:24:54',1,4),(429,10.05,'2024-11-12 06:24:54',1,5),(430,20.35,'2024-11-12 06:24:54',1,6),(431,21.78,'2024-11-12 06:24:54',1,7),(432,21.99,'2024-11-12 06:24:54',1,8),(433,5.05,'2024-11-12 06:25:04',1,1),(434,11.98,'2024-11-12 06:25:04',1,2),(435,11.23,'2024-11-12 06:25:04',1,3),(436,127.55,'2024-11-12 06:25:04',1,4),(437,10.05,'2024-11-12 06:25:04',1,5),(438,20.35,'2024-11-12 06:25:04',1,6),(439,21.78,'2024-11-12 06:25:04',1,7),(440,21.99,'2024-11-12 06:25:04',1,8);
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
  UNIQUE KEY `unique_regla_tipo` (`id_regla`,`id_tipo_medicion`),
  KEY `id_tipo_medicion` (`id_tipo_medicion`),
  CONSTRAINT `parametros_medicion_ibfk_1` FOREIGN KEY (`id_tipo_medicion`) REFERENCES `tipos_medicion` (`id`),
  CONSTRAINT `parametros_medicion_ibfk_2` FOREIGN KEY (`id_regla`) REFERENCES `reglas_medicion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_medicion`
--

LOCK TABLES `parametros_medicion` WRITE;
/*!40000 ALTER TABLE `parametros_medicion` DISABLE KEYS */;
INSERT INTO `parametros_medicion` VALUES (1,1,1,10.00,11.00,12.00),(2,1,2,10.00,11.00,12.00),(3,1,3,10.00,11.00,12.00),(4,1,4,100.00,120.00,140.00),(5,1,5,10.00,11.00,12.00),(6,1,6,16.00,20.00,30.00),(7,1,7,16.00,20.00,30.00),(8,1,8,0.00,25.00,45.00),(17,2,1,11.00,12.00,13.00),(18,2,2,11.00,12.00,13.00),(19,2,3,101.00,121.00,141.00),(20,2,4,11.00,12.00,13.00),(21,2,5,11.00,12.00,13.00),(22,2,6,17.00,21.00,31.00),(23,2,7,17.00,21.00,31.00),(24,2,8,1.00,26.00,46.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas_medicion`
--

LOCK TABLES `reglas_medicion` WRITE;
/*!40000 ALTER TABLE `reglas_medicion` DISABLE KEYS */;
INSERT INTO `reglas_medicion` VALUES (1,'GENERAL'),(2,'Regla_2');
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

-- Dump completed on 2024-11-17  0:26:00
