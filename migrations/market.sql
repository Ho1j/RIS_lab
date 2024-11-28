CREATE DATABASE  IF NOT EXISTS `store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `store`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: store
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `external_users`
--

DROP TABLE IF EXISTS `external_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `user_group` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_users`
--

LOCK TABLES `external_users` WRITE;
/*!40000 ALTER TABLE `external_users` DISABLE KEYS */;
INSERT INTO `external_users` VALUES (1,'user1','password','user'),(2,'user2','12345','user');
/*!40000 ALTER TABLE `external_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_users`
--

DROP TABLE IF EXISTS `internal_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_group` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_users`
--

LOCK TABLES `internal_users` WRITE;
/*!40000 ALTER TABLE `internal_users` DISABLE KEYS */;
INSERT INTO `internal_users` VALUES (1,'admin1','1234','admin'),(2,'admin2','1234','admin');
/*!40000 ALTER TABLE `internal_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_lines`
--

DROP TABLE IF EXISTS `orders_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_lines` (
  `basket_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`basket_id`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `user_orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_lines`
--

LOCK TABLES `orders_lines` WRITE;
/*!40000 ALTER TABLE `orders_lines` DISABLE KEYS */;
INSERT INTO `orders_lines` VALUES (1,19,1,1),(2,19,4,1),(3,19,5,3),(4,19,6,1),(5,20,5,1),(6,20,6,3),(7,21,5,1),(8,21,6,3),(9,22,4,1),(10,22,5,1),(11,22,6,2),(12,23,5,1),(13,24,1,1),(14,24,5,1),(15,24,6,1),(16,24,7,1);
/*!40000 ALTER TABLE `orders_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(45) NOT NULL,
  `prod_measure` varchar(45) NOT NULL,
  `prod_price` int NOT NULL,
  `prod_cat` varchar(45) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'говядина','кг',500,'мясо'),(2,'свинина','кг',400,'мясо'),(3,'курица','кг',300,'мясо'),(4,'индейка','кг',300,'мясо'),(5,'баранина','кг',600,'мясо'),(6,'ветчина','кг',250,'колбаса'),(7,'гауда','кг',1000,'сыр'),(8,'творожный сыр','кг',700,'сыр'),(16,'сыр российский','кг',700,'сыр'),(17,'удон','шт',70,'бакалея'),(18,'макароны','шт',50,'бакалея'),(19,'рис','шт',90,'бакалея'),(20,'кефир','л',80,'молочные продукты'),(21,'творог','шт',65,'молочные продукты'),(22,'карбонад','кг',1500,'колбаса'),(23,'мортаделла','шт',300,'колбаса');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_1`
--

DROP TABLE IF EXISTS `report_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_1` (
  `report_1_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` date NOT NULL,
  `order_sum` int NOT NULL,
  PRIMARY KEY (`report_1_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_1`
--

LOCK TABLES `report_1` WRITE;
/*!40000 ALTER TABLE `report_1` DISABLE KEYS */;
INSERT INTO `report_1` VALUES (43,1,'2023-10-15',340),(44,1,'2023-10-18',700),(45,5,'2023-10-19',1231),(46,5,'2023-10-19',1231);
/*!40000 ALTER TABLE `report_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_2`
--

DROP TABLE IF EXISTS `report_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_2` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `order_date` date NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_2`
--

LOCK TABLES `report_2` WRITE;
/*!40000 ALTER TABLE `report_2` DISABLE KEYS */;
INSERT INTO `report_2` VALUES (1,'говядина',1,'2023-11-28'),(2,'индейка',1,'2023-11-28'),(3,'баранина',3,'2023-11-28'),(4,'ветчина',1,'2023-11-28'),(5,'баранина',1,'2023-11-28'),(6,'ветчина',3,'2023-11-28'),(7,'баранина',1,'2023-11-28'),(8,'ветчина',3,'2023-11-28'),(9,'индейка',1,'2023-11-28'),(10,'баранина',1,'2023-11-28'),(11,'ветчина',2,'2023-11-28'),(12,'баранина',1,'2023-11-29'),(13,'говядина',1,'2023-11-29'),(14,'баранина',1,'2023-11-29'),(15,'ветчина',1,'2023-11-29'),(16,'гауда',1,'2023-11-29'),(17,'гауда',1,'2023-11-29');
/*!40000 ALTER TABLE `report_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_orders`
--

DROP TABLE IF EXISTS `user_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_sum` int DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_orders`
--

LOCK TABLES `user_orders` WRITE;
/*!40000 ALTER TABLE `user_orders` DISABLE KEYS */;
INSERT INTO `user_orders` VALUES (1,1,'2023-10-15',340),(2,1,'2023-10-18',700),(3,2,'2023-09-15',1244),(4,5,'2023-10-19',1231),(5,2,'2023-09-12',123),(6,22,'2023-09-30',1000),(7,23,'2023-08-30',2000),(9,24,'2023-08-05',333),(10,2,'2023-08-08',3000),(11,2,'2023-11-28',2850),(17,2,'2023-11-28',2850),(18,2,'2023-11-28',2850),(19,2,'2023-11-28',2850),(20,2,'2023-11-28',1350),(21,2,'2023-11-28',1350),(22,2,'2023-11-28',1400),(23,2,'2023-11-29',600),(24,2,'2023-11-29',2350);
/*!40000 ALTER TABLE `user_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 21:55:57
