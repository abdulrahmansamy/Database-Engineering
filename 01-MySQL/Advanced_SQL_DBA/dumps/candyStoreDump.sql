-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: candystore
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `candy_products`
--

DROP TABLE IF EXISTS `candy_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candy_products` (
  `candy_product_id` bigint unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `cogs` decimal(13,2) DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candy_products`
--

LOCK TABLES `candy_products` WRITE;
/*!40000 ALTER TABLE `candy_products` DISABLE KEYS */;
INSERT INTO `candy_products` VALUES (1,'chocolate bar',0.25,1.50),(2,'fruit candy',0.30,1.50),(3,'candy cane',0.15,0.95),(4,'bubble gum',0.05,0.25),(5,'sour balls',0.10,0.50),(6,'popping candy',0.35,1.50);
/*!40000 ALTER TABLE `candy_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reviews`
--

DROP TABLE IF EXISTS `customer_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reviews` (
  `customer_review_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `customer_rating` bigint unsigned NOT NULL,
  PRIMARY KEY (`customer_review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reviews`
--

LOCK TABLES `customer_reviews` WRITE;
/*!40000 ALTER TABLE `customer_reviews` DISABLE KEYS */;
INSERT INTO `customer_reviews` VALUES (1,4,5),(2,2,4),(3,4,5),(4,4,4),(5,1,5),(6,6,5),(7,6,4),(8,4,5),(9,6,4),(10,6,4),(11,3,4),(12,4,5),(13,4,5),(14,4,5),(15,5,5),(16,3,5),(17,6,4),(18,4,5),(19,1,5),(20,3,5),(21,2,4),(22,1,5),(23,2,5),(24,5,5),(25,2,5),(26,5,5),(27,2,5),(28,4,5),(29,3,5),(30,5,4),(31,4,5),(32,1,4),(33,1,5);
/*!40000 ALTER TABLE `customer_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` bigint unsigned NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `avg_customer_rating` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Jim','John','2018-01-15','Manager',NULL),(2,'Wayland','Smithers','2018-01-15','Assistant Manager',NULL),(3,'Elizabeth','Boop','2019-02-01','Clerk',NULL),(4,'Margaret','Simpson','2019-02-01','Clerk',NULL),(5,'Lawrence','Bird','2019-12-15','Clerk',NULL),(6,'Santos','Halper','2019-12-15','Clerk',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-23 15:18:38
