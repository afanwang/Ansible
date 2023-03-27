-- MySQL dump 10.14  Distrib 5.5.34-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: data_analytics
-- ------------------------------------------------------
-- Server version	5.5.34-MariaDB-log

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
-- Table structure for table `CRASH_REPORT`
--

DROP TABLE IF EXISTS `CRASH_REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRASH_REPORT` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `REPORT_DATE` varchar(255) NOT NULL,
  `TIME_PERIOD` varchar(255) NOT NULL,
  `APP_ID` varchar(255) NOT NULL,
  `BUNDLE_VERSION` varchar(255) NOT NULL,
  `ERROR_COUNT` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SCREEN_VIEW_REPORT`
--

DROP TABLE IF EXISTS `SCREEN_VIEW_REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCREEN_VIEW_REPORT` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `REPORT_DATE` varchar(20) NOT NULL,
  `SCREEN_JSON` varchar(500) DEFAULT NULL,
  `SCREEN_PATH` varchar(1000) NOT NULL,
  `SCREEN_TITLE` varchar(255) DEFAULT NULL,
  `TIME_PERIOD` varchar(20) NOT NULL,
  `TOTAL_VIEWS` bigint(20) NOT NULL,
  `INDIVIDUAL_VIEWS` bigint(20) NOT NULL,
  `location_ID` varchar(300) NOT NULL,
  `VIEW_DURATION` double NOT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PARENT_KEY` (`PARENT_ID`),
  CONSTRAINT `FK_PARENT_ID` FOREIGN KEY (`PARENT_ID`) REFERENCES `SCREEN_VIEW_REPORT` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UPDATE_STATS_REPORT`
--

DROP TABLE IF EXISTS `UPDATE_STATS_REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPDATE_STATS_REPORT` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `REPORT_DATE` varchar(255) NOT NULL,
  `TIME_PERIOD` varchar(255) NOT NULL,
  `location_ID` varchar(300) NOT NULL,
  `SUCCESS_COUNT` double NOT NULL,
  `FAILED_COUNT` double NOT NULL,
  `CANCEL_COUNT` double NOT NULL,
  `SCHEDULED_COUNT` double NOT NULL,
  `REQUEST_SENT_COUNT` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11501 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-24 18:18:32
