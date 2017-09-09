-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: damweb
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `amenity`
--

DROP TABLE IF EXISTS `amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenity` (
  `amenity_id` int(11) NOT NULL AUTO_INCREMENT,
  `short_desc` varchar(30) DEFAULT NULL,
  `long_desc` varchar(100) DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`amenity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES (1,'Swimming Pool',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(2,'SPA',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(3,'Fitness Centre',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(27,'Business Centre',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(28,'Restaurant',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(29,'BAR',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(30,'Meeting / Event Rooms',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(31,'Travel / Tour Desk',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(32,'Room Service',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(33,'Laundry Service',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(34,'Doctor on Call',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(35,'Free W-FI',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(36,'24 Hour Room Service',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(37,'Baby Sitting Service',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(38,'Free Parking',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(39,'Smoking Room',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(40,'Safe Deposit Locker',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(41,'Car Parking',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(42,'In Room WI-Room',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(43,'Non Smoking Room',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(44,'In Room Safe',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(45,'Pets Allowed',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(46,'WI-FI at Lobby',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(47,'Smoking Area',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(48,'24 Hour Check In',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(49,'Disabled Friendly',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin'),(50,'PC with Internet',NULL,'A','2016-09-01 18:30:00','2016-09-01 18:30:00','Admin','Admin');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_details` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `thumb_img_link` varchar(60) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `active_flag` varchar(10) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_asset`
--

DROP TABLE IF EXISTS `digital_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digital_asset` (
  `digital_asset_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_type` varchar(45) NOT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `use_room_type` varchar(45) DEFAULT NULL,
  `no_of_assets` int(11) DEFAULT NULL,
  `asset_detail` varchar(256) DEFAULT NULL,
  `asset_res_ht_px` int(11) DEFAULT NULL,
  `asset_res_wd_px` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`digital_asset_id`),
  UNIQUE KEY `digital_asset_unique_key` (`asset_type`,`hotel_id`,`room_type_id`,`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_asset`
--

LOCK TABLES `digital_asset` WRITE;
/*!40000 ALTER TABLE `digital_asset` DISABLE KEYS */;
INSERT INTO `digital_asset` VALUES (1,'HT_THUMB',12,0,0,NULL,0,NULL,0,0,'2016-10-28 13:00:00','UserIdOfAdminUser',NULL,NULL),(2,'HT_DETAIL',12,0,0,NULL,0,NULL,0,0,'2016-10-28 13:00:00','UserIdOfAdminUser',NULL,NULL),(5,'RT_THUMB',12,1,0,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(6,'RT_DETAIL',12,1,0,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(7,'RM_THUMB',12,1,5,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(8,'RM_DETAIL',12,1,5,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(9,'RM_THUMB',12,1,6,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(10,'RM_DETAIL',12,1,6,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(11,'RM_THUMB',12,2,7,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(12,'RM_DETAIL',12,2,7,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(13,'RT_THUMB',12,2,0,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(14,'RT_DETAIL',12,2,0,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(15,'RM_THUMB',12,3,8,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(16,'RM_DETAIL',12,3,8,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(17,'RT_THUMB',12,3,0,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(18,'RT_DETAIL',12,3,0,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(19,'RM_THUMB',12,1,9,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(20,'RM_DETAIL',12,1,9,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(21,'RM_THUMB',12,3,10,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(22,'RM_DETAIL',12,3,10,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(23,'RM_THUMB',12,1,11,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(24,'RM_DETAIL',12,1,11,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(25,'RM_THUMB',12,2,12,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(26,'RM_DETAIL',12,2,12,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(27,'RM_THUMB',3,1,13,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(28,'RM_DETAIL',3,1,13,NULL,0,NULL,0,0,'2016-11-04 13:00:00','UserIdOfAdminUser',NULL,NULL),(29,'HT_THUMB',3,0,0,NULL,0,NULL,0,0,'2016-11-14 13:00:00','UserIdOfAdminUser',NULL,NULL),(30,'HT_DETAIL',3,0,0,NULL,0,NULL,0,0,'2016-11-14 13:00:00','UserIdOfAdminUser',NULL,NULL),(31,'HT_THUMB',14,0,0,NULL,0,NULL,0,0,'2016-11-14 13:00:00','UserIdOfAdminUser',NULL,NULL),(32,'HT_DETAIL',14,0,0,NULL,0,NULL,0,0,'2016-11-14 13:00:00','UserIdOfAdminUser',NULL,NULL),(33,'HT_THUMB',15,0,0,NULL,0,NULL,0,0,'2016-11-14 13:00:00','UserIdOfAdminUser',NULL,NULL),(34,'HT_DETAIL',15,0,0,NULL,0,NULL,0,0,'2016-11-14 13:00:00','UserIdOfAdminUser',NULL,NULL);
/*!40000 ALTER TABLE `digital_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_asset_details`
--

DROP TABLE IF EXISTS `digital_asset_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digital_asset_details` (
  `da_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `digital_asset_id` int(11) DEFAULT NULL,
  `asset_name` varchar(60) DEFAULT NULL,
  `digital_asset_location` varchar(256) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `last_refresh_date` date DEFAULT NULL,
  PRIMARY KEY (`da_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_asset_details`
--

LOCK TABLES `digital_asset_details` WRITE;
/*!40000 ALTER TABLE `digital_asset_details` DISABLE KEYS */;
INSERT INTO `digital_asset_details` VALUES (1,1,'LingtamResort_20170909.JPG','static/assets/HSR01/HT_THUMB','ACTIVE','2017-09-08','2017-09-08','2017-08-08'),(2,2,'gallery-image-6.jpg','static/assets/HSR01/HT_DETAIL','ACTIVE','2017-09-08','2017-09-08','2017-08-08');
/*!40000 ALTER TABLE `digital_asset_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) NOT NULL,
  `short_desc` varchar(100) DEFAULT NULL,
  `detailed_desc` varchar(500) DEFAULT NULL,
  `htl_address` varchar(256) DEFAULT NULL,
  `htl_amenities` varchar(500) DEFAULT NULL,
  `htl_rating` varchar(45) DEFAULT NULL,
  `htl_avlbl_start_date` date DEFAULT NULL,
  `htl_avlbl_end_date` date DEFAULT NULL,
  `use_hotel_avlbl` varchar(45) DEFAULT NULL,
  `active_flag` varchar(10) DEFAULT NULL,
  `verified_flag` varchar(10) DEFAULT NULL,
  `htl_thumb_img_link` varchar(256) DEFAULT NULL,
  `htl_slide_img_link` varchar(256) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `hotel_code` varchar(45) NOT NULL,
  `amenity_id` varchar(45) DEFAULT NULL,
  `htl_360score` int(11) NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (3,'Taj Bengal','Taj Bengal','Detailed Description','Hotel/Resort Address','[1, 2, 35, 36, 45, 46]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,'static/assets/HTB01/HT_THUMB/imgname_20170909.jpg','static/assets/HTB01/HT_DETAIL/gallery-image-8.jpg','2016-10-23 18:30:00','UserIdOfAdminUser',NULL,NULL,'HTB01',NULL,96),(4,'Hotel001','Short001','Detailed Description','Hotel/Resort Address','[2, 3, 27, 36, 37, 38]',NULL,'2016-10-01','2016-11-30',NULL,NULL,NULL,NULL,NULL,'2016-10-23 18:30:00','UserIdOfAdminUser','2016-10-26 18:30:00','UserIdOfAdminUser','',NULL,0),(5,'Hotel/Resort Name','Short Description','Detailed Description','Hotel/Resort Address','[2, 34, 36, 44, 46, 47]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-23 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(6,'New Hotel 001','New Hotel 001','New Hotel 001','New Hotel 001','[27, 28, 29]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-25 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(7,'New Hotel 001','New Hotel 001','New Hotel 001','New Hotel 001','[27, 28, 29]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-25 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(8,'New Hotel 001','New Hotel 001','New Hotel 001','New Hotel 001','[27, 28, 29]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-25 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(9,'New Hotel 001','New Hotel 001','New Hotel 001','New Hotel 001','[27, 28, 29]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-25 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(10,'hotel005','hotel005','hotel005','test','[27, 28, 36, 37, 44, 45]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-25 18:30:00','UserIdOfAdminUser','2016-10-25 18:30:00','UserIdOfAdminUser','',NULL,0),(11,'nnnnnnn','nnnnnnn','nnnnnnn','nnnnnnn','[2, 34, 42, 50]',NULL,'2016-10-01','2016-10-31',NULL,NULL,NULL,NULL,NULL,'2016-10-28 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(12,'Silk Route Resort','This is a hotel near mountains','Hotel Specific Detailed Features','MMR Manner Bldg 3030','[2, 3, 27, 33, 41]',NULL,'2016-11-01','2017-04-30',NULL,NULL,NULL,'static/assets/HTB01/HT_THUMB/imgname_20170909.jpg','static/assets/HTB01/HT_DETAIL/gallery-image-8.jpg','2016-10-28 18:30:00','UserIdOfAdminUser','2016-11-04 18:30:00','UserIdOfAdminUser','HSR01',NULL,90),(13,'TEST001','TEST001','TEST001','TEST001','[1, 2, 3, 35, 36, 37]',NULL,'2016-11-18','2016-11-30',NULL,NULL,NULL,NULL,NULL,'2016-11-14 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(14,'TEST002','TEST002','TEST002','TEST002','[1, 2, 3, 34]',NULL,'2016-11-15','2016-11-29',NULL,NULL,NULL,NULL,NULL,'2016-11-14 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(15,'TEST003','TEST003','TEST003','TEST003','[1, 2, 3, 27, 28]',NULL,'2016-11-16','2016-11-30',NULL,NULL,NULL,NULL,NULL,'2016-11-14 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0),(16,'TEST004','TEST004','TEST004','TEST004','[1, 2]',NULL,'2016-11-24','2016-11-30',NULL,NULL,NULL,NULL,NULL,'2016-11-21 18:30:00','UserIdOfAdminUser',NULL,NULL,'',NULL,0);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_amenity`
--

DROP TABLE IF EXISTS `hotel_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_amenity` (
  `hotel_amenity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amenity_id` int(11) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hotel_amenity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_amenity`
--

LOCK TABLES `hotel_amenity` WRITE;
/*!40000 ALTER TABLE `hotel_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htl_login`
--

DROP TABLE IF EXISTS `htl_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htl_login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` varchar(4) NOT NULL DEFAULT 'A',
  `ref_key` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htl_login`
--

LOCK TABLES `htl_login` WRITE;
/*!40000 ALTER TABLE `htl_login` DISABLE KEYS */;
INSERT INTO `htl_login` VALUES (1,'admin','lv56FjDA8qRVwADdz/fT2A==','A','lv56FjDA8qRVwADdz/fT2A==','Customer'),(2,'sadmin','lv56FjDA8qRVwADdz/fT2A==','A','lv56FjDA8qRVwADdz/fT2A==','Admin');
/*!40000 ALTER TABLE `htl_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_desc` varchar(60) DEFAULT NULL,
  `room_thumb_img_link` varchar(256) DEFAULT NULL,
  `rt_thumb_img_link` varchar(256) DEFAULT NULL,
  `room_avlbl_start_date` date DEFAULT NULL,
  `room_avlbl_end_date` date DEFAULT NULL,
  `active_flag` varchar(10) DEFAULT NULL,
  `verified_flag` varchar(10) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `room_type_id` int(11) NOT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `room_number` varchar(45) NOT NULL,
  `bed_type_id` int(11) NOT NULL,
  `max_occ` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `room_type_id` (`room_type_id`),
  KEY `bed_type_id` (`bed_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (5,'Ok Did some correction',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',1,12,'101',1,2),(6,'Description',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',1,12,'102',2,2),(7,'Extra Child Correction',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',2,12,'201',3,4),(8,'Super Deluxe Correction',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',3,12,'301',1,4),(9,'MAINAK STANDARD',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',1,12,'103',2,3),(10,'MAINAK SUPER DELUXE',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-22 18:30:00','UserIdOfAdminUser',3,12,'302',2,4),(11,'MAINAK EXTRA CHILD',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',1,12,'104',3,3),(12,'One Serious Entry',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',2,12,'202',2,4),(13,'Hello This is Again Some Update',NULL,NULL,NULL,NULL,NULL,NULL,'2016-11-04 18:30:00','UserIdOfAdminUser','2016-11-05 18:30:00','UserIdOfAdminUser',1,12,'105',4,3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type` (
  `room_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `rt_desc` varchar(60) DEFAULT NULL,
  `rt_thumb_img_link` varchar(256) DEFAULT NULL,
  `rt_avlbl_start_date` date DEFAULT NULL,
  `rt_avlbl_end_date` date DEFAULT NULL,
  `use_room_type_avlbl` varchar(10) DEFAULT NULL,
  `active_flag` varchar(10) DEFAULT NULL,
  `verified_flag` varchar(10) DEFAULT NULL,
  `room_typecol` varchar(45) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'Standard',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Deluxe',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Super Deluxe',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Executive',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Royal',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `user_type` varchar(60) NOT NULL,
  `status` varchar(4) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','lv56FjDA8qRVwADdz/fT2A==','Admin','A');
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

-- Dump completed on 2017-09-10  2:07:00
