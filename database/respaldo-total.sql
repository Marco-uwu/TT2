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
-- Current Database: `estaciones_carga`
--

/*!40000 DROP DATABASE IF EXISTS `estaciones_carga`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `estaciones_carga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `estaciones_carga`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$KYzcXdHaQw7pRR1fvevxiy$Pz0dQHZUxyf39FJ8Agqu4GXLKlbzV4XUbLZtxISAyLw=','2024-11-29 20:20:22',1,'admin','','','admin@example.com',1,1,'2024-11-17 06:32:42'),(7,'pbkdf2_sha256$600000$ECfN8ihyWQYjj9T5AEhilw$GsW26sI8hwXeh+2StksXk/jmF/cD+oP2zxIomcxd2OQ=',NULL,0,'user_prueba','','','example@example.com',0,1,'2024-11-18 22:02:58'),(8,'pbkdf2_sha256$600000$jgnSos2mo3w8tclzBqRkCb$Gore+q0X/SHkBDdWho4oESaAFMw4sTavNhD7NPwSKag=','2024-11-28 06:13:24',0,'nuevo','','','nuevo@prueba.com',0,1,'2024-11-26 21:30:27'),(9,'pbkdf2_sha256$600000$eSRuoPSIf26oMh9BxlKjZc$mh8aDNyZLinMqjFU8NodFmJej6is8vbkY2QJUNe0l7A=','2024-12-05 06:15:49',0,'administrador','','','administrador@admin.com',0,1,'2024-11-28 06:14:34'),(10,'pbkdf2_sha256$600000$G5QhWBptXIpXisBON5ssS3$9Tw+Awy6/C/yy5U3uVVG6FlqR8yuq+RZ0zs+eRYg/wc=','2024-11-28 06:39:05',0,'cliente','','','cliente@cliente.com',0,1,'2024-11-28 06:15:25');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` tinyint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_id` (`content_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-17 07:34:40','3','prueba',1,'[{\"added\": {}}]',2,1),(2,'2024-11-17 07:47:25','3','prueba',2,'[{\"changed\": {\"fields\": [\"user_type\"]}}]',2,1),(3,'2024-11-17 07:47:59','1','prueba - Cliente',2,'[{\"changed\": {\"fields\": [\"User type\"]}}]',3,1),(4,'2024-11-18 21:46:41','3','prueba',2,'[{\"changed\": {\"fields\": [\"user_type\"]}}]',2,1),(5,'2024-11-18 21:52:42','3','prueba',3,'',2,1),(6,'2024-11-18 22:02:59','7','user_prueba',1,'[{\"added\": {}}]',2,1),(7,'2024-11-18 22:03:27','5','user_prueba - Administrador',2,'[{\"changed\": {\"fields\": [\"User type\"]}}]',3,1),(8,'2024-11-26 21:30:28','8','nuevo',1,'[{\"added\": {}}]',2,1),(9,'2024-11-26 21:43:52','6','nuevo - Cliente',2,'[{\"changed\": {\"fields\": [\"User type\"]}}]',3,1),(10,'2024-11-28 06:14:34','9','administrador',1,'[{\"added\": {}}]',2,1),(11,'2024-11-28 06:14:56','7','administrador - Administrador',2,'[{\"changed\": {\"fields\": [\"User type\"]}}]',3,1),(12,'2024-11-28 06:15:26','10','cliente',1,'[{\"added\": {}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'auth','group'),(2,'auth','user'),(1,'inicio','estaciones'),(3,'inicio','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00dldaqtzv92bwdpfs2vvrjw5j0wp2t8','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIBdp:XmcFZUzBluOU6Kh8Sd2hLmAZOJ6WDJQGzEY5ocS6v18','2024-12-16 18:59:29'),('0vjwzql1jrs9arbtxwp92d75pt2y0m06','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHxBK:9Y48np-_PWLpfZjCOG2CKU_Z89rvd35S3nyxxoCMjCQ','2024-12-16 03:33:07'),('17x2j1at964j67wmhdwys8odehixxh1v','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tI9nC:CZ1Z6eDwwsQE6ab3QbHsppFb_nJnfTktkCRtTRtqpPQ','2024-12-16 17:01:03'),('1k9rkohohjuz2rb8gzlx0ypbsu2kg0ab','.eJyrVorPTS0uTkxPLVayUoqOjlGKj88qzs-DicYo6SgY6CgYmeooxCj5Zyu4FpckJmfm5ym4Bjv7-4JkY5RilGJ1FOivM1apFgDsczlE:1tF2e7:g4mX1jzHAsjiUzIpl49qEwZTMw5FwXBO-YSJIC211Zg','2024-12-08 02:46:48'),('2loezklcdonp6yl9uwau7to7wubjuz8i','.eJxVjEEOwiAQRe_C2hBgoEWX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7e2mhUMgNF7G4EcGM8qW2eYHeYcEUibEZLJ1pAakRDBQULGsxpAR_H-AOM6ODk:1tD91S:a9vdk7CaqDaONKMt_4lI--suBv5vx77oWOEeS_ghA4I','2024-12-02 21:11:02'),('2o8ycwfu0qv5oup5g4l3lpw836rnx9sg','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tH6nS:tYUkqKvO455u1XzD523lkG54c8K0v3-GHe9v1RmvzhA','2024-12-13 19:36:58'),('372ou6h3bqtr9zjodjwclpujsc1tujtw','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tGZRk:LZHXLGc8fw-kj9tH_dVgHfffZYH8QM4K7pyTqqOvnPw','2024-12-12 08:00:20'),('3k7wsfdekju02toz8r4grlr9fna4afzu','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tH6PB:HZKSBhePuZ0eBS7YNIKuaYP7s5qxaNnjvMjACNnNeh4','2024-12-13 19:11:54'),('52l488i4yc4upckdvf3jkbuvvkwsgy44','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHwkc:sR-l_6iQmrt8QMac4kkRF0mI_2ZWgNQK8Me7-LYxEIw','2024-12-16 03:05:30'),('5886cualr6d7faac8zsbbuf9vdn347i5','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHzS2:qylfHXtbym6ejJ9rsHJmFl-ony1O8pVAxPxbVyHijwk','2024-12-16 05:58:30'),('6c2fjxt054a11amnidnnvckijredxmbv','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tJ59Q:YrH6hhSQJN7DL7TPmQVjpm7O3JpIwLVzKBtrCI_RFbM','2024-12-19 06:15:49'),('6hrl9stzmy7uisp2l5gyxy9jz12qf16d','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHwPj:0Jolk5YZ5Un0gO_6RIqS-oeRQgCb03iTquPwDmuuuJ4','2024-12-16 02:43:56'),('76brbroanhuf27abcv82lm2nmkbiocwa','.eJxVjEEOwiAQRe_C2hBgoEWX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7e2mhUMgNF7G4EcGM8qW2eYHeYcEUibEZLJ1pAakRDBQULGsxpAR_H-AOM6ODk:1tDFoI:HgZtxVtfEg-ZOjSiURbkgylSb-zSkT5PzzSB-GqYXdQ','2024-12-03 04:25:55'),('7kbcjvjvxmggzz9tc6xu43w4xi07lh3q','.eJxVjEEOgjAQRe_StWmgTsvUpXvOQGamHUFNSSisjHdXEha6_e-9_zIDbes4bDUvw5TMxaA5_W5M8shlB-lO5TZbmcu6TGx3xR602n5O-Xk93L-Dker4rbN0HjvuEKRVdI02QDHE4Am8KkCURqNCdMKYOSEHCsBwdozgQVvz_gDiIDfI:1tGXlb:jjprTRquKB4fGwIJkEZ14aMSRwNpTSkRbQtDBUEz8mw','2024-12-12 06:12:44'),('8d709mjuv5ww2w2qhii4iaz98l2ovtyp','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tI9oR:blcNeayi2VRRp_bz2ciJSTPhNWcgPIkS_HZPCKJjVHQ','2024-12-16 17:02:19'),('95vrumom20tf61wmeivl211zvl319hzp','.eJxVjEEOwiAQRe_C2hBgoEWX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7e2mhUMgNF7G4EcGM8qW2eYHeYcEUibEZLJ1pAakRDBQULGsxpAR_H-AOM6ODk:1tCaIR:SBOL8fH8VNBOqY8VmkWcJZ0VB3OxhA0P-tPsZld_CIk','2024-12-01 08:06:15'),('99yu9pveg3gmjdrbt1pqhgf64kiywqta','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tGZ8v:_QDS-uOCBsXbD34ztjzSEP6E9MpOKUH7eXbIfqBQttw','2024-12-12 07:40:54'),('afce58xn5astf0tekgmnc6b6lzycppqd','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIJmv:t7zl-NDjercLfhZZI14R_hYQ4pXBP_t07Qrx8djQXq8','2024-12-17 03:41:25'),('atgwbn2wb73ajgxzefv5ruwwh09ka71z','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIC8H:G8FNaBJzQugJsQ9oQ3hm5mV8YBx14PvsxYoU0cnaBdA','2024-12-16 19:30:57'),('bcstgbrw4bkofik88yj1wwdtzhq69h1g','.eJxVjEEOgjAQRe_StWmgTsvUpXvOQGamHUFNSSisjHdXEha6_e-9_zIDbes4bDUvw5TMxaA5_W5M8shlB-lO5TZbmcu6TGx3xR602n5O-Xk93L-Dker4rbN0HjvuEKRVdI02QDHE4Am8KkCURqNCdMKYOSEHCsBwdozgQVvz_gDiIDfI:1tGXjw:p3i09tXX_dMl5jotKOKMNJTDpZeI1XRATQxptau2tWo','2024-12-12 06:11:01'),('cmxnwtcbm8der79x9ydtr2swceungrfr','eyJfbWVzc2FnZXMiOiJbW1wiX19qc29uX21lc3NhZ2VcIiwgMCwgMjUsIFwiT2sgRXN0YWNpb24gRVNDT01cIiwgXCJcIl1dIn0:1tF2Wb:JsldJt7hu7WKYdgXPNvA8peVgyEVFS-abUbGAkBHvrE','2024-12-08 02:39:02'),('cscm2pno9p3m7t47skq1nccnkq368nnn','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tJ59R:CdCJV-19MzdlStud6tHqnI8Vq2b5M2IlUnhaUwJ17aE','2024-12-19 06:15:49'),('e8anzx288t37ydmcje3wvqghthv3mjxd','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIZDc:BZwBzqZJFWtyuMe2_1dQ5k8ae0X84qO_mo7hiDaPo9g','2024-12-17 20:10:01'),('f810ibwyzr1ml19qram32p0uf9owaokn','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHwLe:6gJKc15QQZnxxIctbmaMBLZFtCsqAJeqCrxs2srjkSQ','2024-12-16 02:39:43'),('fz0vahifcg2p48azqtfxw1i5l63qzcvc','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHvo3:MClrMeRASAbOOqpO_Cp5k3Zr467_BKE8Nt-xMM862Ss','2024-12-16 02:04:59'),('jjj3hbey5ncagf0uy7sy0vkqb7t3heh4','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIYwJ:MnLSHwAjFgfz0enbpW1XwZSmJm75SizMbCFHH-_uRbQ','2024-12-17 19:52:08'),('jndcgbtdh5i09ieqocetd1zuxg5vv5sd','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tGZCn:ZkiGr0sWcI6Y7I4me96DoYHZ9J1dFzw3hk2_dozjVgg','2024-12-12 07:44:53'),('kk8y8exe8pt3366ft68re5tt8hdht8fq','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tH7U7:lxd9u_MsU9AQIjIrCGlR5Bcgddew7SIJd6_d3xBVj5A','2024-12-13 20:21:04'),('lvie81fzadta6at86p8iwwvratxmrwi9','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tH6kP:U-cAPSOQqOvwAwbZZOFkgArbY_6UqB6R1_bS4-Tn5ps','2024-12-13 19:33:50'),('m8pvg8vn9lhmhplloq3a2jc7aj56e1i5','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tHvw6:XRC-9-dzlpXQL4JuGO94nnauOAyrQGPio37o8N_-qu4','2024-12-16 02:13:19'),('mfgwzi6ilmb6tnule5d353vjwwc6vu09','.eJxVjEEOwiAQRe_C2hBgoEWX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7e2mhUMgNF7G4EcGM8qW2eYHeYcEUibEZLJ1pAakRDBQULGsxpAR_H-AOM6ODk:1tG3Lc:HotEiLKZU92VLv2fDwkulpPWmXEHVoR-iYibRh0gyro','2024-12-10 21:43:52'),('mq3h6vzbva5xy9etvlny4wvi0uqarxje','.eJxVjEEOgjAQRe_StWmgTsvUpXvOQGamHUFNSSisjHdXEha6_e-9_zIDbes4bDUvw5TMxaA5_W5M8shlB-lO5TZbmcu6TGx3xR602n5O-Xk93L-Dker4rbN0HjvuEKRVdI02QDHE4Am8KkCURqNCdMKYOSEHCsBwdozgQVvz_gDiIDfI:1tG3QZ:WIUmZABxGWzC6AdtOrZ7hE4u3Yv2Wb_5tQWTYwlCBf0','2024-12-10 21:49:00'),('nq3i82558yi8zxuv7175d7o2ralu7809','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tGZT2:-KRlllFU7yaQOKLE1Y4rlDLew0DDXsw1K6yPoSZVhjE','2024-12-12 08:01:41'),('p52v6m3fw14u8y0e82hqh01lfodo4loz','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIB2i:dKHRaYwaV0Zn7hRLpFAmdq1YLPwgDjzEKy8WioO9-jI','2024-12-16 18:21:09'),('p75b3bnagz9o2z0dp1xj99pcc7mwj0ue','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tICDX:gwaXqtXtRLGJXCJ_pr0YNEIQ1rDVfY0WCbvvnX_YgZY','2024-12-16 19:36:23'),('phvuk88tdxc8ixt94kxmpnrbvelro2v2','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tGXoX:MsarbSzqdcCcvtpSclbdzkCFcnX1tste-iQZ3iF-w1M','2024-12-12 06:15:46'),('q4xs6xehxbw1vcunc58mfw38zrzxpcnz','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tGYAn:HY-8Fo0CZNx4ooD1507z52SiSdXp3qFKOjR2hhbVFlI','2024-12-12 06:38:45'),('ricywdjbtlxf410gwasb8yo91gs6s9wc','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIYM5:UdPuKLiU7lQLjztPZifIATwepcrHU4UU-v9YzxSKKr0','2024-12-17 19:14:42'),('veri9un377uk17569foo7wua990p6knk','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tIYQh:UijFXnflAGGDEiEFTF6EB5wQ-D5ULcvaBIviDwmeZkM','2024-12-17 19:19:28'),('w6vm1ijeieje1i4fwyx04swxwshad3ws','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tI9v1:O9Wjz9MJDdH53WWVmqroo2vi7FwSKMjk25h-52zueT8','2024-12-16 17:09:07'),('xjz970z1go8bdgzy80eyey5u6n31x724','.eJxVjDsOwjAQBe_iGllZf7BNSZ8zWLveFQ4gR8qnQtwdLKWAdmbee6mM-1bzvsqSJ1YXldTplxGWh7Qu-I7tNusyt22ZSPdEH3bV48zyvB7t30HFtfa1jc5LJIl8Th4xDWIdhAQk4MgxOZBgAlr40sAejUVbhoEImMWAen8A4TI3vw:1tILRL:RNso7z7AguGoxwH1wkc-keY779BOrAOqWcP3BQ7lJ5k','2024-12-17 05:27:16'),('zc7muxepvjqr3gtky9iv3je3y0e7h22v','.eJxVjEEOgjAQRe_StWmgTsvUpXvOQGamHUFNSSisjHdXEha6_e-9_zIDbes4bDUvw5TMxaA5_W5M8shlB-lO5TZbmcu6TGx3xR602n5O-Xk93L-Dker4rbN0HjvuEKRVdI02QDHE4Am8KkCURqNCdMKYOSEHCsBwdozgQVvz_gDiIDfI:1tGWkX:7oZXVfpTM9rjPrEQ2cB4haenpoCp1GqQeBOulMMXwwQ','2024-12-12 05:07:34'),('zciekftghs9ajr24fv9bov5j79rfa2cs','.eJxVjEEOwiAQRe_C2hBgoEWX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7e2mhUMgNF7G4EcGM8qW2eYHeYcEUibEZLJ1pAakRDBQULGsxpAR_H-AOM6ODk:1tCYup:NFFVz_fpLPixMf6sSbb1W7DVlc__w8BhNpK7F5yhm0g','2024-12-01 06:37:47');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
  `id_tarifa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dir_mac` (`dir_mac`),
  KEY `id_regla` (`id_regla`),
  KEY `fk_tarifa` (`id_tarifa`),
  CONSTRAINT `estaciones_ibfk_1` FOREIGN KEY (`id_regla`) REFERENCES `reglas_medicion` (`id`),
  CONSTRAINT `fk_tarifa` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES (1,1,'Estacion ESCOM','https://maps.app.goo.gl/unj27d9cYA1ng7r59','Disponible','RTQ1RjAxN0Y5NjAz',1),(2,1,'Estacion ESIME','https://maps.app.goo.gl/jKLh46eTctsxe6ng8','Fuera de servicio','NjQ1RDg2MUREMTdC',1),(3,1,'Estación ESIA','https://maps.app.goo.gl/8JNuRnLcUaUNcR4X7','No disponible','NjQ1RDg2MUREMTdX',1),(4,1,'Estacion ESCA','https://maps.app.goo.gl/C8gFh3uWF1U4q57U9','Fuera de servicio','RTQ1RjAxN0Y5NjAy',1);
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inicio_userprofile`
--

DROP TABLE IF EXISTS `inicio_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inicio_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inicio_userprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inicio_userprofile`
--

LOCK TABLES `inicio_userprofile` WRITE;
/*!40000 ALTER TABLE `inicio_userprofile` DISABLE KEYS */;
INSERT INTO `inicio_userprofile` VALUES (5,7,'admin'),(6,8,'client'),(7,9,'admin'),(8,10,'client');
/*!40000 ALTER TABLE `inicio_userprofile` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediciones`
--

LOCK TABLES `mediciones` WRITE;
/*!40000 ALTER TABLE `mediciones` DISABLE KEYS */;
INSERT INTO `mediciones` VALUES (1,220.50,'2024-11-11 04:38:38',1,1),(2,221.00,'2024-11-11 04:38:38',1,2),(3,219.80,'2024-11-11 04:38:38',1,3),(4,220.20,'2024-11-11 04:38:38',1,4),(5,220.70,'2024-11-11 04:38:38',1,5),(6,10.50,'2024-11-11 04:38:38',1,6),(7,10.70,'2024-11-11 04:38:38',1,7),(8,25.30,'2024-11-11 04:38:38',1,8),(9,0.06,'2024-11-11 04:47:17',1,1),(10,0.06,'2024-11-11 04:47:17',1,2),(11,10.37,'2024-11-11 04:47:17',1,3),(12,127.50,'2024-11-11 04:47:17',1,4),(13,0.91,'2024-11-11 04:47:17',1,5),(14,0.29,'2024-11-11 04:47:17',1,6),(15,0.01,'2024-11-11 04:47:17',1,7),(16,21.99,'2024-11-11 04:47:17',1,8),(17,0.06,'2024-11-11 04:48:40',1,1),(18,0.06,'2024-11-11 04:48:40',1,2),(19,10.37,'2024-11-11 04:48:40',1,3),(20,127.50,'2024-11-11 04:48:40',1,4),(21,0.91,'2024-11-11 04:48:40',1,5),(22,0.29,'2024-11-11 04:48:40',1,6),(23,0.01,'2024-11-11 04:48:41',1,7),(24,21.99,'2024-11-11 04:48:41',1,8),(25,0.06,'2024-11-12 02:48:46',1,1),(26,0.06,'2024-11-12 02:48:46',1,2),(27,10.37,'2024-11-12 02:48:46',1,3),(28,127.50,'2024-11-12 02:48:46',1,4),(29,0.91,'2024-11-12 02:48:46',1,5),(30,0.29,'2024-11-12 02:48:46',1,6),(31,0.01,'2024-11-12 02:48:46',1,7),(32,21.99,'2024-11-12 02:48:46',1,8),(33,0.06,'2024-11-12 02:52:02',1,1),(34,0.06,'2024-11-12 02:52:02',1,2),(35,10.37,'2024-11-12 02:52:02',1,3),(36,127.50,'2024-11-12 02:52:02',1,4),(37,0.91,'2024-11-12 02:52:02',1,5),(38,0.29,'2024-11-12 02:52:02',1,6),(39,0.01,'2024-11-12 02:52:02',1,7),(40,21.99,'2024-11-12 02:52:02',1,8),(41,0.06,'2024-11-12 02:54:17',1,1),(42,0.06,'2024-11-12 02:54:17',1,2),(43,10.37,'2024-11-12 02:54:17',1,3),(44,127.50,'2024-11-12 02:54:17',1,4),(45,0.91,'2024-11-12 02:54:17',1,5),(46,0.29,'2024-11-12 02:54:17',1,6),(47,0.01,'2024-11-12 02:54:17',1,7),(48,21.99,'2024-11-12 02:54:17',1,8),(49,0.06,'2024-11-12 02:56:57',1,1),(50,0.06,'2024-11-12 02:56:57',1,2),(51,10.37,'2024-11-12 02:56:57',1,3),(52,127.50,'2024-11-12 02:56:57',1,4),(53,0.91,'2024-11-12 02:56:57',1,5),(54,0.29,'2024-11-12 02:56:57',1,6),(55,0.01,'2024-11-12 02:56:57',1,7),(56,21.99,'2024-11-12 02:56:57',1,8),(57,0.06,'2024-11-12 02:58:03',1,1),(58,0.06,'2024-11-12 02:58:03',1,2),(59,10.37,'2024-11-12 02:58:03',1,3),(60,127.50,'2024-11-12 02:58:03',1,4),(61,0.91,'2024-11-12 02:58:03',1,5),(62,0.29,'2024-11-12 02:58:03',1,6),(63,0.01,'2024-11-12 02:58:03',1,7),(64,21.99,'2024-11-12 02:58:03',1,8),(65,0.06,'2024-11-12 03:00:19',1,1),(66,0.06,'2024-11-12 03:00:19',1,2),(67,10.37,'2024-11-12 03:00:19',1,3),(68,127.50,'2024-11-12 03:00:19',1,4),(69,0.91,'2024-11-12 03:00:19',1,5),(70,0.29,'2024-11-12 03:00:19',1,6),(71,0.01,'2024-11-12 03:00:19',1,7),(72,21.99,'2024-11-12 03:00:19',1,8),(73,0.06,'2024-11-12 03:01:54',1,1),(74,0.06,'2024-11-12 03:01:54',1,2),(75,10.37,'2024-11-12 03:01:54',1,3),(76,127.50,'2024-11-12 03:01:54',1,4),(77,0.91,'2024-11-12 03:01:54',1,5),(78,0.29,'2024-11-12 03:01:54',1,6),(79,0.01,'2024-11-12 03:01:54',1,7),(80,21.99,'2024-11-12 03:01:54',1,8),(81,0.06,'2024-11-12 03:02:10',1,1),(82,0.06,'2024-11-12 03:02:10',1,2),(83,10.37,'2024-11-12 03:02:10',1,3),(84,127.50,'2024-11-12 03:02:10',1,4),(85,0.91,'2024-11-12 03:02:10',1,5),(86,0.29,'2024-11-12 03:02:10',1,6),(87,0.01,'2024-11-12 03:02:10',1,7),(88,21.99,'2024-11-12 03:02:10',1,8),(89,0.06,'2024-11-12 03:02:22',1,1),(90,0.06,'2024-11-12 03:02:23',1,2),(91,10.37,'2024-11-12 03:02:23',1,3),(92,127.50,'2024-11-12 03:02:23',1,4),(93,0.91,'2024-11-12 03:02:23',1,5),(94,0.29,'2024-11-12 03:02:23',1,6),(95,0.01,'2024-11-12 03:02:23',1,7),(96,21.99,'2024-11-12 03:02:23',1,8),(97,0.06,'2024-11-12 03:02:43',1,1),(98,0.06,'2024-11-12 03:02:43',1,2),(99,10.37,'2024-11-12 03:02:43',1,3),(100,127.50,'2024-11-12 03:02:43',1,4),(101,0.91,'2024-11-12 03:02:43',1,5),(102,0.29,'2024-11-12 03:02:43',1,6),(103,0.01,'2024-11-12 03:02:43',1,7),(104,21.99,'2024-11-12 03:02:43',1,8),(105,0.06,'2024-11-12 03:03:17',1,1),(106,0.06,'2024-11-12 03:03:17',1,2),(107,10.37,'2024-11-12 03:03:17',1,3),(108,127.50,'2024-11-12 03:03:17',1,4),(109,0.91,'2024-11-12 03:03:17',1,5),(110,0.29,'2024-11-12 03:03:17',1,6),(111,0.01,'2024-11-12 03:03:17',1,7),(112,21.99,'2024-11-12 03:03:17',1,8),(113,0.06,'2024-11-12 03:05:00',1,1),(114,0.06,'2024-11-12 03:05:00',1,2),(115,10.37,'2024-11-12 03:05:00',1,3),(116,127.50,'2024-11-12 03:05:00',1,4),(117,0.91,'2024-11-12 03:05:00',1,5),(118,0.29,'2024-11-12 03:05:00',1,6),(119,0.01,'2024-11-12 03:05:00',1,7),(120,21.99,'2024-11-12 03:05:00',1,8),(121,0.06,'2024-11-12 03:07:33',1,1),(122,0.06,'2024-11-12 03:07:33',1,2),(123,10.37,'2024-11-12 03:07:33',1,3),(124,127.50,'2024-11-12 03:07:33',1,4),(125,0.91,'2024-11-12 03:07:33',1,5),(126,0.29,'2024-11-12 03:07:33',1,6),(127,0.01,'2024-11-12 03:07:33',1,7),(128,21.99,'2024-11-12 03:07:33',1,8),(129,0.06,'2024-11-12 03:27:01',1,1),(130,0.06,'2024-11-12 03:27:01',1,2),(131,10.37,'2024-11-12 03:27:01',1,3),(132,127.50,'2024-11-12 03:27:01',1,4),(133,0.91,'2024-11-12 03:27:01',1,5),(134,0.29,'2024-11-12 03:27:01',1,6),(135,0.01,'2024-11-12 03:27:01',1,7),(136,21.99,'2024-11-12 03:27:01',1,8),(137,0.06,'2024-11-12 03:30:06',1,1),(138,0.06,'2024-11-12 03:30:06',1,2),(139,10.37,'2024-11-12 03:30:06',1,3),(140,127.50,'2024-11-12 03:30:06',1,4),(141,0.91,'2024-11-12 03:30:06',1,5),(142,0.29,'2024-11-12 03:30:06',1,6),(143,0.01,'2024-11-12 03:30:06',1,7),(144,21.99,'2024-11-12 03:30:06',1,8),(145,0.06,'2024-11-12 03:56:42',1,1),(146,0.06,'2024-11-12 03:56:42',1,2),(147,10.37,'2024-11-12 03:56:42',1,3),(148,127.50,'2024-11-12 03:56:42',1,4),(149,0.91,'2024-11-12 03:56:43',1,5),(150,0.29,'2024-11-12 03:56:43',1,6),(151,0.01,'2024-11-12 03:56:43',1,7),(152,21.99,'2024-11-12 03:56:43',1,8),(153,0.06,'2024-11-12 03:59:13',1,1),(154,0.06,'2024-11-12 03:59:13',1,2),(155,10.37,'2024-11-12 03:59:13',1,3),(156,127.50,'2024-11-12 03:59:13',1,4),(157,0.91,'2024-11-12 03:59:13',1,5),(158,0.29,'2024-11-12 03:59:13',1,6),(159,0.01,'2024-11-12 03:59:13',1,7),(160,21.99,'2024-11-12 03:59:13',1,8),(161,0.06,'2024-11-12 04:04:43',1,1),(162,0.06,'2024-11-12 04:04:43',1,2),(163,10.37,'2024-11-12 04:04:43',1,3),(164,127.50,'2024-11-12 04:04:43',1,4),(165,0.91,'2024-11-12 04:04:43',1,5),(166,0.29,'2024-11-12 04:04:43',1,6),(167,0.01,'2024-11-12 04:04:43',1,7),(168,21.99,'2024-11-12 04:04:43',1,8),(169,0.06,'2024-11-12 04:13:14',1,1),(170,0.06,'2024-11-12 04:13:14',1,2),(171,10.37,'2024-11-12 04:13:14',1,3),(172,127.50,'2024-11-12 04:13:14',1,4),(173,0.91,'2024-11-12 04:13:14',1,5),(174,0.29,'2024-11-12 04:13:14',1,6),(175,0.01,'2024-11-12 04:13:14',1,7),(176,21.99,'2024-11-12 04:13:14',1,8),(177,0.06,'2024-11-12 04:14:15',1,1),(178,0.06,'2024-11-12 04:14:15',1,2),(179,10.37,'2024-11-12 04:14:15',1,3),(180,127.50,'2024-11-12 04:14:15',1,4),(181,0.91,'2024-11-12 04:14:15',1,5),(182,0.29,'2024-11-12 04:14:15',1,6),(183,0.01,'2024-11-12 04:14:15',1,7),(184,21.99,'2024-11-12 04:14:15',1,8),(185,0.06,'2024-11-12 04:14:23',1,1),(186,0.06,'2024-11-12 04:14:23',1,2),(187,10.37,'2024-11-12 04:14:23',1,3),(188,127.50,'2024-11-12 04:14:23',1,4),(189,0.91,'2024-11-12 04:14:23',1,5),(190,0.29,'2024-11-12 04:14:23',1,6),(191,0.01,'2024-11-12 04:14:23',1,7),(192,21.99,'2024-11-12 04:14:23',1,8),(193,0.06,'2024-11-12 04:16:49',1,1),(194,0.06,'2024-11-12 04:16:49',1,2),(195,10.37,'2024-11-12 04:16:49',1,3),(196,127.50,'2024-11-12 04:16:49',1,4),(197,0.91,'2024-11-12 04:16:49',1,5),(198,0.29,'2024-11-12 04:16:49',1,6),(199,0.01,'2024-11-12 04:16:49',1,7),(200,21.99,'2024-11-12 04:16:49',1,8),(201,0.06,'2024-11-12 04:19:39',1,1),(202,0.06,'2024-11-12 04:19:39',1,2),(203,10.37,'2024-11-12 04:19:39',1,3),(204,127.50,'2024-11-12 04:19:39',1,4),(205,0.91,'2024-11-12 04:19:39',1,5),(206,0.29,'2024-11-12 04:19:39',1,6),(207,0.01,'2024-11-12 04:19:39',1,7),(208,21.99,'2024-11-12 04:19:39',1,8),(209,0.06,'2024-11-12 04:23:16',1,1),(210,0.06,'2024-11-12 04:23:16',1,2),(211,10.37,'2024-11-12 04:23:16',1,3),(212,127.50,'2024-11-12 04:23:16',1,4),(213,0.91,'2024-11-12 04:23:16',1,5),(214,0.29,'2024-11-12 04:23:16',1,6),(215,0.01,'2024-11-12 04:23:16',1,7),(216,21.99,'2024-11-12 04:23:16',1,8),(217,0.06,'2024-11-12 04:23:23',1,1),(218,0.06,'2024-11-12 04:23:23',1,2),(219,10.37,'2024-11-12 04:23:23',1,3),(220,127.50,'2024-11-12 04:23:23',1,4),(221,0.91,'2024-11-12 04:23:23',1,5),(222,0.29,'2024-11-12 04:23:23',1,6),(223,0.01,'2024-11-12 04:23:23',1,7),(224,21.99,'2024-11-12 04:23:23',1,8),(225,0.06,'2024-11-12 04:26:22',1,1),(226,0.06,'2024-11-12 04:26:22',1,2),(227,10.37,'2024-11-12 04:26:22',1,3),(228,127.50,'2024-11-12 04:26:22',1,4),(229,0.91,'2024-11-12 04:26:22',1,5),(230,0.29,'2024-11-12 04:26:22',1,6),(231,0.01,'2024-11-12 04:26:22',1,7),(232,21.99,'2024-11-12 04:26:22',1,8),(233,0.06,'2024-11-12 04:26:32',1,1),(234,0.06,'2024-11-12 04:26:32',1,2),(235,10.37,'2024-11-12 04:26:32',1,3),(236,127.50,'2024-11-12 04:26:32',1,4),(237,0.91,'2024-11-12 04:26:32',1,5),(238,0.29,'2024-11-12 04:26:32',1,6),(239,0.01,'2024-11-12 04:26:32',1,7),(240,21.99,'2024-11-12 04:26:32',1,8),(241,0.06,'2024-11-12 04:39:56',1,1),(242,0.06,'2024-11-12 04:39:56',1,2),(243,10.37,'2024-11-12 04:39:56',1,3),(244,127.50,'2024-11-12 04:39:56',1,4),(245,0.91,'2024-11-12 04:39:56',1,5),(246,0.29,'2024-11-12 04:39:56',1,6),(247,0.01,'2024-11-12 04:39:56',1,7),(248,21.99,'2024-11-12 04:39:56',1,8),(249,0.06,'2024-11-12 04:41:21',1,1),(250,0.06,'2024-11-12 04:41:21',1,2),(251,10.37,'2024-11-12 04:41:21',1,3),(252,127.50,'2024-11-12 04:41:21',1,4),(253,0.91,'2024-11-12 04:41:21',1,5),(254,0.29,'2024-11-12 04:41:21',1,6),(255,0.01,'2024-11-12 04:41:21',1,7),(256,21.99,'2024-11-12 04:41:21',1,8),(257,0.06,'2024-11-12 04:42:05',1,1),(258,0.06,'2024-11-12 04:42:05',1,2),(259,10.37,'2024-11-12 04:42:05',1,3),(260,127.50,'2024-11-12 04:42:05',1,4),(261,0.91,'2024-11-12 04:42:05',1,5),(262,0.29,'2024-11-12 04:42:05',1,6),(263,0.01,'2024-11-12 04:42:05',1,7),(264,21.99,'2024-11-12 04:42:05',1,8),(265,0.06,'2024-11-12 05:16:42',1,1),(266,0.06,'2024-11-12 05:16:42',1,2),(267,10.37,'2024-11-12 05:16:42',1,3),(268,127.50,'2024-11-12 05:16:42',1,4),(269,0.91,'2024-11-12 05:16:42',1,5),(270,0.29,'2024-11-12 05:16:42',1,6),(271,0.01,'2024-11-12 05:16:42',1,7),(272,21.99,'2024-11-12 05:16:42',1,8),(273,0.06,'2024-11-12 05:20:45',1,1),(274,0.06,'2024-11-12 05:20:45',1,2),(275,10.37,'2024-11-12 05:20:45',1,3),(276,127.50,'2024-11-12 05:20:45',1,4),(277,0.91,'2024-11-12 05:20:45',1,5),(278,0.29,'2024-11-12 05:20:45',1,6),(279,0.01,'2024-11-12 05:20:45',1,7),(280,21.99,'2024-11-12 05:20:45',1,8),(281,0.06,'2024-11-12 05:31:39',1,1),(282,0.06,'2024-11-12 05:31:39',1,2),(283,10.37,'2024-11-12 05:31:39',1,3),(284,127.50,'2024-11-12 05:31:39',1,4),(285,0.91,'2024-11-12 05:31:39',1,5),(286,0.29,'2024-11-12 05:31:39',1,6),(287,0.01,'2024-11-12 05:31:39',1,7),(288,21.99,'2024-11-12 05:31:39',1,8),(289,0.06,'2024-11-12 05:37:18',1,1),(290,0.06,'2024-11-12 05:37:18',1,2),(291,10.37,'2024-11-12 05:37:18',1,3),(292,127.50,'2024-11-12 05:37:18',1,4),(293,0.91,'2024-11-12 05:37:18',1,5),(294,0.29,'2024-11-12 05:37:18',1,6),(295,0.01,'2024-11-12 05:37:18',1,7),(296,21.99,'2024-11-12 05:37:18',1,8),(297,0.06,'2024-11-12 05:38:23',1,1),(298,0.06,'2024-11-12 05:38:23',1,2),(299,10.37,'2024-11-12 05:38:23',1,3),(300,127.50,'2024-11-12 05:38:23',1,4),(301,0.91,'2024-11-12 05:38:23',1,5),(302,0.29,'2024-11-12 05:38:23',1,6),(303,0.01,'2024-11-12 05:38:23',1,7),(304,21.99,'2024-11-12 05:38:23',1,8),(305,0.06,'2024-11-12 05:47:45',1,1),(306,0.06,'2024-11-12 05:47:45',1,2),(307,10.37,'2024-11-12 05:47:45',1,3),(308,127.50,'2024-11-12 05:47:45',1,4),(309,0.91,'2024-11-12 05:47:45',1,5),(310,0.29,'2024-11-12 05:47:45',1,6),(311,0.01,'2024-11-12 05:47:45',1,7),(312,21.99,'2024-11-12 05:47:45',1,8),(313,0.06,'2024-11-12 05:50:51',1,1),(314,0.06,'2024-11-12 05:50:51',1,2),(315,10.37,'2024-11-12 05:50:51',1,3),(316,127.50,'2024-11-12 05:50:51',1,4),(317,0.91,'2024-11-12 05:50:51',1,5),(318,0.29,'2024-11-12 05:50:51',1,6),(319,0.01,'2024-11-12 05:50:51',1,7),(320,21.99,'2024-11-12 05:50:51',1,8),(321,0.06,'2024-11-12 06:01:30',1,1),(322,0.06,'2024-11-12 06:01:30',1,2),(323,10.37,'2024-11-12 06:01:30',1,3),(324,127.50,'2024-11-12 06:01:30',1,4),(325,0.91,'2024-11-12 06:01:30',1,5),(326,0.29,'2024-11-12 06:01:30',1,6),(327,0.01,'2024-11-12 06:01:30',1,7),(328,21.99,'2024-11-12 06:01:30',1,8),(329,0.06,'2024-11-12 06:02:27',1,1),(330,0.06,'2024-11-12 06:02:27',1,2),(331,10.37,'2024-11-12 06:02:27',1,3),(332,127.50,'2024-11-12 06:02:27',1,4),(333,0.91,'2024-11-12 06:02:27',1,5),(334,0.29,'2024-11-12 06:02:27',1,6),(335,0.01,'2024-11-12 06:02:27',1,7),(336,21.99,'2024-11-12 06:02:27',1,8),(337,10.05,'2024-11-12 06:06:16',1,1),(338,11.98,'2024-11-12 06:06:16',1,2),(339,11.23,'2024-11-12 06:06:16',1,3),(340,127.55,'2024-11-12 06:06:16',1,4),(341,10.05,'2024-11-12 06:06:16',1,5),(342,20.35,'2024-11-12 06:06:16',1,6),(343,21.78,'2024-11-12 06:06:16',1,7),(344,21.99,'2024-11-12 06:06:16',1,8),(345,5.05,'2024-11-12 06:06:45',1,1),(346,11.98,'2024-11-12 06:06:45',1,2),(347,11.23,'2024-11-12 06:06:45',1,3),(348,127.55,'2024-11-12 06:06:45',1,4),(349,10.05,'2024-11-12 06:06:45',1,5),(350,20.35,'2024-11-12 06:06:45',1,6),(351,21.78,'2024-11-12 06:06:45',1,7),(352,21.99,'2024-11-12 06:06:45',1,8),(353,5.05,'2024-11-12 06:12:12',1,1),(354,11.98,'2024-11-12 06:12:12',1,2),(355,11.23,'2024-11-12 06:12:12',1,3),(356,127.55,'2024-11-12 06:12:12',1,4),(357,10.05,'2024-11-12 06:12:12',1,5),(358,20.35,'2024-11-12 06:12:12',1,6),(359,21.78,'2024-11-12 06:12:12',1,7),(360,21.99,'2024-11-12 06:12:12',1,8),(361,0.06,'2024-11-12 06:12:29',1,1),(362,0.06,'2024-11-12 06:12:29',1,2),(363,10.37,'2024-11-12 06:12:29',1,3),(364,127.50,'2024-11-12 06:12:29',1,4),(365,0.91,'2024-11-12 06:12:29',1,5),(366,0.29,'2024-11-12 06:12:29',1,6),(367,0.01,'2024-11-12 06:12:29',1,7),(368,21.99,'2024-11-12 06:12:29',1,8),(369,11.35,'2024-11-12 06:13:50',1,1),(370,11.98,'2024-11-12 06:13:50',1,2),(371,11.23,'2024-11-12 06:13:50',1,3),(372,127.55,'2024-11-12 06:13:50',1,4),(373,10.05,'2024-11-12 06:13:50',1,5),(374,20.35,'2024-11-12 06:13:50',1,6),(375,21.78,'2024-11-12 06:13:50',1,7),(376,21.99,'2024-11-12 06:13:50',1,8),(377,11.35,'2024-11-12 06:18:29',1,1),(378,11.98,'2024-11-12 06:18:29',1,2),(379,11.23,'2024-11-12 06:18:29',1,3),(380,127.55,'2024-11-12 06:18:29',1,4),(381,10.05,'2024-11-12 06:18:29',1,5),(382,20.35,'2024-11-12 06:18:29',1,6),(383,21.78,'2024-11-12 06:18:29',1,7),(384,21.99,'2024-11-12 06:18:29',1,8),(385,5.05,'2024-11-12 06:18:40',1,1),(386,11.98,'2024-11-12 06:18:40',1,2),(387,11.23,'2024-11-12 06:18:40',1,3),(388,127.55,'2024-11-12 06:18:40',1,4),(389,10.05,'2024-11-12 06:18:40',1,5),(390,20.35,'2024-11-12 06:18:40',1,6),(391,21.78,'2024-11-12 06:18:40',1,7),(392,21.99,'2024-11-12 06:18:40',1,8),(393,5.05,'2024-11-12 06:21:46',1,1),(394,11.98,'2024-11-12 06:21:46',1,2),(395,11.23,'2024-11-12 06:21:46',1,3),(396,127.55,'2024-11-12 06:21:46',1,4),(397,10.05,'2024-11-12 06:21:46',1,5),(398,20.35,'2024-11-12 06:21:46',1,6),(399,21.78,'2024-11-12 06:21:46',1,7),(400,21.99,'2024-11-12 06:21:46',1,8),(401,5.05,'2024-11-12 06:22:16',1,1),(402,11.98,'2024-11-12 06:22:16',1,2),(403,11.23,'2024-11-12 06:22:16',1,3),(404,127.55,'2024-11-12 06:22:16',1,4),(405,10.05,'2024-11-12 06:22:16',1,5),(406,20.35,'2024-11-12 06:22:16',1,6),(407,21.78,'2024-11-12 06:22:16',1,7),(408,21.99,'2024-11-12 06:22:16',1,8),(409,5.05,'2024-11-12 06:23:46',1,1),(410,11.98,'2024-11-12 06:23:46',1,2),(411,11.23,'2024-11-12 06:23:46',1,3),(412,127.55,'2024-11-12 06:23:46',1,4),(413,10.05,'2024-11-12 06:23:46',1,5),(414,20.35,'2024-11-12 06:23:46',1,6),(415,21.78,'2024-11-12 06:23:46',1,7),(416,21.99,'2024-11-12 06:23:46',1,8),(417,11.35,'2024-11-12 06:23:56',1,1),(418,11.98,'2024-11-12 06:23:56',1,2),(419,11.23,'2024-11-12 06:23:56',1,3),(420,127.55,'2024-11-12 06:23:56',1,4),(421,10.05,'2024-11-12 06:23:56',1,5),(422,20.35,'2024-11-12 06:23:56',1,6),(423,21.78,'2024-11-12 06:23:56',1,7),(424,21.99,'2024-11-12 06:23:56',1,8),(425,11.35,'2024-11-12 06:24:54',1,1),(426,11.98,'2024-11-12 06:24:54',1,2),(427,11.23,'2024-11-12 06:24:54',1,3),(428,127.55,'2024-11-12 06:24:54',1,4),(429,10.05,'2024-11-12 06:24:54',1,5),(430,20.35,'2024-11-12 06:24:54',1,6),(431,21.78,'2024-11-12 06:24:54',1,7),(432,21.99,'2024-11-12 06:24:54',1,8),(433,5.05,'2024-11-12 06:25:04',1,1),(434,11.98,'2024-11-12 06:25:04',1,2),(435,11.23,'2024-11-12 06:25:04',1,3),(436,127.55,'2024-11-12 06:25:04',1,4),(437,10.05,'2024-11-12 06:25:04',1,5),(438,20.35,'2024-11-12 06:25:04',1,6),(439,21.78,'2024-11-12 06:25:04',1,7),(440,21.99,'2024-11-12 06:25:04',1,8),(441,11.35,'2024-11-29 07:33:18',1,1),(442,11.98,'2024-11-29 07:33:18',1,2),(443,11.23,'2024-11-29 07:33:18',1,3),(444,127.55,'2024-11-29 07:33:18',1,4),(445,10.05,'2024-11-29 07:33:18',1,5),(446,20.35,'2024-11-29 07:33:18',1,6),(447,21.78,'2024-11-29 07:33:18',1,7),(448,21.99,'2024-11-29 07:33:18',1,8),(449,11.35,'2024-11-29 07:53:11',1,1),(450,11.98,'2024-11-29 07:53:11',1,2),(451,11.23,'2024-11-29 07:53:11',1,3),(452,127.55,'2024-11-29 07:53:11',1,4),(453,10.05,'2024-11-29 07:53:11',1,5),(454,20.35,'2024-11-29 07:53:11',1,6),(455,21.78,'2024-11-29 07:53:11',1,7),(456,21.99,'2024-11-29 07:53:11',1,8),(457,0.06,'2024-11-29 07:53:26',1,1),(458,0.06,'2024-11-29 07:53:26',1,2),(459,10.37,'2024-11-29 07:53:26',1,3),(460,127.50,'2024-11-29 07:53:26',1,4),(461,0.91,'2024-11-29 07:53:26',1,5),(462,0.29,'2024-11-29 07:53:26',1,6),(463,0.01,'2024-11-29 07:53:26',1,7),(464,21.99,'2024-11-29 07:53:26',1,8),(465,0.06,'2024-11-29 08:08:37',1,1),(466,0.06,'2024-11-29 08:08:37',1,2),(467,10.37,'2024-11-29 08:08:37',1,3),(468,127.50,'2024-11-29 08:08:37',1,4),(469,0.91,'2024-11-29 08:08:37',1,5),(470,0.29,'2024-11-29 08:08:37',1,6),(471,0.01,'2024-11-29 08:08:37',1,7),(472,21.99,'2024-11-29 08:08:37',1,8),(473,11.35,'2024-11-29 18:22:17',4,1),(474,11.98,'2024-11-29 18:22:17',4,2),(475,11.23,'2024-11-29 18:22:17',4,3),(476,127.55,'2024-11-29 18:22:17',4,4),(477,10.05,'2024-11-29 18:22:17',4,5),(478,20.35,'2024-11-29 18:22:17',4,6),(479,21.78,'2024-11-29 18:22:17',4,7),(480,21.99,'2024-11-29 18:22:17',4,8),(481,5.05,'2024-11-29 18:22:32',4,1),(482,11.98,'2024-11-29 18:22:32',4,2),(483,11.23,'2024-11-29 18:22:32',4,3),(484,127.55,'2024-11-29 18:22:32',4,4),(485,10.05,'2024-11-29 18:22:32',4,5),(486,20.35,'2024-11-29 18:22:32',4,6),(487,21.78,'2024-11-29 18:22:32',4,7),(488,21.99,'2024-11-29 18:22:32',4,8),(489,0.06,'2024-11-29 18:22:40',4,1),(490,0.06,'2024-11-29 18:22:40',4,2),(491,10.37,'2024-11-29 18:22:40',4,3),(492,127.50,'2024-11-29 18:22:40',4,4),(493,0.91,'2024-11-29 18:22:40',4,5),(494,0.29,'2024-11-29 18:22:40',4,6),(495,0.01,'2024-11-29 18:22:40',4,7),(496,21.99,'2024-11-29 18:22:40',4,8),(497,11.35,'2024-11-29 18:38:34',4,1),(498,11.98,'2024-11-29 18:38:34',4,2),(499,11.23,'2024-11-29 18:38:34',4,3),(500,127.55,'2024-11-29 18:38:34',4,4),(501,10.05,'2024-11-29 18:38:34',4,5),(502,20.35,'2024-11-29 18:38:34',4,6),(503,21.78,'2024-11-29 18:38:34',4,7),(504,21.99,'2024-11-29 18:38:34',4,8),(505,11.35,'2024-11-29 18:40:44',4,1),(506,11.98,'2024-11-29 18:40:44',4,2),(507,11.23,'2024-11-29 18:40:44',4,3),(508,127.55,'2024-11-29 18:40:44',4,4),(509,10.05,'2024-11-29 18:40:44',4,5),(510,20.35,'2024-11-29 18:40:44',4,6),(511,21.78,'2024-11-29 18:40:44',4,7),(512,21.99,'2024-11-29 18:40:44',4,8),(513,11.35,'2024-11-29 18:44:54',4,1),(514,11.98,'2024-11-29 18:44:54',4,2),(515,11.23,'2024-11-29 18:44:54',4,3),(516,127.55,'2024-11-29 18:44:54',4,4),(517,10.05,'2024-11-29 18:44:54',4,5),(518,20.35,'2024-11-29 18:44:54',4,6),(519,21.78,'2024-11-29 18:44:54',4,7),(520,21.99,'2024-11-29 18:44:54',4,8),(521,11.35,'2024-11-29 18:48:08',4,1),(522,11.98,'2024-11-29 18:48:08',4,2),(523,11.23,'2024-11-29 18:48:08',4,3),(524,127.55,'2024-11-29 18:48:08',4,4),(525,10.05,'2024-11-29 18:48:08',4,5),(526,20.35,'2024-11-29 18:48:08',4,6),(527,21.78,'2024-11-29 18:48:08',4,7),(528,21.99,'2024-11-29 18:48:08',4,8),(538,0.06,'2024-12-05 05:43:22',1,1),(539,0.06,'2024-12-05 05:43:22',1,2),(540,10.37,'2024-12-05 05:43:22',1,3),(541,127.50,'2024-12-05 05:43:22',1,4),(542,0.91,'2024-12-05 05:43:22',1,5),(543,0.29,'2024-12-05 05:43:22',1,6),(544,0.01,'2024-12-05 05:43:22',1,7),(545,21.99,'2024-12-05 05:43:22',1,8),(555,51.34,'2024-12-05 05:51:03',1,1),(556,49.71,'2024-12-05 05:51:03',1,2),(557,11.23,'2024-12-05 05:51:03',1,3),(558,127.55,'2024-12-05 05:51:03',1,4),(559,12.33,'2024-12-05 05:51:03',1,5),(560,0.55,'2024-12-05 05:51:03',1,6),(561,10.09,'2024-12-05 05:51:03',1,7),(562,21.99,'2024-12-05 05:51:03',1,8),(563,124.41,'2024-12-05 05:51:03',1,9),(564,51.34,'2024-12-05 05:51:10',1,1),(565,49.71,'2024-12-05 05:51:10',1,2),(566,11.23,'2024-12-05 05:51:10',1,3),(567,127.55,'2024-12-05 05:51:10',1,4),(568,12.33,'2024-12-05 05:51:10',1,5),(569,0.55,'2024-12-05 05:51:10',1,6),(570,10.09,'2024-12-05 05:51:10',1,7),(571,21.99,'2024-12-05 05:51:10',1,8),(572,124.41,'2024-12-05 05:51:10',1,9),(573,51.34,'2024-12-05 05:52:03',1,1),(574,49.71,'2024-12-05 05:52:03',1,2),(575,11.23,'2024-12-05 05:52:03',1,3),(576,127.55,'2024-12-05 05:52:03',1,4),(577,12.33,'2024-12-05 05:52:03',1,5),(578,0.55,'2024-12-05 05:52:03',1,6),(579,10.09,'2024-12-05 05:52:03',1,7),(580,21.99,'2024-12-05 05:52:03',1,8),(581,124.41,'2024-12-05 05:52:03',1,9),(582,51.34,'2024-12-05 05:53:25',1,1),(583,49.71,'2024-12-05 05:53:25',1,2),(584,11.23,'2024-12-05 05:53:25',1,3),(585,127.55,'2024-12-05 05:53:25',1,4),(586,12.33,'2024-12-05 05:53:25',1,5),(587,0.55,'2024-12-05 05:53:25',1,6),(588,10.09,'2024-12-05 05:53:25',1,7),(589,21.99,'2024-12-05 05:53:25',1,8),(590,124.41,'2024-12-05 05:53:25',1,9),(591,51.34,'2024-12-05 05:53:48',1,1),(592,49.71,'2024-12-05 05:53:48',1,2),(593,11.23,'2024-12-05 05:53:48',1,3),(594,127.55,'2024-12-05 05:53:48',1,4),(595,12.33,'2024-12-05 05:53:48',1,5),(596,0.55,'2024-12-05 05:53:48',1,6),(597,10.09,'2024-12-05 05:53:48',1,7),(598,21.99,'2024-12-05 05:53:48',1,8),(599,124.41,'2024-12-05 05:53:48',1,9),(600,51.34,'2024-12-05 05:54:59',1,1),(601,49.71,'2024-12-05 05:54:59',1,2),(602,11.23,'2024-12-05 05:54:59',1,3),(603,127.55,'2024-12-05 05:54:59',1,4),(604,12.33,'2024-12-05 05:54:59',1,5),(605,0.55,'2024-12-05 05:54:59',1,6),(606,10.09,'2024-12-05 05:54:59',1,7),(607,21.99,'2024-12-05 05:54:59',1,8),(608,124.41,'2024-12-05 05:54:59',1,9),(609,51.34,'2024-12-05 05:55:12',1,1),(610,49.71,'2024-12-05 05:55:12',1,2),(611,11.23,'2024-12-05 05:55:12',1,3),(612,127.55,'2024-12-05 05:55:12',1,4),(613,12.33,'2024-12-05 05:55:12',1,5),(614,0.55,'2024-12-05 05:55:12',1,6),(615,10.09,'2024-12-05 05:55:12',1,7),(616,21.99,'2024-12-05 05:55:12',1,8),(617,124.41,'2024-12-05 05:55:12',1,9),(618,51.34,'2024-12-05 05:56:15',1,1),(619,49.71,'2024-12-05 05:56:15',1,2),(620,11.23,'2024-12-05 05:56:15',1,3),(621,127.55,'2024-12-05 05:56:15',1,4),(622,12.33,'2024-12-05 05:56:15',1,5),(623,0.55,'2024-12-05 05:56:15',1,6),(624,10.09,'2024-12-05 05:56:15',1,7),(625,21.99,'2024-12-05 05:56:15',1,8),(626,124.41,'2024-12-05 05:56:15',1,9),(627,51.34,'2024-12-05 06:24:17',1,1),(628,49.71,'2024-12-05 06:24:17',1,2),(629,11.23,'2024-12-05 06:24:17',1,3),(630,127.55,'2024-12-05 06:24:17',1,4),(631,12.33,'2024-12-05 06:24:17',1,5),(632,0.55,'2024-12-05 06:24:17',1,6),(633,10.09,'2024-12-05 06:24:18',1,7),(634,21.99,'2024-12-05 06:24:18',1,8),(635,124.41,'2024-12-05 06:24:18',1,9),(636,51.34,'2024-12-05 06:25:54',1,1),(637,49.71,'2024-12-05 06:25:54',1,2),(638,11.23,'2024-12-05 06:25:54',1,3),(639,127.55,'2024-12-05 06:25:54',1,4),(640,12.33,'2024-12-05 06:25:54',1,5),(641,0.55,'2024-12-05 06:25:54',1,6),(642,10.09,'2024-12-05 06:25:54',1,7),(643,21.99,'2024-12-05 06:25:54',1,8),(644,124.41,'2024-12-05 06:25:54',1,9),(645,51.34,'2024-12-05 06:26:24',1,1),(646,49.71,'2024-12-05 06:26:24',1,2),(647,11.23,'2024-12-05 06:26:24',1,3),(648,127.55,'2024-12-05 06:26:24',1,4),(649,12.33,'2024-12-05 06:26:24',1,5),(650,0.55,'2024-12-05 06:26:24',1,6),(651,10.09,'2024-12-05 06:26:24',1,7),(652,21.99,'2024-12-05 06:26:24',1,8),(653,124.41,'2024-12-05 06:26:24',1,9),(654,51.34,'2024-12-05 06:27:02',1,1),(655,49.71,'2024-12-05 06:27:02',1,2),(656,11.23,'2024-12-05 06:27:02',1,3),(657,127.55,'2024-12-05 06:27:02',1,4),(658,12.33,'2024-12-05 06:27:02',1,5),(659,0.55,'2024-12-05 06:27:02',1,6),(660,10.09,'2024-12-05 06:27:02',1,7),(661,21.99,'2024-12-05 06:27:02',1,8),(662,124.41,'2024-12-05 06:27:02',1,9),(663,51.34,'2024-12-05 06:28:47',1,1),(664,49.71,'2024-12-05 06:28:47',1,2),(665,11.23,'2024-12-05 06:28:47',1,3),(666,127.55,'2024-12-05 06:28:47',1,4),(667,0.02,'2024-12-05 06:28:47',1,5),(668,0.55,'2024-12-05 06:28:47',1,6),(669,10.09,'2024-12-05 06:28:47',1,7),(670,21.99,'2024-12-05 06:28:47',1,8),(671,0.20,'2024-12-05 06:28:47',1,9),(672,51.34,'2024-12-05 06:28:57',1,1),(673,49.71,'2024-12-05 06:28:57',1,2),(674,11.23,'2024-12-05 06:28:57',1,3),(675,127.55,'2024-12-05 06:28:57',1,4),(676,0.02,'2024-12-05 06:28:57',1,5),(677,0.55,'2024-12-05 06:28:57',1,6),(678,10.09,'2024-12-05 06:28:57',1,7),(679,21.99,'2024-12-05 06:28:57',1,8),(680,0.20,'2024-12-05 06:28:57',1,9),(681,51.34,'2024-12-05 06:30:20',1,1),(682,49.71,'2024-12-05 06:30:20',1,2),(683,11.23,'2024-12-05 06:30:20',1,3),(684,127.55,'2024-12-05 06:30:20',1,4),(685,0.02,'2024-12-05 06:30:20',1,5),(686,0.55,'2024-12-05 06:30:20',1,6),(687,0.01,'2024-12-05 06:30:20',1,7),(688,21.99,'2024-12-05 06:30:20',1,8),(689,51.34,'2024-12-05 06:30:38',1,1),(690,49.71,'2024-12-05 06:30:38',1,2),(691,11.23,'2024-12-05 06:30:38',1,3),(692,127.55,'2024-12-05 06:30:38',1,4),(693,12.33,'2024-12-05 06:30:38',1,5),(694,0.55,'2024-12-05 06:30:38',1,6),(695,10.09,'2024-12-05 06:30:38',1,7),(696,21.99,'2024-12-05 06:30:38',1,8),(697,124.41,'2024-12-05 06:30:38',1,9),(698,51.34,'2024-12-05 06:33:15',1,1),(699,49.71,'2024-12-05 06:33:15',1,2),(700,11.23,'2024-12-05 06:33:15',1,3),(701,127.55,'2024-12-05 06:33:15',1,4),(702,12.33,'2024-12-05 06:33:15',1,5),(703,0.55,'2024-12-05 06:33:15',1,6),(704,10.09,'2024-12-05 06:33:15',1,7),(705,21.99,'2024-12-05 06:33:15',1,8),(706,124.41,'2024-12-05 06:33:15',1,9),(707,51.34,'2024-12-05 06:33:21',1,1),(708,49.71,'2024-12-05 06:33:21',1,2),(709,11.23,'2024-12-05 06:33:21',1,3),(710,127.55,'2024-12-05 06:33:21',1,4),(711,0.02,'2024-12-05 06:33:21',1,5),(712,0.55,'2024-12-05 06:33:21',1,6),(713,0.01,'2024-12-05 06:33:21',1,7),(714,21.99,'2024-12-05 06:33:21',1,8),(715,51.34,'2024-12-05 06:46:01',1,1),(716,49.71,'2024-12-05 06:46:01',1,2),(717,11.23,'2024-12-05 06:46:01',1,3),(718,127.55,'2024-12-05 06:46:01',1,4),(719,0.02,'2024-12-05 06:46:01',1,5),(720,0.55,'2024-12-05 06:46:01',1,6),(721,0.01,'2024-12-05 06:46:01',1,7),(722,21.99,'2024-12-05 06:46:01',1,8),(723,51.34,'2024-12-05 06:46:05',1,1),(724,49.71,'2024-12-05 06:46:05',1,2),(725,11.23,'2024-12-05 06:46:05',1,3),(726,127.55,'2024-12-05 06:46:05',1,4),(727,12.33,'2024-12-05 06:46:05',1,5),(728,0.55,'2024-12-05 06:46:05',1,6),(729,10.09,'2024-12-05 06:46:05',1,7),(730,21.99,'2024-12-05 06:46:05',1,8),(731,124.41,'2024-12-05 06:46:05',1,9),(732,51.34,'2024-12-05 06:47:38',1,1),(733,49.71,'2024-12-05 06:47:38',1,2),(734,11.23,'2024-12-05 06:47:38',1,3),(735,127.55,'2024-12-05 06:47:38',1,4),(736,12.33,'2024-12-05 06:47:38',1,5),(737,0.55,'2024-12-05 06:47:38',1,6),(738,10.09,'2024-12-05 06:47:38',1,7),(739,21.99,'2024-12-05 06:47:38',1,8),(740,124.41,'2024-12-05 06:47:38',1,9),(741,51.34,'2024-12-05 06:47:47',1,1),(742,49.71,'2024-12-05 06:47:47',1,2),(743,11.23,'2024-12-05 06:47:47',1,3),(744,127.55,'2024-12-05 06:47:47',1,4),(745,0.02,'2024-12-05 06:47:47',1,5),(746,0.55,'2024-12-05 06:47:47',1,6),(747,0.01,'2024-12-05 06:47:47',1,7),(748,21.99,'2024-12-05 06:47:47',1,8),(749,51.34,'2024-12-05 06:47:49',1,1),(750,49.71,'2024-12-05 06:47:49',1,2),(751,11.23,'2024-12-05 06:47:49',1,3),(752,127.55,'2024-12-05 06:47:49',1,4),(753,0.02,'2024-12-05 06:47:49',1,5),(754,0.55,'2024-12-05 06:47:49',1,6),(755,0.01,'2024-12-05 06:47:49',1,7),(756,21.99,'2024-12-05 06:47:49',1,8),(757,51.34,'2024-12-05 06:49:03',1,1),(758,49.71,'2024-12-05 06:49:03',1,2),(759,11.23,'2024-12-05 06:49:03',1,3),(760,127.55,'2024-12-05 06:49:03',1,4),(761,0.02,'2024-12-05 06:49:03',1,5),(762,0.55,'2024-12-05 06:49:03',1,6),(763,0.01,'2024-12-05 06:49:03',1,7),(764,21.99,'2024-12-05 06:49:03',1,8),(765,51.34,'2024-12-05 06:49:05',1,1),(766,49.71,'2024-12-05 06:49:05',1,2),(767,11.23,'2024-12-05 06:49:05',1,3),(768,127.55,'2024-12-05 06:49:05',1,4),(769,12.33,'2024-12-05 06:49:05',1,5),(770,0.55,'2024-12-05 06:49:05',1,6),(771,10.09,'2024-12-05 06:49:05',1,7),(772,21.99,'2024-12-05 06:49:05',1,8),(773,124.41,'2024-12-05 06:49:05',1,9),(774,51.34,'2024-12-05 06:49:17',1,1),(775,49.71,'2024-12-05 06:49:17',1,2),(776,11.23,'2024-12-05 06:49:17',1,3),(777,127.55,'2024-12-05 06:49:17',1,4),(778,0.02,'2024-12-05 06:49:17',1,5),(779,0.55,'2024-12-05 06:49:17',1,6),(780,0.01,'2024-12-05 06:49:17',1,7),(781,21.99,'2024-12-05 06:49:17',1,8),(782,51.34,'2024-12-05 06:49:38',1,1),(783,49.71,'2024-12-05 06:49:38',1,2),(784,11.23,'2024-12-05 06:49:38',1,3),(785,127.55,'2024-12-05 06:49:38',1,4),(786,0.02,'2024-12-05 06:49:38',1,5),(787,0.55,'2024-12-05 06:49:38',1,6),(788,0.01,'2024-12-05 06:49:38',1,7),(789,21.99,'2024-12-05 06:49:39',1,8),(790,51.34,'2024-12-05 06:50:30',1,1),(791,49.71,'2024-12-05 06:50:30',1,2),(792,11.23,'2024-12-05 06:50:30',1,3),(793,127.55,'2024-12-05 06:50:30',1,4),(794,0.02,'2024-12-05 06:50:30',1,5),(795,0.55,'2024-12-05 06:50:30',1,6),(796,0.01,'2024-12-05 06:50:30',1,7),(797,21.99,'2024-12-05 06:50:30',1,8),(798,51.34,'2024-12-05 06:50:37',1,1),(799,49.71,'2024-12-05 06:50:37',1,2),(800,11.23,'2024-12-05 06:50:37',1,3),(801,127.55,'2024-12-05 06:50:37',1,4),(802,12.33,'2024-12-05 06:50:37',1,5),(803,0.55,'2024-12-05 06:50:37',1,6),(804,10.09,'2024-12-05 06:50:37',1,7),(805,21.99,'2024-12-05 06:50:37',1,8),(806,124.41,'2024-12-05 06:50:37',1,9),(807,51.34,'2024-12-05 06:50:51',1,1),(808,49.71,'2024-12-05 06:50:51',1,2),(809,11.23,'2024-12-05 06:50:51',1,3),(810,127.55,'2024-12-05 06:50:51',1,4),(811,0.02,'2024-12-05 06:50:51',1,5),(812,0.55,'2024-12-05 06:50:51',1,6),(813,0.01,'2024-12-05 06:50:51',1,7),(814,21.99,'2024-12-05 06:50:51',1,8),(815,51.34,'2024-12-05 06:51:46',1,1),(816,49.71,'2024-12-05 06:51:46',1,2),(817,11.23,'2024-12-05 06:51:46',1,3),(818,127.55,'2024-12-05 06:51:46',1,4),(819,0.02,'2024-12-05 06:51:46',1,5),(820,0.55,'2024-12-05 06:51:46',1,6),(821,0.01,'2024-12-05 06:51:46',1,7),(822,21.99,'2024-12-05 06:51:46',1,8),(823,51.34,'2024-12-05 06:51:58',1,1),(824,49.71,'2024-12-05 06:51:58',1,2),(825,11.23,'2024-12-05 06:51:58',1,3),(826,127.55,'2024-12-05 06:51:58',1,4),(827,12.33,'2024-12-05 06:51:58',1,5),(828,0.55,'2024-12-05 06:51:58',1,6),(829,10.09,'2024-12-05 06:51:58',1,7),(830,21.99,'2024-12-05 06:51:58',1,8),(831,124.41,'2024-12-05 06:51:58',1,9),(832,51.34,'2024-12-05 06:53:15',1,1),(833,49.71,'2024-12-05 06:53:15',1,2),(834,11.23,'2024-12-05 06:53:15',1,3),(835,127.55,'2024-12-05 06:53:15',1,4),(836,12.33,'2024-12-05 06:53:15',1,5),(837,0.55,'2024-12-05 06:53:15',1,6),(838,10.09,'2024-12-05 06:53:15',1,7),(839,21.99,'2024-12-05 06:53:15',1,8),(840,124.41,'2024-12-05 06:53:15',1,9),(841,51.34,'2024-12-05 06:53:18',1,1),(842,49.71,'2024-12-05 06:53:18',1,2),(843,11.23,'2024-12-05 06:53:18',1,3),(844,127.55,'2024-12-05 06:53:18',1,4),(845,0.02,'2024-12-05 06:53:18',1,5),(846,0.55,'2024-12-05 06:53:18',1,6),(847,0.01,'2024-12-05 06:53:18',1,7),(848,21.99,'2024-12-05 06:53:18',1,8),(849,51.34,'2024-12-05 06:55:11',1,1),(850,49.71,'2024-12-05 06:55:11',1,2),(851,11.23,'2024-12-05 06:55:11',1,3),(852,127.55,'2024-12-05 06:55:11',1,4),(853,0.02,'2024-12-05 06:55:11',1,5),(854,0.55,'2024-12-05 06:55:11',1,6),(855,0.01,'2024-12-05 06:55:11',1,7),(856,21.99,'2024-12-05 06:55:11',1,8),(857,51.34,'2024-12-05 06:56:14',1,1),(858,49.71,'2024-12-05 06:56:14',1,2),(859,11.23,'2024-12-05 06:56:14',1,3),(860,127.55,'2024-12-05 06:56:14',1,4),(861,0.02,'2024-12-05 06:56:14',1,5),(862,0.55,'2024-12-05 06:56:14',1,6),(863,0.01,'2024-12-05 06:56:14',1,7),(864,21.99,'2024-12-05 06:56:14',1,8),(865,51.34,'2024-12-05 06:57:52',1,1),(866,49.71,'2024-12-05 06:57:52',1,2),(867,11.23,'2024-12-05 06:57:52',1,3),(868,127.55,'2024-12-05 06:57:52',1,4),(869,0.02,'2024-12-05 06:57:52',1,5),(870,0.55,'2024-12-05 06:57:52',1,6),(871,0.01,'2024-12-05 06:57:52',1,7),(872,21.99,'2024-12-05 06:57:52',1,8),(873,51.34,'2024-12-05 06:57:54',1,1),(874,49.71,'2024-12-05 06:57:54',1,2),(875,11.23,'2024-12-05 06:57:54',1,3),(876,127.55,'2024-12-05 06:57:54',1,4),(877,0.02,'2024-12-05 06:57:54',1,5),(878,0.55,'2024-12-05 06:57:54',1,6),(879,0.01,'2024-12-05 06:57:54',1,7),(880,21.99,'2024-12-05 06:57:54',1,8),(881,51.34,'2024-12-05 06:58:06',1,1),(882,49.71,'2024-12-05 06:58:06',1,2),(883,11.23,'2024-12-05 06:58:06',1,3),(884,127.55,'2024-12-05 06:58:06',1,4),(885,12.33,'2024-12-05 06:58:06',1,5),(886,0.55,'2024-12-05 06:58:06',1,6),(887,10.09,'2024-12-05 06:58:06',1,7),(888,21.99,'2024-12-05 06:58:06',1,8),(889,124.41,'2024-12-05 06:58:06',1,9),(890,51.34,'2024-12-05 06:58:10',1,1),(891,49.71,'2024-12-05 06:58:10',1,2),(892,11.23,'2024-12-05 06:58:10',1,3),(893,127.55,'2024-12-05 06:58:10',1,4),(894,0.02,'2024-12-05 06:58:10',1,5),(895,0.55,'2024-12-05 06:58:10',1,6),(896,0.01,'2024-12-05 06:58:10',1,7),(897,21.99,'2024-12-05 06:58:10',1,8),(898,51.34,'2024-12-05 06:59:49',1,1),(899,49.71,'2024-12-05 06:59:49',1,2),(900,11.23,'2024-12-05 06:59:49',1,3),(901,127.55,'2024-12-05 06:59:49',1,4),(902,0.02,'2024-12-05 06:59:49',1,5),(903,0.55,'2024-12-05 06:59:49',1,6),(904,0.01,'2024-12-05 06:59:49',1,7),(905,21.99,'2024-12-05 06:59:49',1,8),(906,51.34,'2024-12-05 06:59:52',1,1),(907,49.71,'2024-12-05 06:59:52',1,2),(908,11.23,'2024-12-05 06:59:52',1,3),(909,127.55,'2024-12-05 06:59:52',1,4),(910,12.33,'2024-12-05 06:59:52',1,5),(911,0.55,'2024-12-05 06:59:52',1,6),(912,10.09,'2024-12-05 06:59:52',1,7),(913,21.99,'2024-12-05 06:59:52',1,8),(914,124.41,'2024-12-05 06:59:52',1,9),(915,51.34,'2024-12-05 07:00:44',1,1),(916,49.71,'2024-12-05 07:00:44',1,2),(917,11.23,'2024-12-05 07:00:44',1,3),(918,127.55,'2024-12-05 07:00:44',1,4),(919,12.33,'2024-12-05 07:00:44',1,5),(920,0.55,'2024-12-05 07:00:44',1,6),(921,10.09,'2024-12-05 07:00:44',1,7),(922,21.99,'2024-12-05 07:00:44',1,8),(923,124.41,'2024-12-05 07:00:44',1,9),(924,51.34,'2024-12-05 07:00:46',1,1),(925,49.71,'2024-12-05 07:00:46',1,2),(926,11.23,'2024-12-05 07:00:46',1,3),(927,127.55,'2024-12-05 07:00:46',1,4),(928,12.33,'2024-12-05 07:00:46',1,5),(929,0.55,'2024-12-05 07:00:46',1,6),(930,10.09,'2024-12-05 07:00:46',1,7),(931,21.99,'2024-12-05 07:00:46',1,8),(932,124.41,'2024-12-05 07:00:46',1,9),(933,51.34,'2024-12-05 07:01:11',1,1),(934,49.71,'2024-12-05 07:01:11',1,2),(935,11.23,'2024-12-05 07:01:11',1,3),(936,127.55,'2024-12-05 07:01:11',1,4),(937,12.33,'2024-12-05 07:01:11',1,5),(938,0.55,'2024-12-05 07:01:11',1,6),(939,10.09,'2024-12-05 07:01:11',1,7),(940,21.99,'2024-12-05 07:01:11',1,8),(941,124.41,'2024-12-05 07:01:11',1,9),(942,51.34,'2024-12-05 07:01:19',1,1),(943,49.71,'2024-12-05 07:01:19',1,2),(944,11.23,'2024-12-05 07:01:19',1,3),(945,127.55,'2024-12-05 07:01:19',1,4),(946,12.33,'2024-12-05 07:01:19',1,5),(947,0.55,'2024-12-05 07:01:19',1,6),(948,10.09,'2024-12-05 07:01:19',1,7),(949,21.99,'2024-12-05 07:01:19',1,8),(950,124.41,'2024-12-05 07:01:19',1,9),(951,51.34,'2024-12-05 07:01:55',1,1),(952,49.71,'2024-12-05 07:01:55',1,2),(953,11.23,'2024-12-05 07:01:55',1,3),(954,127.55,'2024-12-05 07:01:55',1,4),(955,12.33,'2024-12-05 07:01:55',1,5),(956,0.55,'2024-12-05 07:01:55',1,6),(957,10.09,'2024-12-05 07:01:55',1,7),(958,21.99,'2024-12-05 07:01:55',1,8),(959,124.41,'2024-12-05 07:01:55',1,9),(960,51.34,'2024-12-05 07:02:27',1,1),(961,49.71,'2024-12-05 07:02:27',1,2),(962,11.23,'2024-12-05 07:02:27',1,3),(963,127.55,'2024-12-05 07:02:27',1,4),(964,12.33,'2024-12-05 07:02:27',1,5),(965,0.55,'2024-12-05 07:02:27',1,6),(966,10.09,'2024-12-05 07:02:27',1,7),(967,21.99,'2024-12-05 07:02:27',1,8),(968,124.41,'2024-12-05 07:02:27',1,9),(969,51.34,'2024-12-05 07:02:47',1,1),(970,49.71,'2024-12-05 07:02:47',1,2),(971,11.23,'2024-12-05 07:02:47',1,3),(972,127.55,'2024-12-05 07:02:47',1,4),(973,12.33,'2024-12-05 07:02:47',1,5),(974,0.55,'2024-12-05 07:02:47',1,6),(975,10.09,'2024-12-05 07:02:47',1,7),(976,21.99,'2024-12-05 07:02:47',1,8),(977,124.41,'2024-12-05 07:02:47',1,9),(978,51.34,'2024-12-05 07:18:04',1,1),(979,49.71,'2024-12-05 07:18:04',1,2),(980,11.23,'2024-12-05 07:18:04',1,3),(981,127.55,'2024-12-05 07:18:04',1,4),(982,0.02,'2024-12-05 07:18:04',1,5),(983,0.55,'2024-12-05 07:18:04',1,6),(984,0.01,'2024-12-05 07:18:04',1,7),(985,21.99,'2024-12-05 07:18:04',1,8),(986,51.34,'2024-12-05 07:18:07',1,1),(987,49.71,'2024-12-05 07:18:07',1,2),(988,11.23,'2024-12-05 07:18:07',1,3),(989,127.55,'2024-12-05 07:18:07',1,4),(990,12.33,'2024-12-05 07:18:07',1,5),(991,0.55,'2024-12-05 07:18:07',1,6),(992,10.09,'2024-12-05 07:18:07',1,7),(993,21.99,'2024-12-05 07:18:07',1,8),(994,124.41,'2024-12-05 07:18:07',1,9),(995,51.34,'2024-12-05 07:31:42',1,1),(996,49.71,'2024-12-05 07:31:42',1,2),(997,11.23,'2024-12-05 07:31:42',1,3),(998,127.55,'2024-12-05 07:31:42',1,4),(999,0.02,'2024-12-05 07:31:42',1,5),(1000,0.55,'2024-12-05 07:31:42',1,6),(1001,0.01,'2024-12-05 07:31:42',1,7),(1002,21.99,'2024-12-05 07:31:42',1,8),(1003,51.34,'2024-12-05 07:31:46',1,1),(1004,49.71,'2024-12-05 07:31:46',1,2),(1005,11.23,'2024-12-05 07:31:46',1,3),(1006,127.55,'2024-12-05 07:31:46',1,4),(1007,12.33,'2024-12-05 07:31:46',1,5),(1008,0.55,'2024-12-05 07:31:46',1,6),(1009,10.09,'2024-12-05 07:31:46',1,7),(1010,21.99,'2024-12-05 07:31:46',1,8),(1011,124.41,'2024-12-05 07:31:46',1,9),(1012,51.34,'2024-12-05 07:31:51',1,1),(1013,49.71,'2024-12-05 07:31:51',1,2),(1014,11.23,'2024-12-05 07:31:51',1,3),(1015,127.55,'2024-12-05 07:31:51',1,4),(1016,0.02,'2024-12-05 07:31:51',1,5),(1017,0.55,'2024-12-05 07:31:51',1,6),(1018,0.01,'2024-12-05 07:31:51',1,7),(1019,21.99,'2024-12-05 07:31:51',1,8),(1020,51.34,'2024-12-05 07:34:48',1,1),(1021,49.71,'2024-12-05 07:34:48',1,2),(1022,11.23,'2024-12-05 07:34:48',1,3),(1023,127.55,'2024-12-05 07:34:48',1,4),(1024,0.02,'2024-12-05 07:34:48',1,5),(1025,0.55,'2024-12-05 07:34:48',1,6),(1026,0.01,'2024-12-05 07:34:48',1,7),(1027,21.99,'2024-12-05 07:34:48',1,8),(1028,51.34,'2024-12-05 07:34:49',1,1),(1029,49.71,'2024-12-05 07:34:49',1,2),(1030,11.23,'2024-12-05 07:34:49',1,3),(1031,127.55,'2024-12-05 07:34:49',1,4),(1032,0.02,'2024-12-05 07:34:49',1,5),(1033,0.55,'2024-12-05 07:34:49',1,6),(1034,0.01,'2024-12-05 07:34:49',1,7),(1035,21.99,'2024-12-05 07:34:49',1,8),(1036,51.34,'2024-12-05 07:34:50',1,1),(1037,49.71,'2024-12-05 07:34:50',1,2),(1038,11.23,'2024-12-05 07:34:50',1,3),(1039,127.55,'2024-12-05 07:34:50',1,4),(1040,0.02,'2024-12-05 07:34:50',1,5),(1041,0.55,'2024-12-05 07:34:50',1,6),(1042,0.01,'2024-12-05 07:34:50',1,7),(1043,21.99,'2024-12-05 07:34:50',1,8),(1044,51.34,'2024-12-05 07:34:51',1,1),(1045,49.71,'2024-12-05 07:34:51',1,2),(1046,11.23,'2024-12-05 07:34:51',1,3),(1047,127.55,'2024-12-05 07:34:51',1,4),(1048,0.02,'2024-12-05 07:34:51',1,5),(1049,0.55,'2024-12-05 07:34:51',1,6),(1050,0.01,'2024-12-05 07:34:51',1,7),(1051,21.99,'2024-12-05 07:34:51',1,8),(1052,51.34,'2024-12-05 07:34:54',1,1),(1053,49.71,'2024-12-05 07:34:54',1,2),(1054,11.23,'2024-12-05 07:34:54',1,3),(1055,127.55,'2024-12-05 07:34:54',1,4),(1056,12.33,'2024-12-05 07:34:54',1,5),(1057,0.55,'2024-12-05 07:34:54',1,6),(1058,10.09,'2024-12-05 07:34:54',1,7),(1059,21.99,'2024-12-05 07:34:54',1,8),(1060,124.41,'2024-12-05 07:34:54',1,9),(1061,51.34,'2024-12-05 07:34:56',1,1),(1062,49.71,'2024-12-05 07:34:56',1,2),(1063,11.23,'2024-12-05 07:34:56',1,3),(1064,127.55,'2024-12-05 07:34:56',1,4),(1065,12.33,'2024-12-05 07:34:56',1,5),(1066,0.55,'2024-12-05 07:34:56',1,6),(1067,10.09,'2024-12-05 07:34:56',1,7),(1068,21.99,'2024-12-05 07:34:56',1,8),(1069,124.41,'2024-12-05 07:34:56',1,9),(1070,51.34,'2024-12-05 07:34:58',1,1),(1071,49.71,'2024-12-05 07:34:58',1,2),(1072,11.23,'2024-12-05 07:34:58',1,3),(1073,127.55,'2024-12-05 07:34:58',1,4),(1074,12.33,'2024-12-05 07:34:58',1,5),(1075,0.55,'2024-12-05 07:34:58',1,6),(1076,10.09,'2024-12-05 07:34:58',1,7),(1077,21.99,'2024-12-05 07:34:58',1,8),(1078,124.41,'2024-12-05 07:34:58',1,9),(1079,51.34,'2024-12-05 07:34:59',1,1),(1080,49.71,'2024-12-05 07:34:59',1,2),(1081,11.23,'2024-12-05 07:34:59',1,3),(1082,127.55,'2024-12-05 07:34:59',1,4),(1083,12.33,'2024-12-05 07:34:59',1,5),(1084,0.55,'2024-12-05 07:34:59',1,6),(1085,10.09,'2024-12-05 07:34:59',1,7),(1086,21.99,'2024-12-05 07:34:59',1,8),(1087,124.41,'2024-12-05 07:34:59',1,9),(1088,51.34,'2024-12-05 07:35:00',1,1),(1089,49.71,'2024-12-05 07:35:00',1,2),(1090,11.23,'2024-12-05 07:35:00',1,3),(1091,127.55,'2024-12-05 07:35:00',1,4),(1092,12.33,'2024-12-05 07:35:00',1,5),(1093,0.55,'2024-12-05 07:35:00',1,6),(1094,10.09,'2024-12-05 07:35:00',1,7),(1095,21.99,'2024-12-05 07:35:00',1,8),(1096,124.41,'2024-12-05 07:35:00',1,9),(1097,51.34,'2024-12-05 07:35:01',1,1),(1098,49.71,'2024-12-05 07:35:01',1,2),(1099,11.23,'2024-12-05 07:35:01',1,3),(1100,127.55,'2024-12-05 07:35:01',1,4),(1101,12.33,'2024-12-05 07:35:01',1,5),(1102,0.55,'2024-12-05 07:35:01',1,6),(1103,10.09,'2024-12-05 07:35:01',1,7),(1104,21.99,'2024-12-05 07:35:01',1,8),(1105,124.41,'2024-12-05 07:35:01',1,9),(1106,51.34,'2024-12-05 07:35:02',1,1),(1107,49.71,'2024-12-05 07:35:02',1,2),(1108,11.23,'2024-12-05 07:35:02',1,3),(1109,127.55,'2024-12-05 07:35:02',1,4),(1110,12.33,'2024-12-05 07:35:02',1,5),(1111,0.55,'2024-12-05 07:35:02',1,6),(1112,10.09,'2024-12-05 07:35:02',1,7),(1113,21.99,'2024-12-05 07:35:02',1,8),(1114,124.41,'2024-12-05 07:35:02',1,9),(1115,51.34,'2024-12-05 07:35:03',1,1),(1116,49.71,'2024-12-05 07:35:03',1,2),(1117,11.23,'2024-12-05 07:35:03',1,3),(1118,127.55,'2024-12-05 07:35:03',1,4),(1119,12.33,'2024-12-05 07:35:03',1,5),(1120,0.55,'2024-12-05 07:35:03',1,6),(1121,10.09,'2024-12-05 07:35:03',1,7),(1122,21.99,'2024-12-05 07:35:03',1,8),(1123,124.41,'2024-12-05 07:35:03',1,9),(1124,51.34,'2024-12-05 07:35:04',1,1),(1125,49.71,'2024-12-05 07:35:04',1,2),(1126,11.23,'2024-12-05 07:35:04',1,3),(1127,127.55,'2024-12-05 07:35:04',1,4),(1128,12.33,'2024-12-05 07:35:04',1,5),(1129,0.55,'2024-12-05 07:35:04',1,6),(1130,10.09,'2024-12-05 07:35:04',1,7),(1131,21.99,'2024-12-05 07:35:04',1,8),(1132,124.41,'2024-12-05 07:35:04',1,9),(1133,51.34,'2024-12-05 07:35:05',1,1),(1134,49.71,'2024-12-05 07:35:05',1,2),(1135,11.23,'2024-12-05 07:35:05',1,3),(1136,127.55,'2024-12-05 07:35:05',1,4),(1137,12.33,'2024-12-05 07:35:05',1,5),(1138,0.55,'2024-12-05 07:35:05',1,6),(1139,10.09,'2024-12-05 07:35:05',1,7),(1140,21.99,'2024-12-05 07:35:05',1,8),(1141,124.41,'2024-12-05 07:35:05',1,9),(1142,51.34,'2024-12-05 07:35:06',1,1),(1143,49.71,'2024-12-05 07:35:06',1,2),(1144,11.23,'2024-12-05 07:35:06',1,3),(1145,127.55,'2024-12-05 07:35:06',1,4),(1146,12.33,'2024-12-05 07:35:06',1,5),(1147,0.55,'2024-12-05 07:35:06',1,6),(1148,10.09,'2024-12-05 07:35:06',1,7),(1149,21.99,'2024-12-05 07:35:06',1,8),(1150,124.41,'2024-12-05 07:35:06',1,9),(1151,51.34,'2024-12-05 07:35:07',1,1),(1152,49.71,'2024-12-05 07:35:07',1,2),(1153,11.23,'2024-12-05 07:35:07',1,3),(1154,127.55,'2024-12-05 07:35:07',1,4),(1155,12.33,'2024-12-05 07:35:07',1,5),(1156,0.55,'2024-12-05 07:35:07',1,6),(1157,10.09,'2024-12-05 07:35:07',1,7),(1158,21.99,'2024-12-05 07:35:07',1,8),(1159,124.41,'2024-12-05 07:35:07',1,9),(1160,51.34,'2024-12-05 07:35:08',1,1),(1161,49.71,'2024-12-05 07:35:08',1,2),(1162,11.23,'2024-12-05 07:35:08',1,3),(1163,127.55,'2024-12-05 07:35:08',1,4),(1164,12.33,'2024-12-05 07:35:08',1,5),(1165,0.55,'2024-12-05 07:35:08',1,6),(1166,10.09,'2024-12-05 07:35:08',1,7),(1167,21.99,'2024-12-05 07:35:08',1,8),(1168,124.41,'2024-12-05 07:35:08',1,9),(1169,51.34,'2024-12-05 07:35:10',1,1),(1170,49.71,'2024-12-05 07:35:10',1,2),(1171,11.23,'2024-12-05 07:35:10',1,3),(1172,127.55,'2024-12-05 07:35:10',1,4),(1173,12.33,'2024-12-05 07:35:10',1,5),(1174,0.55,'2024-12-05 07:35:10',1,6),(1175,10.09,'2024-12-05 07:35:10',1,7),(1176,21.99,'2024-12-05 07:35:10',1,8),(1177,124.41,'2024-12-05 07:35:10',1,9),(1178,51.34,'2024-12-05 07:35:11',1,1),(1179,49.71,'2024-12-05 07:35:11',1,2),(1180,11.23,'2024-12-05 07:35:11',1,3),(1181,127.55,'2024-12-05 07:35:11',1,4),(1182,12.33,'2024-12-05 07:35:11',1,5),(1183,0.55,'2024-12-05 07:35:11',1,6),(1184,10.09,'2024-12-05 07:35:11',1,7),(1185,21.99,'2024-12-05 07:35:11',1,8),(1186,124.41,'2024-12-05 07:35:11',1,9),(1187,51.34,'2024-12-05 07:35:13',1,1),(1188,49.71,'2024-12-05 07:35:13',1,2),(1189,11.23,'2024-12-05 07:35:13',1,3),(1190,127.55,'2024-12-05 07:35:13',1,4),(1191,0.02,'2024-12-05 07:35:13',1,5),(1192,0.55,'2024-12-05 07:35:13',1,6),(1193,0.01,'2024-12-05 07:35:13',1,7),(1194,21.99,'2024-12-05 07:35:13',1,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_medicion`
--

LOCK TABLES `parametros_medicion` WRITE;
/*!40000 ALTER TABLE `parametros_medicion` DISABLE KEYS */;
INSERT INTO `parametros_medicion` VALUES (1,1,1,10.00,11.00,12.01),(2,1,2,10.00,11.00,12.00),(3,1,3,10.00,11.00,12.00),(4,1,4,100.00,120.00,140.00),(5,1,5,10.00,11.00,12.00),(6,1,6,16.00,20.00,30.00),(7,1,7,16.00,20.00,30.00),(8,1,8,0.00,25.00,45.05),(17,2,1,11.00,12.00,14.00),(18,2,2,11.00,12.00,13.00),(19,2,3,101.00,121.00,141.00),(20,2,4,11.00,12.00,13.00),(21,2,5,11.00,12.00,13.00),(22,2,6,17.00,21.00,31.00),(23,2,7,17.00,21.00,31.00),(24,2,8,1.00,26.00,49.00),(41,7,1,1.00,2.02,3.00),(42,7,2,1.01,2.02,3.03),(43,7,3,1.01,2.02,3.03),(44,7,4,1.01,2.02,3.03),(45,7,5,1.01,2.02,3.03),(46,7,6,1.01,2.02,3.03),(47,7,7,1.01,2.02,3.03),(48,7,8,1.01,2.02,3.03);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas_medicion`
--

LOCK TABLES `reglas_medicion` WRITE;
/*!40000 ALTER TABLE `reglas_medicion` DISABLE KEYS */;
INSERT INTO `reglas_medicion` VALUES (1,'GENERAL'),(2,'Regla_2'),(7,'Prueba 7');
/*!40000 ALTER TABLE `reglas_medicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_medicion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_medicion` (`id_medicion`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_medicion`) REFERENCES `mediciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,457),(2,458),(3,461),(4,462),(5,463),(6,465),(7,466),(8,469),(9,470),(10,471),(11,481),(12,489),(13,490),(14,493),(15,494),(16,495),(22,538),(23,539),(24,542),(25,543),(26,544),(32,555),(33,556),(34,559),(35,560),(36,561),(37,564),(38,565),(39,568),(40,569),(41,570),(42,573),(43,574),(44,577),(45,578),(46,579),(47,582),(48,583),(49,586),(50,587),(51,588),(52,591),(53,592),(54,595),(55,596),(56,597),(57,600),(58,601),(59,604),(60,605),(61,606),(62,609),(63,610),(64,613),(65,614),(66,615),(67,618),(68,619),(69,622),(70,623),(71,624),(72,627),(73,628),(74,631),(75,632),(76,633),(77,636),(78,637),(79,640),(80,641),(81,642),(82,645),(83,646),(84,649),(85,650),(86,651),(87,654),(88,655),(89,658),(90,659),(91,660),(92,663),(93,664),(94,667),(95,668),(96,669),(97,672),(98,673),(99,676),(100,677),(101,678),(102,681),(103,682),(104,685),(105,686),(106,687),(107,689),(108,690),(109,693),(110,694),(111,695),(112,698),(113,699),(114,702),(115,703),(116,704),(117,707),(118,708),(119,711),(120,712),(121,713),(122,715),(123,716),(124,719),(125,720),(126,721),(127,723),(128,724),(129,727),(130,728),(131,729),(132,732),(133,733),(134,736),(135,737),(136,738),(137,741),(138,742),(139,745),(140,746),(141,747),(142,749),(143,750),(144,753),(145,754),(146,755),(147,757),(148,758),(149,761),(150,762),(151,763),(152,765),(153,766),(154,769),(155,770),(156,771),(157,774),(158,775),(159,778),(160,779),(161,780),(162,782),(163,783),(164,786),(165,787),(166,788),(167,790),(168,791),(169,794),(170,795),(171,796),(172,798),(173,799),(174,802),(175,803),(176,804),(177,807),(178,808),(179,811),(180,812),(181,813),(182,815),(183,816),(184,819),(185,820),(186,821),(187,823),(188,824),(189,827),(190,828),(191,829),(192,832),(193,833),(194,836),(195,837),(196,838),(197,841),(198,842),(199,845),(200,846),(201,847),(202,849),(203,850),(204,853),(205,854),(206,855),(207,857),(208,858),(209,861),(210,862),(211,863),(212,865),(213,866),(214,869),(215,870),(216,871),(217,873),(218,874),(219,877),(220,878),(221,879),(222,881),(223,882),(224,885),(225,886),(226,887),(227,890),(228,891),(229,894),(230,895),(231,896),(232,898),(233,899),(234,902),(235,903),(236,904),(237,906),(238,907),(239,910),(240,911),(241,912),(242,915),(243,916),(244,919),(245,920),(246,921),(247,924),(248,925),(249,928),(250,929),(251,930),(252,933),(253,934),(254,937),(255,938),(256,939),(257,942),(258,943),(259,946),(260,947),(261,948),(262,951),(263,952),(264,955),(265,956),(266,957),(267,960),(268,961),(269,964),(270,965),(271,966),(272,969),(273,970),(274,973),(275,974),(276,975),(277,978),(278,979),(279,982),(280,983),(281,984),(282,986),(283,987),(284,990),(285,991),(286,992),(287,995),(288,996),(289,999),(290,1000),(291,1001),(292,1003),(293,1004),(294,1007),(295,1008),(296,1009),(297,1012),(298,1013),(299,1016),(300,1017),(301,1018),(302,1020),(303,1021),(304,1024),(305,1025),(306,1026),(307,1028),(308,1029),(309,1032),(310,1033),(311,1034),(312,1036),(313,1037),(314,1040),(315,1041),(316,1042),(317,1044),(318,1045),(319,1048),(320,1049),(321,1050),(322,1052),(323,1053),(324,1056),(325,1057),(326,1058),(327,1061),(328,1062),(329,1065),(330,1066),(331,1067),(332,1070),(333,1071),(334,1074),(335,1075),(336,1076),(337,1079),(338,1080),(339,1083),(340,1084),(341,1085),(342,1088),(343,1089),(344,1092),(345,1093),(346,1094),(347,1097),(348,1098),(349,1101),(350,1102),(351,1103),(352,1106),(353,1107),(354,1110),(355,1111),(356,1112),(357,1115),(358,1116),(359,1119),(360,1120),(361,1121),(362,1124),(363,1125),(364,1128),(365,1129),(366,1130),(367,1133),(368,1134),(369,1137),(370,1138),(371,1139),(372,1142),(373,1143),(374,1146),(375,1147),(376,1148),(377,1151),(378,1152),(379,1155),(380,1156),(381,1157),(382,1160),(383,1161),(384,1164),(385,1165),(386,1166),(387,1169),(388,1170),(389,1173),(390,1174),(391,1175),(392,1178),(393,1179),(394,1182),(395,1183),(396,1184),(397,1187),(398,1188),(399,1191),(400,1192),(401,1193);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones_carga`
--

DROP TABLE IF EXISTS `sesiones_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones_carga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin` datetime DEFAULT NULL,
  `id_estacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estacion_sesion` (`id_estacion`),
  CONSTRAINT `fk_estacion_sesion` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones_carga`
--

LOCK TABLES `sesiones_carga` WRITE;
/*!40000 ALTER TABLE `sesiones_carga` DISABLE KEYS */;
INSERT INTO `sesiones_carga` VALUES (1,'2024-12-03 17:43:22','2024-12-05 01:27:38',1),(6,'2024-12-05 01:31:46','2024-12-05 01:31:51',1),(7,'2024-12-05 01:34:54','2024-12-05 01:35:13',1);
/*!40000 ALTER TABLE `sesiones_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifas`
--

DROP TABLE IF EXISTS `tarifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) NOT NULL DEFAULT '1.00',
  `moneda` varchar(3) NOT NULL DEFAULT 'MXN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifas`
--

LOCK TABLES `tarifas` WRITE;
/*!40000 ALTER TABLE `tarifas` DISABLE KEYS */;
INSERT INTO `tarifas` VALUES (1,'Precio General kW/h',10.00,'MXN');
/*!40000 ALTER TABLE `tarifas` ENABLE KEYS */;
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
  `tipo_medicion` enum('V','I','T','N/A','P') NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_medicion`
--

LOCK TABLES `tipos_medicion` WRITE;
/*!40000 ALTER TABLE `tipos_medicion` DISABLE KEYS */;
INSERT INTO `tipos_medicion` VALUES (1,'voltaje_1','V'),(2,'voltaje_2','V'),(3,'voltaje_3','V'),(4,'voltaje_4','V'),(5,'voltaje_5','V'),(6,'intensidad_1','I'),(7,'intensidad_2','I'),(8,'temperatura','T'),(9,'potencia','P');
/*!40000 ALTER TABLE `tipos_medicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'estaciones_carga'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-05  1:55:05
