-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: examen
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `ideas`
--

DROP TABLE IF EXISTS `ideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ideas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4qp1368gdn4wk6ih62bj80ym` (`user_id`),
  CONSTRAINT `FKt4qp1368gdn4wk6ih62bj80ym` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas`
--

LOCK TABLES `ideas` WRITE;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` VALUES (1,'2020-09-05 15:59:44.951000','Idea 1',NULL,1),(2,'2020-09-05 15:59:51.331000','Idea 2',NULL,1),(3,'2020-09-05 15:59:57.280000','Idea 3',NULL,1),(4,'2020-09-05 16:00:42.843000','Idea JD 1',NULL,2),(5,'2020-09-05 16:00:54.265000','Idea JD 2',NULL,2),(6,'2020-09-05 16:01:01.208000','Idea JD 3',NULL,2),(7,'2020-09-05 16:01:37.067000','Idea Yoly 1',NULL,3),(8,'2020-09-05 16:01:44.711000','Idea Yoly 2',NULL,3),(9,'2020-09-05 16:01:52.874000','Idea Yoly 3',NULL,3);
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_ideas_users`
--

DROP TABLE IF EXISTS `likes_ideas_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_ideas_users` (
  `user_id` bigint NOT NULL,
  `idea_id` bigint NOT NULL,
  KEY `FK2l962g9hdnjycnj3gi7tef9qd` (`idea_id`),
  KEY `FKgwcseg70w3ae53ivpuapte4fc` (`user_id`),
  CONSTRAINT `FK2l962g9hdnjycnj3gi7tef9qd` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`id`),
  CONSTRAINT `FKgwcseg70w3ae53ivpuapte4fc` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_ideas_users`
--

LOCK TABLES `likes_ideas_users` WRITE;
/*!40000 ALTER TABLE `likes_ideas_users` DISABLE KEYS */;
INSERT INTO `likes_ideas_users` VALUES (1,6),(3,6),(1,7),(3,7),(1,8),(3,8),(3,1),(1,1),(2,1),(1,2),(3,2),(2,2),(1,3),(3,3),(2,3),(1,4),(3,4),(2,4),(1,5),(3,5),(2,5);
/*!40000 ALTER TABLE `likes_ideas_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `passw` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2020-09-05 15:59:34.985000','juan@cool.com','Juan Carlos Acuña','$2a$10$nmw9qa3BZO4NAGeOAbvx5.LA0rI/5/91Hk3YskKECN4ZJ45A/5Tcy',NULL),(2,'2020-09-05 16:00:31.976000','juandavid@cool.com','Juan David Acuña','$2a$10$0XPFyNdoGsrCqskD3hYZK.qxqDdYW8XHjdwpbEkTnwjgRoinbgHT6',NULL),(3,'2020-09-05 16:01:27.467000','yoly@cool.com','Yoly Guillen','$2a$10$QlsT33urFEqDIcASqNNIPe5i3cJjMYuerCKJQdeLprE7Qs4M/rnA2',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-05 16:05:34
