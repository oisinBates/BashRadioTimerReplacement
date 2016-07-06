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
/*!50001 VIEW `weekly_bedtime_data_view` AS select count(`bash_bedtime_data_table`.`id`) AS `script_run_count`,sec_to_time(avg(time_to_sec(`bash_bedtime_data_table`.`sleep_time`))) AS `sleep_time_avg`,max(cast(`bash_bedtime_data_table`.`sleep_time` as time)) AS `sleep_time_max`,min(cast(`bash_bedtime_data_table`.`sleep_time` as time)) AS `sleep_time_min`,sec_to_time(avg(time_to_sec(`bash_bedtime_data_table`.`wake_time`))) AS `wake_time_avg`,max(cast(`bash_bedtime_data_table`.`wake_time` as time)) AS `wake_time_max`,min(cast(`bash_bedtime_data_table`.`wake_time` as time)) AS `wake_time_min`,round(avg(`bash_bedtime_data_table`.`radio_play_length`),2) AS `radio_length_avg`,max(`bash_bedtime_data_table`.`radio_play_length`) AS `radio_length_max`,min(`bash_bedtime_data_table`.`radio_play_length`) AS `radio_length_min`,round(avg(`bash_bedtime_data_table`.`sleep_length`),2) AS `sleep_length_avg`,max(`bash_bedtime_data_table`.`radio_play_length`) AS `sleep_length_max`,min(`bash_bedtime_data_table`.`radio_play_length`) AS `sleep_length_min` from `bash_bedtime_data_table` where (`bash_bedtime_data_table`.`sleep_time` >= (now() - interval 1 week)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'bashBedtimeData'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `weekly_averages_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `weekly_averages_event` ON SCHEDULE EVERY 7 DAY STARTS '2016-07-10 18:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO `bashBedtimeData`.`bashBedtimeDataAverages`
	(
	`script_run_count`,
	`sleep_time_avg`,
	`sleep_time_high`,
	`sleep_time_low`,
	`wake_time_avg`,
	`wake_time_high`,
	`wake_time_low`,
	`sleep_length_avg`,
	`sleep_length_high`,
	`sleep_length_low`,
	`radio_play_length_avg`,
	`radio_play_length_high`,
	`radio_play_length_low`) 
	SELECT * FROM weekly_bedtime_data_view */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-06 18:30:24
