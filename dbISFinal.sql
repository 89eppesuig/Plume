DROP DATABASE if exists `is`;
CREATE DATABASE IF NOT EXISTS `is`;
USE `is`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `passwordhash` char(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gestore` boolean NOT NULL,
  `gestoreprodotti` boolean NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`username`),
  UNIQUE KEY (`email`)
);



CREATE TABLE `order`(
`id` int(11) NOT NULL auto_increment,
`iduser` int(11) NOT NULL,
`prezzo` double NOT NULL,
PRIMARY KEY (`id`),
  CONSTRAINT FOREIGN KEY (`iduser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `prezzo` double NOT NULL,
  `percorso` blob,
  `taglia` varchar(3) NOT NULL,
  `idcategory` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FOREIGN KEY (`idcategory`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FULLTEXT KEY (`name`,`description`)
);

CREATE TABLE `product_order`(
`idorder` int(11) NOT NULL,
`idproduct` int(11) NOT NULL,
`quantita` int(5) NOT NULL,
PRIMARY KEY (`idorder`,`idproduct`),
  CONSTRAINT FOREIGN KEY (`idorder`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`idproduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);





