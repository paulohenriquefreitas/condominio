-- MySQL dump 10.13  Distrib 5.6.19, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: Condominio
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Table structure for table `Fornecedor`
--

DROP TABLE IF EXISTS `Fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedor`
--

LOCK TABLES `Fornecedor` WRITE;
/*!40000 ALTER TABLE `Fornecedor` DISABLE KEYS */;
INSERT INTO `Fornecedor` VALUES (1,'Supermercado Guanabara '),(2,'Energia Elétrica'),(3,'Casas Guanabara C. L.'),(4,'JVD Infonorte Info. Ltda'),(5,'Mercearia Diniz Ltda'),(6,'Eurico de Castor M. Filho'),(7,'Cedae'),(8,'Alcimar (Nem)'),(9,'Thelma Leal'),(10,'Paulo Henrique'),(11,'Bradesco Ltda'),(12,'Papelaria Summer Ltda'),(13,'Meta Ltda'),(14,'Kalunga Comércio Ltda'),(15,'Torre e Cia Supermercado'),(16,'Lojas Magal Ltda'),(17,'Street Fighter Bazar'),(18,'El Shammah');
/*!40000 ALTER TABLE `Fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Morador`
--

DROP TABLE IF EXISTS `Morador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Morador` (
  `nome` varchar(45) NOT NULL,
  `ap` varchar(45) NOT NULL,
  PRIMARY KEY (`ap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Morador`
--

LOCK TABLES `Morador` WRITE;
/*!40000 ALTER TABLE `Morador` DISABLE KEYS */;
INSERT INTO `Morador` VALUES ('Alvaro Fiaes Inacio','101'),('Edla Lemos das Chagas','102'),('Jayme Sampaio Guimaraes','103'),('Agostinho Guerra Antonio','201'),('Ivan Luiz','202'),('Awrum Reznil','203'),('Eduardo','301'),('Paulo Henrique de Freitas','302'),('Thelma Leal','303'),('Marcos Antonio J. Santos','401'),('Gladys Barbosa da Silva','402'),('Rodrigues Pestana Cardoso','403');
/*!40000 ALTER TABLE `Morador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagamento`
--

DROP TABLE IF EXISTS `Pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `fornecedor` varchar(255) NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `complemento` varchar(60) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagamento`
--

LOCK TABLES `Pagamento` WRITE;
/*!40000 ALTER TABLE `Pagamento` DISABLE KEYS */;
INSERT INTO `Pagamento` VALUES (28,'2017-07-15','Alcimar (Nem)','Julho','Retirada de entulho do sotão',40,'cota extra'),(29,'2017-07-15','Alcimar (Nem)','Julho','Retirada de cano velho do sotão',200,'cota extra'),(30,'2017-07-18','Cedae','Julho','Consumo de médio (174)',1090.08,'condominio'),(31,'2017-07-19','Eurico de Castor M. Filho','Julho','Manutenção de Interfone',110,'condominio'),(32,'2017-07-22','Eurico de Castor M. Filho','Julho','Revisão de cabeamento de interfone',60,'condominio'),(34,'2017-07-15','JVD Infonorte Info. Ltda','Julho','9 placas de sinalização',42,'condominio'),(35,'2017-07-04','Energia Elétrica','Julho','Consumo médio (194)',147.59,'condominio'),(36,'2017-07-03','Casas Guanabara C. L.','Julho','Material de Limpeza',17.96,'condominio'),(37,'2017-07-06','Casas Guanabara C. L.','Julho','Material de Limpeza',21.94,'condominio'),(38,'2017-07-16','Mercearia Diniz Ltda','Julho','Sabão de côco em barras',8.96,'condominio'),(39,'2017-07-31','Thelma Leal','Julho','Serviços prestados',502.08,'condominio'),(40,'2017-07-31','Paulo Henrique','Julho','Taxas Administrativas',30,'condominio'),(42,'2017-07-14','Bradesco Ltda','Julho','Tar. Bancárias 47,90+Tar. cobranças 24,51',72.41,'condominio'),(43,'2017-08-02','Energia Elétrica','Agosto','Consumo de médio (193)',147.84,'condominio'),(44,'2017-08-15','Eurico de Castor M. Filho','Agosto','Manutenção de Interfone',110,'condominio'),(45,'2017-08-15','Cedae','Agosto','Consumo de médio (168)',1052.49,'condominio'),(46,'2017-08-16','Papelaria Summer Ltda','Agosto','Papel Chamequinho e envelope',7.5,'condominio'),(47,'2017-08-17','Meta Ltda','Agosto','Revisão do para-raios',400,'cota extra'),(48,'2017-08-31','Thelma Leal','Agosto','Serviços prestados',502.08,'condominio'),(49,'2017-08-31','Paulo Henrique','Agosto','Taxas Administrativas',30,'condominio'),(50,'2017-08-14','Bradesco Ltda','Agosto','Tarifa Bancárias 47,90 + Tarifas de cobranças 29,60',77.5,'condominio'),(51,'2017-09-01','Kalunga Comércio Ltda','Setembro','3 lâmpadas Lumens Bivolt Led',46.2,'condominio'),(52,'2017-09-03','Torre e Cia Supermercado','Setembro','Material de Limpeza',20.72,'condominio'),(53,'2017-09-04','Energia Elétrica','Setembro','Consumo de médio (215)',170.69,'condominio'),(54,'2017-09-13','Cedae','Setembro','Consumo de médio (168)',1090.22,'condominio'),(55,'2017-09-18','Casas Guanabara C. L.','Setembro','Pá de lixo',12.9,'condominio'),(56,'2017-09-30','Thelma Leal','Setembro','Serviços prestados',502.08,'condominio'),(57,'2017-09-20','Eurico de Castor M. Filho','Setembro','Manutenção de Interfone',110,'condominio'),(58,'2017-09-15','Bradesco Ltda','Setembro','Tarifa Bancárias 47,90 + Tarifas de cobranças 25,90',73.8,'condominio'),(59,'2017-09-30','Paulo Henrique','Setembro','Taxas Administrativas',30,'condominio'),(60,'2017-10-04','Casas Guanabara C. L.','Outubro','Material de Limpeza',31.07,'condominio'),(61,'2017-10-03','Energia Elétrica','Outubro','Consumo de médio (209)',164.23,'condominio'),(62,'2017-10-13','Cedae','Outubro','Consumo de médio (174)',1129.17,'condominio'),(63,'2017-10-16','Eurico de Castor M. Filho','Outubro','Manutenção de Interfone',110,'condominio'),(64,'2017-10-31','Thelma Leal','Outubro','Serviços prestados',502.08,'condominio'),(65,'2017-10-31','Paulo Henrique','Outubro','Taxas Administrativas',30,'condominio'),(66,'2017-10-13','Bradesco Ltda','Outubro','Tarifa Bancárias 47,90 + Tarifas de cobranças 25,03',72.93,'condominio'),(67,'2017-11-02','Energia Elétrica','Novembro','Consumo de médio (212)',152,'condominio'),(68,'2017-11-02','Energia Elétrica','Novembro','Desconto de Lançamento a maior dos meses anteriores',-152,'condominio'),(69,'2017-11-11','Lojas Magal Ltda','Novembro','Envelope',8.07,'condominio'),(70,'2017-11-13','Cedae','Novembro','Consumo de médio (192)',1245.99,'condominio'),(71,'2017-11-25','Street Fighter Bazar','Novembro','Material de construção',28.4,'condominio'),(72,'2017-11-25','El Shammah','Novembro','Limpeza de caixa dágua',500,'condominio'),(73,'2017-11-30','Thelma Leal','Novembro','Serviços prestados',502.08,'condominio'),(74,'2017-11-30','Paulo Henrique','Novembro','Taxas Administrativas',30,'condominio'),(75,'2017-11-14','Bradesco Ltda','Novembro','Tarifa Bancárias 47,90 + Tarifas de cobranças 13,86',61.76,'condominio'),(76,'2017-12-04','Energia Elétrica','Dezembro','Consumo de médio (213)',162.76,'condominio'),(77,'2017-12-04','Energia Elétrica','Dezembro','Desconto de Lançamento a maior dos meses anteriores',-141.61,'condominio'),(78,'2017-12-05','Supermercado Guanabara ','Dezembro','Material de Limpeza',56.39,'condominio'),(79,'2017-12-12','Eurico de Castor M. Filho','Dezembro','Manutenção de Interfone',110,'condominio'),(80,'2017-12-13','Cedae','Dezembro','Consumo de médio (186)',1207.04,'condominio'),(81,'2017-12-31','Paulo Henrique','Dezembro','Taxas Administrativas',30,'condominio'),(82,'2017-12-31','Thelma Leal','Dezembro','Serviços prestados',502.08,'condominio'),(83,'2017-12-31','Thelma Leal','Dezembro','Contribuição natalina',502.08,'condominio'),(84,'2017-12-15','Bradesco Ltda','Dezembro','Tarifa Bancárias 47,90 + Tarifas de cobranças 21,73',69.63,'condominio'),(85,'2018-01-08','Energia Elétrica','Janeiro','Consumo médio (192)',150.38,'condominio'),(86,'2018-01-12','Eurico de Castor M. Filho','Janeiro','Manutenção de Interfone',110,'condominio'),(87,'2018-01-15','Cedae','Janeiro','Consumo médio (192)',1311.68,'condominio'),(88,'2018-01-31','Paulo Henrique','Janeiro','Tarifas Administrativas',30,'condominio'),(89,'2018-01-31','Thelma Leal','Janeiro','Serviços prestados',502.08,'condominio'),(90,'2018-01-15','Bradesco Ltda','Janeiro','Tarifas Bancárias 50,90 + Tarifas de cobranças 39,29',90.19,'condominio');
/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recebimento`
--

DROP TABLE IF EXISTS `Recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recebimento` (
  `id_rece` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `valor` double NOT NULL,
  `fk_morador` varchar(45) NOT NULL,
  `multa` double DEFAULT NULL,
  PRIMARY KEY (`id_rece`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recebimento`
--

LOCK TABLES `Recebimento` WRITE;
/*!40000 ALTER TABLE `Recebimento` DISABLE KEYS */;
INSERT INTO `Recebimento` VALUES (128,'2017-06-21','condominio','Junho 2017',4055.02,'302',0),(129,'2017-06-21','fundo de reserva','Junho 2017',1357,'302',0),(130,'2017-06-21','cota extra','Junho 2017',742.7,'302',0),(132,'2017-07-19','condominio','Julho 2017',203.4,'202',0),(134,'2017-07-19','fundo de reserva','Julho 2017',20,'202',0),(137,'2017-07-17','condominio','Junho 2017',203.4,'202',0),(138,'2017-07-17','fundo de reserva','Junho 2017',20,'202',0),(139,'2017-07-24','condominio','Julho 2017',203.4,'102',0),(140,'2017-07-24','fundo de reserva','Julho 2017',20,'102',0),(141,'2017-07-24','condominio','Julho 2017',203.4,'402',0),(142,'2017-07-24','fundo de reserva','Julho 2017',20,'402',0),(145,'2017-07-24','condominio','Julho 2017',203.4,'103',0),(146,'2017-07-24','fundo de reserva','Julho 2017',20,'103',0),(147,'2017-07-28','condominio','Julho 2017',203.4,'401',5.5),(148,'2017-07-28','fundo de reserva','Julho 2017',20,'401',0),(152,'2017-07-10','condominio','Junho 2017',203.4,'101',7.45),(153,'2017-07-10','fundo de reserva','Junho 2017',20,'101',0),(154,'2017-07-17','condominio','Julho 2017',203.4,'101',0),(155,'2017-07-17','fundo de reserva','Julho 2017',20,'101',0),(156,'2017-07-20','condominio','Julho 2017',203.4,'403',0),(157,'2017-07-20','fundo de reserva','Julho 2017',20,'403',0),(158,'2017-07-21','condominio','Julho 2017',203.4,'203',0),(159,'2017-07-21','fundo de reserva','Julho 2017',20,'203',0),(160,'2017-07-24','condominio','Julho 2017',203.4,'201',0),(161,'2017-07-24','fundo de reserva','Julho 2017',20,'201',0),(162,'2017-07-21','condominio','Julho 2017',203.4,'303',0),(163,'2017-07-21','fundo de reserva','Julho 2017',20,'303',0),(164,'2017-07-17','condominio','Julho 2017',203.4,'302',0),(165,'2017-07-17','fundo de reserva','Julho 2017',20,'302',0),(166,'2017-08-19','condominio','Agosto 2017',203.4,'202',0),(167,'2017-08-19','fundo de reserva','Agosto 2017',20,'202',0),(168,'2017-08-19','condominio','Agosto 2017',203.4,'302',0),(169,'2017-08-19','fundo de reserva','Agosto 2017',20,'302',0),(170,'2017-08-23','condominio','Agosto 2017',203.4,'201',0),(171,'2017-08-23','fundo de reserva','Agosto 2017',20,'201',0),(172,'2017-08-21','condominio','Agosto 2017',203.4,'101',0),(173,'2017-08-21','fundo de reserva','Agosto 2017',20,'101',0),(174,'2017-08-23','condominio','Agosto 2017',203.4,'203',0),(175,'2017-08-23','fundo de reserva','Agosto 2017',20,'203',0),(176,'2017-08-23','condominio','Agosto 2017',203.4,'102',0),(177,'2017-08-23','fundo de reserva','Agosto 2017',20,'102',0),(178,'2017-08-23','condominio','Agosto 2017',203.4,'402',0),(179,'2017-08-23','fundo de reserva','Agosto 2017',20,'402',0),(180,'2017-08-23','condominio','Agosto 2017',203.4,'103',0),(181,'2017-08-23','fundo de reserva','Agosto 2017',20,'103',0),(182,'2017-08-22','condominio','Agosto 2017',203.4,'403',0),(183,'2017-08-22','fundo de reserva','Agosto 2017',20,'403',0),(184,'2017-08-21','condominio','Agosto 2017',203.4,'303',0),(185,'2017-08-21','fundo de reserva','Agosto 2017',20,'303',0),(186,'2017-08-23','condominio','Agosto 2017',203.4,'401',0),(187,'2017-08-23','fundo de reserva','Agosto 2017',20,'401',0),(188,'2017-09-19','condominio','Setembro 2017',203.4,'202',0),(189,'2017-09-19','fundo de reserva','Setembro 2017',20,'202',0),(190,'2017-09-19','condominio','Setembro 2017',203.4,'302',0),(191,'2017-09-19','fundo de reserva','Setembro 2017',20,'302',0),(192,'2017-09-20','condominio','Setembro 2017',203.4,'101',0),(193,'2017-09-20','fundo de reserva','Setembro 2017',20,'101',0),(194,'2017-09-20','condominio','Setembro 2017',203.4,'103',0),(195,'2017-09-20','fundo de reserva','Setembro 2017',20,'103',0),(196,'2017-09-21','condominio','Setembro 2017',203.4,'102',0),(197,'2017-09-21','fundo de reserva','Setembro 2017',20,'102',0),(198,'2017-09-25','condominio','Setembro 2017',203.4,'203',0),(199,'2017-09-25','fundo de reserva','Setembro 2017',20,'203',0),(200,'2017-09-25','condominio','Setembro 2017',203.4,'402',0),(201,'2017-09-25','fundo de reserva','Setembro 2017',20,'402',0),(202,'2017-09-25','condominio','Setembro 2017',203.4,'403',0),(203,'2017-09-25','fundo de reserva','Setembro 2017',20,'403',0),(204,'2017-09-29','condominio','Setembro 2017',203.4,'401',5.5),(205,'2017-09-29','fundo de reserva','Setembro 2017',20,'401',0),(206,'2017-09-19','condominio','Setembro 2017',203.4,'303',0),(207,'2017-09-19','fundo de reserva','Setembro 2017',20,'303',0),(208,'2017-10-09','condominio','Outubro 2017',203.4,'101',0),(209,'2017-10-09','fundo de reserva','Outubro 2017',20,'101',0),(210,'2017-10-13','condominio','Setembro 2017',203.4,'201',5.5),(211,'2017-10-13','fundo de reserva','Setembro 2017',20,'201',0),(212,'2017-10-19','condominio','Outubro 2017',203.4,'201',0),(213,'2017-10-19','fundo de reserva','Outubro 2017',20,'201',0),(214,'2017-10-20','condominio','Outubro 2017',203.4,'402',0),(215,'2017-10-20','fundo de reserva','Outubro 2017',20,'402',0),(216,'2017-10-23','condominio','Outubro 2017',203.4,'203',0),(217,'2017-10-23','fundo de reserva','Outubro 2017',20,'203',0),(218,'2017-10-23','condominio','Outubro 2017',203.4,'403',0),(219,'2017-10-23','fundo de reserva','Outubro 2017',20,'403',0),(220,'2017-10-31','condominio','Outubro 2017',203.4,'401',5.95),(221,'2017-10-31','fundo de reserva','Outubro 2017',20,'401',0),(222,'2017-10-19','condominio','Outubro 2017',203.4,'202',0),(223,'2017-10-19','fundo de reserva','Outubro 2017',20,'202',0),(224,'2017-10-19','condominio','Outubro 2017',203.4,'302',0),(225,'2017-10-19','fundo de reserva','Outubro 2017',20,'302',0),(226,'2017-10-19','condominio','Outubro 2017',203.4,'303',0),(227,'2017-10-19','fundo de reserva','Outubro 2017',20,'303',0),(228,'2017-11-19','condominio','Novembro 2017',203.4,'202',0),(229,'2017-11-19','fundo de reserva','Novembro 2017',20,'202',0),(230,'2017-11-19','condominio','Novembro 2017',203.4,'302',0),(231,'2017-11-19','fundo de reserva','Novembro 2017',20,'302',0),(232,'2017-11-19','condominio','Novembro 2017',203.4,'303',0),(233,'2017-11-19','fundo de reserva','Novembro 2017',20,'303',0),(234,'2017-11-21','condominio','Outubro 2017',203.4,'102',9.1),(235,'2017-11-21','fundo de reserva','Outubro 2017',20,'102',0),(236,'2017-11-21','condominio','Novembro 2017',203.4,'101',0),(237,'2017-11-21','fundo de reserva','Novembro 2017',20,'101',0),(238,'2017-11-21','condominio','Novembro 2017',203.4,'203',0),(239,'2017-11-21','fundo de reserva','Novembro 2017',20,'203',0),(244,'2017-11-21','condominio','Novembro 2017',203.4,'402',0),(245,'2017-11-21','fundo de reserva','Novembro 2017',20,'402',0),(246,'2017-11-21','condominio','Novembro 2017',203.4,'102',0),(247,'2017-11-21','fundo de reserva','Novembro 2017',20,'102',0),(248,'2017-11-21','condominio','Novembro 2017',203.4,'103',0),(249,'2017-11-21','fundo de reserva','Novembro 2017',20,'103',0),(250,'2017-11-21','condominio','Novembro 2017',203.4,'401',0),(251,'2017-11-21','fundo de reserva','Novembro 2017',20,'401',0),(252,'2017-11-22','condominio','Novembro 2017',203.4,'403',0),(253,'2017-11-22','fundo de reserva','Novembro 2017',20,'403',0),(254,'2017-12-19','condominio','Dezembro 2017',203.4,'202',0),(255,'2017-12-19','fundo de reserva','Dezembro 2017',20,'202',0),(256,'2017-12-19','condominio','Dezembro 2017',203.4,'302',0),(257,'2017-12-19','fundo de reserva','Dezembro 2017',20,'302',0),(258,'2017-12-19','condominio','Dezembro 2017',203.4,'303',0),(259,'2017-12-19','fundo de reserva','Dezembro 2017',20,'303',0),(260,'2017-12-18','condominio','Dezembro 2017',203.4,'101',0),(261,'2017-12-18','fundo de reserva','Dezembro 2017',20,'101',0),(262,'2017-12-19','condominio','Dezembro 2017',203.4,'403',0),(263,'2017-12-19','fundo de reserva','Dezembro 2017',20,'403',0),(264,'2017-12-20','condominio','Dezembro 2017',203.4,'102',0),(265,'2017-12-20','fundo de reserva','Dezembro 2017',20,'102',0),(266,'2017-12-21','condominio','Dezembro 2017',203.4,'402',0),(267,'2017-12-21','fundo de reserva','Dezembro 2017',20,'402',0),(268,'2017-12-22','condominio','Novembro 2017',203.4,'201',4.75),(269,'2017-12-22','fundo de reserva','Novembro 2017',20,'201',0),(270,'2018-01-03','condominio','Dezembro 2017',203.4,'401',6.25),(271,'2018-01-03','fundo de reserva','Dezembro 2017',20,'401',0),(274,'2018-01-18','condominio','Dezembro 2017',203.4,'201',8.5),(275,'2018-01-18','fundo de reserva','Dezembro 2017',20,'201',0),(276,'2018-01-04','condominio','Dezembro 2017',203.4,'203',6.4),(277,'2018-01-04','fundo de reserva','Dezembro 2017',20,'203',0),(278,'2018-01-15','condominio','Janeiro 2017',203.4,'101',0),(279,'2018-01-15','fundo de reserva','Janeiro 2017',20,'101',0),(280,'2018-01-22','condominio','Janeiro 2017',203.4,'203',0),(281,'2018-01-22','fundo de reserva','Janeiro 2017',20,'203',0),(282,'2018-01-22','condominio','Janeiro 2017',203.4,'102',0),(283,'2018-01-22','fundo de reserva','Janeiro 2017',20,'102',0),(284,'2018-01-22','condominio','Janeiro 2017',203.4,'402',0),(285,'2018-01-22','fundo de reserva','Janeiro 2017',20,'402',0),(286,'2018-01-22','condominio','Janeiro 2017',203.4,'103',0),(287,'2018-01-22','fundo de reserva','Janeiro 2017',20,'103',0),(288,'2018-01-24','condominio','Janeiro 2017',203.4,'403',5.05),(289,'2018-01-24','fundo de reserva','Janeiro 2017',20,'403',0),(290,'2018-01-30','condominio','Janeiro 2017',203.4,'401',5.95),(291,'2018-01-30','fundo de reserva','Janeiro 2017',20,'401',0),(292,'2018-01-22','condominio','Janeiro 2017',203.4,'202',0),(293,'2018-01-22','fundo de reserva','Janeiro 2017',20,'202',0),(294,'2018-01-22','condominio','Janeiro 2017',203.4,'302',0),(295,'2018-01-22','fundo de reserva','Janeiro 2017',20,'302',0),(296,'2018-01-22','condominio','Janeiro 2017',203.4,'303',0),(297,'2018-01-22','fundo de reserva','Janeiro 2017',20,'303',0);
/*!40000 ALTER TABLE `Recebimento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-24 12:03:23
