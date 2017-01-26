CREATE DATABASE  IF NOT EXISTS `balay` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `balay`;

-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: balay
-- ------------------------------------------------------

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-26 17:07:28


-- INSERT

INSERT INTO modulo VALUES 
(1,'Cronoanálise',0),
(2,'Produção',3),
(4,'Ajustes',2);

INSERT INTO interface VALUES 
(1,1,NULL,'Ação',1,'01001',1),
(2,1,NULL,'Produto',7,'01007',1),
(3,1,NULL,'G. Produtos',9,'01009',1),
(4,1,NULL,'Recurso',6,'01006',1),
(5,1,NULL,'Tipo de Recurso',4,'01004',1),
(6,1,NULL,'Cronometrista',2,'01002',1),
(7,1,NULL,'Tecido',5,'01005',1),
(8,1,NULL,'Operação',8,'01008',1),
(9,1,NULL,'L. Produção',3,'01003',1),
(10,1,NULL,'Operador',10,'01010',1),
(11,1,NULL,'Fase',11,'01011',1),
(12,1,NULL,'Parte',12,'01012',1),
(13,4,NULL,'Telas',4,'03001',1),
(14,4,NULL,'Modulos',4,'03002',1),
(15,4,NULL,'Usuários',10,'03003',1),
(16,2,NULL,'Ordem',13,'02001',1),
(17,2,NULL,'Movimentação',14,'02002',1),
(18,2,NULL,'Tipo Mov.',4,'02003',1),
(19,1,NULL,'APP',15,'01014',1),
(20,2,NULL,'Balanceamento',0,'02004',1),
(21,1,NULL,'Cronometragem',0,'01013',0);

INSERT INTO tipo_usuario VALUES 
(1,'Administrador',NULL),
(2,'Cronoanalista',NULL),
(3,'Gerente de Produção',NULL),
(4,'Auxiliar de Produção',NULL),
(5,'Operador de Produção',NULL);

INSERT INTO seguranca VALUES 
(1,1,1,1,1,1),(1,2,1,1,1,1),(1,3,1,1,1,1),
(1,4,1,1,1,1),(1,5,1,1,1,1),(1,6,1,1,1,1),
(1,7,1,1,1,1),(1,8,1,1,1,1),(1,9,1,1,1,1),
(1,10,1,1,1,1),(1,11,1,1,1,1),(1,12,1,1,1,1),
(1,13,1,1,1,1),(1,14,1,1,1,1),(1,15,1,1,1,1),
(1,16,1,1,1,1),(1,17,1,1,1,1),(1,18,1,1,1,1),
(1,19,1,1,1,1),(1,20,1,1,1,1),(1,21,1,1,1,1),
(2,1,1,1,1,1),(2,2,1,1,1,1),(2,3,1,1,1,1),
(2,4,1,1,1,1),(2,5,1,1,1,1),(2,6,1,1,1,1),
(2,7,1,1,1,1),(2,8,1,1,1,1),(2,9,1,1,1,1),
(2,10,1,1,1,1),(2,11,1,1,1,1),(2,12,1,1,1,1),
(2,19,1,1,1,1),(2,21,1,1,1,1),(3,16,1,1,1,1),
(3,17,1,1,1,1),(3,18,1,1,1,1),(3,20,1,1,1,1),
(4,17,1,1,1,1),(4,20,1,1,1,1),(5,17,1,1,0,0);

INSERT INTO USUARIO(IDUSUARIO,NOME,LOGIN,SENHA,idtipoUsuario) VALUES(1,'ADMINISTRADOR','admin','21232F297A57A5A743894A0E4A801FC3',1);

INSERT INTO parametros VALUES 
('seqAcao',NULL,1),
('seqBatida',NULL,1),
('seqCelula',NULL,1),
('seqCronometragem',NULL,1),
('seqCronometrista',NULL,1),
('seqFase',NULL,1),
('seqGrupoProduto',NULL,1),
('seqMovimentacao',NULL,1),
('seqOperacao',NULL,1),
('seqOperador',NULL,1),
('seqOrdemFase',NULL,1),
('seqOrdemProducao',NULL,1),
('seqParte',NULL,1),
('seqProduto',NULL,1),
('seqRecurso',NULL,1),
('seqSequenciamento',NULL,1),
('seqTarefaSequenciada',NULL,1),
('seqTecido',NULL,1),
('seqTipoMovimentacao',NULL,1),
('seqTipoRecurso',NULL,1),
('seqUsuario',NULL,2);



