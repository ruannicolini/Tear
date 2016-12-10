CREATE DATABASE  IF NOT EXISTS `balay` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `balay`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: balay
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `acao`
--

DROP TABLE IF EXISTS `acao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acao` (
  `idacao` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acao`
--

LOCK TABLES `acao` WRITE;
/*!40000 ALTER TABLE `acao` DISABLE KEYS */;
INSERT INTO `acao` VALUES (2,'PREGAR'),(9,'CHULIAR'),(10,'FAZER'),(20,'FECHAR'),(22,'FITAR'),(23,'PASSAR'),(24,'PREPARAR'),(25,'REBATER'),(26,'UNIR'),(27,'COSTURAR'),(28,'TRAVAR'),(29,'REVISAR'),(30,'CORTAR'),(31,'EMBUTIR'),(32,'MARCAR'),(33,'MOSQUEAR'),(34,'CASEAR');
/*!40000 ALTER TABLE `acao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batida`
--

DROP TABLE IF EXISTS `batida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batida` (
  `idbatida` int(11) NOT NULL DEFAULT '0',
  `minutos` int(11) DEFAULT NULL,
  `segundos` int(11) DEFAULT NULL,
  `milesimos` int(11) DEFAULT NULL,
  `utilizar` tinyint(1) DEFAULT NULL,
  `idCronometragem` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbatida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batida`
--

LOCK TABLES `batida` WRITE;
/*!40000 ALTER TABLE `batida` DISABLE KEYS */;
INSERT INTO `batida` VALUES (347,0,2,78,1,244),(348,0,3,32,1,244),(349,0,3,46,1,244),(350,0,3,766,1,244),(356,0,6,703,1,246),(357,0,3,31,1,246),(358,0,0,172,1,246),(359,0,4,78,1,246),(360,0,3,766,1,246),(361,0,2,968,1,246),(362,0,3,407,0,246),(363,0,2,515,0,246),(364,0,3,266,1,248),(365,0,1,390,1,248),(366,0,1,532,1,248),(367,0,2,15,1,248),(368,0,1,938,1,248),(369,0,2,15,1,248),(376,0,2,172,1,249),(377,0,2,203,1,249),(378,0,2,16,1,249),(379,0,1,953,1,249),(380,0,1,843,1,249),(381,0,1,282,1,249),(383,0,2,375,1,249),(384,0,1,484,1,249),(385,0,1,93,1,258),(386,0,3,516,1,258),(387,0,3,766,1,258),(388,0,1,859,1,258),(389,0,0,125,1,258),(390,0,2,563,1,258),(405,0,4,672,1,191),(406,0,6,797,1,191),(407,0,5,828,1,191),(408,0,5,187,1,191),(409,0,5,938,1,191),(410,0,8,62,1,191),(411,0,5,47,1,191),(412,0,3,422,1,191),(419,0,6,781,1,194),(420,0,6,156,1,194),(421,0,5,891,1,194),(422,0,7,375,1,194),(423,0,7,562,1,194),(424,0,2,828,1,283),(425,0,5,937,1,283),(426,0,4,547,1,283),(427,0,6,703,1,283),(428,0,3,266,1,283),(429,0,35,406,1,283),(430,1,9,110,1,283),(431,0,5,500,1,192),(432,0,6,141,1,192),(433,0,8,125,1,192),(434,0,7,531,1,192),(443,1,0,735,1,285),(444,1,7,953,1,285),(445,0,51,562,0,285),(446,1,33,688,1,286),(447,1,28,265,1,286),(448,0,20,750,1,287),(449,0,23,250,1,287),(450,0,27,859,1,287),(451,1,23,687,1,288),(452,1,5,110,1,288),(453,0,45,203,1,290),(454,0,45,328,1,290),(455,0,32,265,1,291),(456,0,33,172,1,291),(457,0,26,860,1,289),(458,0,21,406,1,289),(459,0,29,625,1,294),(460,0,31,360,1,294),(461,1,13,203,1,293),(462,0,47,750,1,292),(463,1,2,78,1,295),(464,0,48,172,1,295),(465,1,11,469,1,295),(466,1,2,469,1,296),(468,0,34,578,1,297),(469,0,28,859,1,297),(470,0,38,360,1,297),(471,0,28,140,1,297),(472,0,50,719,1,297),(473,0,36,984,1,298),(474,0,44,329,1,298),(475,1,12,828,1,299),(476,0,33,859,1,300),(477,0,51,297,1,301),(478,0,15,812,1,302),(479,0,18,47,1,302),(480,0,18,125,1,304),(481,0,34,844,1,305),(482,0,15,125,1,305),(483,0,13,484,1,305),(484,0,51,172,1,306),(485,0,35,406,1,307),(486,0,38,859,1,308),(487,0,52,828,1,310),(488,0,38,688,1,309),(489,0,47,78,1,311),(490,0,52,422,1,312),(491,0,17,718,1,313),(492,0,56,47,1,314),(493,0,16,922,1,324),(494,0,22,719,1,315),(495,0,43,985,1,316),(496,0,39,203,1,317),(497,0,34,156,1,318),(498,1,57,734,1,319),(499,0,21,719,1,320),(500,1,4,485,1,322),(501,0,31,937,1,323),(502,0,41,79,1,327),(503,0,14,547,1,325),(504,0,19,313,1,325),(505,0,49,891,1,326),(506,0,44,78,1,328),(507,0,53,907,1,331),(508,0,48,969,1,329),(509,1,10,15,1,330),(510,0,28,563,1,332),(511,0,34,469,1,333),(512,1,18,375,1,334),(513,2,43,969,1,335),(514,0,52,891,1,336),(515,0,19,16,1,337),(516,0,24,250,1,321),(517,1,52,438,1,338),(518,0,45,250,1,339);
/*!40000 ALTER TABLE `batida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronometragem`
--

DROP TABLE IF EXISTS `cronometragem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronometragem` (
  `idcronometragem` int(11) NOT NULL DEFAULT '0',
  `tempo_original` tinyint(1) DEFAULT NULL,
  `tempo_ideal` tinyint(1) DEFAULT NULL,
  `ritmo` int(11) DEFAULT NULL,
  `num_pecas` int(11) DEFAULT NULL,
  `tolerancia` int(11) DEFAULT NULL,
  `comprimento_prod` float DEFAULT NULL,
  `num_ocorrencia` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `idCronometrista` int(11) DEFAULT NULL,
  `idTecido` int(11) DEFAULT NULL,
  `idOperacao` int(11) DEFAULT NULL,
  `idOperador` int(11) DEFAULT NULL,
  `tempoPadraoFinal` float DEFAULT '0',
  `dataCronometragem` date DEFAULT NULL,
  PRIMARY KEY (`idcronometragem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronometragem`
--

LOCK TABLES `cronometragem` WRITE;
/*!40000 ALTER TABLE `cronometragem` DISABLE KEYS */;
INSERT INTO `cronometragem` VALUES (191,0,0,90,1,10,10,1,7,NULL,NULL,26,NULL,5562.93,NULL),(192,1,1,80,1,10,NULL,1,7,NULL,NULL,9,NULL,6005.34,NULL),(194,1,0,80,1,20,NULL,1,7,NULL,14,5,NULL,6482.88,NULL),(244,0,0,80,1,10,NULL,1,7,NULL,2,28,NULL,2622.84,NULL),(246,0,0,85,1,15,NULL,1,105,1,1,5,1,3375.31,NULL),(248,0,0,95,1,15,NULL,1,105,NULL,1,9,NULL,2213.41,NULL),(249,1,0,80,1,10,NULL,1,105,NULL,10,22,NULL,1686.08,NULL),(250,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,26,NULL,0,NULL),(251,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,28,NULL,0,NULL),(252,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,32,NULL,0,NULL),(253,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,33,NULL,0,NULL),(254,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,34,NULL,0,NULL),(255,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,35,NULL,0,NULL),(256,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,37,NULL,0,NULL),(257,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,39,NULL,0,NULL),(258,0,0,80,1,10,NULL,1,105,NULL,NULL,65,NULL,1895.23,NULL),(259,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,40,NULL,0,NULL),(260,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,41,NULL,0,NULL),(261,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,42,NULL,0,NULL),(262,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,43,NULL,0,NULL),(263,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,44,NULL,0,NULL),(264,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,45,NULL,0,NULL),(265,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,46,NULL,0,NULL),(266,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,47,NULL,0,NULL),(267,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,48,NULL,0,NULL),(268,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,49,NULL,0,NULL),(269,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,50,NULL,0,NULL),(270,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,51,NULL,0,NULL),(271,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,52,NULL,0,NULL),(272,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,53,NULL,0,NULL),(273,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,54,NULL,0,NULL),(274,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,56,NULL,0,NULL),(275,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,57,NULL,0,NULL),(276,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,58,NULL,0,NULL),(277,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,59,NULL,0,NULL),(278,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,61,NULL,0,NULL),(279,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,62,NULL,0,NULL),(280,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,63,NULL,0,NULL),(281,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,64,NULL,0,NULL),(283,0,0,90,1,15,NULL,1,7,NULL,NULL,66,NULL,18895.7,NULL),(285,0,0,85,1,15,NULL,1,108,6,NULL,112,72,62896.3,NULL),(286,0,0,90,1,15,NULL,1,108,6,14,113,NULL,94160.7,NULL),(287,1,0,90,1,15,NULL,1,108,6,14,115,NULL,24791.4,NULL),(288,0,0,90,1,15,NULL,1,108,6,14,116,NULL,77002.4,NULL),(289,0,0,85,1,15,NULL,1,108,NULL,NULL,117,NULL,23590,NULL),(290,0,0,100,1,15,NULL,1,108,6,14,122,NULL,52055.3,NULL),(291,0,0,85,1,15,NULL,1,108,6,14,121,NULL,31982.3,NULL),(292,0,0,80,1,15,NULL,1,108,6,14,120,NULL,43930,NULL),(293,1,0,95,1,15,NULL,1,108,6,14,119,NULL,79974.3,NULL),(294,0,0,90,1,15,NULL,1,108,6,14,118,NULL,31559.7,NULL),(295,1,1,90,1,15,NULL,1,110,1,9,123,NULL,62693.1,NULL),(296,1,0,85,1,15,NULL,1,110,1,9,37,NULL,61063.4,NULL),(297,0,0,80,1,15,NULL,1,110,1,9,117,NULL,33240.7,NULL),(298,1,0,90,1,15,NULL,1,110,1,9,125,NULL,42079.5,NULL),(299,0,0,90,1,15,NULL,1,110,1,9,126,NULL,75377,NULL),(300,1,0,100,1,15,NULL,1,110,1,9,127,NULL,38937.9,NULL),(301,0,0,85,1,15,NULL,1,110,1,9,121,NULL,50142.8,NULL),(302,0,0,80,1,5,NULL,1,110,1,9,128,NULL,14220.8,NULL),(304,0,0,90,1,15,NULL,1,111,5,1,108,NULL,18759.4,NULL),(305,1,1,85,1,15,NULL,1,111,5,1,9,NULL,20675.1,NULL),(306,0,0,80,1,15,NULL,1,111,5,1,129,NULL,47078.2,NULL),(307,0,0,85,1,15,NULL,1,111,5,1,69,NULL,34609.4,NULL),(308,1,0,85,1,15,NULL,1,111,5,1,97,NULL,37984.7,NULL),(309,1,0,80,1,15,NULL,1,111,5,1,33,NULL,35593,NULL),(310,1,0,80,1,15,NULL,1,111,5,1,130,NULL,48601.8,NULL),(311,1,0,85,1,15,NULL,1,111,5,1,34,1,46018.7,NULL),(312,0,0,85,1,15,NULL,1,111,5,1,37,NULL,51242.5,NULL),(313,0,0,85,1,15,NULL,1,111,5,1,86,NULL,17319.3,NULL),(314,1,0,80,1,15,NULL,1,111,5,1,39,NULL,51563.2,NULL),(315,0,0,85,1,15,NULL,1,111,5,1,65,NULL,22207.8,NULL),(316,0,0,80,1,15,NULL,1,111,5,1,104,NULL,40466.2,NULL),(317,1,1,85,1,15,NULL,1,111,5,1,40,NULL,38320.9,NULL),(318,0,0,85,1,15,NULL,1,111,5,1,41,NULL,33387.5,NULL),(319,0,0,90,1,15,NULL,1,111,NULL,1,42,NULL,121855,NULL),(320,0,0,80,1,15,NULL,1,111,5,1,44,NULL,19981.5,NULL),(321,0,0,90,1,15,NULL,1,111,5,1,132,NULL,25098.8,NULL),(322,1,0,85,1,15,NULL,1,111,5,1,133,NULL,63034.1,NULL),(323,0,0,85,1,15,NULL,1,111,5,1,47,NULL,31218.4,NULL),(324,0,0,85,1,15,NULL,1,111,5,1,50,NULL,16541.3,NULL),(325,0,0,90,1,15,NULL,1,111,5,1,49,NULL,17522.6,NULL),(326,0,0,85,1,15,NULL,1,111,5,1,51,NULL,48768.5,NULL),(327,0,0,90,1,15,NULL,1,111,5,1,48,NULL,42516.8,NULL),(328,1,0,90,1,15,NULL,1,111,NULL,1,53,NULL,45620.7,NULL),(329,0,0,85,1,15,NULL,1,111,5,1,58,NULL,47867.2,NULL),(330,1,0,90,1,15,NULL,1,111,5,1,59,NULL,72465.5,NULL),(331,0,0,90,1,15,NULL,1,111,5,1,134,NULL,55793.7,NULL),(332,0,0,95,1,15,NULL,1,111,5,1,62,NULL,31205.1,NULL),(333,0,0,100,1,15,NULL,1,111,5,1,63,NULL,39639.4,NULL),(334,1,0,85,1,15,NULL,1,111,5,1,5,NULL,76611.6,NULL),(335,0,0,85,1,15,NULL,1,111,NULL,1,135,NULL,160280,NULL),(336,0,0,90,1,15,NULL,1,111,5,1,136,NULL,54742.2,NULL),(337,0,0,90,1,15,NULL,1,111,5,1,137,NULL,19681.6,NULL),(338,0,0,85,1,15,NULL,1,111,5,1,138,NULL,109908,NULL),(339,1,1,90,1,15,NULL,1,111,5,1,139,NULL,46833.8,NULL);
/*!40000 ALTER TABLE `cronometragem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIGGER_Cronometragem_delete 
AFTER DELETE ON Cronometragem for each row
BEGIN
	-- Exclui cronometragem_has_tipo_recurso
	DELETE FROM cronometragem_has_tipo_recurso WHERE cronometragem_has_tipo_recurso.idCronometragem = old.idCronometragem;
    -- Exclui Batida
    DELETE FROM batida WHERE batida.idCronometragem = old.idCronometragem;
    -- Exclui Dependencias
    DELETE FROM dependencia WHERE dependencia.idCronometragem = old.idCronometragem;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cronometragem_has_tipo_recurso`
--

DROP TABLE IF EXISTS `cronometragem_has_tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronometragem_has_tipo_recurso` (
  `idcronometragem` int(11) NOT NULL DEFAULT '0',
  `idTipoRecurso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcronometragem`,`idTipoRecurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronometragem_has_tipo_recurso`
--

LOCK TABLES `cronometragem_has_tipo_recurso` WRITE;
/*!40000 ALTER TABLE `cronometragem_has_tipo_recurso` DISABLE KEYS */;
INSERT INTO `cronometragem_has_tipo_recurso` VALUES (191,5),(192,1),(194,4),(244,3),(246,6),(248,1),(249,4),(258,15),(283,5),(285,1),(286,9),(287,5),(288,5),(289,5),(290,3),(291,5),(292,5),(293,5),(294,1),(295,9),(296,5),(297,5),(298,9),(299,9),(300,1),(301,1),(302,1),(304,1),(305,5),(306,5),(307,5),(308,17),(309,6),(310,21),(311,5),(312,5),(313,5),(314,11),(315,11),(316,14),(317,14),(318,1),(319,3),(320,1),(321,1),(322,1),(323,1),(324,1),(325,1),(326,3),(327,1),(328,1),(329,1),(330,1),(331,1),(332,8),(333,15),(334,15),(335,1),(336,1),(337,3),(338,33),(339,33);
/*!40000 ALTER TABLE `cronometragem_has_tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronometrista`
--

DROP TABLE IF EXISTS `cronometrista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronometrista` (
  `idcronometrista` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcronometrista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronometrista`
--

LOCK TABLES `cronometrista` WRITE;
/*!40000 ALTER TABLE `cronometrista` DISABLE KEYS */;
INSERT INTO `cronometrista` VALUES (1,'JOSÉ SOUZA'),(4,'NATÁLIA FERREIRA'),(5,'GUSTAVO SILVA'),(6,'TANIA MARIA'),(8,'LUCIANA V.');
/*!40000 ALTER TABLE `cronometrista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencia`
--

DROP TABLE IF EXISTS `dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencia` (
  `idCronometragem` int(11) NOT NULL,
  `idCronometragemDependencia` int(11) NOT NULL,
  PRIMARY KEY (`idCronometragem`,`idCronometragemDependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencia`
--

LOCK TABLES `dependencia` WRITE;
/*!40000 ALTER TABLE `dependencia` DISABLE KEYS */;
INSERT INTO `dependencia` VALUES (191,244),(244,194),(250,256);
/*!40000 ALTER TABLE `dependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fase` (
  `idfase` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
INSERT INTO `fase` VALUES (1,'ALMOXARIFADO'),(5,'CORTE'),(6,'ESTAMPA'),(7,'COSTURA'),(8,'RISCO'),(17,'BORDADO'),(18,'LAVANDERIA'),(19,'ACABAMENTO'),(21,'ENFESTO');
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase_has_grupo`
--

DROP TABLE IF EXISTS `fase_has_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fase_has_grupo` (
  `idFase` int(11) NOT NULL DEFAULT '0',
  `idGrupo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFase`,`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase_has_grupo`
--

LOCK TABLES `fase_has_grupo` WRITE;
/*!40000 ALTER TABLE `fase_has_grupo` DISABLE KEYS */;
INSERT INTO `fase_has_grupo` VALUES (1,8),(5,22),(6,23),(7,1),(7,28),(7,29),(8,21),(17,24),(18,25),(19,26);
/*!40000 ALTER TABLE `fase_has_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'CEL COSTURA 1'),(2,'CEL COSTURA 2'),(3,'CEL COSTURA 3'),(8,'CEL ALMO 1'),(21,'CEL RISCO 1'),(22,'CEL CORTE 1'),(23,'CEL ESTAMP 1'),(24,'CEL BORDADO 1'),(25,'CEL LAVAN 1'),(26,'CEL ACAB 1');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIGGER_Grupo_delete 
AFTER DELETE ON Grupo for each row
BEGIN
	DELETE FROM fase_has_grupo WHERE fase_has_grupo.idGrupo = old.idGrupo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupo_produto`
--

DROP TABLE IF EXISTS `grupo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_produto` (
  `idgrupo_Produto` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgrupo_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_produto`
--

LOCK TABLES `grupo_produto` WRITE;
/*!40000 ALTER TABLE `grupo_produto` DISABLE KEYS */;
INSERT INTO `grupo_produto` VALUES (1,'GRUPO 1 TESTE DE GRUPO DE PRODUTO'),(2,'GRUPO 2'),(3,'GRUPO 3'),(4,'GRUPO 4'),(8,'teste'),(15,'COLEÇÃO 0116');
/*!40000 ALTER TABLE `grupo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `idinterface` int(11) NOT NULL AUTO_INCREMENT,
  `idmodulo` int(11) DEFAULT NULL,
  `idgrupo` int(11) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `icone` int(11) DEFAULT NULL,
  `tela` varchar(5) NOT NULL,
  `visivelMenu` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idinterface`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,1,NULL,'Ação',1,'01001',1),(2,1,NULL,'Produto',7,'01007',1),(3,1,NULL,'G. Produtos',9,'01009',1),(4,1,NULL,'Recurso',6,'01006',1),(5,1,NULL,'Tipo de Recurso',4,'01004',1),(6,1,NULL,'Cronometrista',2,'01002',1),(7,1,NULL,'Tecido',5,'01005',1),(8,1,NULL,'Operação',8,'01008',1),(9,1,NULL,'L. Produção',3,'01003',1),(10,1,NULL,'Operador',10,'01010',1),(11,1,NULL,'Fase',11,'01011',1),(12,1,NULL,'Parte',12,'01012',1),(13,4,NULL,'Telas',4,'03001',1),(14,4,NULL,'Modulos',4,'03002',1),(15,4,NULL,'Usuários',10,'03003',1),(16,2,NULL,'Ordem',13,'02001',1),(17,2,NULL,'Movimentação',14,'02002',1),(18,2,NULL,'Tipo Mov.',4,'02003',1),(19,1,NULL,'APP',15,'01014',1),(20,2,NULL,'Balanceamento',0,'02004',1),(21,1,NULL,'Cronometragem',0,'01013',0);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `icone` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Cronoanálise',0),(2,'Produção',3),(4,'Ajustes',2);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentacao` (
  `idmovimentacao` int(11) NOT NULL,
  `idOrdem_has_fase` int(11) DEFAULT NULL,
  `dataMov` date DEFAULT NULL,
  `responsavel` varchar(45) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `idTipoMovimentacao` int(11) DEFAULT NULL,
  `observacao` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idmovimentacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
INSERT INTO `movimentacao` VALUES (8,33,'2016-03-08','RUAN',2,5,NULL),(17,31,NULL,NULL,10,1,NULL),(18,32,'2016-03-10',NULL,5,1,NULL),(19,31,'2016-03-10',NULL,2,2,NULL),(20,31,'2016-03-10',NULL,16,1,NULL),(75,31,'2016-03-14',NULL,1,11,NULL),(151,88,NULL,NULL,4,12,NULL),(152,88,NULL,NULL,6,1,NULL),(155,89,NULL,NULL,2,11,NULL),(157,89,NULL,NULL,4,1,NULL),(158,90,NULL,NULL,4,1,NULL),(162,114,NULL,NULL,4,1,NULL),(164,119,'2016-05-18','Ruan Nicolini',100,1,NULL);
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao`
--

DROP TABLE IF EXISTS `operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao` (
  `idoperacao` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  `idAcao` int(11) DEFAULT NULL,
  `idParte` int(11) DEFAULT NULL,
  `idFase` int(11) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idoperacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (5,'PREGAR PASSANTE',2,1,7,NULL),(9,'CHULIAR BAINHA DO BOLSO TRASEIRO',9,2,7,NULL),(22,'CHULIAR BOLSO DA VISTA',9,6,7,NULL),(26,'FAZER BAINHA',10,7,7,NULL),(28,'FAZER BAINHA NO BOLSO DA VISTA',10,6,7,NULL),(32,'FAZER BAINHA DO BOLSO TRASEIRO',10,2,7,''),(33,'FECHAR ENTRE PERNAS',20,10,7,NULL),(34,'FECHAR FORRO DO BOLSO CURVADO LONGO',20,11,7,NULL),(35,'FECHAR GANCHO',20,12,7,NULL),(37,'FECHAR LATERAL',20,13,7,NULL),(39,'FITAR BRAGUILHA',22,14,7,NULL),(40,'PASSAR CÓS',23,16,7,NULL),(41,'PASSAR VOLTA DO CÓS',23,17,7,NULL),(42,'PREGAR BOLSO',2,18,7,NULL),(43,'PREGAR BOLSO DA VISTA',2,6,7,NULL),(44,'PREGAR ETIQUETA ESTRINA',2,19,7,NULL),(45,'PREGAR BOCA DE BOLSO',2,27,7,NULL),(46,'PREGAR PALA TRASEIRA',2,21,7,NULL),(47,'PREGAR RESERVA NO FORRO',2,36,7,'NO FORRO'),(48,'PREGAR VISTA NO FORRO',2,23,7,'NO FORRO'),(49,'PREPARAR BRAGUILHA',24,14,7,NULL),(50,'PREPARAR PERDIGAL',24,15,7,NULL),(51,'REBATER BOCA DE BOLSO COM 2 COSTURAS',25,27,7,'COM 2 COSTURAS'),(52,'REBATER ENTRE PERNAS',25,10,7,NULL),(53,'REBATER FORRO CURVADO',25,25,7,NULL),(54,'REBATER GANCHO TRASEIRO',25,26,7,NULL),(56,'REBATER LATERAL - 2 LADOS',25,13,7,'- 2 LADOS'),(57,'REBATER PALA TRASEIRA',25,21,7,NULL),(58,'UNIR BOCA DE BOLSO',26,27,7,NULL),(59,'UNIR FECHO',26,28,7,NULL),(61,'FAZER GANCHO LARGO',10,35,7,NULL),(62,'FAZER CASAS',10,29,7,NULL),(63,'FAZER MOSCAS',10,30,7,NULL),(64,'PREGAR ETIQUETA  POR DENTRO DO CÓS',2,31,7,' POR DENTRO DO CÓS'),(65,'FITAR PERDIGAL',22,15,7,NULL),(66,'FAZER LATERAL',10,13,8,NULL),(67,'FITAR BOCA DE BOLSO',22,27,7,NULL),(69,'CHULIAR RESERVA',9,36,7,NULL),(70,'PREPARAR RESERVA',24,36,7,NULL),(72,'COSTURAR FORRO NO BOLSO',27,39,7,'NO BOLSO'),(74,'REBATER BOLSO',25,18,7,NULL),(76,'COSTURAR VISTA NO FORRO',27,23,7,'NO FORRO'),(78,'CHULIAR FRENTE',9,38,7,NULL),(79,'REBATER FORRO',25,39,7,NULL),(82,'TRAVAR BOCA DE BOLSO NA FRENTE',28,27,7,'NA FRENTE'),(83,'PREPARAR ETIQUETA DE COMPOSIÇÃO',24,41,7,NULL),(84,'REBATER \"J\" E REBATER A FRENTE',25,42,7,'E REBATER A FRENTE'),(85,'REVISAR DIANTEIRO',29,43,7,NULL),(86,'FECHAR FUNDO DO PERDIGAL',20,44,7,NULL),(88,'FITAR BRAGUILHA E PERDIGAL',22,14,7,'E PERDIGAL'),(89,'PREPARAR BRAGUILHA E PERDIGAL',24,14,7,'E PERDIGAL'),(90,'CORTAR ZIPER NA MEDIDA',30,45,7,'NA MEDIDA'),(91,'PREPARAR PALA',24,46,7,NULL),(92,'REBATER PALA',25,46,7,NULL),(93,'REBATER GANCHO',25,12,7,NULL),(95,'EMBUTIR PALA',31,46,7,NULL),(96,'CORTAR PALA NA MEDIDA',30,46,7,'NA MEDIDA'),(97,'EMBUTIR GANCHO',31,12,7,NULL),(98,'MARCAR BOLSO (POSIÇÃO)',32,18,7,'(POSIÇÃO)'),(99,'COSTURAR BOLSO',27,18,7,NULL),(101,'REVISAR TRASEIRO',29,47,7,NULL),(102,'CHULIAR BOLSO',9,18,7,NULL),(103,'REBATER BAINHA NO BOLSO',25,7,7,'NO BOLSO'),(104,'PASSAR BOLSO',23,18,7,NULL),(105,'COSTURAR VOLTA DO CÓS',27,17,7,NULL),(106,'CORTAR CÓS',30,16,7,NULL),(107,'FAZER PONTA',10,48,7,NULL),(108,'PREGAR ETIQUETA',2,31,7,NULL),(109,'MOSQUEAR PEÇA',33,49,7,NULL),(110,'CASEAR CÓS',34,16,7,NULL),(111,'REVISAR PEÇA',29,49,7,NULL),(112,'FAZER BAINHA NA BARRA DA CAMISA - 2,5 CM',10,7,7,'NA BARRA DA CAMISA - 2,5 CM'),(113,'FAZER BAINHA NAS MANGAS - 2 LADOS',10,7,7,'NAS MANGAS - 2 LADOS'),(115,'FECHAR GOLA TRADICIONAL',20,50,7,'TRADICIONAL'),(116,'FECHAR LATERAL C/ MANGAS E ETIQUETA',20,13,7,'C/ MANGAS E ETIQUETA'),(117,'FECHAR OMBRO',20,51,7,NULL),(118,'REBATER GOLA E PARA-SUOR',25,54,7,NULL),(119,'PREGAR MANGAS (PAR)',2,53,7,NULL),(120,'PREGAR GOLA TRADICIONAL',2,50,7,'TRADICIONAL'),(121,'PREGAR ETIQUETA NAS COSTAS',2,31,7,'NAS COSTAS'),(122,'PASSAR PARA-SUOR NO OMBRO E NA GOLA - COSTA',23,52,7,'NO OMBRO E NA GOLA - COSTA'),(123,'FAZER BAINHA NA BARRA DA BLUSA - 1,5 CM',10,7,7,'NA BARRA DA BLUSA - 1,5 CM'),(125,'PASSAR VIÉS NA GOLA - FRENTE E COSTAS',23,55,7,'NA GOLA - FRENTE E COSTAS'),(126,'PASSAR VIÉS NAS CAVAS',23,55,7,'NAS CAVAS'),(127,'PREGAR ETIQUETA NA BARRA DA BLUSA',2,31,7,'NA BARRA DA BLUSA'),(128,'PREPARAR ETIQUETA',24,31,7,NULL),(129,'CHULIAR FORRO DO BOLSO E GANCHO',9,39,7,'DO BOLSO E GANCHO'),(130,'EMBUTIR PALA TRASEIRA',31,21,7,NULL),(132,'PREGAR ETIQUETA DE TAMANHO',2,31,7,'DE TAMANHO'),(133,'PREGAR FORRO NA BOCA DO BOLDO DE RESERVA DOBR',2,39,7,'NA BOCA DO BOLDO DE RESERVA DOBRADA'),(134,'REBATER LATERAL COM COSTURA ESTREIRA',25,13,7,'COM COSTURA ESTREIRA'),(135,'FAZER PONTA DE CÓS COM MEDIDA',10,48,7,'DE CÓS COM MEDIDA'),(136,'FAZER GANCHO LARGO COM 2 VOLTAS',10,35,7,'COM 2 VOLTAS'),(137,'FAZER \"J\"',10,42,7,NULL),(138,'PASSAR CÓS NO ZIG-ZAG',23,16,7,'NO ZIG-ZAG'),(139,'PASSAR BOCA DE BOLSO NO ZIG-ZAG',23,27,7,'NO ZIG-ZAG');
/*!40000 ALTER TABLE `operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operador`
--

DROP TABLE IF EXISTS `operador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operador` (
  `idoperador` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(45) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idoperador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador`
--

LOCK TABLES `operador` WRITE;
/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
INSERT INTO `operador` VALUES (1,'MARIA SILVA',1),(44,'CINTIA MORAES',1),(45,'ROSE GUIMARAES',1),(68,'JORGE RODRIGUES',1),(69,'TAÍS DE OLIVEIRA',1),(70,'ROSEMAR ALVES',1),(71,'CARLA SOUZA',1),(72,'MÔNICA',1),(73,'RODRIGO FERREIRA',1),(75,'JOSE ROBERTO',1),(76,'DIANA',2),(77,'LUISA M.',2),(78,'LEILA M.',2),(79,'MAISA S.',2),(80,'ALCIONE D.',2),(81,'HELENA T.',2),(82,'LUZIA B.',2),(83,'DENISE P.',2),(84,'DINALVA',2),(85,'AUREA N.',2),(86,'SAMARA',3),(87,'CLAUDIA',3),(88,'IVONE T.',3),(89,'JOANA',3),(90,'MARTA',3),(91,'THAMIRYS',3),(92,'KARLA GONÇALVES',3),(93,'JESSICA MARIA',3),(94,'SANDRA',3),(95,'SÔNIA M.',3),(96,'JOÃO PEDRO',3),(97,'PAULA',3);
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIGGER_Operador_delete 
AFTER DELETE ON Operador for each row
BEGIN
	DELETE FROM operador_has_tipo_recurso WHERE operador_has_tipo_recurso.idOperador = old.idOperador;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `operador_has_tipo_recurso`
--

DROP TABLE IF EXISTS `operador_has_tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operador_has_tipo_recurso` (
  `idOperador` int(11) NOT NULL DEFAULT '0',
  `idTipoRecurso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTipoRecurso`,`idOperador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador_has_tipo_recurso`
--

LOCK TABLES `operador_has_tipo_recurso` WRITE;
/*!40000 ALTER TABLE `operador_has_tipo_recurso` DISABLE KEYS */;
INSERT INTO `operador_has_tipo_recurso` VALUES (1,1),(44,1),(75,1),(76,1),(84,1),(86,1),(87,1),(89,1),(1,2),(77,2),(91,2),(1,3),(44,3),(69,3),(75,3),(78,3),(84,3),(86,3),(88,3),(96,3),(1,4),(44,4),(79,4),(1,5),(44,5),(80,5),(87,5),(92,5),(70,6),(81,6),(85,6),(93,6),(94,6),(45,7),(81,7),(82,7),(85,7),(92,7),(45,8),(68,8),(73,8),(83,8),(96,8),(68,9),(73,9),(83,9),(90,9),(91,9),(68,10),(83,10),(94,10),(96,10),(69,11),(75,11),(82,11),(84,11),(85,11),(88,11),(90,11),(95,11),(70,12),(81,12),(82,12),(94,12),(95,12),(70,13),(73,13),(80,13),(91,13),(93,13),(97,13),(70,14),(80,14),(94,14),(95,14),(45,15),(73,15),(79,15),(90,15),(93,15),(71,16),(72,16),(78,16),(93,16),(96,16),(71,17),(72,17),(77,17),(92,17),(71,18),(72,18),(95,18),(97,18),(71,19),(72,19),(97,19),(71,20),(72,20),(97,20),(71,21),(72,21),(71,22),(72,22),(76,22),(85,22),(97,22),(69,33),(77,33),(91,33);
/*!40000 ALTER TABLE `operador_has_tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_has_fase`
--

DROP TABLE IF EXISTS `ordem_has_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_has_fase` (
  `idOrdem_has_fase` int(11) NOT NULL,
  `idOrdem` int(11) DEFAULT NULL,
  `idFase` int(11) DEFAULT NULL,
  `qtdOriginal` int(11) DEFAULT '0',
  `qtdPrevista` int(11) DEFAULT '0',
  `qtdProduzindo` int(11) DEFAULT '0',
  `idLinhaProducao` int(11) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  `qtdFinalizada` int(11) DEFAULT '0',
  PRIMARY KEY (`idOrdem_has_fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_has_fase`
--

LOCK TABLES `ordem_has_fase` WRITE;
/*!40000 ALTER TABLE `ordem_has_fase` DISABLE KEYS */;
INSERT INTO `ordem_has_fase` VALUES (31,7,8,25,0,0,NULL,1,26),(32,7,1,25,0,21,NULL,2,5),(33,7,5,25,21,3,NULL,3,0),(88,35,8,10,0,0,1,1,10),(89,35,1,10,0,0,8,2,4),(90,35,5,10,0,0,22,3,4),(114,84,1,4,0,0,8,2,4),(115,84,5,4,0,4,22,3,0),(116,85,8,2,0,2,1,1,0),(117,85,1,2,2,0,8,2,0),(118,85,5,2,2,0,22,3,0),(119,87,8,100,0,0,21,1,100),(120,87,1,100,0,100,8,2,0),(121,87,5,100,100,0,22,3,0),(122,87,6,100,100,0,23,4,0),(123,87,7,100,100,0,1,5,0),(124,87,17,100,100,0,24,6,0),(125,87,18,100,100,0,25,7,0),(126,87,19,100,100,0,26,8,0),(151,91,8,100,0,100,21,1,0),(152,91,1,100,100,0,8,2,0),(153,91,5,100,100,0,22,3,0),(154,91,7,100,100,0,1,4,0),(163,93,7,530,0,530,29,1,0);
/*!40000 ALTER TABLE `ordem_has_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_producao`
--

DROP TABLE IF EXISTS `ordem_producao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_producao` (
  `idOrdem` int(11) NOT NULL,
  `numOrdem` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `qtdOriginal` int(11) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `observacao` varchar(60) DEFAULT NULL,
  `sequenciado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idOrdem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_producao`
--

LOCK TABLES `ordem_producao` WRITE;
/*!40000 ALTER TABLE `ordem_producao` DISABLE KEYS */;
INSERT INTO `ordem_producao` VALUES (7,1012,7,25,'2016-03-03','Teste de observações',1),(35,35,7,10,'2016-03-23',NULL,1),(84,35,7,4,'2016-03-25','Finalização Parcial da Ordem 35',1),(85,35,7,2,'2016-03-25','Retrabalho da Ordem 35',1),(87,1170516,105,100,'2016-05-17','Ordem de produção ativa.',1),(91,1,7,100,NULL,NULL,1),(93,1801,108,530,'2016-12-09','Prioridade',0);
/*!40000 ALTER TABLE `ordem_producao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIGGER_Ordem_delete 
AFTER DELETE ON ordem_producao for each row
BEGIN
	DELETE FROM ordem_has_fase WHERE ordem_has_fase.idOrdem = old.idOrdem;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `parametro` varchar(20) NOT NULL DEFAULT '',
  `descricao` varchar(45) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`parametro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES ('seqAcao',NULL,35),('seqBatida',NULL,519),('seqCelula',NULL,30),('seqCronometragem',NULL,340),('seqCronometrista',NULL,12),('seqFase',NULL,22),('seqGrupoProduto',NULL,16),('seqMovimentacao',NULL,169),('seqOperacao',NULL,140),('seqOperador',NULL,98),('seqOrdemFase',NULL,164),('seqOrdemProducao',NULL,94),('seqParte',NULL,57),('seqProduto',NULL,112),('seqRecurso',NULL,73),('seqSequenciamento',NULL,71),('seqTarefaSequenciada',NULL,50),('seqTecido',NULL,15),('seqTipoMovimentacao',NULL,14),('seqTipoRecurso',NULL,34),('seqUsuario',NULL,6);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parte`
--

DROP TABLE IF EXISTS `parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parte` (
  `idparte` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idparte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parte`
--

LOCK TABLES `parte` WRITE;
/*!40000 ALTER TABLE `parte` DISABLE KEYS */;
INSERT INTO `parte` VALUES (1,'PASSANTE'),(2,'BAINHA DO BOLSO TRASEIRO'),(6,'BOLSO DA VISTA'),(7,'BAINHA'),(10,'ENTRE PERNAS'),(11,'FORRO DO BOLSO CURVADO LONGO'),(12,'GANCHO'),(13,'LATERAL'),(14,'BRAGUILHA'),(15,'PERDIGAL'),(16,'CÓS'),(17,'VOLTA DO CÓS'),(18,'BOLSO'),(19,'ETIQUETA ESTRINA'),(21,'PALA TRASEIRA'),(23,'VISTA'),(25,'FORRO CURVADO'),(26,'GANCHO TRASEIRO'),(27,'BOCA DE BOLSO'),(28,'FECHO'),(29,'CASAS'),(30,'MOSCAS'),(31,'ETIQUETA'),(35,'GANCHO LARGO'),(36,'RESERVA'),(38,'FRENTE'),(39,'FORRO'),(41,'ETIQUETA DE COMPOSIÇÃO'),(42,'\"J\"'),(43,'DIANTEIRO'),(44,'FUNDO DO PERDIGAL'),(45,'ZIPER'),(46,'PALA'),(47,'TRASEIRO'),(48,'PONTA'),(49,'PEÇA'),(50,'GOLA'),(51,'OMBRO'),(52,'PARA-SUOR'),(53,'MANGAS (PAR)'),(54,'GOLA E PARA-SUOR'),(55,'VIÉS');
/*!40000 ALTER TABLE `parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (7,'PRODUTO 1 TESTE','2015-10-22',3),(105,'M CA 46 19448','2016-05-16',15),(108,'VJ TSC 123 33170 - CAMISETA TRADICIONAL','2016-12-09',15),(110,'M BL 35 7646 - BLUSA REGATA - ID 5579','2016-12-09',15),(111,'M CA 35 3274 - CALÇA SKINNY MEDIA BORD - 5843','2016-12-09',15);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIGGER_Produto_delete 
AFTER DELETE ON produto for each row
BEGIN
	DELETE FROM produto_has_fase WHERE produto_has_fase.idProduto = old.idProduto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produto_has_fase`
--

DROP TABLE IF EXISTS `produto_has_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_has_fase` (
  `idProduto` int(11) NOT NULL,
  `idFase` int(11) NOT NULL,
  `sequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduto`,`idFase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_fase`
--

LOCK TABLES `produto_has_fase` WRITE;
/*!40000 ALTER TABLE `produto_has_fase` DISABLE KEYS */;
INSERT INTO `produto_has_fase` VALUES (7,1,2),(7,5,3),(7,7,4),(7,8,1),(101,5,2),(101,8,1),(105,1,2),(105,5,3),(105,6,4),(105,7,5),(105,8,1),(105,17,6),(105,19,7),(108,7,1),(110,7,1),(111,7,1);
/*!40000 ALTER TABLE `produto_has_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `idRecurso` int(11) NOT NULL DEFAULT '0',
  `patrimonio` int(11) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `idTipoRecurso` int(11) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (1,123456789,'MAQUINA 100',1,1),(2,987654321,'MAQUINA 102',1,2),(3,112355009,'MAQUINA 101',1,3),(4,718809252,'MAQUINA 103',2,1),(5,NULL,'MAQUINA 104',2,2),(6,NULL,'MAQUINA 105',2,3),(7,NULL,'MAQUINA 106',3,1),(8,NULL,'MAQUINA 107',3,2),(9,NULL,'MAQUINA 108',3,3),(10,NULL,'MAQUINA 109',4,1),(11,NULL,'MAQUINA 110',4,2),(12,NULL,'MAQUINA 111',4,3),(13,NULL,'MAQUINA 112',5,1),(14,NULL,'MAQUINA 113',5,2),(15,NULL,'MAQUINA 114',5,3),(16,NULL,'MAQUINA 115',6,1),(17,NULL,'MAQUINA 116',6,2),(18,NULL,'MAQUINA 117',6,3),(19,NULL,'MAQUINA 118',7,1),(20,NULL,'MAQUINA 119',7,2),(21,NULL,'MAQUINA 120',7,3),(22,NULL,'MAQUINA 121',8,1),(23,NULL,'MAQUINA 122',8,2),(24,NULL,'MAQUINA 123',8,3),(25,NULL,'MAQUINA 124',9,1),(26,NULL,'MAQUINA 125',9,2),(27,NULL,'MAQUINA 126',9,3),(28,NULL,'MAQUINA 127',10,1),(29,NULL,'MAQUINA 128',10,2),(30,NULL,'MAQUINA 129',10,3),(31,NULL,'MAQUINA 130',11,1),(32,NULL,'MAQUINA 131',11,2),(33,NULL,'MAQUINA 132',11,3),(34,NULL,'MAQUINA 133',12,1),(35,NULL,'MAQUINA 134',12,2),(36,NULL,'MAQUINA 135',12,3),(37,NULL,'MAQUINA 136',13,1),(38,NULL,'MAQUINA 137',13,2),(39,NULL,'MAQUINA 138',13,3),(40,NULL,'MAQUINA 139',14,1),(41,NULL,'MAQUINA 140',14,2),(42,NULL,'MAQUINA 141',14,3),(43,NULL,'MAQUINA 142',15,1),(44,NULL,'MAQUINA 143',15,2),(45,NULL,'MAQUINA 144',15,3),(46,NULL,'MAQUINA 145',16,1),(47,NULL,'MAQUINA 146',16,2),(48,NULL,'MAQUINA 147',16,3),(49,NULL,'MAQUINA 148',17,1),(50,NULL,'MAQUINA 149',17,2),(51,NULL,'MAQUINA 150',17,3),(52,NULL,'MAQUINA 151',18,1),(53,NULL,'MAQUINA 152',18,2),(54,NULL,'MAQUINA 153',18,3),(55,NULL,'MAQUINA 154',19,1),(56,NULL,'MAQUINA 155',19,2),(57,NULL,'MAQUINA 156',19,3),(58,NULL,'MAQUINA 157',20,1),(59,NULL,'MAQUINA 158',20,2),(60,NULL,'MAQUINA 159',20,3),(61,NULL,'MAQUINA 160',21,1),(62,NULL,'MAQUINA 161',21,2),(63,NULL,'MAQUINA 162',21,3),(64,NULL,'MAQUINA 163',22,1),(65,NULL,'MAQUINA 164',22,2),(66,NULL,'MAQUINA 165',22,3),(67,NULL,'MAQUINA I65',1,1),(68,NULL,'MAQUINA I66',1,1),(69,NULL,'MAQUINA I67',3,1),(70,NULL,'MAQUINA 168',33,1),(71,NULL,'MAQUINA 169',33,2),(72,NULL,'MAQUINA 170',33,3);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguranca`
--

DROP TABLE IF EXISTS `seguranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguranca` (
  `idTipo_Usuario` int(11) NOT NULL DEFAULT '0',
  `idinterface` int(11) NOT NULL DEFAULT '0',
  `adicionar` tinyint(1) DEFAULT '0',
  `consultar` tinyint(1) DEFAULT '0',
  `editar` tinyint(1) DEFAULT '0',
  `excluir` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idTipo_Usuario`,`idinterface`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguranca`
--

LOCK TABLES `seguranca` WRITE;
/*!40000 ALTER TABLE `seguranca` DISABLE KEYS */;
INSERT INTO `seguranca` VALUES (1,1,1,1,1,1),(1,2,1,1,1,1),(1,3,1,1,1,1),(1,4,1,1,1,1),(1,5,1,1,1,1),(1,6,1,1,1,1),(1,7,1,1,1,1),(1,8,1,1,1,1),(1,9,1,1,1,1),(1,10,1,1,1,1),(1,11,1,1,1,1),(1,12,1,1,1,1),(1,13,1,1,1,1),(1,14,1,1,1,1),(1,15,1,1,1,1),(1,16,1,1,1,1),(1,17,1,1,1,1),(1,18,1,1,1,1),(1,19,1,1,1,1),(1,20,1,1,1,1),(1,21,1,1,1,1),(2,1,1,1,1,1),(2,2,1,1,1,1),(2,3,1,1,1,1),(2,4,1,1,1,1),(2,5,1,1,1,1),(2,6,1,1,1,1),(2,7,1,1,1,1),(2,8,1,1,1,1),(2,9,1,1,1,1),(2,10,1,1,1,1),(2,11,1,1,1,1),(2,12,1,1,1,1),(2,19,1,1,1,1),(2,21,1,1,1,1),(3,16,1,1,1,1),(3,17,1,1,1,1),(3,18,1,1,1,1),(3,20,1,1,1,1),(4,17,1,1,1,1),(4,20,1,1,1,1),(5,17,1,1,0,0);
/*!40000 ALTER TABLE `seguranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequenciamento`
--

DROP TABLE IF EXISTS `sequenciamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequenciamento` (
  `idSequenciamento` int(11) NOT NULL,
  `dataSeq` date DEFAULT NULL,
  `responstavel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSequenciamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequenciamento`
--

LOCK TABLES `sequenciamento` WRITE;
/*!40000 ALTER TABLE `sequenciamento` DISABLE KEYS */;
INSERT INTO `sequenciamento` VALUES (5,'2016-09-27','Ruan Nicolini'),(70,'2016-11-28',NULL);
/*!40000 ALTER TABLE `sequenciamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa_sequenciada`
--

DROP TABLE IF EXISTS `tarefa_sequenciada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefa_sequenciada` (
  `idTarefaSequenciada` int(11) NOT NULL,
  `idCronometragem` int(11) DEFAULT NULL,
  `idOrdem` int(11) DEFAULT NULL,
  `idRecurso` int(11) DEFAULT NULL,
  `idLinha_Producao` int(11) DEFAULT NULL,
  `NumOperador` int(11) DEFAULT NULL,
  `tempoInicio` datetime DEFAULT NULL,
  `tempoFim` datetime DEFAULT NULL,
  `idSequenciamento` int(11) DEFAULT NULL,
  `eventType` int(11) DEFAULT NULL,
  `options` int(11) DEFAULT NULL,
  `Mensagem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTarefaSequenciada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa_sequenciada`
--

LOCK TABLES `tarefa_sequenciada` WRITE;
/*!40000 ALTER TABLE `tarefa_sequenciada` DISABLE KEYS */;
INSERT INTO `tarefa_sequenciada` VALUES (20,191,7,1,1,1,'2016-10-16 08:00:00','2016-10-16 11:30:00',5,0,0,'Colocar aqui o num da ordem'),(21,194,35,1,1,1,'2016-10-16 13:00:00','2016-10-16 18:00:00',5,0,0,NULL),(22,248,87,1,21,1,'2016-08-10 08:00:00','2016-08-10 10:00:00',5,0,0,NULL),(23,248,91,1,8,1,'2016-08-10 08:00:00','2016-08-10 12:00:00',5,0,0,NULL),(24,244,7,6,1,2,'2016-10-16 13:00:00','2016-10-16 15:00:00',5,0,0,NULL),(25,246,35,7,1,2,'2016-10-16 15:00:00','2016-10-16 18:00:00',5,0,0,NULL),(26,249,7,4,1,3,'2016-10-16 08:00:00','2016-10-16 15:00:00',5,0,0,NULL),(27,283,35,7,1,2,'2016-10-16 08:00:00','2016-10-16 13:00:00',5,0,0,NULL);
/*!40000 ALTER TABLE `tarefa_sequenciada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecido`
--

DROP TABLE IF EXISTS `tecido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecido` (
  `idtecido` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtecido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecido`
--

LOCK TABLES `tecido` WRITE;
/*!40000 ALTER TABLE `tecido` DISABLE KEYS */;
INSERT INTO `tecido` VALUES (1,'JEANS'),(2,'VISCOSE'),(6,'POPELINE'),(7,'TRICOLINE'),(8,'BRIM'),(9,'VISCOLYCRA'),(10,'JÉRSEI'),(11,'OXFORD'),(13,'GABARDINE'),(14,'ALGODÃO');
/*!40000 ALTER TABLE `tecido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_movimentacao`
--

DROP TABLE IF EXISTS `tipo_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_movimentacao` (
  `idtipo_Movimentacao` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `incrementar` tinyint(1) DEFAULT '0',
  `decrementar` tinyint(1) DEFAULT '0',
  `finalizarTotal` tinyint(1) DEFAULT '0',
  `dividirOrdemAvancar` tinyint(1) DEFAULT '0',
  `dividirOrdemRetrabalho` tinyint(1) DEFAULT '0',
  `finalizarParcial` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtipo_Movimentacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_movimentacao`
--

LOCK TABLES `tipo_movimentacao` WRITE;
/*!40000 ALTER TABLE `tipo_movimentacao` DISABLE KEYS */;
INSERT INTO `tipo_movimentacao` VALUES (1,'Finalização TOTAL',0,0,1,0,0,0),(2,'Incremento',1,0,0,0,0,0),(3,'Cancelamento',0,1,0,0,0,0),(4,'Extravio',0,1,0,0,0,0),(5,'Perda',0,1,0,0,0,0),(11,'RETRABALHO',0,1,0,0,1,0),(12,'Finalização PARCIAL',0,0,0,1,0,1);
/*!40000 ALTER TABLE `tipo_movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_recurso`
--

DROP TABLE IF EXISTS `tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_recurso` (
  `idtipo_recurso` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_recurso`
--

LOCK TABLES `tipo_recurso` WRITE;
/*!40000 ALTER TABLE `tipo_recurso` DISABLE KEYS */;
INSERT INTO `tipo_recurso` VALUES (1,'MAQ. RETA'),(2,'MAQ. FITADEIRA'),(3,'MAQ. 2 AGULHAS'),(4,'MAQ. 4 FIOS'),(5,'MAQ. 3 FIOS'),(6,'MAQ. 5 FIOS'),(7,'MAQ. DE CÓS'),(8,'CASEADEIRA'),(9,'COLARETE'),(10,'REVISORA'),(11,'OVERLOCK (FITADEIRA)'),(12,'TESOURA (AUXILIAR)'),(13,'PLAINA'),(14,'PASSADEIRA'),(15,'MOSQUEADEIRA'),(16,'TRAVETE'),(17,'EMBUTIDEIRA'),(18,'EMBUTIDEIRA 3/4'),(19,'EMBUTIDEIRA 3/8'),(20,'EMBUTIDEIRA 1/8'),(21,'EMBUTIDEIRA CONTÍNUA'),(22,'EMBUTIDEIRA (1/4)'),(32,'FERRO A VAPOR'),(33,'ZIG-ZAG');
/*!40000 ALTER TABLE `tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `idTipo_usuario` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador',NULL),(2,'Cronoanalista',NULL),(3,'Gerente de Produção',NULL),(4,'Auxiliar de Produção',NULL),(5,'Operador de Produção',NULL);
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `idtipoUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Marta','martajulia','000',3),(2,'alguem',NULL,'1010',4),(3,'Ruan Nicolini','ruannicolini','102313',1),(4,'José','jose','12345',5),(5,'Isadora','isadoraMartins','9988',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'balay'
--

--
-- Dumping routines for database 'balay'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-09 23:07:49
