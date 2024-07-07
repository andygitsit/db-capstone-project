-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`CustomerDetails` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `Phone` INT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNo` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `FK_CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `FK_CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`CustomerDetails` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OderDeliverySatsus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OderDeliverySatsus` (
  `StatusID` INT NOT NULL,
  `DeliverDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `BookingID` INT NOT NULL,
  PRIMARY KEY (`StatusID`),
  INDEX `FK_BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `FK_BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`StaffInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffInformation` (
  `StaffID` INT NOT NULL,
  `FullName` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL(19,4) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OderDate` DATE NOT NULL,
  `TotalCost` DECIMAL(19,4) NOT NULL,
  `CustomerID` INT NOT NULL,
  `StatusID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `FK_CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `FK_StatusID_idx` (`StatusID` ASC) VISIBLE,
  INDEX `FK_StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `FK_CustomertoOrdersID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`CustomerDetails` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_StatusID`
    FOREIGN KEY (`StatusID`)
    REFERENCES `LittleLemonDB`.`OderDeliverySatsus` (`StatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`StaffInformation` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `ItemID` INT NOT NULL,
  `ItemType` VARCHAR(100) NOT NULL,
  `ItemDesc` VARCHAR(255) NOT NULL,
  `ItemPrice` DECIMAL(19,5) NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDetials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDetials` (
  `OrderID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderID`, `ItemID`),
  INDEX `FK_ItemID_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `FK_ItemID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDB`.`Menu` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
