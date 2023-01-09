---------------------------------------------------------
-- FICHIER SQL de la BDD cinema après export avec la commande suivante :
-- mysqldump -u root -p cinema > dump.sql
---------------------------------------------------------

-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `theater_id` int NOT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `fk_admin_users_id` (`users_id`),
  KEY `fk_theater_id` (`theater_id`),
  CONSTRAINT `fk_admin_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id_users`),
  CONSTRAINT `fk_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`id_theater`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,10,1),(2,11,2),(3,12,3),(4,13,4),(5,14,5),(6,15,6),(7,16,7),(8,17,8),(9,18,9),(10,19,10),(11,20,1),(12,21,2),(13,12,3),(14,13,4);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `age`
--

DROP TABLE IF EXISTS `age`;
/*!50001 DROP VIEW IF EXISTS `age`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `age` AS SELECT 
 1 AS `id_customers`,
 1 AS `dateOfBirth`,
 1 AS `ROUND(DATEDIFF(now(), dateOfBirth) / 365)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `id_booking` int NOT NULL AUTO_INCREMENT,
  `no_ticket` int NOT NULL,
  `number_person` int NOT NULL,
  `total_price` float NOT NULL,
  `booking_date` date NOT NULL,
  `customers_id` int NOT NULL,
  `cinemaSession_id` int NOT NULL,
  `payment_id` int NOT NULL,
  PRIMARY KEY (`id_booking`),
  KEY `fk_cinemaSession_id` (`cinemaSession_id`),
  KEY `fk_customers_id` (`customers_id`),
  KEY `fk_payment_id` (`payment_id`),
  CONSTRAINT `fk_cinemaSession_id` FOREIGN KEY (`cinemaSession_id`) REFERENCES `cinema_session` (`id_cinema_session`),
  CONSTRAINT `fk_customers_id` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id_customers`),
  CONSTRAINT `fk_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id_payment`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,5.9,'2023-01-12',10,3,1),(3,3,2,18.4,'2023-01-12',13,6,1),(10,10,6,55.2,'2023-01-12',10,1,1),(11,1,1,5.9,'2023-01-12',1,3,1),(12,2,2,15.01,'2023-01-12',2,2,2),(13,3,2,18.4,'2023-01-12',3,6,1),(14,4,5,46,'2023-01-12',4,8,1),(15,5,6,55.2,'2023-01-12',5,2,1),(16,6,2,12.08,'2023-01-12',6,3,1),(17,7,2,46.51,'2023-01-12',7,5,2),(18,8,3,22.7,'2023-01-12',8,10,2),(19,9,4,40.66,'2023-01-12',9,4,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_session`
--

DROP TABLE IF EXISTS `cinema_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_session` (
  `id_cinema_session` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hours` time NOT NULL,
  `movie_id` int NOT NULL,
  `hall_id` int NOT NULL,
  PRIMARY KEY (`id_cinema_session`),
  KEY `fk_movie_id` (`movie_id`),
  KEY `fk_hall_id` (`hall_id`),
  CONSTRAINT `fk_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`id_hall`),
  CONSTRAINT `fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_session`
--

LOCK TABLES `cinema_session` WRITE;
/*!40000 ALTER TABLE `cinema_session` DISABLE KEYS */;
INSERT INTO `cinema_session` VALUES (1,'2023-01-12','15:30:00',1,9),(2,'2023-01-12','11:15:00',4,2),(3,'2023-01-12','11:30:00',3,4),(4,'2023-01-12','17:00:00',2,6),(5,'2023-01-12','18:45:00',6,3),(6,'2023-01-12','19:00:00',1,5),(7,'2023-01-12','19:30:00',7,8),(8,'2023-01-12','20:00:00',10,3),(9,'2023-01-12','20:30:00',4,1),(10,'2023-01-12','21:00:00',8,7);
/*!40000 ALTER TABLE `cinema_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id_customers` int NOT NULL AUTO_INCREMENT,
  `dateOfBirth` date NOT NULL,
  `isStudent` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int NOT NULL,
  `prices_id` int NOT NULL,
  PRIMARY KEY (`id_customers`),
  KEY `fk_customers_users_id` (`users_id`),
  KEY `fk_prices_id` (`prices_id`),
  CONSTRAINT `fk_customers_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id_users`),
  CONSTRAINT `fk_prices_id` FOREIGN KEY (`prices_id`) REFERENCES `prices` (`id_prices`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'2010-03-11',0,3,3),(2,'1988-02-13',0,1,1),(3,'1983-10-09',0,2,1),(4,'2012-11-02',0,4,3),(5,'1991-05-03',0,5,1),(6,'1995-10-11',0,6,1),(7,'2008-03-28',1,8,2),(8,'1991-03-30',0,9,1),(9,'1998-10-15',1,7,2),(10,'2005-10-11',1,6,2),(11,'1981-03-28',0,8,1),(12,'1991-03-30',0,9,1),(13,'1998-10-15',1,7,2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall` (
  `id_hall` int NOT NULL AUTO_INCREMENT,
  `roomNumber` int NOT NULL,
  `capacity_place` int NOT NULL,
  `theater_id` int NOT NULL,
  PRIMARY KEY (`id_hall`),
  KEY `fk_hall_theater_id` (`theater_id`),
  CONSTRAINT `fk_hall_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`id_theater`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,1,650,1),(2,2,600,2),(3,3,550,3),(4,4,500,4),(5,5,450,5),(6,6,400,6),(7,7,350,7),(8,8,300,8),(9,9,250,9);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id_movie` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `release_date` datetime NOT NULL,
  `duration` time NOT NULL,
  `genre` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `directed_by` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Flamingo Road','2022-02-03 00:00:00','02:10:00','Drama|Romance','Audy Mompesson'),(2,'Mississippi Masala','2022-04-14 00:00:00','01:43:00','Drama|Romance','Michel Matteotti'),(3,'Space Pirate Captain Harlock: Arcadia of My Youth','2022-07-01 00:00:00','01:26:00','Action|Adventure|Sci-Fi','Valaree Wheatley'),(4,'Standing Still','2022-10-01 00:00:00','02:15:00','Comedy|Drama|Romance','Laurent Cunnell'),(5,'Chained for Life','2022-02-14 00:00:00','02:23:00','Crime','Kristos Veeler'),(6,'Friday','2022-01-30 00:00:00','02:01:00','Comedy','Lee Widdall'),(7,'Nuremberg','2022-03-18 00:00:00','02:10:00','Drama|War','Merl Iskow'),(8,'Very Potter Musical, A','2022-06-01 00:00:00','02:09:00','Comedy|Musical','Keelby Heigho'),(9,'License to Drive','2022-01-03 00:00:00','01:43:00','Comedy','Lorelle Kedie'),(10,'Scream 3','2022-08-19 00:00:00','02:11:00','Comedy|Horror|Mystery|Thriller','Renato Chatan');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_payment`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Paiement en ligne'),(2,'Paiement au comptoir');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `id_prices` int NOT NULL AUTO_INCREMENT,
  `label` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id_prices`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'Plein tarif',9.2),(2,'Etudiant',7.6),(3,'Moins de 14 ans',5.9);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater` (
  `id_theater` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantity_room` int NOT NULL,
  PRIMARY KEY (`id_theater`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'HEALTHO','4198 Anhalt Pass','Bor',9),(2,'AtoQ','2166 Bultman Plaza','Qiandeng',5),(3,'Zoro','1577 Rusk Drive','Fenshui',9),(4,'LBEL','2 International Street','Le Lamentin',3),(5,'Alpra','957 Jenifer Court','Lumbayan',3),(6,'Lisino','3 Cordelia Circle','Wanganui',10),(7,'Clonid','96 Scott Street','Banjarbaru',9),(8,'HYVEE','87874 Reindahl Crossing','Ajdabiya',10),(9,'Simtin','02299 Blaine Pass','Kunvald',6),(10,'Urea','875 Messerschmidt Park','Gaozhou',3);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Norway','Brody','bnorway0@bbb.org','$2y$10$hdqFjNN.GsrSDm8EXBZ7IOqzt2ryxWGBDNge6bYJL750D/qMQJwny','2023-01-06 09:49:49'),(2,'Charlick','Sargent','scharlick1@geocities.com','$2y$10$ajhvhtcAJEhS5ZEU1bEjWOczM1vZtTcz3zlUk7U/Lc0LYHkLpJlzG','2023-01-06 09:49:49'),(3,'Josselson','Cecile','cjosselson2@answers.com','$2y$10$EXVBbZLySFyv/muXnOL2mez0PYdkrXxWverxSG7mcGpWaIprn5VHu','2023-01-06 09:49:49'),(4,'Lopez','Rudyard','rlopez3@fastcompany.com','$2y$10$PdmSCKJA9KbIlURhHwu9zuZHkz4P2io2kk7Bt8jXaESTbFmAspL7q','2023-01-06 09:49:49'),(5,'Leneham','Ashby','aleneham4@arizona.edu','$2y$10$JVScDKl.EdrHh5KRBiptmOMCv/sW4bMesTI4hB2xXnVc9UHf2cTtO','2023-01-06 09:49:49'),(6,'Rosenkranc','Tim','trosenkranc5@nhs.uk','$2y$10$ufvtyyhJGapOZGF0MfPHAutojI3VZQ5PTISr5qqjV6Vm82/VoIyum','2023-01-06 09:49:49'),(7,'Taborre','Petey','ptaborre6@pinterest.com','$2y$10$r3NCmD5qIpO7cVZ6DL3bSOrqCzG9aouEbmIg9FN5wGtSsq.ywlT3a','2023-01-06 09:49:49'),(8,'Durbann','Sheri','sdurbann7@princeton.edu','$2y$10$4dTepYBDSqxxt1Q1E7e17eAvwXIYcXuWKr3me/RnRknRquIGbgwtK','2023-01-06 09:49:49'),(9,'Dunster','Katie','kdunster8@tripadvisor.com','$2y$10$MjuXP0Cweq1igf1FfW3qyufwg4x2Q4p8j99U.fUhADljSxFbBNxp2','2023-01-06 09:49:49'),(10,'Smickle','Agace','asmickle9@jimdo.com','$2y$10$H.hOdxZ5EyFcBN6p9XFSl.XztuMOhE2Qpmt1kVAyuUL8hcEpwsDgG','2023-01-06 09:49:49'),(11,'Peppin','Jose','jpeppin0@naver.com','$2y$10$4jjwal2GguAWKG6tksyYM.XDmBGV13PYJ/dwfCpgimgzZHYLHXx22','2023-01-06 09:49:49'),(12,'Pedrielli','L;urette','lpedrielli1@rediff.com','$2y$10$6668H.zOsVgICcErZ0jS0uPnqxF6lQLD0APYOh6eLl1B7zqiKoflK','2023-01-06 09:49:49'),(13,'Putnam','Laurene','lputnam2@skyrock.com','$2y$10$Da5ZjtoTdN3AP0ZYZc9.Q.M65mtfBOhviyGZ1VxUPmHINeHzyGSjG','2023-01-06 09:49:49'),(14,'Niland','Teddy','tniland3@narod.ru','$2y$10$dioAExMdvCcHfj2fjuILxesLMd8ed7vys/RNEafWDdv4BDCO3mCRK','2023-01-06 09:49:49'),(15,'Itzakson','Dore','ditzakson4@statcounter.com','$2y$10$I8VJXQzBXj0FdDE7Tchsb./WWls8eNPF7SVu4Vcoc6LDX7trzH8ju','2023-01-06 09:49:49'),(16,'Pleager','Kelly','kpleager5@webmd.com','$2y$10$PL.5dmwYJfvYf8uW80vAh.zkDd6E8UBdMqcmRnXJYrF4pMndmpBKq','2023-01-06 09:49:49'),(17,'Redler','Ceciley','credler6@ask.com','$2y$10$p7TBFMrCO1GL8jwBrH7u3Oj/b7tqbTk8qFLBj6U5FUqUKRkn5jstS','2023-01-06 09:49:49'),(18,'Deary','Lannie','ldeary7@digg.com','$2y$10$TY5HQ4ltjc.EXr0EoEmCdu/zHIsSiHA0mdV0yWycjAHlyiDkqEVmq','2023-01-06 09:49:49'),(19,'Marshall','Shannon','smarshall8@cbsnews.com','$2y$10$BUE4h/yaR3VA8r0UErbcN.yu9hLu9sA2zee.OVkDKK8uHFvMHHyWy','2023-01-06 09:49:49'),(20,'Baruch','Fayre','fbaruch9@rakuten.co.jp','$2y$10$..8fQOL973MCN0lXGL0vrOmc4tmbWrmUvRRdUWQp9E3x3nVws0bi2','2023-01-06 09:49:49'),(21,'Testo','Abbe','atesto0@biblegateway.com','$2y$10$eiPMZ6REPIf.ejXqN1WBEeqNWQJHMlLWt1c6aiclmR92ncm36tGMy','2023-01-06 09:49:49'),(22,'Cowen','Rourke','rcowen1@forbes.com','$2y$10$dZ2Kskkrv9KRJGjYKnHBsuCO7iJ2XckHp02xCh1cTbC8K2cLJ1.Xm','2023-01-06 09:49:49'),(23,'Worssam','Georgeanne','gworssam2@goo.ne.jp','$2y$10$3qJJ4JAxKbqHFh5vGtIoe.3iIcgKNIyyylYnUDFHczd/2o7tmKEtS','2023-01-06 09:49:49'),(24,'Bartrum','Britteny','bbartrum3@smh.com.au','$2y$10$z9GT3D4R8Zt/bQmm9cXuieCTBVCB6navJBdIYPTFwC0n.hbC.hFAK','2023-01-06 09:49:49'),(25,'Saull','Trumaine','tsaull4@europa.eu','$2y$10$ua3dpUhtPtyIdqgck96zBeTi0YUUdOlIyeQnEhGxGlOeTqWvWbx.K','2023-01-06 09:49:49'),(26,'Camoletto','Keith','kcamoletto5@alexa.com','$2y$10$5ljhrnzdXCz8lrXiVBtAhObo5khZ.4KOWtd1HGKxFYmA4Zk5cj9PW','2023-01-06 09:49:49'),(27,'Crummey','Gherardo','gcrummey6@hao123.com','$2y$10$UNKvY5ds6USqfxw7A3KbTuASCk58k/oYq7dUPIK/YhPC4pAtuZHyW','2023-01-06 09:49:49'),(28,'MacLure','Gillie','gmaclure7@timesonline.co.uk','$2y$10$0pMaNckwBuKzOJXaUXMcNO6J742yf1OPUBjJ.KKyscBjP86PE6KC2','2023-01-06 09:49:49'),(29,'Ianno','Wilma','wianno8@list-manage.com','$2y$10$9337MJ5Uih3CfPzY5mBMZubqPgrKOQ6QvCLp1dvG45lEXO5wQ2Jeu','2023-01-06 09:49:49'),(30,'Albury','Cobbie','calbury9@reference.com','$2y$10$rl9uIGLWsACqyJh2yNULzeDle3gobOgbaCJdQokGXmC8rkj7.W81G','2023-01-06 09:49:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `age`
--

/*!50001 DROP VIEW IF EXISTS `age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `age` AS select `customers`.`id_customers` AS `id_customers`,`customers`.`dateOfBirth` AS `dateOfBirth`,round(((to_days(now()) - to_days(`customers`.`dateOfBirth`)) / 365),0) AS `ROUND(DATEDIFF(now(), dateOfBirth) / 365)` from `customers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 14:20:27
