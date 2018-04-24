-- MySQL Script generated by MySQL Workbench
-- lun. 16 avril 2018 16:50:50 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `techno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `techno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `password` VARCHAR(12) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `technoId` INT NOT NULL,
  PRIMARY KEY (`id`),
  -- INDEX `fk_User_techno_idx` (`techno_id` ASC),
  CONSTRAINT `fk_User_techno`
    FOREIGN KEY (`technoId`)
    REFERENCES `techno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helpRequest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wildRequest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(300) NOT NULL,
  `topic` VARCHAR(45) NOT NULL,
  `technoId` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`id`),
  -- INDEX `fk_Request Help_techno1_idx` (`techno_id` ASC),
  -- INDEX `fk_helpRequest_User1_idx` (`User_id` ASC, `User_techno_id` ASC),
  CONSTRAINT `fk_Request wild_techno1`
    FOREIGN KEY (`technoId`)
    REFERENCES `techno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wildRequest_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `helpProposal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpProposal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `description` TEXT NOT NULL,
  `status` VARCHAR(45) NULL,
  `userId` INT NOT NULL,
  `requestId` INT NOT NULL,
  PRIMARY KEY (`id`),
  -- INDEX `fk_help proposal_User1_idx` (`User_id` ASC),
  CONSTRAINT `fk_helpProposal_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_helpProposal_helpRequest1`
    FOREIGN KEY (`requestId`)
    REFERENCES `helpRequest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user proposal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userProposal` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `userId` INT NOT NULL,
  `proposalId` INT NOT NULL,
  CONSTRAINT `fk_help proposal_has_User_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userProposal_RequestHelp1`
    FOREIGN KEY (`proposalId`)
    REFERENCES `helpProposal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `view1` (`id` INT);

-- -----------------------------------------------------
-- View `view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
