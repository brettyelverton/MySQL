CREATE DATABASE  IF NOT EXISTS `cy355_project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cy355_project`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: cy355_project
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` varchar(2) NOT NULL,
  `barracks` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('A1','Lee'),('A2','Bradley'),('A3','Ike'),('A4','Mac Short'),('B1','Lee'),('B2','Bradley'),('B3','Ike'),('B4','Mac Short'),('C1','Grant'),('C2','Bradley'),('C3','Ike'),('C4','Mac Short'),('D1','Grant'),('D2','Bradley'),('D3','Ike'),('D4','Mac Short'),('E1','Grant'),('E2','Bradley'),('E3','Ike'),('E4','Scott'),('F1','Grant'),('F2','Bradley'),('F3','Pershing'),('F4','Scott'),('G1','Sherman'),('G2','Bradley'),('G3','Ike'),('G4','Scott'),('H1','Sherman'),('H2','Bradley'),('H3','Pershing'),('H4','Scott'),('I1','Sherman'),('I2','Bradley'),('I3','Pershing'),('I4','Scott');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_language`
--

DROP TABLE IF EXISTS `computer_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_language`
--

LOCK TABLES `computer_language` WRITE;
/*!40000 ALTER TABLE `computer_language` DISABLE KEYS */;
INSERT INTO `computer_language` VALUES (1,'Ada'),(2,'C'),(3,'C++'),(4,'Haskell'),(5,'HTML/CSS'),(6,'Java'),(7,'Javascript'),(8,'MongoDB'),(9,'Perl'),(10,'PHP'),(11,'Python'),(12,'Ruby'),(13,'Scala'),(14,'Scheme'),(15,'SQL'),(16,'Swift');
/*!40000 ALTER TABLE `computer_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `is_abet` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Engineering Pyschology','Behavioral Science and Leadership',0),(2,'Management','Behavioral Science and Leadership',0),(3,'Psychology','Behavioral Science and Leadership',0),(4,'Sociology','Behavioral Science and Leadership',0),(5,'Chemical Engineering','Chemistry and Life Science',1),(6,'Chemistry','Chemistry and Life Science',0),(7,'Kinesiology','Chemistry and Life Science',0),(8,'Life Science','Chemistry and Life Science',0),(9,'Civil Engineering','Civil and Mechanical Engineering',1),(10,'Mechanical Engineering','Civil and Mechanical Engineering',1),(11,'Computer Science','Electrical Engineeing and Computer Science',1),(12,'Electrical Engineering','Electrical Engineeing and Computer Science',1),(13,'Information Technology','Electrical Engineeing and Computer Science',1),(14,'Foreign Language','Foreign Languages',0),(15,'Foreign Area Studies','Foreign Languages',0),(16,'English','English and Philosophy',0),(17,'Philosophy','English and Philosophy',0),(18,'Environmental Engineering','Geography and Environmental Engineering',1),(19,'Environmental Science','Geography and Environmental Engineering',0),(20,'Geography: Human','Geography and Environmental Engineering',0),(21,'Geography: Physical','Geography and Environmental Engineering',0),(22,'Geospatial Information Science','Geography and Environmental Engineering',0),(23,'Military History','History',0),(24,'International History','History',0),(25,'United States History','History',0),(26,'Law and Legal Studies','Law',0),(27,'Mathematical Sciences','Mathematical Sciences',0),(28,'Operations Research','Mathematical Sciences',0),(29,'Defense and Strategic Studies','Military Instruction',0),(30,'Interdisciplinary Science','Physics and Nuclear Engineering',0),(31,'Nuclear Engineering','Physics and Nuclear Engineering',1),(32,'Physics','Physics and Nuclear Engineering',0),(33,'Economics','Social Sciences',0),(34,'American Politics','Social Sciences',0),(35,'Comparative Politics','Social Sciences',0),(36,'International Relations','Social Sciences',0),(37,'Engineering Management','Systems Engineering',1),(38,'Systems and Decision Sciences','Systems Engineering',0),(39,'Systems Engineering','Systems Engineering',1);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `email` varchar(30) NOT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `grad_year` year(4) DEFAULT NULL,
  `major_id` int(11) NOT NULL,
  `company_id` varchar(2) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_member_major_idx` (`major_id`),
  KEY `fk_member_company1_idx` (`company_id`),
  CONSTRAINT `fk_member_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_major` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('Abraham.Wease@gotmail.com','Wease','Abraham','Male','1997-01-14',2019,12,'H2'),('Adrienne.Fairfax@wahoo.com','Fairfax','Adrienne','Female','1994-12-05',2017,22,'G2'),('Alaine.Loaiza@wahoo.com','Loaiza','Alaine','Female','1996-05-30',2018,28,'B1'),('Alejandro.Veselka@gotmail.com','Veselka','Alejandro','Male','1996-08-17',2018,12,'I4'),('Angelika.Amon@gotmail.com','Amon','Angelika','Female','1996-03-18',2018,13,'B3'),('Barney.Quinton@gotmail.com','Quinton','Barney','Male','1998-02-05',2020,11,'F3'),('Beatriz.Disandro@hmail.com','Disandro','Beatriz','Female','1994-10-13',2017,13,'I4'),('Blake.Gaus@hmail.com','Gaus','Blake','Male','1998-06-19',2020,30,'H1'),('Brenton.Jetter@hmail.com','Jetter','Brenton','Male','1998-03-16',2020,10,'I4'),('Brian.Timm@wahoo.com','Timm','Brian','Male','1994-09-05',2017,13,'G2'),('Candra.Spitz@wahoo.com','Spitz','Candra','Female','1998-05-24',2020,13,'H2'),('Casey.Argueta@hmail.com','Argueta','Casey','Male','1995-01-19',2017,11,'I4'),('Cody.Lemonds@wahoo.com','Lemonds','Cody','Male','1996-04-03',2018,12,'B2'),('Corrie.Peck@wahoo.com','Peck','Corrie','Female','1996-12-06',2019,12,'H1'),('Coy.Hurtado@hmail.com','Hurtado','Coy','Male','1996-12-03',2019,10,'E4'),('Damian.Fisk@hmail.com','Fisk','Damian','Male','1995-04-02',2017,27,'H1'),('Dick.Dalton@wahoo.com','Dalton','Dick','Male','1995-03-31',2017,13,'D2'),('Dominique.Scharf@hmail.com','Scharf','Dominique','Male','1996-09-10',2019,11,'D2'),('Earle.Rosenzweig@hmail.com','Rosenzweig','Earle','Male','1994-10-16',2017,11,'I2'),('Emory.Delbosque@gotmail.com','Delbosque','Emory','Male','1998-08-31',2020,27,'G3'),('Gaston.Mebane@gotmail.com','Mebane','Gaston','Male','1996-05-14',2018,11,'F2'),('Georgette.Blan@gotmail.com','Blan','Georgette','Female','1996-11-25',2019,11,'H4'),('Gerry.Mclamb@hmail.com','Mclamb','Gerry','Male','1996-06-25',2018,22,'D3'),('Glenda.Henning@gotmail.com','Henning','Glenda','Female','1996-06-01',2018,13,'C3'),('Glenn.Chaffin@wahoo.com','Chaffin','Glenn','Male','1996-01-30',2018,13,'G3'),('Hector.Pruitt@hmail.com','Pruitt','Hector','Male','1997-03-06',2019,32,'G1'),('Hong.Minns@gotmail.com','Minns','Hong','Male','1996-02-11',2018,13,'F2'),('Jeff.Booher@gotmail.com','Booher','Jeff','Male','1995-02-20',2017,11,'A3'),('Joaquina.Prete@hmail.com','Prete','Joaquina','Female','1998-01-17',2020,13,'F1'),('King.Grosse@hmail.com','Grosse','King','Male','1996-03-22',2018,13,'E4'),('Kristopher.Olsen@gotmail.com','Olsen','Kristopher','Male','1998-05-08',2020,8,'G4'),('Kurtis.Gowen@wahoo.com','Gowen','Kurtis','Male','1994-12-08',2017,11,'D4'),('Lavona.Arens@wahoo.com','Arens','Lavona','Female','1996-02-07',2018,10,'H2'),('Loma.Bagg@gotmail.com','Bagg','Loma','Female','1998-03-02',2020,13,'I2'),('Lupita.Cabiness@hmail.com','Cabiness','Lupita','Female','1996-04-29',2018,11,'H3'),('Marlin.Ratliff@wahoo.com','Ratliff','Marlin','Male','1996-07-06',2018,27,'H1'),('Parker.Rock@gotmail.com','Rock','Parker','Male','1996-10-21',2019,13,'G3'),('Perla.Stlawrence@wahoo.com','Stlawrence','Perla','Female','1998-02-28',2020,13,'A1'),('Perry.Otani@wahoo.com','Otani','Perry','Male','1998-07-20',2020,39,'E2'),('Quinton.Dilullo@wahoo.com','Dilullo','Quinton','Male','1996-11-02',2019,13,'C2'),('Rochell.Wojcik@gotmail.com','Wojcik','Rochell','Female','1997-02-28',2019,13,'B4'),('Ryan.Hundt@wahoo.com','Hundt','Ryan','Male','1997-02-25',2019,11,'E1'),('Senaida.Buel@gotmail.com','Buel','Senaida','Female','1994-11-24',2017,11,'B3'),('Serina.Cleaver@wahoo.com','Cleaver','Serina','Female','1994-09-02',2017,13,'H1'),('Shemeka.Keese@hmail.com','Keese','Shemeka','Female','1995-01-16',2017,12,'I3'),('Tristan.Dimauro@gotmail.com','Dimauro','Tristan','Male','1994-11-27',2017,12,'E3'),('Versie.Shubert@hmail.com','Shubert','Versie','Female','1998-04-13',2020,11,'H2'),('Vikki.Chapell@hmail.com','Chapell','Vikki','Female','1996-10-14',2019,13,'D4'),('Winnifred.Hendon@hmail.com','Hendon','Winnifred','Female','1997-01-17',2019,13,'C1'),('Zackary.Cesario@wahoo.com','Cesario','Zackary','Male','1998-04-27',2020,11,'H3');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_knows_computer_language`
--

DROP TABLE IF EXISTS `member_knows_computer_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_knows_computer_language` (
  `member_email` varchar(30) NOT NULL,
  `computer_language_id` int(11) NOT NULL,
  `proficiency` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_email`,`computer_language_id`),
  KEY `fk_member_has_computer_language_computer_language1_idx` (`computer_language_id`),
  KEY `fk_member_has_computer_language_member1_idx` (`member_email`),
  CONSTRAINT `fk_member_has_computer_language_computer_language1` FOREIGN KEY (`computer_language_id`) REFERENCES `computer_language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_computer_language_member1` FOREIGN KEY (`member_email`) REFERENCES `member` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_knows_computer_language`
--

LOCK TABLES `member_knows_computer_language` WRITE;
/*!40000 ALTER TABLE `member_knows_computer_language` DISABLE KEYS */;
INSERT INTO `member_knows_computer_language` VALUES ('Abraham.Wease@gotmail.com',6,'Intermediate'),('Abraham.Wease@gotmail.com',11,'Expert'),('Adrienne.Fairfax@wahoo.com',2,'Expert'),('Adrienne.Fairfax@wahoo.com',11,'Expert'),('Adrienne.Fairfax@wahoo.com',13,'Intermediate'),('Alaine.Loaiza@wahoo.com',2,'Basic'),('Alaine.Loaiza@wahoo.com',11,'Intermediate'),('Alaine.Loaiza@wahoo.com',13,'Basic'),('Alejandro.Veselka@gotmail.com',2,'Basic'),('Alejandro.Veselka@gotmail.com',4,'Basic'),('Alejandro.Veselka@gotmail.com',9,'Basic'),('Alejandro.Veselka@gotmail.com',11,'Basic'),('Alejandro.Veselka@gotmail.com',13,'Basic'),('Angelika.Amon@gotmail.com',2,'Basic'),('Angelika.Amon@gotmail.com',4,'Intermediate'),('Angelika.Amon@gotmail.com',6,'Intermediate'),('Angelika.Amon@gotmail.com',9,'Intermediate'),('Angelika.Amon@gotmail.com',11,'Intermediate'),('Angelika.Amon@gotmail.com',13,'Intermediate'),('Barney.Quinton@gotmail.com',11,'Basic'),('Beatriz.Disandro@hmail.com',2,'Basic'),('Beatriz.Disandro@hmail.com',4,'Basic'),('Beatriz.Disandro@hmail.com',11,'Expert'),('Beatriz.Disandro@hmail.com',13,'Intermediate'),('Blake.Gaus@hmail.com',11,'Basic'),('Brenton.Jetter@hmail.com',11,'Basic'),('Brian.Timm@wahoo.com',2,'Intermediate'),('Brian.Timm@wahoo.com',11,'Basic'),('Brian.Timm@wahoo.com',13,'Intermediate'),('Candra.Spitz@wahoo.com',11,'Basic'),('Casey.Argueta@hmail.com',2,'Basic'),('Casey.Argueta@hmail.com',6,'Expert'),('Casey.Argueta@hmail.com',11,'Intermediate'),('Casey.Argueta@hmail.com',13,'Intermediate'),('Cody.Lemonds@wahoo.com',2,'Basic'),('Cody.Lemonds@wahoo.com',11,'Intermediate'),('Cody.Lemonds@wahoo.com',13,'Basic'),('Corrie.Peck@wahoo.com',11,'Intermediate'),('Corrie.Peck@wahoo.com',13,'Basic'),('Coy.Hurtado@hmail.com',6,'Basic'),('Coy.Hurtado@hmail.com',11,'Basic'),('Coy.Hurtado@hmail.com',13,'Basic'),('Damian.Fisk@hmail.com',2,'Expert'),('Damian.Fisk@hmail.com',11,'Basic'),('Damian.Fisk@hmail.com',13,'Intermediate'),('Dick.Dalton@wahoo.com',2,'Intermediate'),('Dick.Dalton@wahoo.com',6,'Expert'),('Dick.Dalton@wahoo.com',11,'Basic'),('Dick.Dalton@wahoo.com',13,'Intermediate'),('Dominique.Scharf@hmail.com',11,'Intermediate'),('Earle.Rosenzweig@hmail.com',2,'Intermediate'),('Earle.Rosenzweig@hmail.com',11,'Basic'),('Earle.Rosenzweig@hmail.com',13,'Intermediate'),('Emory.Delbosque@gotmail.com',11,'Basic'),('Gaston.Mebane@gotmail.com',2,'Intermediate'),('Gaston.Mebane@gotmail.com',11,'Basic'),('Gaston.Mebane@gotmail.com',13,'Basic'),('Georgette.Blan@gotmail.com',11,'Intermediate'),('Georgette.Blan@gotmail.com',13,'Intermediate'),('Gerry.Mclamb@hmail.com',2,'Basic'),('Gerry.Mclamb@hmail.com',6,'Intermediate'),('Gerry.Mclamb@hmail.com',11,'Basic'),('Gerry.Mclamb@hmail.com',13,'Basic'),('Glenda.Henning@gotmail.com',2,'Basic'),('Glenda.Henning@gotmail.com',4,'Basic'),('Glenda.Henning@gotmail.com',11,'Basic'),('Glenda.Henning@gotmail.com',13,'Basic'),('Glenn.Chaffin@wahoo.com',2,'Basic'),('Glenn.Chaffin@wahoo.com',11,'Basic'),('Glenn.Chaffin@wahoo.com',13,'Basic'),('Hector.Pruitt@hmail.com',6,'Basic'),('Hector.Pruitt@hmail.com',11,'Intermediate'),('Hector.Pruitt@hmail.com',13,'Basic'),('Hong.Minns@gotmail.com',2,'Basic'),('Hong.Minns@gotmail.com',11,'Basic'),('Hong.Minns@gotmail.com',13,'Basic'),('Jeff.Booher@gotmail.com',2,'Basic'),('Jeff.Booher@gotmail.com',11,'Intermediate'),('Jeff.Booher@gotmail.com',13,'Intermediate'),('Joaquina.Prete@hmail.com',6,'Intermediate'),('Joaquina.Prete@hmail.com',11,'Intermediate'),('King.Grosse@hmail.com',2,'Intermediate'),('King.Grosse@hmail.com',6,'Basic'),('King.Grosse@hmail.com',11,'Basic'),('King.Grosse@hmail.com',13,'Basic'),('Kristopher.Olsen@gotmail.com',11,'Basic'),('Kurtis.Gowen@wahoo.com',2,'Basic'),('Kurtis.Gowen@wahoo.com',6,'Intermediate'),('Kurtis.Gowen@wahoo.com',11,'Intermediate'),('Kurtis.Gowen@wahoo.com',13,'Intermediate'),('Lavona.Arens@wahoo.com',2,'Basic'),('Lavona.Arens@wahoo.com',11,'Expert'),('Lavona.Arens@wahoo.com',13,'Intermediate'),('Loma.Bagg@gotmail.com',9,'Expert'),('Loma.Bagg@gotmail.com',11,'Basic'),('Lupita.Cabiness@hmail.com',2,'Basic'),('Lupita.Cabiness@hmail.com',11,'Intermediate'),('Lupita.Cabiness@hmail.com',13,'Intermediate'),('Marlin.Ratliff@wahoo.com',2,'Basic'),('Marlin.Ratliff@wahoo.com',6,'Intermediate'),('Marlin.Ratliff@wahoo.com',11,'Expert'),('Marlin.Ratliff@wahoo.com',13,'Basic'),('Parker.Rock@gotmail.com',6,'Intermediate'),('Parker.Rock@gotmail.com',11,'Basic'),('Perla.Stlawrence@wahoo.com',11,'Intermediate'),('Perry.Otani@wahoo.com',11,'Intermediate'),('Quinton.Dilullo@wahoo.com',11,'Intermediate'),('Quinton.Dilullo@wahoo.com',13,'Basic'),('Rochell.Wojcik@gotmail.com',11,'Basic'),('Ryan.Hundt@wahoo.com',9,'Basic'),('Ryan.Hundt@wahoo.com',11,'Basic'),('Ryan.Hundt@wahoo.com',13,'Basic'),('Senaida.Buel@gotmail.com',2,'Basic'),('Senaida.Buel@gotmail.com',4,'Basic'),('Senaida.Buel@gotmail.com',11,'Expert'),('Senaida.Buel@gotmail.com',13,'Intermediate'),('Serina.Cleaver@wahoo.com',2,'Intermediate'),('Serina.Cleaver@wahoo.com',11,'Intermediate'),('Serina.Cleaver@wahoo.com',13,'Intermediate'),('Shemeka.Keese@hmail.com',2,'Basic'),('Shemeka.Keese@hmail.com',11,'Intermediate'),('Shemeka.Keese@hmail.com',13,'Intermediate'),('Tristan.Dimauro@gotmail.com',2,'Basic'),('Tristan.Dimauro@gotmail.com',11,'Basic'),('Tristan.Dimauro@gotmail.com',13,'Intermediate'),('Versie.Shubert@hmail.com',11,'Basic'),('Vikki.Chapell@hmail.com',6,'Basic'),('Vikki.Chapell@hmail.com',11,'Intermediate'),('Vikki.Chapell@hmail.com',13,'Basic'),('Winnifred.Hendon@hmail.com',6,'Basic'),('Winnifred.Hendon@hmail.com',11,'Basic'),('Winnifred.Hendon@hmail.com',13,'Basic'),('Zackary.Cesario@wahoo.com',11,'Basic');
/*!40000 ALTER TABLE `member_knows_computer_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_competition`
--

DROP TABLE IF EXISTS `program_competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_competition` (
  `member_email` varchar(30) NOT NULL,
  `team_name` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`member_email`),
  CONSTRAINT `program_competition_ibfk_1` FOREIGN KEY (`member_email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_competition`
--

LOCK TABLES `program_competition` WRITE;
/*!40000 ALTER TABLE `program_competition` DISABLE KEYS */;
INSERT INTO `program_competition` VALUES ('Beatriz.Disandro@hmail.com','Team Rogers',87),('Casey.Argueta@hmail.com','Team Stark',82),('Cody.Lemonds@wahoo.com','Team Banner',85),('Coy.Hurtado@hmail.com','Team Banner',97),('Dick.Dalton@wahoo.com','Team Barton',96),('Emory.Delbosque@gotmail.com','Team Romanov',78),('Hector.Pruitt@hmail.com','Team Stark',87),('Hong.Minns@gotmail.com','Team Rogers',79),('Jeff.Booher@gotmail.com','Team Banner',90),('King.Grosse@hmail.com','Team Barton',92),('Kristopher.Olsen@gotmail.com','Team Barton',74),('Lavona.Arens@wahoo.com','Team Romanov',86),('Loma.Bagg@gotmail.com','Team Rogers',79),('Lupita.Cabiness@hmail.com','Team Stark',79),('Parker.Rock@gotmail.com','Team Barton',98),('Perla.Stlawrence@wahoo.com','Team Stark',96),('Perry.Otani@wahoo.com','Team Banner',76),('Rochell.Wojcik@gotmail.com','Team Rogers',89),('Shemeka.Keese@hmail.com','Team Romanov',87),('Vikki.Chapell@hmail.com','Team Romanov',81);
/*!40000 ALTER TABLE `program_competition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-12 16:13:42
