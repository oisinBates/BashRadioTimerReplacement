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
-- Temporary table structure for view `weekly_bedtime_data_view`
--

DROP TABLE IF EXISTS `weekly_bedtime_data_view`;
/*!50001 DROP VIEW IF EXISTS `weekly_bedtime_data_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `weekly_bedtime_data_view` (
  `script_run_count` tinyint NOT NULL,
  `sleep_time_avg` tinyint NOT NULL,
  `sleep_time_max` tinyint NOT NULL,
  `sleep_time_min` tinyint NOT NULL,
  `wake_time_avg` tinyint NOT NULL,
  `wake_time_max` tinyint NOT NULL,
  `wake_time_min` tinyint NOT NULL,
  `radio_length_avg` tinyint NOT NULL,
  `radio_length_max` tinyint NOT NULL,
  `radio_length_min` tinyint NOT NULL,
  `sleep_length_avg` tinyint NOT NULL,
  `sleep_length_max` tinyint NOT NULL,
  `sleep_length_min` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `weekly_bedtime_data_view`
--

/*!50001 DROP TABLE IF EXISTS `weekly_bedtime_data_view`*/;
/*!50001 DROP VIEW IF EXISTS `weekly_bedtime_data_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `weekly_bedtime_data_view` AS select count(`bash_bedtime_data_logs`.`id`) AS `script_run_count`,sec_to_time(avg(time_to_sec(`bash_bedtime_data_logs`.`sleep_time`))) AS `sleep_time_avg`,max(cast(`bash_bedtime_data_logs`.`sleep_time` as time)) AS `sleep_time_max`,min(cast(`bash_bedtime_data_logs`.`sleep_time` as time)) AS `sleep_time_min`,sec_to_time(avg(time_to_sec(`bash_bedtime_data_logs`.`wake_time`))) AS `wake_time_avg`,max(cast(`bash_bedtime_data_logs`.`wake_time` as time)) AS `wake_time_max`,min(cast(`bash_bedtime_data_logs`.`wake_time` as time)) AS `wake_time_min`,round(avg(`bash_bedtime_data_logs`.`radio_play_length`),2) AS `radio_length_avg`,max(`bash_bedtime_data_logs`.`radio_play_length`) AS `radio_length_max`,min(`bash_bedtime_data_logs`.`radio_play_length`) AS `radio_length_min`,round(avg(`bash_bedtime_data_logs`.`sleep_length`),2) AS `sleep_length_avg`,max(`bash_bedtime_data_logs`.`radio_play_length`) AS `sleep_length_max`,min(`bash_bedtime_data_logs`.`radio_play_length`) AS `sleep_length_min` from `bash_bedtime_data_logs` where (`bash_bedtime_data_logs`.`sleep_time` >= (now() - interval 1 week)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'bash_bedtime_data'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-06  0:45:44
