CREATE DATABASE  IF NOT EXISTS `bash_bedtime_data` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bash_bedtime_data`;
-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0    Database: bash_bedtime_data
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bash_bedtime_data_averages`
--

LOCK TABLES `bash_bedtime_data_averages` WRITE;
/*!40000 ALTER TABLE `bash_bedtime_data_averages` DISABLE KEYS */;
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

-- Dump completed on 2016-08-06  0:45:43
