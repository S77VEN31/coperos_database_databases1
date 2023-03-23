-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema caso2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema caso2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `caso2` DEFAULT CHARACTER SET utf8 ;
USE `caso2` ;

-- -----------------------------------------------------
-- Table `caso2`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`products` (
  `product_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DECIMAL(12,2) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`carts` (
  `cart_id` INT(4) NOT NULL AUTO_INCREMENT,
  `cart_color` VARCHAR(7) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`cart_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `unit` VARCHAR(15) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  `birth_date` DATE NOT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `iban_account` VARCHAR(50) NOT NULL,
  `birth_date` DATE NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`locations` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(45) NOT NULL,
  `coordinate` POINT NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`work_schedule_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`work_schedule_logs` (
  `work_schedule_log_id` INT NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `log_date` DATE NOT NULL,
  `cart_id` INT(4) NOT NULL,
  `employee_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  INDEX `fk_work_schedule_carritos1_idx` (`cart_id` ASC) VISIBLE,
  INDEX `fk_work_schedule_workers1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_work_schedule_logs_locations1_idx` (`location_id` ASC) VISIBLE,
  PRIMARY KEY (`work_schedule_log_id`),
  CONSTRAINT `fk_work_schedule_carritos1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `caso2`.`carts` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_schedule_workers1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `caso2`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_schedule_logs_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `caso2`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`commission_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`commission_logs` (
  `commission_id` INT NOT NULL,
  `commission_log_start_date` DATE NOT NULL,
  `commission_log_end_date` DATE NOT NULL,
  `commission_percentaje` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`commission_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`sales` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_date` DATETIME NOT NULL,
  `invoice_creation_date` DATETIME NOT NULL,
  `pay_type` TINYINT(3) NOT NULL COMMENT '0 = cash\n1 = card\n2 = transfer',
  `change` DECIMAL(12,2) NULL DEFAULT 0 COMMENT '0 if pay_type !0',
  `total_price` DECIMAL(12,2) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  `client _id` INT NOT NULL,
  `work_schedule_log_id` INT NOT NULL,
  `commission_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_sale_buyer1_idx` (`client _id` ASC) VISIBLE,
  INDEX `fk_sales_work_schedule_logs1_idx` (`work_schedule_log_id` ASC) VISIBLE,
  INDEX `fk_sales_commisions_logs1_idx` (`commission_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_buyer1`
    FOREIGN KEY (`client _id`)
    REFERENCES `caso2`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_work_schedule_logs1`
    FOREIGN KEY (`work_schedule_log_id`)
    REFERENCES `caso2`.`work_schedule_logs` (`work_schedule_log_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_commisions_logs1`
    FOREIGN KEY (`commission_id`)
    REFERENCES `caso2`.`commission_logs` (`commission_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`inventory_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`inventory_logs` (
  `inventory_log_id` INT NOT NULL AUTO_INCREMENT,
  `log_time` DATETIME NOT NULL,
  `movement_type` INT NOT NULL COMMENT '0 = sold out product\n1 = stocked product\n2 = removed from inventory due to expiration',
  `movement_amount` DECIMAL(7,2) NOT NULL,
  `product_amount` DECIMAL(7,2) NOT NULL,
  `item_id` INT NOT NULL,
  `work_schedule_log_id` INT NOT NULL,
  PRIMARY KEY (`inventory_log_id`),
  INDEX `fk_inventory_log_items1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_inventory_log_work_schedule_logs1_idx` (`work_schedule_log_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_log_items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `caso2`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_log_work_schedule_logs1`
    FOREIGN KEY (`work_schedule_log_id`)
    REFERENCES `caso2`.`work_schedule_logs` (`work_schedule_log_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`cash_drawer_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`cash_drawer_logs` (
  `cash_drawer_log_id` INT NOT NULL AUTO_INCREMENT,
  `current_date` DATE NOT NULL,
  `current_total_amount` DECIMAL(15,2) NOT NULL DEFAULT 0,
  `prev_total_amount` DECIMAL(15,2) NOT NULL DEFAULT 0,
  `prev_employee_id` INT NOT NULL,
  `current_employee_id` INT NOT NULL,
  `cart_id` INT(4) NOT NULL,
  INDEX `fk_cash_drawer_carts1_idx` (`cart_id` ASC) VISIBLE,
  PRIMARY KEY (`cash_drawer_log_id`),
  CONSTRAINT `fk_cash_drawer_carts1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `caso2`.`carts` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`items_x_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`items_x_products` (
  `item_x_product_id` VARCHAR(45) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  `amount` DECIMAL(7,2) NOT NULL,
  `product_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  INDEX `fk_recipes_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_recipes_items1_idx` (`item_id` ASC) VISIBLE,
  PRIMARY KEY (`item_x_product_id`),
  CONSTRAINT `fk_recipes_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `caso2`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipes_items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `caso2`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`purchase_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`purchase_orders` (
  `order_id` INT NOT NULL,
  `state` INT NOT NULL DEFAULT 0 COMMENT '0 = in site purchase\n1 = in progress\n2 = ready to take\n3 = completed\n4= canceled by employee\n5= canceled by client',
  `order_creation_date` DATE NOT NULL,
  `employee_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_purchase_orders_employees1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_purchase_orders_clients1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_orders_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `caso2`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_orders_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `caso2`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`products_x_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`products_x_sales` (
  `amount` INT NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  `sale_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  INDEX `fk_products_x_sales_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_products_x_sales_sales1_idx` (`sale_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_x_sales_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `caso2`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_x_sales_sales1`
    FOREIGN KEY (`sale_id`)
    REFERENCES `caso2`.`sales` (`sale_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`product_prices_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`product_prices_logs` (
  `product_price_log_id` INT NOT NULL AUTO_INCREMENT,
  `price_change_log_date` DATE NOT NULL,
  `prev_price` DECIMAL(12,2) NOT NULL,
  `current_price` DECIMAL(12,2) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`product_price_log_id`),
  INDEX `fk_product_prices_logs_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_prices_logs_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `caso2`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`employee_salary_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`employee_salary_logs` (
  `salary_log_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `finish_date` DATE NOT NULL,
  `salary` DECIMAL(15,2) NOT NULL DEFAULT 0,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`salary_log_id`),
  INDEX `fk_employee_salary_logs_employees1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_salary_logs_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `caso2`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`location_taxes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`location_taxes` (
  `location_tax` DECIMAL(4,2) NOT NULL DEFAULT 0,
  `location_id` INT NOT NULL,
  INDEX `fk_taxes_x_locations_locations1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_taxes_x_locations_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `caso2`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`file_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`file_types` (
  `file_type_id` INT NOT NULL,
  `file_format` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`file_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`files` (
  `file_id` INT NOT NULL AUTO_INCREMENT,
  `source` VARCHAR(300) NOT NULL,
  `deleted` BIT NOT NULL DEFAULT 0,
  `file_type_id` INT NOT NULL,
  PRIMARY KEY (`file_id`),
  INDEX `fk_files_file_types1_idx` (`file_type_id` ASC) VISIBLE,
  UNIQUE INDEX `file_id_UNIQUE` (`file_id` ASC) VISIBLE,
  CONSTRAINT `fk_files_file_types1`
    FOREIGN KEY (`file_type_id`)
    REFERENCES `caso2`.`file_types` (`file_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`files_x_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`files_x_locations` (
  `file_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  INDEX `fk_files_x_locations_files1_idx` (`file_id` ASC) VISIBLE,
  CONSTRAINT `fk_files_x_locations_files1`
    FOREIGN KEY (`file_id`)
    REFERENCES `caso2`.`files` (`file_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_x_locations_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `caso2`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caso2`.`products_x_purchase_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caso2`.`products_x_purchase_order` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_amount` INT NOT NULL,
  `deleted` VARCHAR(45) NOT NULL DEFAULT 0,
  INDEX `fk_products_x_purchase_order_purchase_orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_products_x_purchase_order_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_x_purchase_order_purchase_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `caso2`.`purchase_orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_x_purchase_order_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `caso2`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
