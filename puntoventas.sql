-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.18 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------


CREATE DATABASE IF NOT EXISTS `puntoventas`;
USE `puntoventas`;


CREATE TABLE IF NOT EXISTS `datosproduct` (
  `tipoProduct` varchar(50) DEFAULT NULL,
  `IDtipoProduct` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `folioproduct` varchar(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `nombreProveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDtipoProduct`)
);

INSERT INTO `datosproduct` (`tipoProduct`, `IDtipoProduct`, `nombre`, `folioproduct`, `precio`, `nombreProveedor`) VALUES
	('Cuaderno', 1, 'Scribe', '1234565', 12, 'Scribe'),
	('Papeleria', 2, 'Borrador', '123456', 2.9, 'Pelikan'),
	('Lapicero', 19, 'Pluma bic', '123497', 8, 'Norma');


CREATE TABLE IF NOT EXISTS `flujocaja` (
  `folio` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `montoEntrada` float DEFAULT NULL,
  `montoApagar` float DEFAULT NULL,
  `cambioAdar` float DEFAULT NULL
);


CREATE TABLE IF NOT EXISTS `listaproveedores` (
  `IDtipoProduct` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(50) DEFAULT NULL,
  `nombreProduct` varchar(50) DEFAULT NULL,
  `folioProduct` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDtipoProduct`)
);

INSERT INTO `listaproveedores` (`IDtipoProduct`, `nombreProveedor`, `nombreProduct`, `folioProduct`) VALUES
	(1, 'Norm', 'Lapicero rojo', '7373379'),
	(2, 'BIC', 'Lapiceros', '645345');


CREATE TABLE IF NOT EXISTS `listausuarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(50) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `contrasena2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

INSERT INTO `listausuarios` (`ID`, `tipoUsuario`, `apellidoPaterno`, `nombre`, `Correo`, `contrasena`, `contrasena2`) VALUES
	(3, NULL, 'Alan Ernesto', 'Chanona', 'alan@htomail.com', 'jajak', '1111'),
	(4, NULL, 'Isaac', 'Bezares', 'isaac@hotmail.com', '1111', '1111'),
	(5, NULL, 'Ana', 'Navarro', 'ana@htomail.com', 'ananana', 'nananaa'),
	(6, NULL, 'f', 's', 'e', 'r', 'r');
  
CREATE TABLE IF NOT EXISTS `login` (
  `NombreUsuario` varchar(50) DEFAULT NULL,
  `Contrasenia` varchar(50) DEFAULT NULL,
  `tipoUsuario` varchar(50) DEFAULT NULL
);

INSERT INTO `login` (`NombreUsuario`, `Contrasenia`, `tipoUsuario`) VALUES
	('Diana', 'cacacaca', NULL);
  
CREATE TABLE IF NOT EXISTS `reportedeventas` (
  `fecha` date DEFAULT NULL,
  `folioReporte` varchar(50) DEFAULT NULL,
  `cantidadArticulos` int(11) DEFAULT NULL,
  `folioProduct` varchar(50) DEFAULT NULL,
  `descripcionProduct` varchar(50) DEFAULT NULL,
  `precioC/U` float DEFAULT NULL,
  `importetotal` float DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `ticket` (
  `fecha` date DEFAULT NULL,
  `folioticket` varchar(50) DEFAULT NULL,
  `cantidadproduct` int(11) DEFAULT NULL,
  `descripcionproduct` varchar(50) DEFAULT NULL,
  `precioC/U` float DEFAULT NULL,
  `importe` float DEFAULT NULL,
  `totarticulos` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `totalIVA` float DEFAULT NULL,
  `totalApagar` float DEFAULT NULL
);