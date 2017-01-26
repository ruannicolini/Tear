-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema balay
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema balay
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `balay` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `balay` ;

-- -----------------------------------------------------
-- Table `balay`.`grupo_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`grupo_Produto` (
  `idgrupo_Produto` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idgrupo_Produto`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`produto` (
  `idProduto` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  `data` DATE NULL COMMENT '',
  `idGrupo` INT NULL COMMENT '',
  PRIMARY KEY (`idProduto`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`cronometragem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`cronometragem` (
  `idcronometragem` INT NULL COMMENT '',
  `tempo_original` TINYINT(1) NULL COMMENT '',
  `tempo_ideal` TINYINT(1) NULL COMMENT '',
  `ritmo` INT(11) NULL COMMENT '',
  `num_pecas` INT(11) NULL COMMENT '',
  `tolerancia` INT(11) NULL COMMENT '',
  `comprimento_prod` FLOAT NULL COMMENT '',
  `num_ocorrencia` INT(11) NULL COMMENT '',
  `idProduto` INT NULL COMMENT '',
  `idCronometrista` INT NULL COMMENT '',
  `idTecido` INT NULL COMMENT '',
  `idOperacao` INT NULL COMMENT '',
  PRIMARY KEY (`idcronometragem`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`tipo_recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`tipo_recurso` (
  `idtipo_recurso` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idtipo_recurso`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`cronometragem_has_tipo_recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`cronometragem_has_tipo_recurso` (
  `idcronometragem` INT NULL COMMENT '',
  `idTipoRecurso` INT NULL COMMENT '',
  PRIMARY KEY (`idcronometragem`, `idTipoRecurso`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`recurso` (
  `idRecurso` INT NULL COMMENT '',
  `patrimonio` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  `idTipoRecurso` INT NULL COMMENT '',
  PRIMARY KEY (`idRecurso`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`operador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`operador` (
  `idoperador` INT NULL COMMENT '',
  `nome` VARCHAR(45) NULL COMMENT '',
  `idGrupo` INT NULL COMMENT '',
  PRIMARY KEY (`idoperador`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`operador_has_tipo_recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`operador_has_tipo_recurso` (
  `idOperador` INT NULL COMMENT '',
  `idTipoRecurso` INT NULL COMMENT '',
  PRIMARY KEY (`idTipoRecurso`, `idOperador`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`grupo` (
  `idgrupo` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idgrupo`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`batida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`batida` (
  `idbatida` INT NULL COMMENT '',
  `minutos` INT NULL COMMENT '',
  `segundos` INT NULL COMMENT '',
  `centezimos` INT NULL COMMENT '',
  `utilizar` TINYINT(1) NULL COMMENT '',
  `idCronometragem` INT NULL COMMENT '',
  PRIMARY KEY (`idbatida`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`tecido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`tecido` (
  `idtecido` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idtecido`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`operacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`operacao` (
  `idoperacao` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  `idAcao` INT NULL COMMENT '',
  `idParte` INT NULL COMMENT '',
  `idFase` INT NULL COMMENT '',
  PRIMARY KEY (`idoperacao`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`cronometrista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`cronometrista` (
  `idcronometrista` INT NULL COMMENT '',
  `nome` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idcronometrista`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`acao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`acao` (
  `idacao` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idacao`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`parte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`parte` (
  `idparte` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idparte`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`fase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`fase` (
  `idfase` INT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idfase`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`fase_has_grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`fase_has_grupo` (
  `idFase` INT NULL COMMENT '',
  `idGrupo` INT NULL COMMENT '',
  PRIMARY KEY (`idFase`, `idGrupo`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`Dependencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`Dependencia` (
  `idDependencia` INT NULL COMMENT '',
  `idOperacao` INT NULL COMMENT '',
  PRIMARY KEY (`idDependencia`, `idOperacao`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `balay`.`parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balay`.`parametros` (
  `parametro` VARCHAR(20) NULL COMMENT '',
  `descricao` VARCHAR(45) NULL COMMENT '',
  `valor` INT NULL COMMENT '',
  PRIMARY KEY (`parametro`)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqProduto', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqGrupoProduto', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqAcao', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqParte', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqFase', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqCronometrista', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqOperacao', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqOperador', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqRecurso', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqTipoRecurso', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqTecido', '1');
INSERT INTO `balay`.`parametros` (`parametro`, `valor`) VALUES ('seqCelula', '1');
