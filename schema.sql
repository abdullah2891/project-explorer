-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ticketSystem
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `Issue`
--

DROP TABLE IF EXISTS `Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Issue` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `owner` varchar(30) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue`
--

LOCK TABLES `Issue` WRITE;
/*!40000 ALTER TABLE `Issue` DISABLE KEYS */;
INSERT INTO `Issue` VALUES (1,'Add posting new issue or update status ','mrSnuffles','ember data posting  ','closed'),(3,'integrating mysql with with mojolicious','mrSnuffles','setting up mojo with mysql database and set up table','closed'),(4,'test issue','bill gates','this is a test issue please ignore','open'),(6,'Creating new issue','mrSnuffles','Insert Operation in backend','closed'),(7,'Updating the Issue','mrSnuffles','Insert Operation in backend','closed'),(8,'Refactore the Issue.pm getIssue function','mrSnuffles','It was returning only one row. now showing all the issue','closed'),(12,'Update the the status of the Issue','mrSnuffles','writing a updateStatus function which will be refactored to general','open'),(13,'test','test','pleaes ignore','closed'),(15,'Add posting new issue or update status ','mrSnuffles','ember data posting  ','closed'),(21,'Adding Issue frontend ','MrSnuffles','This is ember ','closed'),(22,'Designing the Frontend','MrSnuffles','Implementing lubaba\'s design','closed'),(23,'Changing status in frontend','MrSnuffles','put request is designed in backend. I have to add the feature ','closed'),(24,'Redesigning the submit form','MrSnuffles','test','closed'),(25,'updating the status of the issue','MrSnuffles','finishing the frontend and backend','closed'),(26,'Creating a proper response  for backend following ember data','MrSnuffles','Currently I am sending by the ember data. Ember data has its own convention that I am not following. ','working'),(27,'Totally Redesign the Submit form ','MrSnuffles','description','closed'),(28,'Authentication','MrSnuffles','Using OAuth. Currrently I don\'t have any Idea How to create one :D','open'),(29,'Test Entry','DummyUser','Test Entry pLease ignore','open'),(30,'creating proper response ','we are returning the status wh','mrSnuffles','open'),(31,'Deploying ','Deploying the ticketing system','mrSnuffles','working'),(32,'Adding delete button','adding delete button. creating','mrSnuffles','working'),(33,'Adding delete button','adding delete button. creating','mrSnuffles','open');
/*!40000 ALTER TABLE `Issue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-23 22:24:05
