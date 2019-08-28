-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `Name_Mutation` VARCHAR(45) NULL,
  `Chromosomal location` INT NULL,
  PRIMARY KEY (`Chromosomal location`, `Name_Mutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Name` INT NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `age_diagnose` INT NULL,
  `Which_mutation` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`),
  INDEX `fk_2_idx` (`Which_mutation` ASC) VISIBLE,
  CONSTRAINT `fk_2`
    FOREIGN KEY (`Which_mutation`)
    REFERENCES `mydb`.`Mutation` (`Name_Mutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `location` INT NOT NULL,
  `Name` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`),
  INDEX `fk_1_idx` (`location` ASC) VISIBLE,
  CONSTRAINT `fk_1`
    FOREIGN KEY (`location`)
    REFERENCES `mydb`.`Mutation` (`Chromosomal location`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
