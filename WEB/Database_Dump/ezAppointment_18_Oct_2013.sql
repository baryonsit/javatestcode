-- MySQL dump 10.13  Distrib 5.1.45, for Win32 (ia32)
--
-- Host: localhost    Database: EzAppointment
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `tb_appointment`
--

DROP TABLE IF EXISTS `tb_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_appointment` (
  `appoint_id` int(3) NOT NULL AUTO_INCREMENT,
  `facility_id` int(3) NOT NULL,
  `user_id` int(3) DEFAULT NULL,
  `appoint_from_time` time DEFAULT NULL,
  `appoint_to_time` time DEFAULT NULL,
  `appoint_from_date` date DEFAULT NULL,
  `appoint_to_date` date DEFAULT NULL,
  `appointment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`appoint_id`),
  KEY `facility_id` (`facility_id`)
) ENGINE=MyISAM AUTO_INCREMENT=296 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_appointment`
--

LOCK TABLES `tb_appointment` WRITE;
/*!40000 ALTER TABLE `tb_appointment` DISABLE KEYS */;
INSERT INTO `tb_appointment` VALUES (202,108,112,'09:00:00','09:15:00','2010-05-13','2010-05-13','Cancelled'),(203,108,113,'09:00:00','09:15:00','2010-05-14','2010-05-14','Cancelled'),(205,108,113,'09:00:00','09:15:00','2010-05-16','2010-05-16','Cancelled'),(206,108,113,'09:00:00','09:15:00','2010-05-16','2010-05-16','Completed'),(207,108,113,'09:00:00','09:15:00','2010-05-18','2010-05-18','Booked'),(210,108,113,'09:15:00','09:30:00','2010-05-16','2010-05-16','Booked'),(211,108,113,'09:15:00','09:30:00','2010-05-17','2010-05-17','Booked'),(212,108,113,'09:15:00','09:30:00','2010-05-18','2010-05-18','Booked'),(213,108,114,'09:00:00','09:15:00','2010-06-11','2010-06-11','Booked'),(214,108,114,'10:00:00','10:15:00','2010-06-11','2010-06-11','Booked'),(215,108,114,'10:00:00','10:15:00','2010-06-12','2010-06-12','Booked'),(216,109,116,'14:40:00','15:50:00','2010-08-05','2010-08-05','Postponed'),(217,109,116,'12:20:00','13:30:00','2010-08-07','2010-08-07','Postponed'),(218,109,119,'15:50:00','17:00:00','2010-08-19','2010-08-19','Booked'),(219,110,122,'11:00:00','12:00:00','2010-08-22','2010-08-22','Cancelled'),(220,109,120,'11:10:00','12:20:00','2010-08-23','2010-08-23','Booked'),(221,110,122,'11:00:00','12:00:00','2010-08-24','2010-08-24','Cancelled'),(222,110,122,'11:00:00','12:00:00','2010-08-29','2010-08-29','Postponed'),(223,110,122,'12:00:00','13:00:00','2010-08-24','2010-08-24','Completed'),(224,110,122,'10:00:00','11:00:00','2010-09-01','2010-09-01','Cancelled'),(225,114,124,'13:00:00','14:00:00','2010-08-24','2010-08-24','Cancelled'),(226,114,124,'13:00:00','14:00:00','2010-08-24','2010-08-24','Completed'),(227,114,124,'18:00:00','19:00:00','2010-08-24','2010-08-24','Postponed'),(228,113,124,'09:00:00','10:00:00','2010-08-25','2010-08-25','Cancelled'),(229,113,124,'09:00:00','10:00:00','2010-09-01','2010-09-01','Cancelled'),(230,114,124,'09:00:00','10:00:00','2010-09-03','2010-09-03','Postponed'),(231,12,124,'13:00:00','13:15:00','2010-09-04','2010-09-04','Cancelled'),(232,113,124,'14:00:00','15:00:00','2010-09-04','2010-09-04','Cancelled'),(233,113,124,'15:00:00','16:00:00','2010-09-04','2010-09-04','Cancelled'),(234,113,124,'15:00:00','16:00:00','2010-09-04','2010-09-04','Cancelled'),(235,114,124,'16:00:00','17:00:00','2010-09-04','2010-09-04','Booked'),(236,114,124,'17:00:00','18:00:00','2010-09-04','2010-09-04','Booked'),(237,114,124,'17:00:00','18:00:00','2010-09-04','2010-09-04','Booked'),(238,114,124,'17:00:00','18:00:00','2010-09-04','2010-09-04','Booked'),(239,114,124,'18:00:00','19:00:00','2010-09-04','2010-09-04','Postponed'),(240,114,124,'09:00:00','10:00:00','2010-09-05','2010-09-05','Booked'),(241,114,124,'09:00:00','10:00:00','2010-09-05','2010-09-05','Booked'),(242,114,124,'10:00:00','11:00:00','2010-09-05','2010-09-05','Booked'),(243,114,124,'10:00:00','11:00:00','2010-09-05','2010-09-05','Booked'),(244,114,124,'11:00:00','12:00:00','2010-09-05','2010-09-05','Booked'),(245,114,124,'11:00:00','12:00:00','2010-09-06','2010-09-06','Booked'),(246,113,124,'11:00:00','12:00:00','2010-09-06','2010-09-06','Booked'),(247,109,124,'11:10:00','12:20:00','2010-09-06','2010-09-06','Booked'),(248,113,124,'14:00:00','15:00:00','2010-09-06','2010-09-06','Booked'),(249,113,124,'14:00:00','15:00:00','2010-09-06','2010-09-06','Booked'),(250,113,124,'14:00:00','15:00:00','2010-09-06','2010-09-06','Booked'),(251,113,124,'15:00:00','16:00:00','2010-09-06','2010-09-06','Booked'),(252,113,124,'15:00:00','16:00:00','2010-09-06','2010-09-06','Booked'),(253,113,124,'16:00:00','17:00:00','2010-09-06','2010-09-06','Booked'),(254,113,124,'16:00:00','17:00:00','2010-09-06','2010-09-06','Booked'),(255,113,124,'16:00:00','17:00:00','2010-09-06','2010-09-06','Booked'),(256,113,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(257,113,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(258,113,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(259,113,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(260,113,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(261,113,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(262,113,124,'18:00:00','19:00:00','2010-09-06','2010-09-06','Booked'),(263,113,124,'18:00:00','19:00:00','2010-09-06','2010-09-06','Booked'),(264,113,124,'09:00:00','10:00:00','2010-09-07','2010-09-07','Cancelled'),(265,114,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(266,114,124,'17:00:00','18:00:00','2010-09-06','2010-09-06','Booked'),(267,114,124,'18:00:00','19:00:00','2010-09-06','2010-09-06','Booked'),(268,114,124,'12:00:00','13:00:00','2010-09-07','2010-09-07','Cancelled'),(269,114,124,'09:00:00','10:00:00','2010-09-07','2010-09-07','Cancelled'),(270,114,124,'09:00:00','10:00:00','2010-09-07','2010-09-07','Booked'),(271,114,124,'09:00:00','10:00:00','2010-09-07','2010-09-07','Booked'),(272,114,124,'09:00:00','10:00:00','2010-09-07','2010-09-07','Booked'),(273,114,124,'09:00:00','10:00:00','2010-09-07','2010-09-07','Booked'),(274,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(275,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(276,113,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Cancelled'),(277,113,124,'16:00:00','17:00:00','2010-09-07','2010-09-07','Cancelled'),(278,113,124,'11:00:00','12:00:00','2010-09-08','2010-09-08','Booked'),(279,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(280,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(281,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(282,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(283,113,124,'10:00:00','11:00:00','2010-09-07','2010-09-07','Cancelled'),(284,113,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Booked'),(285,114,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Booked'),(286,114,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Booked'),(287,114,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Booked'),(288,114,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Booked'),(289,114,124,'11:00:00','12:00:00','2010-09-07','2010-09-07','Booked'),(290,114,124,'12:00:00','13:00:00','2010-09-07','2010-09-07','Booked'),(291,114,124,'13:00:00','14:00:00','2010-09-07','2010-09-07','Booked'),(292,114,124,'13:00:00','14:00:00','2010-09-07','2010-09-07','Cancelled'),(293,110,128,'16:00:00','17:00:00','2010-09-07','2010-09-07','Cancelled'),(294,110,128,'17:00:00','18:00:00','2010-09-07','2010-09-07','Cancelled'),(295,110,128,'16:00:00','17:00:00','2010-09-07','2010-09-07','Booked');
/*!40000 ALTER TABLE `tb_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_appointment_invitations`
--

DROP TABLE IF EXISTS `tb_appointment_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_appointment_invitations` (
  `invite_id` int(3) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(3) NOT NULL,
  `invite_type` varchar(20) NOT NULL,
  `address` varchar(62) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`invite_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_appointment_invitations`
--

LOCK TABLES `tb_appointment_invitations` WRITE;
/*!40000 ALTER TABLE `tb_appointment_invitations` DISABLE KEYS */;
INSERT INTO `tb_appointment_invitations` VALUES (1,121,'mail','radhikavkr68@gmail.com','radhika'),(2,121,'mail','jagadeesh.friends@gmail.com','jagadeesh'),(3,5,'sms','9986647687','radhika'),(54,5,'mail','asd','ad'),(55,5,'mail','gdf','gdfgd'),(56,5,'mail','gdfdfg','gdfgddfg'),(57,5,'mail','gdfdfg','radhikavkr68@gmail.com'),(58,5,'mail','erw','wre@g.com'),(59,5,'mail','erw','wre@g.com'),(60,5,'mail','erw','wre@g.com'),(61,5,'mail','erw','wre@g.com'),(62,5,'mail','erw','wre@g.com'),(63,5,'mail','erw','wre@g.com'),(64,5,'mail','erw','wre@g.com'),(65,135,'mail','Shankar','shankarg82@gmail.com'),(66,135,'mail','Shankar','shankargrediffmail.com'),(67,149,'mail','shankar','shankar@gg.com'),(68,149,'mail','shankar','shankar@gg.com'),(69,149,'mail','shankar','shankar@gg.com'),(70,149,'sms','sfdg','9876543213');
/*!40000 ALTER TABLE `tb_appointment_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_business`
--

DROP TABLE IF EXISTS `tb_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_business` (
  `business_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `business_name` varchar(60) DEFAULT NULL,
  `owner_name` varchar(35) DEFAULT NULL,
  `business_start` date DEFAULT NULL,
  `business_end` date DEFAULT NULL,
  `business_categoty` varchar(64) NOT NULL,
  `business_add1` varchar(100) DEFAULT NULL,
  `business_add2` varchar(100) DEFAULT NULL,
  `business_city` varchar(50) DEFAULT NULL,
  `business_zipcode` varchar(32) DEFAULT NULL,
  `business_stateid` int(11) DEFAULT NULL,
  `business_countryid` int(11) DEFAULT NULL,
  `business_desc` text,
  PRIMARY KEY (`business_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_business`
--

LOCK TABLES `tb_business` WRITE;
/*!40000 ALTER TABLE `tb_business` DISABLE KEYS */;
INSERT INTO `tb_business` VALUES (13,22,'beauty care','manjulaputtaiah','2009-09-07','2009-11-01','Beauty Parlour','#100 mainroadd 1\'st street','jhdsjhkjh','bangalore','560079',393,99,'beauty care \"vavavav\" kfdlds\'s hhl\'s. jhlkdfgtyutyuyt'),(18,49,'Beauty Care','Sarika Yellale','2009-04-10','2010-04-10','Beauty Parlour','#30 1st cross','main road','Udgir','896523',395,99,'Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. Beauty Care. '),(16,27,'Natural Beauty Care','Rashmi Hulsurkar','2009-04-02','2009-10-02','Beauty Parlour','#30, 1st cross, 1st main','main road, Vijaynagar','Bangalore','560077',393,99,'Natural Beauty Care. Natural Beauty Care. Natural Beauty Care. Natural Beauty Care. Natural Beauty Care. Natural Beauty Care. '),(17,29,'Sports Club','Radhika','2009-04-03','2009-04-17','Club','ghgjfgjhj','jghkghkgh','vghgjghj','2131231',1,99,'Sports Club. Sports Club. Sports Club. Sports Club. Sports Club. Sports Club. Sports Club. '),(27,65,'Apollo3','Nandini Apollo3','2009-04-21','2009-05-21','Hospital','Apollo3','bannergatta road3','bangalore','124587',384,99,'Apollo3Apollo3Apollo3Apollo3Apollo3Apollo3Apollo3Apollo3Apollo3'),(26,64,'Apollo2','Nandini Apollo2','2009-04-21','2009-05-21','Hospital','Apollo2','bannergatta road2','bangalore','124587',384,99,'Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2Apollo2'),(25,63,'Apollo1','Nandini Apollo1','2009-04-20','2009-07-20','Hospital','Apollo1','Apollo1Apollo1','bangalore','123321',69,13,'Apollo1Apollo1Apollo1Apollo1Apollo1Apollo1Apollo1'),(42,89,'Snookar Clud','Jagdish O. Malgar','2009-07-27','2009-10-27','Club','#10, shanthi nivas i\'st main \"Srinagar\"','\"Bangalore\" 58','Bangalore','560079',384,99,'this is the place for the people who love playing snooker or who are intrested to learn \"snookar\". Snookar\'s club invites u all'),(40,86,'Nishya Sports Club','Nishya Jagdish Malgar','2009-07-09','2009-08-09','Club','#13 srinivaas nagar','main street','Bangalore','560089',384,99,'Nishya Sports Club. The place for all kinds of sports.'),(43,90,'Snookar Clud1','Jagdish O. Malgar','2009-07-27','2009-10-27','Club','fgdfgdfg','hfgfhhgfh','Bangalore','560079',384,99,'ffffff ggggggggggggg'),(45,93,'testBusiness','testowner','2009-08-06','2009-08-29','Beauty Parlour','#99-99/09, \" yyyyy\" 5\'th main','#99-99/09, \" yyyyy\" 5\'th main','hjkhj','560079',384,99,'hjkh'),(44,91,'Snookar Clud2','Jagdish O. Malgar','2009-07-01','2010-01-27','Beauty Parlour','#10, shanthi nivas i\'st main \"Srinagar\"','\"Bangalore\" 58','Bangalore','560079',384,99,'mvmvmvbmvmvbmvbm mvmvbmvbmvm'),(55,108,'only for test','test owner ','2009-09-03','2010-09-01','Beauty Parlour','Address Line1','Address Line2','bangalore','123456',384,99,'jhghjghjghj'),(47,95,'Bary Soft Soutions','hemanth','2009-01-05','2010-08-19','Beauty Parlour','GG Ready layout','Mico layout','Bangalore','635109',384,99,'Test appointment'),(48,97,'Bary Soft Sou','hemanth','2009-08-19','2009-08-23','Club','GG Ready layout','Mico layout','Bangalore','635109',384,99,'hjghjghj'),(49,98,'Only Sports','Shankar G','2009-09-03','2010-09-02','Club','near apollo hospital','bannergatta main road','bangoloreeeee','560088',385,99,'this is for all the sport loving people'),(52,102,'Anjana Clinic','Anjana Devi','2009-09-01','2010-09-17','Hospital','dhjsdhfjshdfj','jhdjhfjsdfh','bangalore','560017',394,99,'Anjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana ClinicAnjana Clinic'),(51,101,'Vivek Clinic','Vivek Kumar','2009-09-01','2010-09-04','Hospital','gsdgdgs','gsgsdgsd','bbssd','125463',394,99,'description does here'),(53,106,'Beauty parlour','Surya','2009-09-19','2009-09-26','Beauty Parlour','467klhgjh jhfjk','jdhdkdgdfgu','bangalore','560089',384,99,'It is ver good'),(56,109,'Health Care','Swate','2010-05-12','2010-05-31','Club','marathalli','','bangaore','560037',393,99,'It all about how to take care of your health.'),(57,112,'Matoshree Hospitals','vijayshree bashatti','2010-05-10','2010-08-12','Hospital','Matoshree Hospitals','behind railway station','Bidar','585401',385,99,'Well come to Matoshree Hospitals...'),(58,115,'nimhans','avinash','2006-04-15','2012-04-30','Hospital','arekare layout','','bangalore','560068',412,99,'all is well.....'),(60,120,'sportstar','deep','2010-08-01','2015-08-15','Club','arekare layout','nasfhlafs','bangalore','560068',400,99,'dmklsgldlkjd'),(61,123,'parlour','kumarr','2010-08-10','2020-08-26','Beauty Parlour','no.4 gandhi street','','bangalore','560068',400,99,'smarter.........'),(62,125,'gents parlour','kumarr','2010-08-10','2013-08-09','Beauty Parlour','no.4 gandhi street','','bangalore','560068',400,99,'dbgfhasgfjkhsdnklgtjfln'),(63,126,'gents ','kumarr','2010-08-10','2013-08-09','Beauty Parlour','no.4 gandhi street','','bangalore','560068',400,99,'dbgfhasgfjkhsdnklgtjfln'),(64,129,'asasds','dsfsadf','2013-05-22','2013-05-31','Club','dfsfdsf','dsfsdfds','ban','464613',400,99,'dsfdsefgdsfgdsfsadf dfgvdsfx dxfwer');
/*!40000 ALTER TABLE `tb_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_business_settings`
--

DROP TABLE IF EXISTS `tb_business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_business_settings` (
  `business_id` int(3) DEFAULT NULL,
  `user_activation` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_business_settings`
--

LOCK TABLES `tb_business_settings` WRITE;
/*!40000 ALTER TABLE `tb_business_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `category_id` int(3) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (1,'Beauty Parlour'),(2,'Club'),(3,'Hospital');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_country`
--

DROP TABLE IF EXISTS `tb_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_country`
--

LOCK TABLES `tb_country` WRITE;
/*!40000 ALTER TABLE `tb_country` DISABLE KEYS */;
INSERT INTO `tb_country` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'American Samoa'),(5,'Andorra'),(6,'Angola'),(7,'Anguilla'),(8,'Antarctica'),(9,'Antigua and Barbuda'),(10,'Argentina'),(11,'Armenia'),(12,'Aruba'),(13,'Australia'),(14,'Austria'),(15,'Azerbaijan'),(16,'Bahamas'),(17,'Bahrain'),(18,'Bangladesh'),(19,'Barbados'),(20,'Belarus'),(21,'Belgium'),(22,'Belize'),(23,'Benin'),(24,'Bermuda'),(25,'Bhutan'),(26,'Bolivia'),(27,'Bosnia and Herzegowina'),(28,'Botswana'),(29,'Bouvet Island'),(30,'Brazil'),(31,'British Indian Ocean Territory'),(32,'Brunei Darussalam'),(33,'Bulgaria'),(34,'Burkina Faso'),(35,'Burundi'),(36,'Cambodia'),(37,'Cameroon'),(38,'Canada'),(39,'Cape Verde'),(40,'Cayman Islands'),(41,'Central African Republic'),(42,'Chad'),(43,'Chile'),(44,'China'),(45,'Christmas Island'),(46,'Cocos (Keeling) Islands'),(47,'Colombia'),(48,'Comoros'),(49,'Congo'),(50,'Cook Islands'),(51,'Costa Rica'),(52,'Cote D\'Ivoire'),(53,'Croatia'),(54,'Cuba'),(55,'Cyprus'),(56,'Czech Republic'),(57,'Denmark'),(58,'Djibouti'),(59,'Dominica'),(60,'Dominican Republic'),(61,'East Timor'),(62,'Ecuador'),(63,'Egypt'),(64,'El Salvador'),(65,'Equatorial Guinea'),(66,'Eritrea'),(67,'Estonia'),(68,'Ethiopia'),(69,'Falkland Islands (Malvinas)'),(70,'Faroe Islands'),(71,'Fiji'),(72,'Finland'),(73,'France'),(74,'France, Metropolitan'),(75,'French Guiana'),(76,'French Polynesia'),(77,'French Southern Territories'),(78,'Gabon'),(79,'Gambia'),(80,'Georgia'),(81,'Germany'),(82,'Ghana'),(83,'Gibraltar'),(84,'Greece'),(85,'Greenland'),(86,'Grenada'),(87,'Guadeloupe'),(88,'Guam'),(89,'Guatemala'),(90,'Guinea'),(91,'Guinea-bissau'),(92,'Guyana'),(93,'Haiti'),(94,'Heard and Mc Donald Islands'),(95,'Honduras'),(96,'Hong Kong'),(97,'Hungary'),(98,'Iceland'),(99,'India'),(100,'Indonesia'),(101,'Iran (Islamic Republic of)'),(102,'Iraq'),(103,'Ireland'),(104,'Israel'),(105,'Italy'),(106,'Jamaica'),(107,'Japan'),(108,'Jordan'),(109,'Kazakhstan'),(110,'Kenya'),(111,'Kiribati'),(112,'Korea, Democratic People\'s Republic of'),(113,'Korea, Republic of'),(114,'Kuwait'),(115,'Kyrgyzstan'),(116,'Lao People\'s Democratic Republic'),(117,'Latvia'),(118,'Lebanon'),(119,'Lesotho'),(120,'Liberia'),(121,'Libyan Arab Jamahiriya'),(122,'Liechtenstein'),(123,'Lithuania'),(124,'Luxembourg'),(125,'Macau'),(126,'Macedonia, The Former Yugoslav Republic of'),(127,'Madagascar'),(128,'Malawi'),(129,'Malaysia'),(130,'Maldives'),(131,'Mali'),(132,'Malta'),(133,'Marshall Islands'),(134,'Martinique'),(135,'Mauritania'),(136,'Mauritius'),(137,'Mayotte'),(138,'Mexico'),(139,'Micronesia, Federated States of'),(140,'Moldova, Republic of'),(141,'Monaco'),(142,'Mongolia'),(143,'Montserrat'),(144,'Morocco'),(145,'Mozambique'),(146,'Myanmar'),(147,'Namibia'),(148,'Nauru'),(149,'Nepal'),(150,'Netherlands'),(151,'Netherlands Antilles'),(152,'New Caledonia'),(153,'New Zealand'),(154,'Nicaragua'),(155,'Niger'),(156,'Nigeria'),(157,'Niue'),(158,'Norfolk Island'),(159,'Northern Mariana Islands'),(160,'Norway'),(161,'Oman'),(162,'Pakistan'),(163,'Palau'),(164,'Panama'),(165,'Papua New Guinea'),(166,'Paraguay'),(167,'Peru'),(168,'Philippines'),(169,'Pitcairn'),(170,'Poland'),(171,'Portugal'),(172,'Puerto Rico'),(173,'Qatar'),(174,'Reunion'),(175,'Romania'),(176,'Russian Federation'),(177,'Rwanda'),(178,'Saint Kitts and Nevis'),(179,'Saint Lucia'),(180,'Saint Vincent and the Grenadines'),(181,'Samoa'),(182,'San Marino'),(183,'Sao Tome and Principe'),(184,'Saudi Arabia'),(185,'Senegal'),(186,'Seychelles'),(187,'Sierra Leone'),(188,'Singapore'),(189,'Slovakia (Slovak Republic)'),(190,'Slovenia'),(191,'Solomon Islands'),(192,'Somalia'),(193,'South Africa'),(194,'South Georgia and the South Sandwich Islands'),(195,'Spain'),(196,'Sri Lanka'),(197,'St. Helena'),(198,'St. Pierre and Miquelon'),(199,'Sudan'),(200,'Suriname'),(201,'Svalbard and Jan Mayen Islands'),(202,'Swaziland'),(203,'Sweden'),(204,'Switzerland'),(205,'Syrian Arab Republic'),(206,'Taiwan'),(207,'Tajikistan'),(208,'Tanzania, United Republic of'),(209,'Thailand'),(210,'Togo'),(211,'Tokelau'),(212,'Tonga'),(213,'Trinidad and Tobago'),(214,'Tunisia'),(215,'Turkey'),(216,'Turkmenistan'),(217,'Turks and Caicos Islands'),(218,'Tuvalu'),(219,'Uganda'),(220,'Ukraine'),(221,'United Arab Emirates'),(222,'United Kingdom'),(223,'United States'),(224,'United States Minor Outlying Islands'),(225,'Uruguay'),(226,'Uzbekistan'),(227,'Vanuatu'),(228,'Vatican City State (Holy See)'),(229,'Venezuela'),(230,'Viet Nam'),(231,'Virgin Islands (British)'),(232,'Virgin Islands (U.S.)'),(233,'Wallis and Futuna Islands'),(234,'Western Sahara'),(235,'Yemen'),(236,'Yugoslavia'),(237,'The Democratic Republic of Congo'),(238,'Zambia'),(239,'Zimbabwe'),(240,'East Timor'),(241,'Jersey'),(242,'St. Barthelemy'),(243,'St. Eustatius'),(244,'Canary Islands');
/*!40000 ALTER TABLE `tb_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_currency`
--

DROP TABLE IF EXISTS `tb_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_currency` (
  `currency_id` int(3) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_currency`
--

LOCK TABLES `tb_currency` WRITE;
/*!40000 ALTER TABLE `tb_currency` DISABLE KEYS */;
INSERT INTO `tb_currency` VALUES (1,'INR'),(2,'RUB'),(3,'US$');
/*!40000 ALTER TABLE `tb_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_facilities`
--

DROP TABLE IF EXISTS `tb_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_facilities` (
  `facility_id` int(3) NOT NULL AUTO_INCREMENT,
  `facility_business_id` int(3) NOT NULL,
  `facility_name` varchar(64) NOT NULL,
  `facility_type` varchar(16) NOT NULL,
  `facility_from_date` date DEFAULT NULL,
  `facility_to_date` date DEFAULT NULL,
  `facility_from_time` time DEFAULT NULL,
  `facility_to_time` time DEFAULT NULL,
  `time_per_slot` time DEFAULT NULL,
  `members_per_slot` int(3) DEFAULT NULL,
  `facility_desc` varchar(256) NOT NULL,
  `facility_add1` varchar(256) NOT NULL,
  `facility_add2` varchar(256) NOT NULL,
  `facility_city` varchar(50) DEFAULT NULL,
  `facility_zip_code` varchar(32) DEFAULT NULL,
  `facility_state_id` int(11) DEFAULT NULL,
  `facility_country_id` int(11) DEFAULT NULL,
  `facility_contact_no` varchar(15) NOT NULL,
  `facility_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_facilities`
--

LOCK TABLES `tb_facilities` WRITE;
/*!40000 ALTER TABLE `tb_facilities` DISABLE KEYS */;
INSERT INTO `tb_facilities` VALUES (36,2,'testing','public','2009-04-15','2009-04-14','03:00:00','06:00:00','00:30:00',1,'jkljkl','kljkl','kljlk','kljkl','121',384,0,'21','open'),(12,13,'Test','public','2009-01-10','2012-06-21','13:00:00','16:00:00','00:15:00',6,'testing Description','address1','address2','bangalore','555555',384,2,'55555','open'),(28,17,'facility1','public','2009-04-07','2010-03-07','10:00:00','15:00:00','00:30:00',1,'gjfjfgj','jjfgjgfjg','gjgfjgfj','fdhdfhf','123456',384,99,'1123121312123','open'),(30,17,'facility2','public','2009-04-08','2009-07-08','11:00:00','14:00:00','00:30:00',1,'hgfhgfhgfhh','jjfgjgfjg','gjgfjgfj','fdhdfhf','123456',384,0,'1123121312123','open'),(91,13,'fortesting','public','2009-01-01','2010-02-01','09:00:00','20:00:00','00:30:00',1,'test facility','cvxcv','cxvcv','cxvcxv','123456',384,0,'232323','open'),(73,18,'jhkhjk','public','2009-04-14','2009-04-13','05:00:00','06:00:00','00:10:00',6,'jkljkl','jkljk','jklkj','jkl','jkl',386,0,'jkl','active'),(77,13,'Testyyyy','public','2009-04-22','2009-11-24','05:00:00','10:30:00','00:30:00',40,'hjkhjk','hjkh','jkjkhjk','hjkhjk','4541452',384,0,'4565','open'),(93,45,'testkkkkk','public','2009-08-04','2009-08-21','06:00:00','14:00:00','12:20:00',33,'#99/99-99, 5th main \"gdfgd\" 6\'th cross','#99/99-99, 5th main \"gdfgd\" 6\'th cross','#99/99-99, 5th main \"gdfgd\" 6\'th cross','ghjgjgh','111111',392,0,'0123456789','open'),(88,13,'sdfdsfdsf','public','2009-07-07','2009-07-18','09:00:00','23:00:00','05:00:00',99,'sdfds','dfdsfyu','sdfsdf','sdfsdds','888888',391,0,'999999','open'),(80,25,'fac1 in apollo1','public','2009-04-21','2009-05-21','10:00:00','18:00:00','00:30:00',1,'fac1 in apollo1fac1 in apollo1fac1 in apollo1fac1 in apollo1fac1 in apollo1','Apollo1','Apollo1Apollo1','bangalore','123321',384,0,'123456','open'),(81,26,'fac1 in apollo2','public','2009-04-21','2009-04-21','10:00:00','18:00:00','00:30:00',1,'Apollo2Apollo2Apollo2','Apollo2','bannergatta road2','bangalore','124587',384,0,'123456','open'),(82,27,'fac1 in apollo3','public','2009-04-21','2009-04-21','10:00:00','18:00:00','00:30:00',1,'Apollo3Apollo3Apollo3Apollo3Apollo3Apollo3\r\nApollo3Apollo3Apollo3','Apollo3','bannergatta road3','bangalore','124587',384,0,'123456','open'),(108,57,'Routine Checkup','public','2010-05-09','2010-09-09','09:00:00','18:00:00','00:15:00',1,'This is a Routine Checkup facility','Matoshree Hospitals','behind railway station','Bidar','585401',385,99,'123456','open'),(94,45,'testkkkkkh','public','2009-08-12','2009-08-26','08:05:00','20:10:00','06:00:00',11,'fdgdfgdf','dfdsfyu','address2','cxvcxv','888888',384,0,'12345678','open'),(95,45,'facilitypp','public','2009-08-06','2009-08-27','05:00:00','16:00:00','02:00:00',6,'dfgdf','dfgd','dfg','dfg','123456',384,0,'999999','open'),(97,13,'Baryons Facility','public','2009-09-10','2009-09-30','08:00:00','19:00:00','13:00:00',4,'Baryons Facility ','#100 mainroadd 1\'st street','jhdsjhkjh','gdfgdfg','560079',0,0,'9789133765','open'),(98,47,'Contcat Us','public','2008-08-22','2010-08-22','10:00:00','15:00:00','02:00:00',1,'You can contact us for yos solutions','GG Ready layout','Mico layout','Bangalore','635109',384,0,'23453467','open'),(99,48,'Contcat Us','private','2009-08-01','2009-08-30','06:00:00','17:00:00','01:00:00',4,'ggffh','GG Ready layout','Mico layout','Bangalore','635109',384,0,'23453467','open'),(100,49,'swimming pool','public','2009-06-03','2009-12-02','06:00:00','18:00:00','00:30:00',5,'swimming pool facility','near apollo hospital','bannergatta main road','bangolore','560088',384,0,'123456','open'),(101,49,'Foot Ball Ground','private','2009-09-01','2010-01-03','06:00:00','20:00:00','01:00:00',11,'this is a foot ball ground','near apollo hospital','bannergatta main road','bangolore','560088',390,99,'123456','open'),(102,49,'tesggggg','public','2009-09-01','2010-09-01','06:00:00','18:00:00','00:15:00',1,'i\'am a \"Good\" girl. so, i came eary.','near apollo hospital','bannergatta main road','bangolore','560088',384,99,'123654789','open'),(105,49,'test on ie','private','2009-09-11','2009-12-10','08:00:00','20:00:00','00:30:00',1,'this is des part.\"ok\",(it\'s just for testing).','near apollo hospital','bannergatta main road','bangolore','560088',385,99,'123456789','open'),(106,13,'nandini','private','2009-09-12','2009-09-23','04:00:00','15:00:00','00:30:00',1,'jljljl','llhj','ljljlh','ljlhj','132313',384,99,'12323123','open'),(107,52,'anjana facone','public','2009-09-01','2009-12-18','09:00:00','20:00:00','00:15:00',1,'anjana facone. \"anjana facone\", \'anjana facone\'.','dhjsdhfjshdfj','jhdjhfjsdfh','bangalore','560017',394,99,'123789654','open'),(109,58,'operation','public','2006-04-15','2012-04-14','10:00:00','20:40:00','01:10:00',6,'all is well...','arekare layout','','bangalore','560068',412,99,'9166228870','open'),(110,60,'materials','public','2010-08-12','2013-08-21','10:00:00','20:40:00','01:00:00',4,'sssss','arekare layout','nasfhlafs','bangalore','560068',400,99,'123456789','open'),(112,60,'dsgas','public','2010-08-17','2013-08-24','07:00:00','20:00:00','01:00:00',5,'gfjksdhgi','arekare layout','nasfhlafs','bangalore','560068',400,99,'','open'),(113,61,'ladies parlour','private','2010-08-10','2013-08-17','09:00:00','19:00:00','01:00:00',5,'brighter','no.4 gandhi street','','bangalore','560068',384,99,'123456','open'),(114,61,'gents parlour','public','2010-08-17','2015-08-20','09:00:00','19:00:00','01:00:00',5,'brighter','no.4 gandhi street','','bangalore','560068',384,99,'1234789','open'),(115,64,'adsa','public','2013-05-23','2013-05-30','10:00:00','20:30:00','04:00:00',4,'fghdfgh','dfsfdsf','dsfsdfds','ban','464613',400,99,'9874563210','open'),(116,64,'dfvds','public','2013-05-24','2013-05-28','06:00:00','18:00:00','03:05:00',5,'dfgdfg','dfsfdsf','dsfsdfds','ban','464613',400,99,'1230456780','open'),(117,64,'dsfgds','public','2013-05-22','2013-05-30','09:00:00','20:00:00','06:00:00',2,'dfhbdfgh','dfsfdsf','dsfsdfds','ban','464613',400,99,'4613933214','open'),(123,64,'cvcxvb','public','2013-05-22','2013-05-24','08:00:00','20:25:00','05:00:00',14,'bfb','dfsfdsf','dsfsdfds','ban','464613',400,99,'3214567890','open'),(124,64,'cvcx','public','2013-05-22','2013-05-31','04:00:00','10:25:00','02:00:00',6,'ddfgdfgdfgf dfgdgdd','dfsfdsf','dsfsdfds','ban','464613',400,99,'9842156021','open');
/*!40000 ALTER TABLE `tb_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_function_permissions`
--

DROP TABLE IF EXISTS `tb_function_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_function_permissions` (
  `permission_id` int(3) NOT NULL AUTO_INCREMENT,
  `function_id` int(3) NOT NULL,
  `role_id` int(3) NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `function_id` (`function_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_function_permissions`
--

LOCK TABLES `tb_function_permissions` WRITE;
/*!40000 ALTER TABLE `tb_function_permissions` DISABLE KEYS */;
INSERT INTO `tb_function_permissions` VALUES (1,1,2),(2,2,2),(3,3,2),(4,4,2),(24,22,1),(23,21,1),(22,20,2),(21,19,2),(20,18,2),(19,17,2),(18,16,3),(17,15,3),(16,14,3),(15,13,2),(14,7,2),(13,12,3),(12,12,2),(11,12,1),(10,6,3),(9,5,3),(8,11,1),(7,10,1),(6,9,1),(5,8,1),(25,23,1);
/*!40000 ALTER TABLE `tb_function_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_functions`
--

DROP TABLE IF EXISTS `tb_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_functions` (
  `function_id` int(3) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_functions`
--

LOCK TABLES `tb_functions` WRITE;
/*!40000 ALTER TABLE `tb_functions` DISABLE KEYS */;
INSERT INTO `tb_functions` VALUES (1,'create_facility'),(2,'update_facility'),(3,'view_facilitylist'),(4,'delete_facility'),(22,'delete_business_owner'),(21,'activate_business'),(20,'update_owner_profile'),(19,'create_business_owner'),(18,'delete_business_user'),(17,'change_account_status'),(16,'update_user_profile'),(15,'create_business_user'),(14,'send_invites'),(13,'search_appointments'),(12,'search_business'),(11,'update_subscription'),(10,'delete_subscription'),(9,'view_subscriptionlist'),(8,'create_subscription'),(7,'change_appointment_status'),(6,'cancel_appointment'),(5,'create_appointment'),(23,'global_settings');
/*!40000 ALTER TABLE `tb_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_global_settings`
--

DROP TABLE IF EXISTS `tb_global_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_global_settings` (
  `setting_id` int(3) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(64) DEFAULT NULL,
  `param_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_global_settings`
--

LOCK TABLES `tb_global_settings` WRITE;
/*!40000 ALTER TABLE `tb_global_settings` DISABLE KEYS */;
INSERT INTO `tb_global_settings` VALUES (1,'default_country','99'),(2,'default_currency','1'),(3,'default_country_by_bo','99');
/*!40000 ALTER TABLE `tb_global_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `role_id` int(3) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'SuperAdministrator'),(2,'Administrator'),(3,'BusinessUsers');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_states`
--

DROP TABLE IF EXISTS `tb_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=417 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_states`
--

LOCK TABLES `tb_states` WRITE;
/*!40000 ALTER TABLE `tb_states` DISABLE KEYS */;
INSERT INTO `tb_states` VALUES (1,223,'Alabama'),(2,223,'Alaska'),(3,223,'Arizona'),(4,223,'Arkansas'),(5,223,'California'),(6,223,'Colorado'),(7,223,'Connecticut'),(8,223,'Delaware'),(9,223,'District Of Columbia'),(10,223,'Florida'),(11,223,'Georgia'),(12,223,'Hawaii'),(13,223,'Idaho'),(14,223,'Illinois'),(15,223,'Indiana'),(16,223,'Iowa'),(17,223,'Kansas'),(18,223,'Kentucky'),(19,223,'Louisiana'),(20,223,'Maine'),(21,223,'Maryland'),(22,223,'Massachusetts'),(23,223,'Michigan'),(24,223,'Minnesota'),(25,223,'Mississippi'),(26,223,'Missouri'),(27,223,'Montana'),(28,223,'Nebraska'),(29,223,'Nevada'),(30,223,'New Hampshire'),(31,223,'New Jersey'),(32,223,'New Mexico'),(33,223,'New York'),(34,223,'North Carolina'),(35,223,'North Dakota'),(36,223,'Ohio'),(37,223,'Oklahoma'),(38,223,'Oregon'),(39,223,'Pennsylvania'),(40,223,'Rhode Island'),(41,223,'South Carolina'),(42,223,'South Dakota'),(43,223,'Tennessee'),(44,223,'Texas'),(45,223,'Utah'),(46,223,'Vermont'),(47,223,'Virginia'),(48,223,'Washington'),(49,223,'West Virginia'),(50,223,'Wisconsin'),(51,223,'Wyoming'),(52,38,'Alberta'),(53,38,'British Columbia'),(54,38,'Manitoba'),(55,38,'New Brunswick'),(56,38,'Newfoundland and Labrador'),(57,38,'Northwest Territories'),(58,38,'Nova Scotia'),(59,38,'Nunavut'),(60,38,'Ontario'),(61,38,'Prince Edward Island'),(62,38,'Quebec'),(63,38,'Saskatchewan'),(64,38,'Yukon'),(65,222,'England'),(66,222,'Northern Ireland'),(67,222,'Scotland'),(68,222,'Wales'),(69,13,'Australian Capital Territory'),(70,13,'New South Wales'),(71,13,'Northern Territory'),(72,13,'Queensland'),(73,13,'South Australia'),(74,13,'Tasmania'),(75,13,'Victoria'),(76,13,'Western Australia'),(77,138,'Aguascalientes'),(78,138,'Baja California Norte'),(79,138,'Baja California Sur'),(80,138,'Campeche'),(81,138,'Chiapas'),(82,138,'Chihuahua'),(83,138,'Coahuila'),(84,138,'Colima'),(85,138,'Distrito Federal'),(86,138,'Durango'),(87,138,'Guanajuato'),(88,138,'Guerrero'),(89,138,'Hidalgo'),(90,138,'Jalisco'),(91,138,'M'),(92,138,'Michoac'),(93,138,'Morelos'),(94,138,'Nayarit'),(95,138,'Nuevo Le'),(96,138,'Oaxaca'),(97,138,'Puebla'),(98,138,'Quer'),(99,138,'Quintana Roo'),(100,138,'San Luis Potos'),(101,138,'Sinaloa'),(102,138,'Sonora'),(103,138,'Tabasco'),(104,138,'Tamaulipas'),(105,138,'Tlaxcala'),(106,138,'Veracruz'),(107,138,'Yucat'),(108,138,'Zacatecas'),(109,30,'Acre'),(110,30,'Alagoas'),(111,30,'Amap'),(112,30,'Amazonas'),(113,30,'Bah'),(114,30,'Cear'),(115,30,'Distrito Federal'),(116,30,'Espirito Santo'),(117,30,'Goi'),(118,30,'Maranh'),(119,30,'Mato Grosso'),(120,30,'Mato Grosso do Sul'),(121,30,'Minas Gera'),(122,30,'Paran'),(123,30,'Para'),(124,30,'Par'),(125,30,'Pernambuco'),(126,30,'Piau'),(127,30,'Rio Grande do Norte'),(128,30,'Rio Grande do Sul'),(129,30,'Rio de Janeiro'),(130,30,'Rond'),(131,30,'Roraima'),(132,30,'Santa Catarina'),(133,30,'Sergipe'),(134,30,'S'),(135,30,'Tocantins'),(136,44,'Anhui'),(137,44,'Beijing'),(138,44,'Chongqing'),(139,44,'Fujian'),(140,44,'Gansu'),(141,44,'Guangdong'),(142,44,'Guangxi Zhuang'),(143,44,'Guizhou'),(144,44,'Hainan'),(145,44,'Hebei'),(146,44,'Heilongjiang'),(147,44,'Henan'),(148,44,'Hubei'),(149,44,'Hunan'),(150,44,'Jiangsu'),(151,44,'Jiangxi'),(152,44,'Jilin'),(153,44,'Liaoning'),(154,44,'Nei Mongol'),(155,44,'Ningxia Hui'),(156,44,'Qinghai'),(157,44,'Shandong'),(158,44,'Shanghai'),(159,44,'Shaanxi'),(160,44,'Sichuan'),(161,44,'Tianjin'),(162,44,'Xinjiang Uygur'),(163,44,'Xizang'),(164,44,'Yunnan'),(165,44,'Zhejiang'),(166,104,'Gaza Strip'),(167,104,'West Bank'),(168,104,'Other'),(169,151,'St. Maarten'),(170,151,'Bonaire'),(171,151,'Curacao'),(172,175,'Alba'),(173,175,'Arad'),(174,175,'Arges'),(175,175,'Bacau'),(176,175,'Bihor'),(177,175,'Bistrita-Nasaud'),(178,175,'Botosani'),(179,175,'Braila'),(180,175,'Brasov'),(181,175,'Bucuresti'),(182,175,'Buzau'),(183,175,'Calarasi'),(184,175,'Caras Severin'),(185,175,'Cluj'),(186,175,'Constanta'),(187,175,'Covasna'),(188,175,'Dambovita'),(189,175,'Dolj'),(190,175,'Galati'),(191,175,'Giurgiu'),(192,175,'Gorj'),(193,175,'Hargita'),(194,175,'Hunedoara'),(195,175,'Ialomita'),(196,175,'Iasi'),(197,175,'Ilfov'),(198,175,'Maramures'),(199,175,'Mehedinti'),(200,175,'Mures'),(201,175,'Neamt'),(202,175,'Olt'),(203,175,'Prahova'),(204,175,'Salaj'),(205,175,'Satu Mare'),(206,175,'Sibiu'),(207,175,'Suceava'),(208,175,'Teleorman'),(209,175,'Timis'),(210,175,'Tulcea'),(211,175,'Valcea'),(212,175,'Vaslui'),(213,175,'Vreancea'),(214,105,'Agrigento'),(215,105,'Alessandria'),(216,105,'Ancona'),(217,105,'Aosta'),(218,105,'Arezzo'),(219,105,'Ascoli Piceno'),(220,105,'Asti'),(221,105,'Avellino'),(222,105,'Bari'),(223,105,'Belluno'),(224,105,'Benevento'),(225,105,'Bergamo'),(226,105,'Biella'),(227,105,'Bologna'),(228,105,'Bolzano'),(229,105,'Brescia'),(230,105,'Brindisi'),(231,105,'Cagliari'),(232,105,'Caltanissetta'),(233,105,'Campobasso'),(234,105,'Carbonia-Iglesias'),(235,105,'Caserta'),(236,105,'Catania'),(237,105,'Catanzaro'),(238,105,'Chieti'),(239,105,'Como'),(240,105,'Cosenza'),(241,105,'Cremona'),(242,105,'Crotone'),(243,105,'Cuneo'),(244,105,'Enna'),(245,105,'Ferrara'),(246,105,'Firenze'),(247,105,'Foggia'),(248,105,'Forli-Cesena'),(249,105,'Frosinone'),(250,105,'Genova'),(251,105,'Gorizia'),(252,105,'Grosseto'),(253,105,'Imperia'),(254,105,'Isernia'),(255,105,'L\'Aquila'),(256,105,'La Spezia'),(257,105,'Latina'),(258,105,'Lecce'),(259,105,'Lecco'),(260,105,'Livorno'),(261,105,'Lodi'),(262,105,'Lucca'),(263,105,'Macerata'),(264,105,'Mantova'),(265,105,'Massa-Carrara'),(266,105,'Matera'),(267,105,'Medio Campidano'),(268,105,'Messina'),(269,105,'Milano'),(270,105,'Modena'),(271,105,'Napoli'),(272,105,'Novara'),(273,105,'Nuoro'),(274,105,'Ogliastra'),(275,105,'Olbia-Tempio'),(276,105,'Oristano'),(277,105,'Padova'),(278,105,'Palermo'),(279,105,'Parma'),(280,105,'Pavia'),(281,105,'Perugia'),(282,105,'Pesaro e Urbino'),(283,105,'Pescara'),(284,105,'Piacenza'),(285,105,'Pisa'),(286,105,'Pistoia'),(287,105,'Pordenone'),(288,105,'Potenza'),(289,105,'Prato'),(290,105,'Ragusa'),(291,105,'Ravenna'),(292,105,'Reggio Calabria'),(293,105,'Reggio Emilia'),(294,105,'Rieti'),(295,105,'Rimini'),(296,105,'Roma'),(297,105,'Rovigo'),(298,105,'Salerno'),(299,105,'Sassari'),(300,105,'Savona'),(301,105,'Siena'),(302,105,'Siracusa'),(303,105,'Sondrio'),(304,105,'Taranto'),(305,105,'Teramo'),(306,105,'Terni'),(307,105,'Torino'),(308,105,'Trapani'),(309,105,'Trento'),(310,105,'Treviso'),(311,105,'Trieste'),(312,105,'Udine'),(313,105,'Varese'),(314,105,'Venezia'),(315,105,'Verbano Cusio Ossola'),(316,105,'Vercelli'),(317,105,'Verona'),(318,105,'Vibo Valenzia'),(319,105,'Vicenza'),(320,105,'Viterbo'),(321,195,'A Coru'),(322,195,'Alava'),(323,195,'Albacete'),(324,195,'Alicante'),(325,195,'Almeria'),(326,195,'Asturias'),(327,195,'Avila'),(328,195,'Badajoz'),(329,195,'Baleares'),(330,195,'Barcelona'),(331,195,'Burgos'),(332,195,'Caceres'),(333,195,'Cadiz'),(334,195,'Cantabria'),(335,195,'Castellon'),(336,195,'Ceuta'),(337,195,'Ciudad Real'),(338,195,'Cordoba'),(339,195,'Cuenca'),(340,195,'Girona'),(341,195,'Granada'),(342,195,'Guadalajara'),(343,195,'Guipuzcoa'),(344,195,'Huelva'),(345,195,'Huesca'),(346,195,'Jaen'),(347,195,'La Rioja'),(348,195,'Las Palmas'),(349,195,'Leon'),(350,195,'Lleida'),(351,195,'Lugo'),(352,195,'Madrid'),(353,195,'Malaga'),(354,195,'Melilla'),(355,195,'Murcia'),(356,195,'Navarra'),(357,195,'Ourense'),(358,195,'Palencia'),(359,195,'Pontevedra'),(360,195,'Salamanca'),(361,195,'Santa Cruz de Tenerife'),(362,195,'Segovia'),(363,195,'Sevilla'),(364,195,'Soria'),(365,195,'Tarragona'),(366,195,'Teruel'),(367,195,'Toledo'),(368,195,'Valencia'),(369,195,'Valladolid'),(370,195,'Vizcaya'),(371,195,'Zamora'),(372,195,'Zaragoza'),(373,11,'Aragatsotn'),(374,11,'Ararat'),(375,11,'Armavir'),(376,11,'Gegharkunik'),(377,11,'Kotayk'),(378,11,'Lori'),(379,11,'Shirak'),(380,11,'Syunik'),(381,11,'Tavush'),(382,11,'Vayots-Dzor'),(383,11,'Yerevan'),(384,99,'Andaman & Nicobar Islands'),(385,99,'Andhra Pradesh'),(386,99,'Arunachal Pradesh'),(387,99,'Assam'),(388,99,'Bihar'),(389,99,'Chandigarh'),(390,99,'Chhatisgarh'),(391,99,'Dadra & Nagar Haveli'),(392,99,'Daman & Diu'),(393,99,'Delhi'),(394,99,'Goa'),(395,99,'Gujarat'),(396,99,'Haryana'),(397,99,'Himachal Pradesh'),(398,99,'Jammu and Kashmir'),(399,99,'Jharkhand'),(400,99,'Karnataka'),(401,99,'Kerala'),(402,99,'Madhya Pradesh'),(403,99,'Maharashtra'),(404,99,'Manipur'),(405,99,'Meghalaya'),(406,99,'Mizoram'),(407,99,'Nagaland'),(408,99,'Orissa'),(409,99,'Punjab'),(410,99,'Rajasthan'),(411,99,'Sikkim'),(412,99,'Tamil Nadu'),(413,99,'Tripura'),(414,99,'Uttar Pradesh'),(415,99,'Uttarakhand'),(416,99,'West Bengal');
/*!40000 ALTER TABLE `tb_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subscription`
--

DROP TABLE IF EXISTS `tb_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subscription` (
  `subs_id` int(3) NOT NULL AUTO_INCREMENT,
  `subs_name` varchar(50) NOT NULL,
  `subs_description` text,
  `subs_amount` float(7,2) DEFAULT NULL,
  `subs_duration` int(3) DEFAULT NULL,
  PRIMARY KEY (`subs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subscription`
--

LOCK TABLES `tb_subscription` WRITE;
/*!40000 ALTER TABLE `tb_subscription` DISABLE KEYS */;
INSERT INTO `tb_subscription` VALUES (1,'Monthly','Monthly',500.00,1),(2,'Six Months','six Month',2500.00,6),(5,'One Year','One YearOne YearOne YearOne YearOne YearOne YearOne YearOne YearOne YearOne Year',5000.00,12),(66,'testingone','testingone',10.00,1),(59,'Year','one year subscription',1000.00,11),(72,'Short Duration','Short Duration period subscription',1000.00,8);
/*!40000 ALTER TABLE `tb_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_subscription`
--

DROP TABLE IF EXISTS `tb_user_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_subscription` (
  `user_id` int(10) NOT NULL,
  `subs_id` int(3) NOT NULL,
  KEY `subs_id` (`subs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_subscription`
--

LOCK TABLES `tb_user_subscription` WRITE;
/*!40000 ALTER TABLE `tb_user_subscription` DISABLE KEYS */;
INSERT INTO `tb_user_subscription` VALUES (22,1),(27,2),(29,3),(49,5),(50,1),(53,1),(54,1),(56,2),(58,1),(61,1),(63,2),(64,1),(65,1),(67,1),(69,1),(70,5),(73,1),(74,1),(75,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(85,1),(86,1),(89,2),(90,1),(91,1),(93,2),(108,1),(95,1),(97,1),(98,1),(100,1),(101,5),(102,5),(106,1),(109,1),(112,1),(115,2),(120,59),(123,5),(125,1),(126,1),(129,1);
/*!40000 ALTER TABLE `tb_user_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_to_business_map`
--

DROP TABLE IF EXISTS `tb_user_to_business_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_to_business_map` (
  `user_business_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `business_id` int(3) NOT NULL,
  PRIMARY KEY (`user_business_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_to_business_map`
--

LOCK TABLES `tb_user_to_business_map` WRITE;
/*!40000 ALTER TABLE `tb_user_to_business_map` DISABLE KEYS */;
INSERT INTO `tb_user_to_business_map` VALUES (6,23,13),(7,24,13),(8,25,13),(9,28,13),(10,30,13),(11,31,13),(12,32,16),(13,33,17),(14,34,17),(15,35,17),(16,37,17),(17,38,17),(18,39,17),(19,40,17),(20,41,17),(21,42,16),(22,43,16),(23,44,16),(24,45,16),(25,46,16),(26,47,16),(27,51,16),(28,52,16),(29,55,16),(30,59,16),(31,60,18),(32,62,13),(33,66,27),(34,76,30),(35,84,18),(36,92,42),(37,96,47),(38,99,49),(39,103,52),(40,104,52),(41,105,13),(42,110,13),(43,111,49),(44,113,57),(45,114,57),(46,116,58),(47,118,58),(48,119,58),(49,121,60),(50,122,60),(51,124,61),(52,127,61),(53,128,60);
/*!40000 ALTER TABLE `tb_user_to_business_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userrole`
--

DROP TABLE IF EXISTS `tb_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_userrole` (
  `user_id` int(10) NOT NULL,
  `role_id` int(3) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userrole`
--

LOCK TABLES `tb_userrole` WRITE;
/*!40000 ALTER TABLE `tb_userrole` DISABLE KEYS */;
INSERT INTO `tb_userrole` VALUES (22,2),(23,3),(24,3),(25,3),(26,1),(27,2),(28,3),(29,2),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(49,2),(50,2),(51,3),(52,3),(53,2),(54,2),(55,3),(56,2),(58,2),(59,3),(60,3),(61,2),(62,3),(63,2),(64,2),(65,2),(66,3),(67,2),(69,2),(70,2),(73,2),(74,2),(75,2),(76,3),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(84,3),(85,2),(86,2),(89,2),(90,2),(91,2),(92,3),(93,2),(108,2),(95,2),(96,3),(97,2),(98,2),(99,3),(100,2),(101,2),(102,2),(103,3),(104,3),(105,3),(106,2),(109,2),(110,3),(111,3),(112,2),(113,3),(114,3),(115,2),(116,3),(120,2),(118,3),(119,3),(121,3),(122,3),(123,2),(124,3),(125,2),(126,2),(127,3),(128,3),(129,2);
/*!40000 ALTER TABLE `tb_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `passward` varchar(30) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `middle_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email_id` varchar(60) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip_code` varchar(32) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `membership_id` varchar(64) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (22,'nandini','áŒ-ò›°¼ž–55˜ooô','nandiniii','XERRReeeyyyyy','p','manjula_puttaiah@yahoo.com','9446687789','#37 jghhuhuhijh 1\'st main','hoskerehalli','Bangalore','560073',384,99,NULL,'Active'),(23,'nandini1',' B’ÛÍJ&/î	æÓ•N','','','','','','','','','',1,1,'','Inactive'),(33,'radhika1','radhika1','radhika1','radhika1','radhika1','radhika1','radhika1','#37 nhcs layout','radhika1','radhika1','radhika1',1,1,'radhika1','Inactive'),(24,'nandini2','S8²è„¦^%d^–ˆNT','yogi','yogiiiiiii','Aaaa','ramyakam123@yahoo.in','9742341769','#1316,bg road \"jhhkhjk\" \"uuuuuu\" jlkjk\'s road','gotti gere','Bangalore','560083',384,99,'nan-111','Inactive'),(25,'nandini3','nandini3','nandini','nagnathrao','hulsurkar','nandini@baryonssoftsolutions.com','9964205527','dsdas','dasdasd','Bangalore','560079',1,1,'222','Inactive'),(26,'superadmin','J¹¶¦êe$6 !æÔvn','admin','admin','admin','kkk@gmail.com','9876543210','jbhjbhkbjk','bjkbjbjkbj','gd','510022',1,99,'','Active'),(32,'',' B’ÛÍJ&/î	æÓ•N','','','','','','','','','',1,1,'','Inactive'),(27,'rashmi','å6`¦Ü|T8Á—ïÍ¾=','rashmi','nagnathrao','hulsurkar','nandini@baryons.in','9844779987','#30, 1st cross, 1st main','main road, Vijaynagar','Bangalore','560077',393,99,NULL,'Active'),(28,'nandini4','nandini4','gsdgsdg','gsdgsdg','gsdgsd','sdsdgsd','sdgsg','sdgsd','ggdgsdg','gdgsg','456982',1,1,'11','Inactive'),(29,'radhika','€ý,TB“ìâ50\Z?ñ\"','radhika','radhika','radhika','radhika','5555','55','d','raichur','4564',1,99,NULL,'Active'),(30,'nandini5','nandini5','nandini5','nandini5','nandini5','nandini5','nandini5','nandini5','nandini5','nandini5','nandini5',1,1,'1','Inactive'),(31,'ghfhghhf',' B’ÛÍJ&/î	æÓ•N','','','','','','','','','',1,1,'','Inactive'),(34,'radhika2','radhika2','radhika2','radhika2','radhika2','radhika2','radhika2','radhika2','radhika2','radhika2','radhika2',1,1,'radhika2','Inactive'),(35,'radhika3','PŠKß­ÉOjO˜æ<æù^','radhika3','radhika3','radhika3','nandini11@baryons.in','radhika3','radhika3','radhika3','radhika3','radhika3',1,1,'radhika3','Inactive'),(36,'radhika','radhika','aad','adasd','ad','asdas','asdsa','asd','','a','5',1,1,NULL,'Inactive'),(87,'ghhgf','\0¸½æx:Ž’ý7OÒXüVS','fghgfgfhgf','gfhgf','gfhgfgfhgf','gfhgfh','','','','','',384,99,NULL,'Inactive'),(48,'rashmi11111111','','','','','1111111111','','','','','',1,1,NULL,'Inactive'),(47,'rashmi4','','','','','aaaaaa','','','','','',1,1,'','Inactive'),(46,'rashmi3','rashmi3','rashmi3','rashmi3','rashmi3','rashmi3gmail.com','9844779987','rashmi3','rashmi3','bangalore','123654',1,1,'rashmi3','Inactive'),(45,'rashmi2','0ŠùÉìÿt ËH/ns_NV','rashmi2','rashmi2','rashmi2','rashmi2@gmail.com','9844779987','rashmi2','rashmi2','bangalore','123654',1,1,'rashmi2','Inactive'),(44,'rashmi1','rashmi1','rashmi1','rashmi1','rashmi1','rashmi1@gmail.com','9844779987','rashmi1','rashmi1','bangalore','123654',1,1,'rashmi1','Inactive'),(49,'Sarika','%Q%:\\lS²b+wr–','Sarika','Shivraj','Yellale','radhikavkr686666@gmail.com','123456789','#30 1st cross','main road','Udgir','896523',395,99,NULL,'Active'),(50,'testing11111','111111','jkhjkh','jkhjkh','jkhjkh','testing1111@gmail.com','jkhjkh','jkhjk','dssdfdfs','kjhjk','5456',384,99,NULL,'Inactive'),(51,'newuser','123456','newuser','newuser','newuser','newuser@newuser.com','22222','pppp','pppp','raichur','5555',386,99,'2','Inactive'),(52,'newuser1','123456','newuser','newuser','newuser','newuse111r@newuser.com','22222','pppp','pppp','raichur','5555',384,99,'2','Inactive'),(53,'ppppp1','123456','fdsfsd','sdfsd','sdfsd','fdfsda@Jhjk.com','555','hjkhjk','hjkhjk','hghj','4245',384,99,NULL,'Active'),(54,'yyyyyyy1111','–Ì@/Ã;›Ö\"‡ÉÆm\n½','jhjkh','kjhjkh','jkhjk','hjkhjkjjj111@jk.com','4545','jkljklj','kljklj','kllkjlk','4564',384,99,NULL,'Inactive'),(55,'radhikavk','ã“ÜÝŒ9ù\Z¼™Wè–|Ù','radhika','vk','hh','radhikavkr681@gmail.com','888888','hjkh','jkhjk','raichur','444',384,99,'7','Inactive'),(56,'kkkkk','2hÂç¿½à;aü‰Ëú','hjkhjk','hjkhkj','jkhjk','radhikavkr6833@gmail.com','45564','jkhjkhjk','hjkhk','raichur','4444',384,99,NULL,'Inactive'),(57,'kkkkk1','á¶©ÝÓÔÌe3scÝ¢Øì','hjkhjk','hjkhkj','jkhjk','radhikavk@gmail.com','45564','jkhjkhjk','hjkhk','raichur','4444',384,99,NULL,'Inactive'),(58,'kkkkk11','á¶©ÝÓÔÌe3scÝ¢Øì','hjkhjk','hjkhkj','jkhjk','radhikavkdd@gmail.com','45564','jkhjkhjk','hjkhk','raichur','4444',384,99,NULL,'Inactive'),(59,'bandi11','ã“ÜÝŒ9ù\Z¼™Wè–|Ù','jagadesh1','j','bandi','radhikavkr681@gmail.com','55555','hgjghj','hjg','hjgj','4564',384,99,'55','Inactive'),(60,'kalps','á¶©ÝÓÔÌe3scÝ¢Øì','ghjg','gjhghj','jhgjh','ks.anjanadevi11@gmail.com','56546','gjhgjhghj','jhghjg','bangalore','66666',384,99,'55','Inactive'),(61,'testingbo','¶û-tµ9l3<å³ÂÍ\rÉ','hjghj','ghjgjh','hjgj','ks.anjanadevi22@gmail.com','5454','hjkhh','kjhkj','hghjghj','45465',384,99,NULL,'Inactive'),(62,'111111','–Ì@/Ã;›Ö\"‡ÉÆm\n½','gfhgfh','hgfh','ghghg','hghgh','hgh','ghgh','ghgh','hgfhgh','ghghg',384,99,'ghgfhgh','Inactive'),(63,'Apollo1','Êa×÷@p=„\r4ðý','nandini Apollo1','nagnathrao Apollo1','hulsurkar Apollo1','Apollo1@gmail.com','123Apollo1','Apollo1','bannergatta road1','bangalore','123456',69,13,NULL,'Active'),(64,'Apollo2','\r@yDO›xRš£|Rw®‰','nandini Apollo2','nagnathrao Apollo2','hulsurkar Apollo2','Apollo2@gmail.com','1456977','Apollo2','bannergatta road2','bangalore','124587',384,99,NULL,'Active'),(65,'Apollo3','ë*+Z^÷ÆÌ&™ö¬ƒ','nandini Apollo3','nagnathrao Apollo3','hulsurkar Apollo3','Apollo3@gmail.com','1456977','Apollo3','bannergatta road3','bangalore','124587',384,99,NULL,'Active'),(66,'333333','7îÄ{ú¸ñˆª\"¯sŽàö','ghdfhdh','dhdhdfh','hdfhdf','dhdfh','dhdfh','dhdfh','dfhdfh','dhdfh','dhdfhdfh',69,13,'333','Inactive'),(67,'Apollo4',')sVíý‹g›tMÜâ\nhf','nandini Apollo4','nagnathrao Apollo4','hulsurkar Apollo4','Apollo4@gmail.com','1456977','Apollo4','bannergatta road4','bangalore','124587',384,99,NULL,'Active'),(68,'Apollo5',':‘)B™]8ÇÈs¼p}pOZ','nandini Apollo5','nagnathrao Apollo5','hulsurkar Apollo5','Apollo5@gmail.com','1456977','Apollo5','bannergatta road5','bangalore','124587',384,99,NULL,'Inactive'),(69,'Apollo6','<¬ƒÆõ7mµ+{»½yã#','nandini Apollo6','nagnathrao Apollo6','hulsurkar Apollo6','Apollo6@gmail.com','1456977','Apollo6','bannergatta road6','bangalore','124587',384,99,NULL,'Active'),(70,'Apollo7','¼DÙ-brìH¬¿K°','nandini Apollo7','nagnathrao Apollo7','hulsurkar Apollo7','Apollo7@gmail.com','1456977','Apollo7','bannergatta road7','bangalore','124587',384,99,NULL,'Active'),(71,'Apollo8',']ÄJsã‡ÛÎCdT®úÚ','nandini Apollo8','nagnathrao Apollo8','hulsurkar Apollo8','Apollo8@gmail.com','1456977','Apollo8','bannergatta road8','bangalore','124587',384,99,NULL,'Inactive'),(72,'Apollo8.1','Ü9³w¸¯D\0\nõÙ°2XO','','','','Apollo8.1@gmail.com','','','','','',384,99,NULL,'Inactive'),(73,'Apollo8.2','íOE­=kîFÿ¼%l£FpÀ','','','','Apollo8.2@gmail.com','','','','','',384,99,NULL,'Inactive'),(74,'Apollo8.3','.\ZÒŠ´0è	ò–k0™','','','','Apollo8.3@gmail.com','','','','','',384,99,NULL,'Inactive'),(75,'Apollo10','àÊ,QFäÁ¯ŽeWûÎXZã','dfsdfsdf','sdfsdf','sddsf','sdfsdf','sdfsd','dsfsdf','sdfsdf','fsdfsdf','sdfsdf',384,99,NULL,'Inactive'),(76,'777777','ôþÒ< ”!a‹Á>ÀØiô','','','','fgff','','','','','',69,13,'','Inactive'),(77,'a1','œ.Èš>î6ÈóRw\"Ù','jhj','jhj','ghjhj','jhgjhgj','ghjghj','hj','ghjghj','ghjhj','ghjghj',384,99,NULL,'Active'),(78,'a2','ßÕ?¸<C‘[$ÇØbÅ#Ðø','','','','fffffffddfd','','','','','',384,99,NULL,'Active'),(79,'a',' Rª¨ØmYÃZ¨–#mÙ','','','','a','','','','','',384,99,NULL,'Inactive'),(80,'b','¨P\'ÓX{ˆBë¨º\rŽ—…','','','','b','','','','','',384,99,NULL,'Inactive'),(81,'c','%:ÊSËHØ·ÊÝyW¾ãX','','','','c','','','','','',384,99,NULL,'Inactive'),(82,'ghhgh','f‡j8ÚÀÅ$gn†wZn‰','','','','ghghh','','','','','',384,99,NULL,'Active'),(83,'hgfh','i§ÝtÏpJå\r+Ç±ôáÉ','','','','rerewrwerwer','','','','','',384,99,NULL,'Inactive'),(84,'121212','ÐLDû^e¬YÝ“\"Ö³N','testing','testing','testing','testing@gmail.com','123456789','dfsdf dsfsdfd dfdfsd','ffdfsdfd','bangalore','456123',69,13,'','Inactive'),(85,'cccccc','âåšù À•ñ;¿ÁžX“','ssssssssqqq','dfsdf','dsfsdfdsf','ks.anjanadevi@gmail.com','+91-9844453632','#37,nandinis house','','bangalore','456123',384,99,NULL,'Active'),(86,'nishya','‘ÍºÝ™4ø¤wdäE','nishya','jagdish','malgar','nandinihulsurkar@gmail.com','9663580578','#13 srinivaas nagar','main street','Bangalore','560089',384,99,NULL,'Active'),(89,'jagdish1','À½á2\n×qÞ½„','jagdish','omprakash','malgar','jagdishmalgar@gmail.com','9743281268','#10, shanthi nivas i\'st main \"Srinagar\"','\"Bangalore\" 58','Bangalore','560079',384,99,NULL,'Active'),(90,'jagdish2','žƒš\r6ÚÊ¥µ—:\'ªè˜','jagdish','omprakash','malgar','jagdishmalgar1@gmail.com','9743281268','fghgfhfghghgfh','ppp','Bangalore','560079',384,99,NULL,'Active'),(91,'jagdish3','Œ®¨%U$9ÕeŠ62GÉ','jagdish','omprakash','malgar','jagdishmalgar2@gmail.com','9743281268','#10, shanthi nivas i\'st main \"Srinagar\"','\"Bangalore\" 58','Bangalore','560079',388,99,NULL,'Inactive'),(92,'scuserone','j˜÷•#ónÏ‰;b(Q','scuserone','scuserone','scuserone','scuserone@gmail.com','65478931','fdfsdfsdf dsfsdfsdf','vxcvxcvxcvcv','Bangalore','560079',384,99,'','Inactive'),(93,'testingbuisness','á¶©ÝÓÔÌe3scÝ¢Øì','test','test','test','test@test.com','1234567890','#99-99/09, \" yyyyy\" 5\'th main','#99-99/09, \" yyyyy\" 5\'th main','dfgdf','111111',389,99,NULL,'Inactive'),(108,'123456','á¶©ÝÓÔÌe3scÝ¢Øì','hghjgh','jghjgh','jghjghjgh','ghjgh@gmail.com','4569871236','Address Line1','Address Line2','bangalore','123456',384,99,NULL,'Inactive'),(95,'baryons','á¶©ÝÓÔÌe3scÝ¢Øì','Baryons','','Bary','shankarg82@gmail.com','9788611262','GG Ready layout','Mico layout','Bangalore','635109',384,99,NULL,'Active'),(96,'usertest','á¶©ÝÓÔÌe3scÝ¢Øì','User','','Test','usertest@gmail.com','2345643','GG Ready layout','Mico layout','Bangalore','635109',384,99,'10001','Inactive'),(97,'lmnopq','l5Þ¶;è”okmY¦®','vnbvn','','Test','usertest10@gmail.com','2345643','GG Ready layout','Mico layout','Bangalore','635109',384,99,NULL,'Inactive'),(98,'shankar','á¶©ÝÓÔÌe3scÝ¢Øì','shankarr','annaaaaaa','g','shankar@baryonssoftsolutions.com','569874123','near apollo hospital','bannergatta main road','bangalore','560088',394,99,NULL,'Active'),(99,'shankar_1','á¶©ÝÓÔÌe3scÝ¢Øì','shankar','','g','shankar1@baryonssoftsolutions.com','9964205527','#1019 neethi marga','1\'st main vijaynagar','Bangalore','560078',388,99,'001','Inactive'),(100,'normal','á¶©ÝÓÔÌe3scÝ¢Øì','normal','','user','normal@gmail.com','9446687789','acc','utyrt','Bangalore','560073',386,99,NULL,'Active'),(101,'vivekkumar','á¶©ÝÓÔÌe3scÝ¢Øì','vivek','n','hulsurkar','vivekkumar@gmail.com','9964205527','jhjfhajfhdj','hjdjhjdfhjsd','mandya','568974',388,99,NULL,'Inactive'),(105,'rashmisurya','>])Y®Ñ9ïèÊ\'A{q','rash','u','t','rash2521989@gmail.com','984419576','no 1125 , lakshmi lyt','bg rd','bangalore','560076',393,99,'','Inactive'),(102,'anjana','á¶©ÝÓÔÌe3scÝ¢Øì','anjana','','lastname','anjana@baryonssoftsolutions.com','789654123','dhjsdhfjshdfj','jhdjhfjsdfh','bangalore','560017',394,99,NULL,'Active'),(103,'anjana1','á¶©ÝÓÔÌe3scÝ¢Øì','anjana','','devi','anjanaone@baryonssoftsolutions.com','789654123','anjana one add1','anjana one add2','bangalore','560017',394,99,'','Inactive'),(104,'anjana2','á¶©ÝÓÔÌe3scÝ¢Øì','anjana','','devi','anjanatwo@baryonssoftsolutions.com','1254789632','anjana two add1','anjana two add2','bangalore','560017',395,99,'','Inactive'),(106,'Suryanarayana','>])Y®Ñ9ïèÊ\'A{q','suzi shan','','gh','suzi@gmail.com','7685976895','132 , ghg rd , hgjhjjhu',' bg rd','bangalore','560076',384,99,NULL,'Active'),(109,'swatee','»b‚h¡oÀ#å«C¥ãd','Swate','','Dash','swatidash.mca@gmail.com','9379013457','marathalli','','Bangalore','560037',393,99,NULL,'Inactive'),(110,'sheenu','mQU)Ã66\rå„ü Ë„<','sheenu','','mishra','cnu@gmail.com','54879632135','marathalli','','bangalore','560037',384,99,'','Inactive'),(111,'xyzxyz','á¶©ÝÓÔÌe3scÝ¢Øì','xyz','','xyz','xyz@xyz.com','45678','ghjkkkl','','fghjjkk','123456',384,99,'','Inactive'),(112,'vijayshree','á¶©ÝÓÔÌe3scÝ¢Øì','Vijayshree','Babu','Bashatti','vijayshree@gmail.com','08482222222','Matoshree Hospitals','behind railway station','Bidar','585401',385,99,NULL,'Active'),(113,'vijayshreeone','á¶©ÝÓÔÌe3scÝ¢Øì','one','one','one','one@gmail.com','1234567890','dsf fsdf','fsdfs sdfsdf','Bidar','585401',385,99,'','Inactive'),(114,'ravishankar','l5Þ¶;è”okmY¦®','Shankar','','G','shankarg@gmail.com','9789133962','Iadira Nagar','II Cross','Bangalore','635109',400,99,'501','Inactive'),(115,'avinash','Ei“<¿jbFc¥uüæöwô','avinash','','kumar','avirex05@gmail.com','9992934920','2 ,longly road,shevapet','','salem','636002',412,99,NULL,'Active'),(116,'hariharan','!0Abc™]/pÚ=ÇE','hari','','haran','avirex05@ymail.com','9975123561','no.4 kamarajar road','','bangalore','560068',400,99,'zdf','Inactive'),(120,'krishh','®èÒK9paO\n‘Ú²›Mä','djghksh','hafksjha','kumar','deepkit@gmail.com','465485141','2 ,longly road,shevapet','hkdghshahf','salem','560068',412,99,NULL,'Active'),(118,'avinas','?\nÃÚbâ’^@\0æÍk´','avinas','','kumar','avirex05@yahoo.com','9992934920','2 ,longly road,shevapet','hkdghshahf','bangalore','560068',400,99,'5456','Inactive'),(119,'krishna','É¸ ¯¨°pu5 j77¡e','djghksh','hafksjha','gjladjgj','avinas@gmail.com','465485141','2 ,longly road,shevapet','hkdghshahf','bangalore','636002',390,99,'5456','Inactive'),(121,'fsfahj','É¸ ¯¨°pu5 j77¡e','djghksh','hafksjha','gjladjgj','krish@gmail.com','465485141','kldfljhxjjgh;l;g','hkdghshahf','bangalore','560068',400,99,'5456','Inactive'),(122,'sachin','\'$?Îî:3$níÎ3‘¢½•','djghksh','hafksjha','gjladjgj','sachin@gmail.com','465485141','kldfljhxjjgh;l;g','hkdghshahf','bangalore','560068',400,99,'5456','Inactive'),(123,'kumarr','V~xµîM<öÅwëcjÊ','kumarr','','avinash','kumar@gmail.com','123456789','no.4 gandhi street','','bangalore','560068',400,99,NULL,'Active'),(124,'avinashh',':»„_ÃvJ`/Ö»yeÃê','avinashh','','kumarr','avinashh@ymail.com','123456789','no.4 gandhi street','','bangalore','560068',400,99,'12345','Inactive'),(125,'rajaraja','b’\r´W4u:ÞƒËr‚','avinashh','','avinash','avin@ymail.com','123456789','no.4 gandhi street','','bangalore','560068',400,99,NULL,'Inactive'),(126,'avinashkumar','Hk<r­rkLíE{1Z','avinashh','','avinash','av@ymail.com','123456789','no.4 gandhi street','','bangalore','560068',400,99,NULL,'Inactive'),(127,'avirex','qs ^ëö±q+%R–W÷','kumarr','','avinash','rex@gmail.com','123456789','no.4 gandhi street','','bangalore','560068',400,99,'12345','Inactive'),(128,'aviii','2Âð;òfp.Ïr‘á­U','ashwin','','kumar','ashwini@gmail.com','123456789','no-5 longly road,','','bangalore','560068',400,99,'98','Inactive'),(129,'sushil','á¶©ÝÓÔÌe3scÝ¢Øì','sushil','','patel','patel@gmail.com','9874563210','dsfd','','gdfgdf','123456',400,99,'45210','Active');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_optholidays`
--

DROP TABLE IF EXISTS `tbl_optholidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_optholidays` (
  `facility_id` int(11) NOT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_optholidays`
--

LOCK TABLES `tbl_optholidays` WRITE;
/*!40000 ALTER TABLE `tbl_optholidays` DISABLE KEYS */;
INSERT INTO `tbl_optholidays` VALUES (116,'',''),(117,'','');
/*!40000 ALTER TABLE `tbl_optholidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_weekholidays`
--

DROP TABLE IF EXISTS `tbl_weekholidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_weekholidays` (
  `day_id` int(11) NOT NULL,
  `Days` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_weekholidays`
--

LOCK TABLES `tbl_weekholidays` WRITE;
/*!40000 ALTER TABLE `tbl_weekholidays` DISABLE KEYS */;
INSERT INTO `tbl_weekholidays` VALUES (1,'sunday'),(2,'monday');
/*!40000 ALTER TABLE `tbl_weekholidays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-22  8:36:47
