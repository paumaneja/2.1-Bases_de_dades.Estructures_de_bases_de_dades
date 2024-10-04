-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `id_province` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_province`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`city` (
  `id_city` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `province_id` INT NOT NULL,
  PRIMARY KEY (`id_city`),
  INDEX `fk_city_province1_idx` (`province_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `pizzeria`.`province` (`id_province`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `id_customer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `postal_code` VARCHAR(10) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `fk_customer_city_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizzeria`.`city` (`id_city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`store` (
  `id_store` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NOT NULL,
  `postal_code` VARCHAR(10) NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id_store`),
  INDEX `fk_store_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizzeria`.`city` (`id_city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(20) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `employee_type` ENUM("chef", "dealer") NOT NULL,
  `store_id` INT NOT NULL,
  PRIMARY KEY (`id_employee`),
  INDEX `fk_employee_store1_idx` (`store_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizzeria`.`store` (`id_store`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`order` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `order_type` ENUM("onsite", "delivery") NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `employee_id` INT NULL,
  `store_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `delivery_date` DATETIME NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_order_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_order_store1_idx` (`store_id` ASC) VISIBLE,
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizzeria`.`employee` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizzeria`.`store` (`id_store`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizzeria`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`pizza_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza_category` (
  `id_pizza_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pizza_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `product_type` ENUM("pizza", "burguer", "drink") NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `image` VARCHAR(200) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `pizza_category_id` INT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_product_pizza_category1_idx` (`pizza_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_pizza_category1`
    FOREIGN KEY (`pizza_category_id`)
    REFERENCES `pizzeria`.`pizza_category` (`id_pizza_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`order_detail` (
  `id_order_detail` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id_order_detail`),
  INDEX `fk_order_detail_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_detail_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_detail_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `pizzeria`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
