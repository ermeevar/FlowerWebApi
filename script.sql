-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema flower
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flower
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flower` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `flower` ;

-- -----------------------------------------------------
-- Table `flower`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `passwordHash` VARCHAR(100) NULL DEFAULT NULL,
  `salt` VARCHAR(100) NULL DEFAULT NULL,
  `role` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `login` ON `flower`.`accounts` (`login` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `flower`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`stores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `firstPhone` VARCHAR(100) NOT NULL,
  `secondPhone` VARCHAR(100) NULL DEFAULT NULL,
  `picture` LONGBLOB NULL DEFAULT NULL,
  `accountId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`storeproducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`storeproducts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `picture` LONGBLOB NULL DEFAULT NULL,
  `cost` DOUBLE NOT NULL,
  `storeId` INT NOT NULL,
  `categoryId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`shops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(1000) NOT NULL,
  `storeId` INT NOT NULL,
  `accountId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`shopproducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`shopproducts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `isEmpty` TINYINT(1) NULL DEFAULT '1',
  `storeProductId` INT NOT NULL,
  `shopId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(100) NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `picture` LONGBLOB NULL DEFAULT NULL,
  `accountId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`bouquets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`bouquets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `cost` DOUBLE NOT NULL,
  `storeId` INT NULL DEFAULT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`bouquetproducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`bouquetproducts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shopProductId` INT NOT NULL,
  `bouquetId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`orderstatuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`orderstatuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`templatecategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`templatecategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`templates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`templates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `templateCategoryId` INT NOT NULL,
  `storeId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `flower`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flower`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start` DATETIME NOT NULL,
  `finish` DATETIME NOT NULL,
  `isRandom` TINYINT(1) NULL DEFAULT '0',
  `orderStatusId` INT NULL DEFAULT NULL,
  `bouquetId` INT NULL DEFAULT NULL,
  `templateId` INT NULL DEFAULT NULL,
  `userId` INT NOT NULL,
  `cost` DOUBLE NULL DEFAULT NULL,
  `shopId` INT NULL DEFAULT NULL,
  `card` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
