-- bookrentalshop.division definition

CREATE TABLE `division` (
  `div_code` char(4) NOT NULL,
  `div_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`div_code`)
);


-- bookrentalshop.members definition

CREATE TABLE `members` (
  `member_idx` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(45) NOT NULL,
  `levels` char(1) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_idx`)
);


-- bookrentalshop.books definition

CREATE TABLE `books` (
  `book_idx` int NOT NULL AUTO_INCREMENT,
  `author` varchar(45) DEFAULT NULL,
  `div_code` char(4) NOT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `release_dt` date DEFAULT NULL,
  `isbn` varchar(200) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`book_idx`),
  KEY `fk_books_division_idx` (`div_code`),
  CONSTRAINT `fk_books_division` FOREIGN KEY (`div_code`) REFERENCES `division` (`div_code`)
);


-- bookrentalshop.rentals definition

CREATE TABLE `rentals` (
  `rental_idx` int NOT NULL AUTO_INCREMENT,
  `member_idx` int NOT NULL,
  `book_idx` int NOT NULL,
  `rentalDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  PRIMARY KEY (`rental_idx`),
  KEY `fk_rentals_members1_idx` (`member_idx`),
  KEY `fk_rentals_books1_idx` (`book_idx`),
  CONSTRAINT `fk_rentals_books1` FOREIGN KEY (`book_idx`) REFERENCES `books` (`book_idx`),
  CONSTRAINT `fk_rentals_members1` FOREIGN KEY (`member_idx`) REFERENCES `members` (`member_idx`)
);