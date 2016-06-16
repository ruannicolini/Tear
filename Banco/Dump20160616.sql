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
INSERT INTO `acao` VALUES (2,'PREGAR'),(9,'CHULIAR'),(10,'FAZER'),(20,'FECHAR'),(22,'FITAR'),(23,'PASSAR'),(24,'PREPARAR'),(25,'REBATER'),(26,'UNIR');
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
INSERT INTO `batida` VALUES (61,1,2,3,1,110),(63,0,2,16,1,111),(65,0,2,578,1,113),(72,0,1,875,1,117),(73,0,7,796,1,117),(74,0,3,219,1,125),(75,0,8,969,1,125),(76,0,13,750,1,125),(94,0,4,671,1,127),(95,0,5,641,1,127),(96,0,2,875,1,127),(97,0,3,828,1,127),(98,0,3,266,1,127),(99,0,4,640,1,127),(163,0,1,703,1,188),(164,0,2,485,1,188),(165,0,1,797,1,188),(244,0,1,859,1,167),(245,0,1,782,1,167),(246,0,2,312,1,167),(247,0,2,31,1,167),(248,0,1,828,1,167),(249,0,2,547,1,167),(250,0,2,375,1,167),(251,0,3,688,1,167),(252,0,2,937,1,153),(253,0,3,735,1,153),(254,0,3,0,1,153),(255,0,4,125,1,153),(256,0,1,734,1,153),(257,0,1,953,1,194),(258,0,3,641,1,194),(260,0,2,391,1,194),(261,0,2,672,1,194),(262,0,3,187,1,194),(279,0,3,672,1,200),(280,0,3,656,1,200),(281,0,2,781,1,200),(282,0,2,157,1,200),(283,0,2,781,1,200),(293,0,1,656,1,191),(294,0,2,297,1,191),(295,0,2,0,1,191),(296,0,1,969,1,191),(297,0,2,609,1,191),(298,0,3,391,1,191),(343,0,0,925,1,243),(344,0,1,386,1,243),(345,0,1,633,1,243),(346,0,1,921,1,243),(347,0,2,78,1,244),(348,0,3,32,1,244),(349,0,3,46,1,244),(350,0,3,766,1,244),(356,0,6,703,1,246),(357,0,3,31,1,246),(358,0,0,172,1,246),(359,0,4,78,1,246),(360,0,3,766,1,246),(361,0,2,968,1,246),(362,0,3,407,1,246),(363,0,2,515,1,246),(364,0,3,266,1,248),(365,0,1,390,1,248),(366,0,1,532,1,248),(367,0,2,15,1,248),(368,0,1,938,1,248),(369,0,2,15,1,248),(376,0,2,172,1,249),(377,0,2,203,1,249),(378,0,2,16,1,249),(379,0,1,953,1,249),(380,0,1,843,1,249),(381,0,1,282,1,249),(383,0,2,375,1,249),(384,0,1,484,1,249);
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
INSERT INTO `cronometragem` VALUES (153,1,1,80,1,10,5,4,8,1,2,5,45,2733.46,NULL),(167,1,1,80,1,10,1,2,43,8,2,26,52,2026.42,NULL),(191,0,0,90,1,10,10,1,7,NULL,NULL,26,NULL,2297.13,NULL),(192,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,9,NULL,NULL,NULL),(194,1,0,80,1,20,NULL,1,7,NULL,NULL,5,NULL,2658.05,NULL),(200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,22,NULL,0,NULL),(243,0,0,80,1,15,35,1,8,102,2,26,34,1348.95,'0000-00-00'),(244,0,0,80,1,10,NULL,1,7,NULL,2,28,NULL,2622.84,NULL),(246,0,0,85,1,15,NULL,1,105,1,1,5,1,3255.07,NULL),(248,0,0,95,1,15,NULL,1,105,NULL,1,9,NULL,2213.41,NULL),(249,1,0,80,1,10,NULL,1,105,NULL,NULL,22,NULL,1686.08,NULL),(250,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,26,NULL,0,NULL),(251,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,28,NULL,0,NULL),(252,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,32,NULL,0,NULL),(253,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,33,NULL,0,NULL),(254,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,34,NULL,0,NULL),(255,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,35,NULL,0,NULL),(256,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,37,NULL,0,NULL),(257,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,39,NULL,0,NULL),(258,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,65,NULL,0,NULL),(259,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,40,NULL,0,NULL),(260,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,41,NULL,0,NULL),(261,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,42,NULL,0,NULL),(262,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,43,NULL,0,NULL),(263,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,44,NULL,0,NULL),(264,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,45,NULL,0,NULL),(265,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,46,NULL,0,NULL),(266,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,47,NULL,0,NULL),(267,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,48,NULL,0,NULL),(268,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,49,NULL,0,NULL),(269,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,50,NULL,0,NULL),(270,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,51,NULL,0,NULL),(271,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,52,NULL,0,NULL),(272,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,53,NULL,0,NULL),(273,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,54,NULL,0,NULL),(274,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,56,NULL,0,NULL),(275,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,57,NULL,0,NULL),(276,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,58,NULL,0,NULL),(277,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,59,NULL,0,NULL),(278,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,61,NULL,0,NULL),(279,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,62,NULL,0,NULL),(280,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,63,NULL,0,NULL),(281,0,0,NULL,1,NULL,NULL,1,105,NULL,NULL,64,NULL,0,NULL);
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
INSERT INTO `cronometragem_has_tipo_recurso` VALUES (46,2),(117,3),(125,2),(125,4),(153,3),(167,1),(167,5),(191,5),(194,4),(243,3),(244,3),(246,6),(248,1),(249,4);
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
INSERT INTO `dependencia` VALUES (191,244),(250,256);
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
INSERT INTO `fase` VALUES (1,'ALMOXARIFADO'),(5,'CORTE'),(6,'ESTAMPA'),(7,'COSTURA'),(8,'RISCO'),(17,'BORDADO'),(18,'LAVANDERIA'),(19,'ACABAMENTO');
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
INSERT INTO `fase_has_grupo` VALUES (1,8),(5,22),(6,23),(7,1),(8,21),(17,24),(18,25),(19,26);
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
INSERT INTO `grupo` VALUES (1,'CEL COSTURA 1'),(8,'CEL ALMO 1'),(21,'CEL RISCO 1'),(22,'CEL CORTE 1'),(23,'CEL ESTAMP 1'),(24,'CEL BORDADO 1'),(25,'CEL LAVAN 1'),(26,'CEL ACAB 1');
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
-- Table structure for table `layoutfase`
--

DROP TABLE IF EXISTS `layoutfase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutfase` (
  `idLayoutFase` int(11) NOT NULL,
  `idOrdem_has_fase` int(11) DEFAULT NULL,
  `numOperadores` int(11) DEFAULT NULL,
  `numFilas` int(11) DEFAULT NULL,
  `dataLayout` date DEFAULT NULL,
  `responsavel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLayoutFase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutfase`
--

LOCK TABLES `layoutfase` WRITE;
/*!40000 ALTER TABLE `layoutfase` DISABLE KEYS */;
INSERT INTO `layoutfase` VALUES (21,88,5,2,NULL,NULL),(22,88,7,2,NULL,NULL);
/*!40000 ALTER TABLE `layoutfase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutmaquina`
--

DROP TABLE IF EXISTS `layoutmaquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutmaquina` (
  `idLayoutMaquina` int(11) NOT NULL,
  `idLayoutOperacao` int(11) DEFAULT NULL,
  `idOperador` int(11) DEFAULT NULL,
  `postoDeTrabalho` int(11) DEFAULT NULL,
  `numMaquina` int(11) DEFAULT NULL,
  `idTipo_Recurso` int(11) DEFAULT NULL,
  `porcentagemOperacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLayoutMaquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutmaquina`
--

LOCK TABLES `layoutmaquina` WRITE;
/*!40000 ALTER TABLE `layoutmaquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `layoutmaquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutoperacao`
--

DROP TABLE IF EXISTS `layoutoperacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutoperacao` (
  `idLayoutOperacao` int(11) NOT NULL,
  `idLayoutFase` int(11) DEFAULT NULL,
  `tempoOperacao` float DEFAULT NULL,
  `idCronometragem` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLayoutOperacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutoperacao`
--

LOCK TABLES `layoutoperacao` WRITE;
/*!40000 ALTER TABLE `layoutoperacao` DISABLE KEYS */;
INSERT INTO `layoutoperacao` VALUES (524,22,2297.13,191),(525,22,2622.84,244),(570,24,3255.07,246),(571,24,2213.41,248),(572,24,1686.08,249),(573,24,0,250),(574,24,0,251),(575,24,0,252),(576,24,0,253),(577,24,0,254),(578,24,0,255),(579,24,0,256),(580,24,0,257),(581,24,0,258),(582,24,0,259),(583,24,0,260),(584,24,0,261),(585,24,0,262),(586,24,0,263),(587,24,0,264),(588,24,0,265),(589,24,0,266),(590,24,0,267),(591,24,0,268),(592,24,0,269),(593,24,0,270),(594,24,0,271),(595,24,0,272),(596,24,0,273),(597,24,0,274),(598,24,0,275),(599,24,0,276),(600,24,0,277),(601,24,0,278),(602,24,0,279),(603,24,0,280),(604,24,0,281);
/*!40000 ALTER TABLE `layoutoperacao` ENABLE KEYS */;
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
INSERT INTO `movimentacao` VALUES (8,33,'2016-03-08','RUAN',2,5,NULL),(17,31,NULL,NULL,10,1,NULL),(18,32,'2016-03-10',NULL,5,1,NULL),(19,31,'2016-03-10',NULL,2,2,NULL),(20,31,'2016-03-10',NULL,16,1,NULL),(75,31,'2016-03-14',NULL,1,11,NULL),(84,NULL,NULL,NULL,NULL,NULL,NULL),(151,88,NULL,NULL,4,12,NULL),(152,88,NULL,NULL,6,1,NULL),(155,89,NULL,NULL,2,11,NULL),(157,89,NULL,NULL,4,1,NULL),(158,90,NULL,NULL,4,1,NULL),(162,114,NULL,NULL,4,1,NULL),(164,119,'2016-05-18','Ruan Nicolini',100,1,NULL);
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
  PRIMARY KEY (`idoperacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (5,'PREGAR PASSANTE',2,1,7),(9,'CHULIAR BAINHA DO BOLSO TRASEIRO',9,2,7),(22,'CHULIAR BOLSO DA VISTA',9,6,7),(26,'FAZER BAINHA',10,7,7),(28,'FAZER BAINHA NO BOLSO DA VISTA',10,6,7),(32,'FAZER BAINHA NO BOLSO TRASEIRO',10,2,7),(33,'FECHAR ENTRE PERNAS',20,10,7),(34,'FECHAR FORRO DO BOLSO CURVADO LONGO',20,11,7),(35,'FECHAR GANCHO',20,12,7),(37,'FECHAR LATERAL',20,13,7),(39,'FITAR BRAGUILHA',22,14,7),(40,'PASSAR CÓS',23,16,7),(41,'PASSAR VOLTA DO CÓS',23,17,7),(42,'PREGAR BOLSO',2,18,7),(43,'PREGAR BOLSO DA VISTA',2,6,7),(44,'PREGAR ETIQUETA ESTRINA',2,19,7),(45,'PREGAR BOCA DE BOLSO',2,32,7),(46,'PREGAR PALA TRASEIRA',2,21,7),(47,'PREGAR RESERVA NO FORRO',2,22,7),(48,'PREGAR VISTA NO FORRO',2,23,7),(49,'PREPARAR BRAGUILHA',24,14,7),(50,'PREPARAR PERDIGAL',24,15,7),(51,'REBATER BOCA DE BOLSO COM 2 COSTURAS',25,24,7),(52,'REBATER ENTRE PERNAS',25,10,7),(53,'REBATER FORRO CURVADO',25,25,7),(54,'REBATER GANCHO TRASEIRO',25,26,7),(56,'REBATER LATERAL - 2 LADOS',25,34,7),(57,'REBATER PALA TRASEIRA',25,21,7),(58,'UNIR BOCA DE BOLSO',26,32,7),(59,'UNIR FECHO',26,28,7),(61,'FAZER GANCHO LARGO',10,35,7),(62,'FAZER CASAS',10,29,7),(63,'FAZER MOSCAS',10,30,7),(64,'PREGAR ETIQUETA POR DENTRO DO CÓS',2,31,7),(65,'FITAR PERDIGAL',22,15,7);
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
INSERT INTO `operador` VALUES (1,'MARIA SILVA',1),(34,'ROSEMAR ALVES',1),(44,'CINTIA MORAES',1),(45,'ROSE GUIMARAES',1),(52,'TAÍS DE OLIVEIRA',1),(68,'JORGE RODRIGUES',1);
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
INSERT INTO `operador_has_tipo_recurso` VALUES (44,1),(45,1),(60,1),(1,3),(44,3),(52,3),(68,3),(1,4),(68,4),(1,5),(45,5),(34,6),(44,6),(45,6),(68,6);
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
INSERT INTO `ordem_has_fase` VALUES (31,7,8,25,0,0,NULL,1,26),(32,7,1,25,0,21,NULL,2,5),(33,7,5,25,21,3,NULL,3,0),(88,35,8,10,0,0,1,1,10),(89,35,1,10,0,0,8,2,4),(90,35,5,10,0,0,22,3,4),(114,84,1,4,0,0,8,2,4),(115,84,5,4,0,4,22,3,0),(116,85,8,2,0,2,1,1,0),(117,85,1,2,2,0,8,2,0),(118,85,5,2,2,0,22,3,0),(119,87,8,100,0,0,21,1,100),(120,87,1,100,0,100,8,2,0),(121,87,5,100,100,0,22,3,0),(122,87,6,100,100,0,23,4,0),(123,87,7,100,100,0,1,5,0),(124,87,17,100,100,0,24,6,0),(125,87,18,100,100,0,25,7,0),(126,87,19,100,100,0,26,8,0);
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
  PRIMARY KEY (`idOrdem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_producao`
--

LOCK TABLES `ordem_producao` WRITE;
/*!40000 ALTER TABLE `ordem_producao` DISABLE KEYS */;
INSERT INTO `ordem_producao` VALUES (7,1012,7,25,'2016-03-03','Teste de observações'),(35,35,7,10,'2016-03-23',NULL),(84,35,7,4,'2016-03-25','Finalização Parcial da Ordem 35'),(85,35,7,2,'2016-03-25','Retrabalho da Ordem 35'),(87,1170516,105,100,'2016-05-17','Ordem de produção ativa.');
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
INSERT INTO `parametros` VALUES ('seqAcao',NULL,27),('seqBatida',NULL,385),('seqCelula',NULL,28),('seqCronometragem',NULL,283),('seqCronometrista',NULL,12),('seqFase',NULL,20),('seqGrupoProduto',NULL,16),('seqLayoutFase',NULL,26),('seqLayoutOperacao',NULL,605),('seqMovimentacao',NULL,168),('seqOperacao',NULL,66),('seqOperador',NULL,69),('seqOrdemFase',NULL,151),('seqOrdemProducao',NULL,91),('seqParte',NULL,36),('seqProduto',NULL,107),('seqRecurso',NULL,20),('seqTecido',NULL,15),('seqTipoMovimentacao',NULL,14),('seqTipoRecurso',NULL,17),('seqUsuario',NULL,6);
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
INSERT INTO `parte` VALUES (1,'PASSANTE'),(2,'BAINHA DO BOLSO TRASEIRO'),(6,'BOLSO DA VISTA'),(7,'BAINHA'),(8,'BAINHA NO BOLSO TRASEIRO'),(9,'BAINHA NO BOLSO DA VISTA'),(10,'ENTRE PERNAS'),(11,'FORRO DO BOLSO CURVADO LONGO'),(12,'GANCHO'),(13,'LATERAL'),(14,'BRAGUILHA'),(15,'PERDIGAL'),(16,'CÓS'),(17,'VOLTA DO CÓS'),(18,'BOLSO'),(19,'ETIQUETA ESTRINA'),(20,'FORRO NA BOCA DE BOLSO'),(21,'PALA TRASEIRA'),(22,'RESERVA NO FORRO'),(23,'VISTA NO FORRO'),(24,'BOCA DE BOLSO COM 2 COSTURAS'),(25,'FORRO CURVADO'),(26,'GANCHO TRASEIRO'),(27,'BOCA DE BOLSO'),(28,'FECHO'),(29,'CASAS'),(30,'MOSCAS'),(31,'ETIQUETA POR DENTRO DO CÓS'),(32,'BOCA DE BOLSO'),(33,'FORRO CURVADO'),(34,'LATERAL - 2 LADOS'),(35,'GANCHO LARGO');
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
INSERT INTO `produto` VALUES (7,'PRODUTO 1 TESTE','2015-10-22',3),(8,'PRODUTO 2 TESTE','2015-09-04',1),(43,'produto teste','2015-12-15',4),(47,'TESTE 47','2016-01-05',4),(56,'TESTE 56','2016-01-27',2),(57,'TESTE 57','2016-01-27',3),(71,'TESTE 4','2016-02-18',4),(90,'323',NULL,4),(91,'XCVB',NULL,2),(105,'M CA 46 19448','2016-05-16',15);
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
INSERT INTO `produto_has_fase` VALUES (7,1,2),(7,5,3),(7,8,1),(8,5,1),(8,8,2),(43,8,1),(71,6,1),(101,5,2),(101,8,1),(105,1,2),(105,5,3),(105,6,4),(105,7,5),(105,8,1),(105,17,6),(105,18,7),(105,19,8);
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
INSERT INTO `recurso` VALUES (2,123456789,'MAQUINA 100',2,1),(3,987654321,'MAQUINA 102',2,1),(8,0,'MAQUINA 101',4,1),(17,71,'MAQUINA 103',3,1);
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
INSERT INTO `tipo_recurso` VALUES (1,'MAQ. RETA'),(2,'MAQ. FITADEIRA'),(3,'MAQ. 2 AGULHAS'),(4,'EMBUTIDEIRA'),(5,'MAQ. 3 FIOS'),(6,'MOSQUEADEIRA'),(15,'TRAVETE'),(16,'CASEADEIRA');
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
INSERT INTO `tipo_usuario` VALUES (1,'Administrador',NULL),(2,'Cronoanalista',NULL),(3,'Controlador de Produção',NULL),(4,'Distribuidor de Produção',NULL),(5,'Movimentador de Produção',NULL);
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

-- Dump completed on 2016-06-16 11:19:27
