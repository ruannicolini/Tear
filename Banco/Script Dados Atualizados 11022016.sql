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
INSERT INTO `acao` VALUES (2,'AÇÃO TESTE 2'),(9,'ação 9'),(10,'ação 10');
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
  `centezimos` int(11) DEFAULT NULL,
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
INSERT INTO `batida` VALUES (13,0,0,7,1,24),(14,0,2,1,1,24),(15,0,1,0,1,25),(16,0,1,6,1,25),(17,0,0,6,1,25),(18,0,2,2,1,25),(19,0,1,3,1,26),(20,0,2,6,1,26),(21,0,3,4,1,26),(22,0,1,0,1,27),(23,0,1,1,1,28),(24,0,1,4,1,28),(25,0,2,6,1,29),(26,0,2,7,1,29),(27,0,2,0,1,29),(28,0,2,8,1,30),(29,0,4,3,1,30),(30,0,2,3,1,30),(31,0,1,9,1,30),(32,0,0,8,1,31),(33,0,1,5,1,31),(34,0,1,5,1,31),(35,0,2,6,1,32),(36,0,3,5,1,32),(37,0,3,5,1,32),(38,0,3,3,1,33),(39,0,3,1,1,33),(40,0,3,5,1,33),(41,0,4,1,1,34),(42,0,5,0,1,34),(43,0,2,2,1,34),(44,0,3,0,1,35),(45,0,2,3,1,35),(46,0,1,6,1,35),(47,0,4,0,1,35);
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
  PRIMARY KEY (`idcronometragem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronometragem`
--

LOCK TABLES `cronometragem` WRITE;
/*!40000 ALTER TABLE `cronometragem` DISABLE KEYS */;
INSERT INTO `cronometragem` VALUES (15,0,0,1,2,4,3,6,8,1,2,9,34),(16,0,0,1,2,4,3,6,8,1,1,5,1),(17,0,0,1,2,4,3,6,7,1,1,9,1),(18,0,0,6,5,3,4,1,8,1,1,9,1),(19,0,0,1,2,4,3,6,7,1,1,9,1),(20,0,0,1,2,4,3,6,7,1,2,9,1),(21,0,0,1,2,4,3,6,7,1,1,5,1),(22,0,0,1,2,4,3,6,8,1,1,9,1),(23,0,0,1,2,4,3,6,7,1,1,5,1),(24,0,0,1,2,4,3,6,7,1,1,5,1),(25,0,0,6,5,3,4,1,8,1,2,5,1),(26,0,0,1,2,4,3,6,7,1,1,5,1),(27,0,0,1,2,4,3,6,7,1,1,5,1),(28,0,0,1,2,4,3,5,8,1,2,9,34),(29,0,0,1,2,4,3,6,8,1,1,9,34),(30,0,0,1,2,4,3,6,8,1,1,9,34),(31,0,0,1,2,4,3,6,7,1,2,5,1),(32,0,0,1,2,4,3,6,8,4,2,9,1),(33,0,0,1,2,4,3,6,7,1,1,5,34),(34,0,0,1,2,4,3,6,7,1,1,9,34),(35,0,0,1,2,4,3,6,7,1,1,9,1);
/*!40000 ALTER TABLE `cronometragem` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `cronometragem_has_tipo_recurso` VALUES (17,1),(17,2),(17,3),(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(19,1),(19,2),(20,1),(20,2),(20,3),(21,1),(21,2),(21,3),(22,1),(22,2),(23,2),(24,1),(25,2),(25,3),(25,6),(26,1),(26,6),(27,2),(28,1),(28,3),(28,5),(29,1),(29,3),(29,5),(30,1),(30,2),(30,5),(31,1),(31,3),(31,5),(32,2),(32,4),(32,6),(33,1),(33,4),(33,6),(34,1),(34,3),(34,6),(35,2),(35,3),(35,5);
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
INSERT INTO `cronometrista` VALUES (1,'TESTE CRONOMETRISTA 1'),(4,'CRONOMETRISTA 4'),(5,'CRONOMETRISTA 5'),(6,'RONOMETRISTA 6');
/*!40000 ALTER TABLE `cronometrista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencia`
--

DROP TABLE IF EXISTS `dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencia` (
  `idDependencia` int(11) NOT NULL DEFAULT '0',
  `idOperacao` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idDependencia`,`idOperacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencia`
--

LOCK TABLES `dependencia` WRITE;
/*!40000 ALTER TABLE `dependencia` DISABLE KEYS */;
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
INSERT INTO `fase` VALUES (1,'FASE TESTE 1'),(5,'FASE 5'),(6,'FASE 6'),(7,'FASE 7'),(8,'FASE 8');
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
INSERT INTO `fase_has_grupo` VALUES (1,8),(6,1),(7,1),(8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,1,NULL,'Ação',10,'01001'),(2,1,NULL,'Produto',16,'01007'),(3,1,NULL,'G. Produtos',18,'01009'),(4,1,NULL,'Recurso',15,'01006'),(5,1,NULL,'Tipo de Recurso',13,'01004'),(6,1,NULL,'Cronometrista',11,'01002'),(7,1,NULL,'Tecido',14,'01005'),(8,1,NULL,'Operação',17,'01008'),(9,1,NULL,'G. Operadores',12,'01003'),(10,1,NULL,'Operador',50,'01010'),(11,1,NULL,'Fase',51,'01011'),(12,1,NULL,'Parte',52,'01012'),(13,3,NULL,'Telas',13,'03001'),(14,3,NULL,'Modulo',0,'03002'),(15,1,NULL,'Cronometragem',5,'01013');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Cronoanálise',40),(2,'Balanceamento',41),(3,'Ajustes',43);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
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
INSERT INTO `operacao` VALUES (5,'TESTE OPERAÇÃO',2,2,5),(9,'TESTE OPERAÇÃO 9',2,1,1);
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
INSERT INTO `operador` VALUES (1,'operador 1',1),(34,'operador 34',1),(44,'OPERADOR 44',1),(45,'teste 45',1),(52,'Operador 52',1);
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `operador_has_tipo_recurso` VALUES (44,1),(45,1),(1,3),(44,3),(52,3),(1,5),(45,5),(34,6),(44,6),(45,6);
/*!40000 ALTER TABLE `operador_has_tipo_recurso` ENABLE KEYS */;
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
INSERT INTO `parametros` VALUES ('seqAcao',NULL,19),('seqBatida',NULL,48),('seqCelula',NULL,10),('seqCronometragem',NULL,36),('seqCronometrista',NULL,7),('seqFase',NULL,14),('seqGrupoProduto',NULL,14),('seqOperacao',NULL,21),('seqOperador',NULL,59),('seqParte',NULL,5),('seqProduto',NULL,55),('seqRecurso',NULL,15),('seqTecido',NULL,5),('seqTipoRecurso',NULL,12);
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
INSERT INTO `produto` VALUES (7,'PRODUTO 1 TESTE','2015-10-22',1),(8,'PRODUTO 2 TESTE','2015-09-04',1),(43,'produto teste','2015-12-15',3),(47,'TESTE 47','2016-01-05',4);
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
  `prioridade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduto`,`idFase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_fase`
--

LOCK TABLES `produto_has_fase` WRITE;
/*!40000 ALTER TABLE `produto_has_fase` DISABLE KEYS */;
INSERT INTO `produto_has_fase` VALUES (7,1,1),(7,5,2),(7,7,3),(7,8,4),(47,1,1),(47,5,2),(47,6,3),(47,7,4),(47,8,5),(52,1,1),(53,1,1),(54,1,2),(54,5,3),(54,6,1);
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
INSERT INTO `recurso` VALUES (2,123456789,'MAQUINA 1 - TESTE DE RECURSO -',2),(3,987654321,'MAQUINA 2 - TESTE DE RECURSO -',2),(8,0,'teste 8',4);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-11 15:23:19
