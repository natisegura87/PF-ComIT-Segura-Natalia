-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2017 a las 22:31:58
-- Versión del servidor: 5.7.9
-- Versión de PHP: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adelanto`
--

DROP TABLE IF EXISTS `adelanto`;
CREATE TABLE IF NOT EXISTS `adelanto` (
  `id_adelanto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `precio` float NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_adelanto`),
  KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque`
--

DROP TABLE IF EXISTS `cheque`;
CREATE TABLE IF NOT EXISTS `cheque` (
  `id_cheque` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fechaaCobrar` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originante` int(11) DEFAULT NULL,
  `destinatario` int(11) DEFAULT NULL,
  `fechaaTercero` date DEFAULT NULL,
  `aTercero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cheque`),
  KEY `originante` (`originante`),
  KEY `destinatario` (`destinatario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer`
--

DROP TABLE IF EXISTS `chofer`;
CREATE TABLE IF NOT EXISTS `chofer` (
  `id_chofer` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuit` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE IF NOT EXISTS `ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuit` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasoil`
--

DROP TABLE IF EXISTS `gasoil`;
CREATE TABLE IF NOT EXISTS `gasoil` (
  `id_gasoil` int(11) NOT NULL AUTO_INCREMENT,
  `gasoilEnEstacion` tinyint(4) NOT NULL,
  `fecha` date NOT NULL,
  `litros` float NOT NULL,
  `precioLitro` float NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id_gasoil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `km`
--

DROP TABLE IF EXISTS `km`;
CREATE TABLE IF NOT EXISTS `km` (
  `id_km` int(11) NOT NULL AUTO_INCREMENT,
  `origen` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `km` int(11) NOT NULL,
  PRIMARY KEY (`id_km`),
  KEY `origen` (`origen`),
  KEY `destino` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE IF NOT EXISTS `movimiento` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Factura','Gasto') COLLATE utf8_unicode_ci NOT NULL,
  `originante` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destinatario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoadelanto`
--

DROP TABLE IF EXISTS `tipoadelanto`;
CREATE TABLE IF NOT EXISTS `tipoadelanto` (
  `id_tipoAdelanto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aFavor` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_tipoAdelanto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

DROP TABLE IF EXISTS `viaje`;
CREATE TABLE IF NOT EXISTS `viaje` (
  `id_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `origen` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `km_extras` float NOT NULL,
  `precioKm` float NOT NULL,
  `subTotal` float NOT NULL,
  `TotalConIva` float NOT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `origen` (`origen`),
  KEY `destino` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adelanto`
--
ALTER TABLE `adelanto`
  ADD CONSTRAINT `adelanto_ibfk_1` FOREIGN KEY (`nombre`) REFERENCES `tipoadelanto` (`id_tipoAdelanto`);

--
-- Filtros para la tabla `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`originante`) REFERENCES `chofer` (`id_chofer`),
  ADD CONSTRAINT `cheque_ibfk_2` FOREIGN KEY (`originante`) REFERENCES `empresa` (`id_empresa`),
  ADD CONSTRAINT `cheque_ibfk_3` FOREIGN KEY (`destinatario`) REFERENCES `empresa` (`id_empresa`),
  ADD CONSTRAINT `cheque_ibfk_4` FOREIGN KEY (`destinatario`) REFERENCES `chofer` (`id_chofer`);

--
-- Filtros para la tabla `km`
--
ALTER TABLE `km`
  ADD CONSTRAINT `km_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `km_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_3` FOREIGN KEY (`origen`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `viaje_ibfk_4` FOREIGN KEY (`destino`) REFERENCES `ciudad` (`id_ciudad`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
