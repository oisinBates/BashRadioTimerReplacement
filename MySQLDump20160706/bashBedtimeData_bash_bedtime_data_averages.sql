CREATE DATABASE  IF NOT EXISTS `bashBedtimeData` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bashBedtimeData`;
-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0    Database: bashBedtimeData
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bash_bedtime_data_averages`
--

DROP TABLE IF EXISTS `bash_bedtime_data_averages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bash_bedtime_data_averages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_ending` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `script_run_count` int(11) DEFAULT NULL,
  `sleep_time_avg` time DEFAULT NULL,
  `sleep_time_high` time DEFAULT NULL,
  `sleep_time_low` time DEFAULT NULL,
  `wake_time_avg` time NOT NULL,
  `wake_time_high` time DEFAULT NULL,
  `wake_time_low` time DEFAULT NULL,
  `sleep_length_avg` double DEFAULT NULL,
  `sleep_length_high` double DEFAULT NULL,
  `sleep_length_low` double DEFAULT NULL,
  `radio_play_length_avg` double DEFAULT NULL,
  `radio_play_length_high` double DEFAULT NULL,
  `radio_play_length_low` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bash_bedtime_data_averages`
--

LOCK TABLES `bash_bedtime_data_averages` WRITE;
/*!40000 ALTER TABLE `bash_bedtime_data_averages` DISABLE KEYS */;
INSERT INTO `bash_bedtime_data_averages` VALUES (1,NULL,25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(2,'2016-07-06 14:41:37',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(3,'2016-07-06 14:59:52',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(4,'2016-07-06 15:07:37',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(5,'2016-07-06 15:07:47',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(6,'2016-07-06 15:07:57',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(7,'2016-07-06 15:08:07',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(8,'2016-07-06 15:08:17',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(9,'2016-07-06 15:08:27',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(10,'2016-07-06 15:08:37',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(11,'2016-07-06 15:13:21',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(12,'2016-07-06 15:13:31',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(13,'2016-07-06 15:13:41',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(14,'2016-07-06 15:13:51',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(15,'2016-07-06 15:14:01',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(16,'2016-07-06 15:14:11',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0),(17,'2016-07-06 15:14:21',25,'18:01:09','22:28:30','00:29:11','18:47:39','22:29:07','00:29:47',18,89,0,13.58,89,0);
/*!40000 ALTER TABLE `bash_bedtime_data_averages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-06 18:30:24
