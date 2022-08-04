-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema simpreserv
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `simpreserv` ;

-- -----------------------------------------------------
-- Schema simpreserv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `simpreserv` DEFAULT CHARACTER SET utf8 ;
USE `simpreserv` ;

-- -----------------------------------------------------
-- Table `simpreserv`.`CLIENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`CLIENTS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`CLIENTS` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `doc_number` VARCHAR(10) NULL,
  `email` VARCHAR(25) NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`POSITIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`POSITIONS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`POSITIONS` (
  `position_id` INT NOT NULL AUTO_INCREMENT,
  `position_name` VARCHAR(45) NULL,
  `position_salary` DECIMAL NULL,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`SHIFTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`SHIFTS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`SHIFTS` (
  `shift_id` INT NOT NULL AUTO_INCREMENT,
  `shift_name` VARCHAR(20) NULL,
  `hour_start` TIME NULL,
  `hour_end` TIME NULL,
  PRIMARY KEY (`shift_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`EMPLOYEES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`EMPLOYEES` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`EMPLOYEES` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `carnet` VARCHAR(25) NULL,
  `enabled` TINYINT NULL,
  `POSITIONS_position_id` INT NOT NULL,
  `SHIFTS_shift_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_EMPLOYEES_POSITIONS1_idx` (`POSITIONS_position_id` ASC) VISIBLE,
  INDEX `fk_EMPLOYEES_SHIFTS1_idx` (`SHIFTS_shift_id` ASC) VISIBLE,
  UNIQUE INDEX `carnet_UNIQUE` (`carnet` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEES_POSITIONS1`
    FOREIGN KEY (`POSITIONS_position_id`)
    REFERENCES `simpreserv`.`POSITIONS` (`position_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEES_SHIFTS1`
    FOREIGN KEY (`SHIFTS_shift_id`)
    REFERENCES `simpreserv`.`SHIFTS` (`shift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`ROOMS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`ROOMS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`ROOMS` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NULL,
  `floor` INT NULL,
  `description` VARCHAR(45) NULL,
  `room_price` DECIMAL NULL,
  `type` VARCHAR(45) NULL,
  `available` TINYINT NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`RESERVATION_STATUS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`RESERVATION_STATUS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`RESERVATION_STATUS` (
  `reservation_status_id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(25) NULL,
  PRIMARY KEY (`reservation_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`RESERVATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`RESERVATIONS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`RESERVATIONS` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `reservation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `checkin_date` DATE NULL,
  `checkout_date` DATE NULL,
  `reservation_balance` DECIMAL NULL,
  `EMPLOYEE_employee_id` INT NOT NULL,
  `CLIENT_client_id` INT NOT NULL,
  `ROOM_room_id` INT NOT NULL,
  `RESERVATION_STATUS_reservation_status_id` INT NOT NULL,
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_RESERVATION_EMPLOYEE1_idx` (`EMPLOYEE_employee_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_CLIENT1_idx` (`CLIENT_client_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_ROOM1_idx` (`ROOM_room_id` ASC) VISIBLE,
  INDEX `fk_RESERVATIONS_RESERVATION_STATUS1_idx` (`RESERVATION_STATUS_reservation_status_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVATION_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_employee_id`)
    REFERENCES `simpreserv`.`EMPLOYEES` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVATION_CLIENT1`
    FOREIGN KEY (`CLIENT_client_id`)
    REFERENCES `simpreserv`.`CLIENTS` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVATION_ROOM1`
    FOREIGN KEY (`ROOM_room_id`)
    REFERENCES `simpreserv`.`ROOMS` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVATIONS_RESERVATION_STATUS1`
    FOREIGN KEY (`RESERVATION_STATUS_reservation_status_id`)
    REFERENCES `simpreserv`.`RESERVATION_STATUS` (`reservation_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`PAYMENT_TYPES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`PAYMENT_TYPES` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`PAYMENT_TYPES` (
  `payment_type_id` INT NOT NULL AUTO_INCREMENT,
  `payment_name` VARCHAR(20) NULL,
  PRIMARY KEY (`payment_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`PAYMENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`PAYMENTS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`PAYMENTS` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_number` VARCHAR(45) NULL,
  `amount` DECIMAL NULL,
  `PAYMENT_TYPE_payment_type_id` INT NOT NULL,
  `RESERVATIONS_reservation_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_PAYMENT_PAYMENT_TYPE1_idx` (`PAYMENT_TYPE_payment_type_id` ASC) VISIBLE,
  INDEX `fk_PAYMENTS_RESERVATIONS1_idx` (`RESERVATIONS_reservation_id` ASC) VISIBLE,
  CONSTRAINT `fk_PAYMENT_PAYMENT_TYPE1`
    FOREIGN KEY (`PAYMENT_TYPE_payment_type_id`)
    REFERENCES `simpreserv`.`PAYMENT_TYPES` (`payment_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PAYMENTS_RESERVATIONS1`
    FOREIGN KEY (`RESERVATIONS_reservation_id`)
    REFERENCES `simpreserv`.`RESERVATIONS` (`reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`USER_TYPES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`USER_TYPES` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`USER_TYPES` (
  `user_type_id` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(20) NULL,
  PRIMARY KEY (`user_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`USERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`USERS` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`USERS` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `email` VARCHAR(30) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `enabled` TINYINT NULL,
  `EMPLOYEES_employee_id` INT NOT NULL,
  `USER_TYPES_user_type_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_USERS_EMPLOYEES1_idx` (`EMPLOYEES_employee_id` ASC) VISIBLE,
  INDEX `fk_USERS_USER_TYPES1_idx` (`USER_TYPES_user_type_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_USERS_EMPLOYEES1`
    FOREIGN KEY (`EMPLOYEES_employee_id`)
    REFERENCES `simpreserv`.`EMPLOYEES` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USERS_USER_TYPES1`
    FOREIGN KEY (`USER_TYPES_user_type_id`)
    REFERENCES `simpreserv`.`USER_TYPES` (`user_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`CASH`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`CASH` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`CASH` (
  `cash_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cash_taken` DECIMAL NULL,
  `cash_given` DECIMAL NULL,
  `PAYMENTS_payment_id` INT NOT NULL,
  PRIMARY KEY (`cash_id`),
  INDEX `fk_table1_PAYMENTS1_idx` (`PAYMENTS_payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_table1_PAYMENTS1`
    FOREIGN KEY (`PAYMENTS_payment_id`)
    REFERENCES `simpreserv`.`PAYMENTS` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`CREDITCARD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`CREDITCARD` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`CREDITCARD` (
  `creditcard_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creditcard_number` VARCHAR(4) NULL,
  `creditcard_exp_month` VARCHAR(2) NULL,
  `creditcard_exp_year` VARCHAR(2) NULL,
  `creditcard_authorization` VARCHAR(20) NULL,
  `PAYMENTS_payment_id` INT NOT NULL,
  PRIMARY KEY (`creditcard_id`),
  INDEX `fk_CREDITCARD_PAYMENTS1_idx` (`PAYMENTS_payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_CREDITCARD_PAYMENTS1`
    FOREIGN KEY (`PAYMENTS_payment_id`)
    REFERENCES `simpreserv`.`PAYMENTS` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `simpreserv`.`CHECK`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpreserv`.`CHECK` ;

CREATE TABLE IF NOT EXISTS `simpreserv`.`CHECK` (
  `check_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_number` VARCHAR(30) NULL,
  `check_reference` VARCHAR(25) NULL,
  `PAYMENTS_payment_id` INT NOT NULL,
  PRIMARY KEY (`check_id`),
  INDEX `fk_CHECK_PAYMENTS1_idx` (`PAYMENTS_payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_CHECK_PAYMENTS1`
    FOREIGN KEY (`PAYMENTS_payment_id`)
    REFERENCES `simpreserv`.`PAYMENTS` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin' IDENTIFIED BY '%K0d1g0#';

GRANT ALL ON `simpreserv`.* TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `simpreserv`.`POSITIONS`
-- -----------------------------------------------------
START TRANSACTION;
USE `simpreserv`;
INSERT INTO `simpreserv`.`POSITIONS` (`position_id`, `position_name`, `position_salary`) VALUES (1, 'System default', 999999);

COMMIT;


-- -----------------------------------------------------
-- Data for table `simpreserv`.`SHIFTS`
-- -----------------------------------------------------
START TRANSACTION;
USE `simpreserv`;
INSERT INTO `simpreserv`.`SHIFTS` (`shift_id`, `shift_name`, `hour_start`, `hour_end`) VALUES (1, 'System default', '00:00', '23:59');
INSERT INTO `simpreserv`.`SHIFTS` (`shift_id`, `shift_name`, `hour_start`, `hour_end`) VALUES (2, 'Day shift', '08:00', '15:59');
INSERT INTO `simpreserv`.`SHIFTS` (`shift_id`, `shift_name`, `hour_start`, `hour_end`) VALUES (3, 'Night shift', '16:00', '23:59');
INSERT INTO `simpreserv`.`SHIFTS` (`shift_id`, `shift_name`, `hour_start`, `hour_end`) VALUES (4, 'Intermediate shift', '00:00', '07:59');

COMMIT;


-- -----------------------------------------------------
-- Data for table `simpreserv`.`EMPLOYEES`
-- -----------------------------------------------------
START TRANSACTION;
USE `simpreserv`;
INSERT INTO `simpreserv`.`EMPLOYEES` (`employee_id`, `create_time`, `update_time`, `first_name`, `last_name`, `carnet`, `enabled`, `POSITIONS_position_id`, `SHIFTS_shift_id`) VALUES (1, '2022-08-01 00:00:00', NULL, 'System', 'Administrator', '999999-9', true, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `simpreserv`.`PAYMENT_TYPES`
-- -----------------------------------------------------
START TRANSACTION;
USE `simpreserv`;
INSERT INTO `simpreserv`.`PAYMENT_TYPES` (`payment_type_id`, `payment_name`) VALUES (1, 'Cash');
INSERT INTO `simpreserv`.`PAYMENT_TYPES` (`payment_type_id`, `payment_name`) VALUES (2, 'CreditCard');
INSERT INTO `simpreserv`.`PAYMENT_TYPES` (`payment_type_id`, `payment_name`) VALUES (3, 'Check');

COMMIT;


-- -----------------------------------------------------
-- Data for table `simpreserv`.`USER_TYPES`
-- -----------------------------------------------------
START TRANSACTION;
USE `simpreserv`;
INSERT INTO `simpreserv`.`USER_TYPES` (`user_type_id`, `type_name`) VALUES (1, 'Administrator');

COMMIT;


-- -----------------------------------------------------
-- Data for table `simpreserv`.`USERS`
-- -----------------------------------------------------
START TRANSACTION;
USE `simpreserv`;
INSERT INTO `simpreserv`.`USERS` (`user_id`, `create_time`, `update_time`, `email`, `password`, `enabled`, `EMPLOYEES_employee_id`, `USER_TYPES_user_type_id`) VALUES (1, '2022-08-01 00:00:00', NULL, 'sysadmin@simpreserv.com', '$2a$10$VvwmMQlTlaa9Pg9wpgCB8.ys3a.QnXyYfyYJ68DcgDz6UcHztcXRW', true, 1, 1);

COMMIT;

