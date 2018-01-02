-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Apteka
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Apteka
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Apteka` DEFAULT CHARACTER SET latin1 ;
USE `Apteka` ;

-- -----------------------------------------------------
-- Table `Apteka`.`Dostawa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Dostawa` (
  `idDostawa` INT(11) NOT NULL AUTO_INCREMENT,
  `Sposob` ENUM('kurier', 'paczkomat', 'pocztaPolska', 'odbiorOsobisty') NULL DEFAULT NULL,
  `Adres` VARCHAR(200) NULL DEFAULT NULL,
  `NrKontaktowy` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idDostawa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Apteka`.`Towar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Towar` (
  `idTowar` INT(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` VARCHAR(200) NULL DEFAULT NULL,
  `Cena` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idTowar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Apteka`.`Pracownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Pracownik` (
  `idPracownik` INT(11) NOT NULL AUTO_INCREMENT,
  `Dzial` ENUM('Sprzedaz', 'ObslugaKlienta', 'Marketing') NULL DEFAULT NULL,
  PRIMARY KEY (`idPracownik`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Apteka`.`Klient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Klient` (
  `idKlient` INT(11) NOT NULL AUTO_INCREMENT,
  `Adres` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idKlient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Apteka`.`Platnosc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Platnosc` (
  `idPlatnosc` INT(11) NOT NULL AUTO_INCREMENT,
  `Sposob` ENUM('PayU', 'PrzelewOnline', 'PrzelewTradycyjny') NULL DEFAULT NULL,
  `Zaksiegowano` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idPlatnosc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Apteka`.`Zamowienie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Zamowienie` (
  `idZamowienie` INT(11) NOT NULL AUTO_INCREMENT,
  `Status` ENUM('Tworzone', 'Zlozone', 'Oplacone', 'Wyslane') NULL DEFAULT NULL,
  `NrKontaktowy` VARCHAR(200) NULL DEFAULT NULL,
  `Dostawa` INT(11) NOT NULL,
  `Pracownik` INT(11) NULL DEFAULT NULL,
  `Klient` INT(11) NULL DEFAULT NULL,
  `Platnosc` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idZamowienie`),
  INDEX `Dostawa` (`Dostawa` ASC),
  INDEX `Pracownik` (`Pracownik` ASC),
  INDEX `Klient` (`Klient` ASC),
  INDEX `Platnosc` (`Platnosc` ASC),
  CONSTRAINT `Zamowienie_ibfk_1`
    FOREIGN KEY (`Dostawa`)
    REFERENCES `Apteka`.`Dostawa` (`idDostawa`),
  CONSTRAINT `Zamowienie_ibfk_2`
    FOREIGN KEY (`Pracownik`)
    REFERENCES `Apteka`.`Pracownik` (`idPracownik`),
  CONSTRAINT `Zamowienie_ibfk_3`
    FOREIGN KEY (`Klient`)
    REFERENCES `Apteka`.`Klient` (`idKlient`),
  CONSTRAINT `Zamowienie_ibfk_4`
    FOREIGN KEY (`Platnosc`)
    REFERENCES `Apteka`.`Platnosc` (`idPlatnosc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Apteka`.`Ilosc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apteka`.`Ilosc` (
  `Ilosc` VARCHAR(200) NULL DEFAULT NULL,
  `Jednostka` VARCHAR(200) NULL DEFAULT NULL,
  `idTowar` INT(11) NOT NULL,
  `idZamowienie` INT(11) NOT NULL,
  PRIMARY KEY (`idTowar`, `idZamowienie`),
  INDEX `idZamowienie` (`idZamowienie` ASC),
  CONSTRAINT `Ilosc_ibfk_1`
    FOREIGN KEY (`idTowar`)
    REFERENCES `Apteka`.`Towar` (`idTowar`),
  CONSTRAINT `Ilosc_ibfk_2`
    FOREIGN KEY (`idZamowienie`)
    REFERENCES `Apteka`.`Zamowienie` (`idZamowienie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
