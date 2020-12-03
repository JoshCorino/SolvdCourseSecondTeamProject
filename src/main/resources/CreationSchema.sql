-- MySQL Script generated by MySQL Workbench
-- Thu Dec  3 14:43:01 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bigpro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bigpro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bigpro` DEFAULT CHARACTER SET utf8 ;
USE `bigpro` ;

-- -----------------------------------------------------
-- Table `bigpro`.`warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`warehouses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wh_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`transport_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`transport_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `transport_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`transport_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DOUBLE NULL,
  `volume` DOUBLE NOT NULL,
  `good_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `companies_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_companies1_idx` (`companies_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_companies1`
    FOREIGN KEY (`companies_id`)
    REFERENCES `bigpro`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`warehouses_have_goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`warehouses_have_goods` (
  `goods_id` INT NOT NULL,
  `warehouses_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_goods_has_warehouses_warehouses1_idx` (`warehouses_id` ASC) VISIBLE,
  INDEX `fk_goods_has_warehouses_goods_idx` (`goods_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_goods_has_warehouses_goods`
    FOREIGN KEY (`goods_id`)
    REFERENCES `bigpro`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_has_warehouses_warehouses1`
    FOREIGN KEY (`warehouses_id`)
    REFERENCES `bigpro`.`warehouses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`companies_have_transports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`companies_have_transports` (
  `companies_id` INT NOT NULL,
  `transports_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `capacity` DOUBLE NOT NULL,
  INDEX `fk_companies_has_transports_transports1_idx` (`transports_id` ASC) VISIBLE,
  INDEX `fk_companies_has_transports_companies1_idx` (`companies_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_companies_has_transports_companies1`
    FOREIGN KEY (`companies_id`)
    REFERENCES `bigpro`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_companies_has_transports_transports1`
    FOREIGN KEY (`transports_id`)
    REFERENCES `bigpro`.`transport_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`orders_have_goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`orders_have_goods` (
  `goods_id` INT NOT NULL,
  `orders_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_goods_has_orders_orders1_idx` (`orders_id` ASC) VISIBLE,
  INDEX `fk_goods_has_orders_goods1_idx` (`goods_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_goods_has_orders_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `bigpro`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_has_orders_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `bigpro`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bigpro`.`allowed_transports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bigpro`.`allowed_transports` (
  `warehouses_id` INT NOT NULL,
  `transport_types_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_warehouses_has_transport_types_transport_types1_idx` (`transport_types_id` ASC) VISIBLE,
  INDEX `fk_warehouses_has_transport_types_warehouses1_idx` (`warehouses_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_warehouses_has_transport_types_warehouses1`
    FOREIGN KEY (`warehouses_id`)
    REFERENCES `bigpro`.`warehouses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouses_has_transport_types_transport_types1`
    FOREIGN KEY (`transport_types_id`)
    REFERENCES `bigpro`.`transport_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
