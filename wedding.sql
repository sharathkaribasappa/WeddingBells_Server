-- MySQL dump 10.13  Distrib 5.5.14, for Win32 (x86)
--
-- Host: localhost    Database: wedding
-- ------------------------------------------------------
-- Server version	5.5.14

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
-- Table structure for table `attendance_table`
--

DROP TABLE IF EXISTS `attendance_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_table` (
  `a_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attending` varchar(8) DEFAULT 'Unknown',
  PRIMARY KEY (`a_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `attendance_table_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_table`
--

LOCK TABLES `attendance_table` WRITE;
/*!40000 ALTER TABLE `attendance_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_table`
--

DROP TABLE IF EXISTS `comments_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_table` (
  `c_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_table_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `comments_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_table`
--

LOCK TABLES `comments_table` WRITE;
/*!40000 ALTER TABLE `comments_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_table`
--

DROP TABLE IF EXISTS `event_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_table` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_event_id` int(11) NOT NULL,
  `main_host_id` int(11) DEFAULT '0',
  `sub_host_id` int(11) DEFAULT '0',
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `main_sub` varchar(4) DEFAULT 'main',
  `invites_purchased` int(6) DEFAULT '0',
  `invites_used` int(6) DEFAULT '0',
  `invites_available` int(6) DEFAULT '0',
  PRIMARY KEY (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_table`
--

LOCK TABLES `event_table` WRITE;
/*!40000 ALTER TABLE `event_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_table`
--

DROP TABLE IF EXISTS `gift_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_table` (
  `gift_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_option` varchar(200) DEFAULT NULL,
  `first_option_id` varchar(100) DEFAULT NULL,
  `second_option` varchar(200) DEFAULT NULL,
  `second_option_id` varchar(100) DEFAULT NULL,
  `other_option` varchar(200) DEFAULT NULL,
  `other_option_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gift_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `gift_table_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `gift_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_table`
--

LOCK TABLES `gift_table` WRITE;
/*!40000 ALTER TABLE `gift_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_list_table`
--

DROP TABLE IF EXISTS `invite_list_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_list_table` (
  `list_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invite_id` int(11) NOT NULL,
  `total_invites` int(8) DEFAULT '0',
  `Subscriber_ids` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  KEY `invite_id` (`invite_id`),
  CONSTRAINT `invite_list_table_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `invite_list_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invite_list_table_ibfk_3` FOREIGN KEY (`invite_id`) REFERENCES `invite_table` (`invite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_list_table`
--

LOCK TABLES `invite_list_table` WRITE;
/*!40000 ALTER TABLE `invite_list_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_list_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_table`
--

DROP TABLE IF EXISTS `invite_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_table` (
  `invite_id` int(11) NOT NULL,
  `invite_price` int(6) DEFAULT '0',
  `coupon` varchar(100) DEFAULT NULL,
  `discount` int(3) DEFAULT '0',
  PRIMARY KEY (`invite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_table`
--

LOCK TABLES `invite_table` WRITE;
/*!40000 ALTER TABLE `invite_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mimetype_table`
--

DROP TABLE IF EXISTS `mimetype_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mimetype_table` (
  `m_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `upload_date` date DEFAULT NULL,
  `upload_time` time DEFAULT NULL,
  `mime_type` varchar(10) DEFAULT NULL,
  `video_path` varchar(250) DEFAULT NULL,
  `audio_path` varchar(250) DEFAULT NULL,
  `image_path` varchar(250) DEFAULT NULL,
  `input_size` int(10) DEFAULT '0',
  `compressed_size` int(10) DEFAULT '0',
  `size_limit` int(10) DEFAULT '0',
  PRIMARY KEY (`m_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mimetype_table_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `mimetype_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mimetype_table`
--

LOCK TABLES `mimetype_table` WRITE;
/*!40000 ALTER TABLE `mimetype_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mimetype_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_table`
--

DROP TABLE IF EXISTS `notify_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_table` (
  `notify_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notify` varchar(15) DEFAULT 'YES',
  PRIMARY KEY (`notify_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notify_table_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `notify_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_table`
--

LOCK TABLES `notify_table` WRITE;
/*!40000 ALTER TABLE `notify_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `status` varchar(8) DEFAULT 'Active',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-21 18:46:36
