-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `idKategori` int(11) NOT NULL AUTO_INCREMENT,
  `Kategorinavn` varchar(45) NOT NULL,
  `Kategoribeskrivelse` varchar(45) NOT NULL,
  PRIMARY KEY (`idKategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Mobil','man kan snakke med folk'),(2,'Hodetelefon','man kan høre på musikk'),(3,'Apple','amerikansk elektroselskap'),(4,'Samsung','sørkoreansk elektronikkselskap'),(5,'Huawei','kinesisk elektronikkselskap');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunde` (
  `idKunde` int(11) NOT NULL AUTO_INCREMENT,
  `Fornavn` varchar(45) NOT NULL,
  `Etternavn` varchar(45) NOT NULL,
  `Gatenavn` varchar(100) NOT NULL,
  `Gatenummer` varchar(10) NOT NULL,
  `Epost` varchar(60) NOT NULL,
  `Mobilnummer` varchar(45) NOT NULL,
  `Poststed_Postnummer` varchar(4) NOT NULL,
  PRIMARY KEY (`idKunde`),
  KEY `fk_Kunde_Poststed1_idx` (`Poststed_Postnummer`),
  CONSTRAINT `fk_Kunde_Poststed1` FOREIGN KEY (`Poststed_Postnummer`) REFERENCES `poststed` (`Postnummer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde`
--

LOCK TABLES `kunde` WRITE;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordre`
--

DROP TABLE IF EXISTS `ordre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordre` (
  `Ordrenummer` int(11) NOT NULL AUTO_INCREMENT,
  `Kunde_id` int(11) NOT NULL,
  `Prissum` float NOT NULL,
  PRIMARY KEY (`Ordrenummer`),
  KEY `fk_Ordre_Kunde_idx` (`Kunde_id`),
  CONSTRAINT `fk_Ordre_Kunde` FOREIGN KEY (`Kunde_id`) REFERENCES `kunde` (`idKunde`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordre`
--

LOCK TABLES `ordre` WRITE;
/*!40000 ALTER TABLE `ordre` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordrelinje`
--

DROP TABLE IF EXISTS `ordrelinje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordrelinje` (
  `idOrdrelinje` int(11) NOT NULL AUTO_INCREMENT,
  `Produkt_id` int(11) NOT NULL,
  `Ordre_Ordrenummer` int(11) NOT NULL,
  `Antall` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrdrelinje`),
  KEY `fk_Ordrelinje_Produkt1_idx` (`Produkt_id`),
  KEY `fk_Ordrelinje_Ordre1_idx` (`Ordre_Ordrenummer`),
  CONSTRAINT `fk_Ordrelinje_Ordre1` FOREIGN KEY (`Ordre_Ordrenummer`) REFERENCES `ordre` (`Ordrenummer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordrelinje_Produkt1` FOREIGN KEY (`Produkt_id`) REFERENCES `produkt` (`idProdukt`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordrelinje`
--

LOCK TABLES `ordrelinje` WRITE;
/*!40000 ALTER TABLE `ordrelinje` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordrelinje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poststed`
--

DROP TABLE IF EXISTS `poststed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poststed` (
  `Postnummer` varchar(4) NOT NULL,
  `Poststed` varchar(45) NOT NULL,
  PRIMARY KEY (`Postnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poststed`
--

LOCK TABLES `poststed` WRITE;
/*!40000 ALTER TABLE `poststed` DISABLE KEYS */;
/*!40000 ALTER TABLE `poststed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `idProdukt` int(11) NOT NULL,
  `Produktnavn` varchar(45) NOT NULL,
  `Produktbeskrivelse` varchar(1000) NOT NULL,
  `Lanseringsår` varchar(45) NOT NULL,
  `Selskap` varchar(45) NOT NULL,
  `Bilde` varchar(45) NOT NULL,
  `Antall_lager` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProdukt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1,'Samsung S20+','Fin mobil','2020','Samsung','iphone-12-pro.png',10),(2,'Iphone 12','Flott mobil','2020','Apple','iphone-12-pro.png',20),(3,'Airpods Pro','God lyd','2019','Apple','iphone-12-pro.png',15),(4,'Samsung Airbuds','Billig og fin lyd','2020','Samsung','iphone-12-pro.png',5),(5,'Huawei P30 Pro','Billig og flott','2019','Huawei','iphone-12-pro.png',2);
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktalternativ`
--

DROP TABLE IF EXISTS `produktalternativ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produktalternativ` (
  `idProduktalternativ` int(11) NOT NULL AUTO_INCREMENT,
  `Produkt_idProdukt` int(11) NOT NULL,
  `Valgalternativer_idValgalternativ` int(11) NOT NULL,
  PRIMARY KEY (`idProduktalternativ`),
  KEY `fk_Produktalternativ_Produkt1_idx` (`Produkt_idProdukt`),
  KEY `fk_Produktalternativ_Valgalternativer1_idx` (`Valgalternativer_idValgalternativ`),
  CONSTRAINT `fk_Produktalternativ_Produkt1` FOREIGN KEY (`Produkt_idProdukt`) REFERENCES `produkt` (`idProdukt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produktalternativ_Valgalternativer1` FOREIGN KEY (`Valgalternativer_idValgalternativ`) REFERENCES `valgalternativer` (`idValgalternativ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktalternativ`
--

LOCK TABLES `produktalternativ` WRITE;
/*!40000 ALTER TABLE `produktalternativ` DISABLE KEYS */;
INSERT INTO `produktalternativ` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,2,1),(10,2,2),(11,2,3),(12,2,4),(13,2,5),(14,2,6),(15,2,7),(16,2,8),(17,3,3),(18,3,4),(19,4,3),(20,4,4),(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5),(26,5,6),(27,5,7),(28,5,8);
/*!40000 ALTER TABLE `produktalternativ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktkategori`
--

DROP TABLE IF EXISTS `produktkategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produktkategori` (
  `idProduktkategori` int(11) NOT NULL AUTO_INCREMENT,
  `Produkt_idProdukt` int(11) NOT NULL,
  `Kategori_idKategori` int(11) NOT NULL,
  PRIMARY KEY (`idProduktkategori`),
  KEY `fk_Produktkategori_Produkt1_idx` (`Produkt_idProdukt`),
  KEY `fk_Produktkategori_Kategori1_idx` (`Kategori_idKategori`),
  CONSTRAINT `fk_Produktkategori_Kategori1` FOREIGN KEY (`Kategori_idKategori`) REFERENCES `kategori` (`idKategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produktkategori_Produkt1` FOREIGN KEY (`Produkt_idProdukt`) REFERENCES `produkt` (`idProdukt`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktkategori`
--

LOCK TABLES `produktkategori` WRITE;
/*!40000 ALTER TABLE `produktkategori` DISABLE KEYS */;
INSERT INTO `produktkategori` VALUES (1,1,1),(2,1,4),(3,2,1),(4,2,3),(5,3,2),(6,3,3),(7,4,2),(8,4,4),(9,5,1),(10,5,5);
/*!40000 ALTER TABLE `produktkategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valgalternativer`
--

DROP TABLE IF EXISTS `valgalternativer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valgalternativer` (
  `idValgalternativ` int(11) NOT NULL AUTO_INCREMENT,
  `Størrelse` varchar(45) NOT NULL,
  `Farge` varchar(45) NOT NULL,
  PRIMARY KEY (`idValgalternativ`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valgalternativer`
--

LOCK TABLES `valgalternativer` WRITE;
/*!40000 ALTER TABLE `valgalternativer` DISABLE KEYS */;
INSERT INTO `valgalternativer` VALUES (1,'128','Lilla'),(2,'128','Blå'),(3,'128','Svart'),(4,'128','Hvit'),(5,'512','Lilla'),(6,'512','Blå'),(7,'512','Svart'),(8,'512','Hvit');
/*!40000 ALTER TABLE `valgalternativer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 15:33:34
