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
INSERT INTO `acao` VALUES (2,'AÇÃO TESTE 2'),(9,'ação 9'),(10,'ação 10'),(20,'TESTE 20 T');
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
INSERT INTO `batida` VALUES (48,0,4,344,1,NULL),(49,0,14,204,1,NULL),(50,0,1,937,1,NULL),(51,0,3,140,1,NULL),(52,NULL,NULL,NULL,1,NULL),(53,0,14,562,1,NULL),(54,0,2,250,1,NULL),(55,0,6,281,1,NULL),(56,0,0,485,1,NULL),(57,0,3,32,1,NULL),(58,0,4,985,1,NULL),(59,0,0,578,1,NULL),(61,1,2,3,1,110),(63,0,2,16,1,111),(65,0,2,578,1,113),(70,NULL,NULL,NULL,NULL,NULL),(71,NULL,NULL,NULL,NULL,NULL),(72,0,1,875,1,117),(73,0,7,796,1,117),(74,0,3,219,1,125),(75,0,8,969,1,125),(76,0,13,750,1,125),(94,0,4,671,1,127),(95,0,5,641,1,127),(96,0,2,875,1,127),(97,0,3,828,1,127),(98,0,3,266,1,127),(99,0,4,640,1,127),(163,0,1,703,1,188),(164,0,2,485,1,188),(165,0,1,797,1,188),(244,0,1,859,1,167),(245,0,1,782,1,167),(246,0,2,312,1,167),(247,0,2,31,1,167),(248,0,1,828,1,167),(249,0,2,547,1,167),(250,0,2,375,1,167),(251,0,3,688,1,167),(252,0,2,937,1,153),(253,0,3,735,1,153),(254,0,3,0,1,153),(255,0,4,125,1,153),(256,0,1,734,1,153),(257,0,1,953,1,194),(258,0,3,641,1,194),(260,0,2,391,1,194),(261,0,2,672,1,194),(262,0,3,187,1,194),(279,0,3,672,1,200),(280,0,3,656,1,200),(281,0,2,781,1,200),(282,0,2,157,1,200),(283,0,2,781,1,200),(292,0,2,562,1,191);
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
  `prioridade` int(11) DEFAULT NULL,
  `tempoPadraoFinal` float DEFAULT '0',
  PRIMARY KEY (`idcronometragem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronometragem`
--

LOCK TABLES `cronometragem` WRITE;
/*!40000 ALTER TABLE `cronometragem` DISABLE KEYS */;
INSERT INTO `cronometragem` VALUES (153,1,1,80,1,10,5,4,8,1,2,5,45,1,2733.46),(167,1,1,80,1,10,1,2,43,8,2,26,52,NULL,2026.42),(191,0,0,90,1,10,10,1,7,NULL,NULL,26,NULL,2,2536.38),(192,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,9,NULL,1,NULL),(194,1,0,80,1,20,NULL,1,7,NULL,NULL,5,NULL,3,2658.05),(200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,22,NULL,1,0);
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
INSERT INTO `cronometragem_has_tipo_recurso` VALUES (46,2),(117,3),(125,2),(125,4),(153,3),(167,1),(167,5),(191,6),(194,4);
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
INSERT INTO `cronometrista` VALUES (1,'TESTE CRONOMETRISTA 1'),(4,'CRONOMETRISTA 4'),(5,'CRONOMETRISTA 5'),(6,'RONOMETRISTA 6'),(8,'CRONOMETRISTA 8');
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
INSERT INTO `dependencia` VALUES (191,192),(191,194);
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
INSERT INTO `fase` VALUES (1,'FASE TESTE 1'),(5,'FASE 5 TESTE'),(6,'FASE 6'),(7,'FASE 7'),(8,'FASE 8');
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
INSERT INTO `fase_has_grupo` VALUES (1,8),(5,14),(6,1),(7,1),(8,1),(8,15);
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
INSERT INTO `grupo` VALUES (1,'grupo 1'),(8,'Test *');
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
INSERT INTO `grupo_produto` VALUES (1,'GRUPO 1 TESTE DE GRUPO DE PRODUTO'),(2,'GRUPO 2'),(3,'GRUPO 3'),(4,'GRUPO 4'),(8,'teste');
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
  PRIMARY KEY (`idinterface`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,1,NULL,'Ação',1,'01001'),(2,1,NULL,'Produto',7,'01007'),(3,1,NULL,'G. Produtos',9,'01009'),(4,1,NULL,'Recurso',6,'01006'),(5,1,NULL,'Tipo de Recurso',4,'01004'),(6,1,NULL,'Cronometrista',2,'01002'),(7,1,NULL,'Tecido',5,'01005'),(8,1,NULL,'Operação',8,'01008'),(9,1,NULL,'G. Operadores',3,'01003'),(10,1,NULL,'Operador',10,'01010'),(11,1,NULL,'Fase',11,'01011'),(12,1,NULL,'Parte',12,'01012'),(13,4,NULL,'Telas',4,'03001'),(14,4,NULL,'Modulo',4,'03002'),(15,1,NULL,'Cronometragem',0,'01013'),(16,2,NULL,'Ordens',13,'02001');
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
INSERT INTO `modulo` VALUES (1,'Cronoanálise',0),(2,'Produção',3),(3,'Balanceamento',1),(4,'Ajustes',2);
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
INSERT INTO `operacao` VALUES (5,'TESTE OPERAÇÃO',2,2,5),(9,'TESTE OPERAÇÃO 9',2,1,1),(22,'1',9,2,6),(26,'TESTE 26',10,2,8),(28,'TESTE 28',9,2,8);
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
INSERT INTO `operador` VALUES (1,'operador 1',1),(34,'operador 34',1),(44,'OPERADOR 44',1),(45,'teste 45',1),(52,'Operador 52',1),(68,'TESTE',8);
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
INSERT INTO `operador_has_tipo_recurso` VALUES (44,1),(45,1),(60,1),(1,3),(44,3),(52,3),(68,3),(1,4),(1,5),(45,5),(34,6),(44,6),(45,6);
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
  `qtdOriginal` int(11) DEFAULT NULL,
  `qtdPrevista` int(11) DEFAULT NULL,
  `qtdProduzindo` int(11) DEFAULT NULL,
  `idLinhaProducao` int(11) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrdem_has_fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_has_fase`
--

LOCK TABLES `ordem_has_fase` WRITE;
/*!40000 ALTER TABLE `ordem_has_fase` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `ordem_producao` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `parametros` VALUES ('seqAcao',NULL,22),('seqBatida',NULL,293),('seqCelula',NULL,21),('seqCronometragem',NULL,222),('seqCronometrista',NULL,11),('seqFase',NULL,16),('seqGrupoProduto',NULL,15),('seqOperacao',NULL,32),('seqOperador',NULL,69),('seqParte',NULL,6),('seqProduto',NULL,100),('seqRecurso',NULL,20),('seqTecido',NULL,6),('seqTipoRecurso',NULL,14);
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
INSERT INTO `parte` VALUES (1,'PARTE TESTE 1'),(2,'PARTE TESTE 2');
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
INSERT INTO `produto` VALUES (7,'PRODUTO 1 TESTE','2015-10-22',3),(8,'PRODUTO 2 TESTE','2015-09-04',1),(43,'produto teste','2015-12-15',4),(47,'TESTE 47','2016-01-05',4),(56,'TESTE 56','2016-01-27',2),(57,'TESTE 57','2016-01-27',3),(63,'TESTE 8','2016-02-04',8),(71,'TESTE 4','2016-02-18',4),(90,'323',NULL,4),(91,'XCVB',NULL,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`idRecurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (2,123456789,'MAQUINA 1 - TESTE DE RECURSO -',2),(3,987654321,'MAQUINA 2 - TESTE DE RECURSO -',2),(8,0,'teste 8',4),(17,71,'TESTE 17',3);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
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
INSERT INTO `tecido` VALUES (1,'TECIDO 1 - TESTE ok'),(2,'TECIDO 2 - TESTE');
/*!40000 ALTER TABLE `tecido` ENABLE KEYS */;
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
INSERT INTO `tipo_recurso` VALUES (1,'TIPO RECURSO TESTE 1'),(2,'TIPO RECURSO TESTE 2'),(3,'TIPO RECURSO TESTE 3'),(4,'TIPO RECURSO TESTE 4'),(5,'TIPO RECURSO TESTE 5'),(6,'TIPO RECURSO TESTE 6');
/*!40000 ALTER TABLE `tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimentacao`
--

DROP TABLE IF EXISTS `tipomovimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomovimentacao` (
  `idtipoMovimentacao` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoMovimentacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimentacao`
--

LOCK TABLES `tipomovimentacao` WRITE;
/*!40000 ALTER TABLE `tipomovimentacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovimentacao` ENABLE KEYS */;
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

-- Dump completed on 2016-03-02  9:02:12
