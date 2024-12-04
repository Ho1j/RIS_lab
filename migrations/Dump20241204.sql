CREATE DATABASE  IF NOT EXISTS `store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `store`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `monthly_reports`
--

DROP TABLE IF EXISTS `monthly_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_reports` (
  `month_reports_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` date NOT NULL,
  `order_sum` int NOT NULL,
  PRIMARY KEY (`month_reports_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_reports`
--

LOCK TABLES `monthly_reports` WRITE;
/*!40000 ALTER TABLE `monthly_reports` DISABLE KEYS */;
INSERT INTO `monthly_reports` VALUES (1,2,'2023-11-28',2850),(2,2,'2023-11-28',2850),(3,2,'2023-11-28',2850),(4,2,'2023-11-28',2850),(5,2,'2023-11-28',1350),(6,2,'2023-11-28',1350),(7,2,'2023-11-28',1400),(8,2,'2023-11-29',600),(9,2,'2023-11-29',2350),(16,23,'2023-08-30',2000),(17,24,'2023-08-05',333),(18,2,'2023-08-08',3000);
/*!40000 ALTER TABLE `monthly_reports` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_lines`
--

LOCK TABLES `orders_lines` WRITE;
/*!40000 ALTER TABLE `orders_lines` DISABLE KEYS */;
INSERT INTO `orders_lines` VALUES (1,19,1,1),(2,19,4,1),(3,19,5,3),(4,19,6,1),(5,20,5,1),(6,20,6,3),(7,21,5,1),(8,21,6,3),(9,22,4,1),(10,22,5,1),(11,22,6,2),(12,23,5,1),(13,24,1,1),(14,24,5,1),(15,24,6,1),(16,24,7,1),(17,25,5,1),(18,25,6,1),(19,26,5,2),(20,26,6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_orders`
--

LOCK TABLES `user_orders` WRITE;
/*!40000 ALTER TABLE `user_orders` DISABLE KEYS */;
INSERT INTO `user_orders` VALUES (1,1,'2023-10-15',340),(2,1,'2023-10-18',700),(3,2,'2023-09-15',1244),(4,5,'2023-10-19',1231),(5,2,'2023-09-12',123),(6,22,'2023-09-30',1000),(7,23,'2023-08-30',2000),(9,24,'2023-08-05',333),(10,2,'2023-08-08',3000),(11,2,'2023-11-28',2850),(17,2,'2023-11-28',2850),(18,2,'2023-11-28',2850),(19,2,'2023-11-28',2850),(20,2,'2023-11-28',1350),(21,2,'2023-11-28',1350),(22,2,'2023-11-28',1400),(23,2,'2023-11-29',600),(24,2,'2023-11-29',2350),(25,2,'2024-11-27',850),(26,1,'2024-12-03',1450);
/*!40000 ALTER TABLE `user_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_group` enum('user','admin') DEFAULT 'user',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','scrypt:32768:8:1$htwHZDepmcd2tlOC$3e3540e2b9d27d1b66909da4f811ab3b752a981bf22bdcbc1891bd1aef400811aa633783c00910cdfe02b7120853f1d90bbc374719b308f35da86ae83e49d486','user'),(2,'admin','scrypt:32768:8:1$Q98JPgG3NPZKwRUo$0dfc02b5777f5f88fab69e2acb2144771c62830a31057a3f84a73ba29cca4e44280dc1fc6500b2a7fba3cac564bfb2d08c2ec703e49de8ce8206835d83803d5d','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'store'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateMonthlyReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateMonthlyReport`(IN month INT, IN year INT)
BEGIN
    -- Генерируем имя таблицы на основе месяца и года
    SET @table_name = CONCAT('monthly_reports');

    -- Вставляем данные в таблицу
    SET @insert_query = CONCAT(
        'INSERT INTO ', @table_name, ' (user_id, order_date, order_sum)
         SELECT user_id, order_date, order_sum
         FROM user_orders
         WHERE MONTH(order_date) = ', month, ' AND YEAR(order_date) = ', year, ';'
    );

    -- Выполняем вставку
    PREPARE stmt FROM @insert_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 10:55:23
