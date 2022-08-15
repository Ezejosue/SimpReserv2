CREATE DATABASE  IF NOT EXISTS `simpreserv` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `simpreserv`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: simpreserv
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash` (
  `cash_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cash_taken` decimal(10,0) DEFAULT NULL,
  `cash_given` decimal(10,0) DEFAULT NULL,
  `PAYMENTS_payment_id` int NOT NULL,
  PRIMARY KEY (`cash_id`),
  KEY `fk_table1_PAYMENTS1_idx` (`PAYMENTS_payment_id`),
  CONSTRAINT `fk_table1_PAYMENTS1` FOREIGN KEY (`PAYMENTS_payment_id`) REFERENCES `payments` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check`
--

DROP TABLE IF EXISTS `check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check` (
  `check_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_number` varchar(30) DEFAULT NULL,
  `check_reference` varchar(25) DEFAULT NULL,
  `PAYMENTS_payment_id` int NOT NULL,
  PRIMARY KEY (`check_id`),
  KEY `fk_CHECK_PAYMENTS1_idx` (`PAYMENTS_payment_id`),
  CONSTRAINT `fk_CHECK_PAYMENTS1` FOREIGN KEY (`PAYMENTS_payment_id`) REFERENCES `payments` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check`
--

LOCK TABLES `check` WRITE;
/*!40000 ALTER TABLE `check` DISABLE KEYS */;
/*!40000 ALTER TABLE `check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `doc_number` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` tinyint DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `doc_number_UNIQUE` (`doc_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `clients_chk_1` CHECK (((`enabled` <= 2) and (`enabled` > 0)))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'2022-08-08 18:39:37',NULL,'Shanon','Lerer','362946249-9','slerer0@indiatimes.com',2),(2,'2022-08-08 18:39:37',NULL,'Velvet','Tootal','580930940-2','vtootal1@si.edu',2),(3,'2022-08-08 18:39:37',NULL,'Gabey','McVeigh','333132022-6','gmcveigh2@kickstarter.com',1),(4,'2022-08-08 18:39:37',NULL,'Harper','Tumbridge','514807546-5','htumbridge3@cnn.com',1),(5,'2022-08-08 18:39:37',NULL,'Becca','Howle','652915487-6','bhowle4@nps.gov',1),(6,'2022-08-08 18:39:37',NULL,'Rafaelita','Chasney','664341038-X','rchasney5@dedecms.com',1),(7,'2022-08-08 18:39:37',NULL,'Kennedy','Stopford','133038247-1','kstopford6@vimeo.com',2),(8,'2022-08-08 18:39:37',NULL,'Dode','McDarmid','253921327-8','dmcdarmid7@icio.us',1),(9,'2022-08-08 18:39:37',NULL,'Giraud','Sanchez','266588021-0','gsanchez8@craigslist.org',1),(10,'2022-08-08 18:39:37',NULL,'Loella','Coaten','621946056-1','lcoaten9@businessinsider.com',1),(11,'2022-08-08 18:39:37',NULL,'Heath','Summersby','171017244-4','hsummersbya@amazon.de',2),(12,'2022-08-08 18:39:37',NULL,'Brion','Gardener','412724906-4','bgardenerb@baidu.com',2),(13,'2022-08-08 18:39:37',NULL,'Heidie','MacCallester','774067257-2','hmaccallesterc@ovh.net',2),(14,'2022-08-08 18:39:37',NULL,'Renaud','Feavearyear','861899272-0','rfeavearyeard@narod.ru',2),(15,'2022-08-08 18:39:37',NULL,'Bidget','Ginity','499533391-6','bginitye@storify.com',2),(16,'2022-08-08 18:39:37',NULL,'Reena','Vanstone','592396655-7','rvanstonef@ycombinator.com',1),(17,'2022-08-08 18:39:37',NULL,'Querida','Broker','684610930-7','qbrokerg@ft.com',1),(18,'2022-08-08 18:39:37',NULL,'Bebe','Chrishop','723678672-1','bchrishoph@hugedomains.com',1),(19,'2022-08-08 18:39:37',NULL,'Flore','Katte','321988261-7','fkattei@google.com.hk',1),(20,'2022-08-08 18:39:37',NULL,'Yehudit','Fernley','395147427-0','yfernleyj@sciencedaily.com',2),(21,'2022-08-08 18:39:37',NULL,'Bathsheba','Leyson','087069272-0','bleysonk@telegraph.co.uk',1),(22,'2022-08-08 18:39:37',NULL,'Hinze','Blodget','406639903-7','hblodgetl@shop-pro.jp',2),(23,'2022-08-08 18:39:37',NULL,'Darrell','Bakhrushin','253840246-8','dbakhrushinm@ezinearticles.com',2),(24,'2022-08-08 18:39:37',NULL,'Carlee','Callingham','355708711-5','ccallinghamn@vinaora.com',2),(25,'2022-08-08 18:39:37',NULL,'Shandeigh','Baroc','977916474-X','sbaroco@taobao.com',2),(26,'2022-08-08 18:39:37',NULL,'Mal','De Santos','352334045-4','mdesantosp@fema.gov',2),(27,'2022-08-08 18:39:37',NULL,'Shandee','Cheson','885268712-2','schesonq@ibm.com',1),(28,'2022-08-08 18:39:37',NULL,'Loralie','Brushfield','166767470-6','lbrushfieldr@vkontakte.ru',2),(29,'2022-08-08 18:39:37',NULL,'Cate','Anersen','899275796-4','canersens@eventbrite.com',1),(30,'2022-08-08 18:39:37',NULL,'Dore','Phonix','605331720-9','dphonixt@networksolutions.com',2),(31,'2022-08-08 18:39:37',NULL,'Dugald','Tesimon','594801404-5','dtesimonu@ustream.tv',1),(32,'2022-08-08 18:39:37',NULL,'Maje','Wilprecht','302480778-0','mwilprechtv@intel.com',1),(33,'2022-08-08 18:39:37',NULL,'Fayina','Wathell','190648802-9','fwathellw@t-online.de',1),(34,'2022-08-08 18:39:37',NULL,'Cynthea','Finnan','776595954-9','cfinnanx@t-online.de',1),(35,'2022-08-08 18:39:37',NULL,'Edita','Muro','394066620-3','emuroy@pinterest.com',1),(36,'2022-08-08 18:39:37',NULL,'Lennie','Collop','258242569-9','lcollopz@google.nl',1),(37,'2022-08-08 18:39:37',NULL,'Cleopatra','Ludford','530373805-1','cludford10@tripod.com',1),(38,'2022-08-08 18:39:37',NULL,'Ellene','Foley','622270205-8','efoley11@ask.com',2),(39,'2022-08-08 18:39:37',NULL,'Sadella','Chandler','752609307-9','schandler12@imdb.com',2),(40,'2022-08-08 18:39:37',NULL,'Hephzibah','Cornels','287535279-2','hcornels13@infoseek.co.jp',1),(41,'2022-08-08 18:39:37',NULL,'Kerry','Godmer','448435617-1','kgodmer14@instagram.com',1),(42,'2022-08-08 18:39:37',NULL,'Remus','Stadding','339061100-2','rstadding15@slate.com',2),(43,'2022-08-08 18:39:37',NULL,'Alyce','Leeming','372449603-6','aleeming16@phoca.cz',2),(44,'2022-08-08 18:39:37',NULL,'Fifi','Sandlin','985479217-X','fsandlin17@webnode.com',1),(45,'2022-08-08 18:39:37',NULL,'Duncan','Warrior','403722498-4','dwarrior18@wufoo.com',2),(46,'2022-08-08 18:39:37',NULL,'Paule','Christopherson','397081955-5','pchristopherson19@tmall.com',1),(47,'2022-08-08 18:39:37',NULL,'Iorgo','Kelland','594392561-9','ikelland1a@dot.gov',1),(48,'2022-08-08 18:39:37',NULL,'Marys','Kilgrove','916385209-8','mkilgrove1b@drupal.org',1),(49,'2022-08-08 18:39:37',NULL,'Rosette','Thow','185689118-6','rthow1c@admin.ch',2),(50,'2022-08-08 18:39:37',NULL,'Adelaida','Sprowson','445047861-4','asprowson1d@vistaprint.com',1),(51,'2022-08-08 18:39:37',NULL,'Darill','Rowden','352037340-8','drowden1e@blogger.com',2),(52,'2022-08-08 18:39:37',NULL,'Phebe','Idill','046646141-0','pidill1f@apache.org',1),(53,'2022-08-08 18:39:37',NULL,'Terence','Baruch','874424403-7','tbaruch1g@umn.edu',2),(54,'2022-08-08 18:39:37',NULL,'Rogers','Rossoni','395487724-4','rrossoni1h@google.fr',2),(55,'2022-08-08 18:39:37',NULL,'Bord','Mingard','969655720-5','bmingard1i@globo.com',1),(56,'2022-08-08 18:39:37',NULL,'Cher','Matsell','414119392-5','cmatsell1j@illinois.edu',2),(57,'2022-08-08 18:39:37',NULL,'Andromache','Muglestone','018400680-5','amuglestone1k@rakuten.co.jp',2),(58,'2022-08-08 18:39:37',NULL,'Winfield','McTaggart','850579378-1','wmctaggart1l@prlog.org',1),(59,'2022-08-08 18:39:37',NULL,'Cozmo','McCarthy','853890846-4','cmccarthy1m@craigslist.org',1),(60,'2022-08-08 18:39:37',NULL,'Marthena','Trevena','273533816-9','mtrevena1n@nbcnews.com',2),(61,'2022-08-08 18:39:38',NULL,'Blaire','Dykas','114323147-3','bdykas1o@hao123.com',1),(62,'2022-08-08 18:39:38',NULL,'Emory','Eastbury','121537205-1','eeastbury1p@ihg.com',1),(63,'2022-08-08 18:39:38',NULL,'Justina','Rives','791837504-1','jrives1q@yahoo.com',2),(64,'2022-08-08 18:39:38',NULL,'Donia','Branche','393853313-7','dbranche1r@purevolume.com',1),(65,'2022-08-08 18:39:38',NULL,'Faina','Meekin','509163273-5','fmeekin1s@prnewswire.com',1),(66,'2022-08-08 18:39:38',NULL,'Lena','Kollas','378555146-0','lkollas1t@ihg.com',2),(67,'2022-08-08 18:39:38',NULL,'Barty','Kaszper','114354210-X','bkaszper1u@typepad.com',1),(68,'2022-08-08 18:39:38',NULL,'Orella','Jowle','192590935-2','ojowle1v@liveinternet.ru',2),(69,'2022-08-08 18:39:38',NULL,'Olenolin','Lowdham','861950297-2','olowdham1w@twitter.com',2),(70,'2022-08-08 18:39:38',NULL,'Liv','Lidden','112986063-9','llidden1x@bing.com',1),(71,'2022-08-08 18:39:38',NULL,'Abeu','Lauks','374606121-0','alauks1y@nbcnews.com',1),(72,'2022-08-08 18:39:38',NULL,'Guglielmo','Axelby','193123750-6','gaxelby1z@state.gov',1),(73,'2022-08-08 18:39:38',NULL,'Sam','Grishanov','187144984-7','sgrishanov20@posterous.com',2),(74,'2022-08-08 18:39:38',NULL,'Phil','Cockshut','438306550-3','pcockshut21@dmoz.org',2),(75,'2022-08-08 18:39:38',NULL,'Godart','Negri','908306696-7','gnegri22@alibaba.com',2),(76,'2022-08-08 18:39:38',NULL,'Fenelia','Learmonth','209803827-5','flearmonth23@illinois.edu',1),(77,'2022-08-08 18:39:38',NULL,'Jolene','Styan','901264209-4','jstyan24@phoca.cz',2),(78,'2022-08-08 18:39:38',NULL,'Meagan','Lorimer','632865156-2','mlorimer25@va.gov',1),(79,'2022-08-08 18:39:38',NULL,'Corrine','Ellerey','862682592-7','cellerey26@cbslocal.com',1),(80,'2022-08-08 18:39:38',NULL,'Gonzalo','MacGow','594604096-0','gmacgow27@youtube.com',2),(81,'2022-08-08 18:39:38',NULL,'Jamill','Powton','284723879-4','jpowton28@lycos.com',2),(82,'2022-08-08 18:39:38',NULL,'Raymund','Durrell','057753229-4','rdurrell29@cocolog-nifty.com',2),(83,'2022-08-08 18:39:38',NULL,'Conny','Stockall','705186951-5','cstockall2a@wired.com',2),(84,'2022-08-08 18:39:38',NULL,'Lindsy','Fley','371437891-X','lfley2b@theguardian.com',2),(85,'2022-08-08 18:39:38',NULL,'Jacky','Valentim','246447522-X','jvalentim2c@home.pl',2),(86,'2022-08-08 18:39:38',NULL,'Saul','Lomath','524774576-0','slomath2d@umich.edu',2),(87,'2022-08-08 18:39:38',NULL,'Robby','Lobley','386007393-1','rlobley2e@tripod.com',2),(88,'2022-08-08 18:39:38',NULL,'Jeth','Huffy','768509901-2','jhuffy2f@deviantart.com',2),(89,'2022-08-08 18:39:38',NULL,'Stanly','Tombleson','671304265-1','stombleson2g@ebay.co.uk',2),(90,'2022-08-08 18:39:38',NULL,'Gertie','Chauvey','434070559-4','gchauvey2h@quantcast.com',1),(91,'2022-08-08 18:39:38',NULL,'Ola','Schulken','421581267-4','oschulken2i@weibo.com',2),(92,'2022-08-08 18:39:38',NULL,'Lloyd','Strevens','496112858-9','lstrevens2j@salon.com',2),(93,'2022-08-08 18:39:38',NULL,'Joann','Dendon','858491095-6','jdendon2k@nature.com',2),(94,'2022-08-08 18:39:38',NULL,'Tabby','Ferentz','874976937-5','tferentz2l@mtv.com',2),(95,'2022-08-08 18:39:38',NULL,'Gay','Endrizzi','220118220-5','gendrizzi2m@instagram.com',1),(96,'2022-08-08 18:39:38',NULL,'Eugenie','Cord','120196895-X','ecord2n@slashdot.org',1),(97,'2022-08-08 18:39:38',NULL,'Esme','Grenshields','790098060-1','egrenshields2o@berkeley.edu',2),(98,'2022-08-08 18:39:38',NULL,'Melamie','Bucktrout','089935076-3','mbucktrout2p@so-net.ne.jp',1),(99,'2022-08-08 18:39:38',NULL,'Rad','Kinglesyd','143411061-3','rkinglesyd2q@facebook.com',2),(100,'2022-08-08 18:39:38',NULL,'Truda','Northcliffe','623735820-X','tnorthcliffe2r@flavors.me',1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `creditcard_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creditcard_number` varchar(4) DEFAULT NULL,
  `creditcard_exp_month` varchar(2) DEFAULT NULL,
  `creditcard_exp_year` varchar(2) DEFAULT NULL,
  `creditcard_authorization` varchar(20) DEFAULT NULL,
  `PAYMENTS_payment_id` int NOT NULL,
  PRIMARY KEY (`creditcard_id`),
  KEY `fk_CREDITCARD_PAYMENTS1_idx` (`PAYMENTS_payment_id`),
  CONSTRAINT `fk_CREDITCARD_PAYMENTS1` FOREIGN KEY (`PAYMENTS_payment_id`) REFERENCES `payments` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `carnet` varchar(25) DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `POSITIONS_position_id` int NOT NULL,
  `SHIFTS_shift_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `carnet_UNIQUE` (`carnet`),
  KEY `fk_EMPLOYEES_POSITIONS1_idx` (`POSITIONS_position_id`),
  KEY `fk_EMPLOYEES_SHIFTS1_idx` (`SHIFTS_shift_id`),
  CONSTRAINT `fk_EMPLOYEES_POSITIONS1` FOREIGN KEY (`POSITIONS_position_id`) REFERENCES `positions` (`position_id`),
  CONSTRAINT `fk_EMPLOYEES_SHIFTS1` FOREIGN KEY (`SHIFTS_shift_id`) REFERENCES `shifts` (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'2022-08-01 06:00:00',NULL,'System','Administrator','999999-9',1,1,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_types` (
  `payment_type_id` int NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'Cash'),(2,'CreditCard'),(3,'Check');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_number` varchar(45) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `PAYMENT_TYPE_payment_type_id` int NOT NULL,
  `RESERVATIONS_reservation_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_PAYMENT_PAYMENT_TYPE1_idx` (`PAYMENT_TYPE_payment_type_id`),
  KEY `fk_PAYMENTS_RESERVATIONS1_idx` (`RESERVATIONS_reservation_id`),
  CONSTRAINT `fk_PAYMENT_PAYMENT_TYPE1` FOREIGN KEY (`PAYMENT_TYPE_payment_type_id`) REFERENCES `payment_types` (`payment_type_id`),
  CONSTRAINT `fk_PAYMENTS_RESERVATIONS1` FOREIGN KEY (`RESERVATIONS_reservation_id`) REFERENCES `reservations` (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) DEFAULT NULL,
  `position_salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'System default',999999);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_status`
--

DROP TABLE IF EXISTS `reservation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_status` (
  `reservation_status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`reservation_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_status`
--

LOCK TABLES `reservation_status` WRITE;
/*!40000 ALTER TABLE `reservation_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `reservation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `checkin_date` date DEFAULT NULL,
  `checkout_date` date DEFAULT NULL,
  `reservation_balance` decimal(10,0) DEFAULT NULL,
  `EMPLOYEE_employee_id` int NOT NULL,
  `CLIENT_client_id` int NOT NULL,
  `ROOM_room_id` int NOT NULL,
  `RESERVATION_STATUS_reservation_status_id` int NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_RESERVATION_EMPLOYEE1_idx` (`EMPLOYEE_employee_id`),
  KEY `fk_RESERVATION_CLIENT1_idx` (`CLIENT_client_id`),
  KEY `fk_RESERVATION_ROOM1_idx` (`ROOM_room_id`),
  KEY `fk_RESERVATIONS_RESERVATION_STATUS1_idx` (`RESERVATION_STATUS_reservation_status_id`),
  CONSTRAINT `fk_RESERVATION_CLIENT1` FOREIGN KEY (`CLIENT_client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `fk_RESERVATION_EMPLOYEE1` FOREIGN KEY (`EMPLOYEE_employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_RESERVATION_ROOM1` FOREIGN KEY (`ROOM_room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `fk_RESERVATIONS_RESERVATION_STATUS1` FOREIGN KEY (`RESERVATION_STATUS_reservation_status_id`) REFERENCES `reservation_status` (`reservation_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `number` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `room_price` decimal(10,0) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `available` tinyint DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(20) DEFAULT NULL,
  `hour_start` time DEFAULT NULL,
  `hour_end` time DEFAULT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,'System default','00:00:00','23:59:00'),(2,'Day shift','08:00:00','15:59:00'),(3,'Night shift','16:00:00','23:59:00'),(4,'Intermediate shift','00:00:00','07:59:00');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `user_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'Administrator'),(2,'Customer Service');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(150) NOT NULL,
  `enabled` tinyint DEFAULT NULL,
  `EMPLOYEES_employee_id` int NOT NULL,
  `USER_TYPES_user_type_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_USERS_EMPLOYEES1_idx` (`EMPLOYEES_employee_id`),
  KEY `fk_USERS_USER_TYPES1_idx` (`USER_TYPES_user_type_id`),
  CONSTRAINT `fk_USERS_EMPLOYEES1` FOREIGN KEY (`EMPLOYEES_employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_USERS_USER_TYPES1` FOREIGN KEY (`USER_TYPES_user_type_id`) REFERENCES `user_types` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

SET SQL_MODE = '';
DROP USER IF EXISTS admin;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin' IDENTIFIED BY '%K0d1g0#';

GRANT ALL ON `simpreserv`.* TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2022-08-01 06:00:00',NULL,'sysadmin@simpreserv.com','$2a$10$VvwmMQlTlaa9Pg9wpgCB8.ys3a.QnXyYfyYJ68DcgDz6UcHztcXRW',1,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'simpreserv'
--

--
-- Dumping routines for database 'simpreserv'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-08 14:09:00
