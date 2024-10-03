-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica_schema` DEFAULT CHARACTER SET utf8mb4 ;
USE `optica_schema` ;

-- -----------------------------------------------------
-- Table `optica_schema`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`address` (
  `id_address` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `num` INT NULL,
  `floor` INT NULL,
  `door` INT NULL,
  `city` VARCHAR(45) NULL,
  `postal_code` VARCHAR(15) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`id_address`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_schema`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`supplier` (
  `id_supplier` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  `fax` VARCHAR(20) NULL,
  `NIF` VARCHAR(20) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id_supplier`),
  INDEX `fk_supplier_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optica_schema`.`address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_schema`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`brand` (
  `id_brand` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`id_brand`),
  INDEX `fk_brand_supplier1_idx` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_brand_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `optica_schema`.`supplier` (`id_supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_schema`.`glass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`glass` (
  `id_glass` INT NOT NULL AUTO_INCREMENT,
  `left_glass_prescription` DECIMAL(4,2) NULL,
  `right_glass_prescription` DECIMAL(4,2) NULL,
  `frame` ENUM("floating", "pasta", "metallic") NULL,
  `frame_color` VARCHAR(20) NULL,
  `left_glass_color` VARCHAR(20) NULL,
  `right_glass_color` VARCHAR(20) NULL,
  `price` DECIMAL(10,2) NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`id_glass`),
  INDEX `fk_glass_brand1_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_glass_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `optica_schema`.`brand` (`id_brand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_schema`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`customer` (
  `id_customer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `register_date` DATE NULL,
  `recomendator_customer_id` INT NULL DEFAULT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `recomendator_customer_id_idx` (`recomendator_customer_id` ASC) VISIBLE,
  INDEX `fk_customer_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `recomendator_customer_id`
    FOREIGN KEY (`recomendator_customer_id`)
    REFERENCES `optica_schema`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optica_schema`.`address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_schema`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`employee` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica_schema`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica_schema`.`invoice` (
  `id_invoice` INT NOT NULL AUTO_INCREMENT,
  `invoice_date` DATE NULL,
  `glass_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id_invoice`, `glass_id`, `employee_id`, `customer_id`),
  INDEX `fk_invoice_glass1_idx` (`glass_id` ASC) VISIBLE,
  INDEX `fk_invoice_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_invoice_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_glass1`
    FOREIGN KEY (`glass_id`)
    REFERENCES `optica_schema`.`glass` (`id_glass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `optica_schema`.`employee` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `optica_schema`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
