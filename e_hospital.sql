-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema e_hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e_hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e_hospital` DEFAULT CHARACTER SET latin1 ;
USE `e_hospital` ;

-- -----------------------------------------------------
-- Table `e_hospital`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_hospital`.`doctor` (
  `mobile` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(105) NOT NULL,
  `last_name` VARCHAR(105) NOT NULL,
  `age` INT(11) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  `license_no` VARCHAR(100) NOT NULL,
  `experience` INT(11) NOT NULL,
  `approved` VARCHAR(10) NOT NULL DEFAULT 'NO',
  `consultaion_fee` INT(11) NOT NULL,
  `cases_handled` INT(11) NOT NULL DEFAULT '0',
  `specialisaton` VARCHAR(255) NOT NULL,
  `qualification` VARCHAR(100) NOT NULL,
  `rating` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobile`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `e_hospital`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_hospital`.`user` (
  `mobile` VARCHAR(20) NOT NULL,
  `password` VARCHAR(145) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `age` INT(11) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `blood_group` VARCHAR(45) NOT NULL,
  `weight` FLOAT NOT NULL,
  `height` FLOAT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Mobile`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `e_hospital`.`past_medical_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_hospital`.`past_medical_records` (
  `mobile` VARCHAR(20) NOT NULL,
  `disease` VARCHAR(45) NOT NULL,
  INDEX `key_user_idx` (`mobile` ASC) VISIBLE,
  CONSTRAINT `key_user`
    FOREIGN KEY (`mobile`)
    REFERENCES `e_hospital`.`user` (`Mobile`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `e_hospital`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_hospital`.`reviews` (
  `review_id` INT(11) NOT NULL,
  `doctor_mobile` INT(20) NOT NULL,
  `user_mobile` INT(20) NOT NULL,
  `star_rating` INT(11) NOT NULL DEFAULT '3',
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `e_hospital`.`specialisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_hospital`.`specialisation` (
  `category` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`category`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `e_hospital`.`tmp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_hospital`.`tmp` (
  `id` INT(11) NOT NULL,
  `image` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
