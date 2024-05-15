-- --------------------------------------------------------
-- Host:                         10.68.0.251
-- Versión del servidor:         5.7.21 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para CristianBravoCristianMundaca 2.4
CREATE DATABASE IF NOT EXISTS `CristianBravoCristianMundaca 2.4` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `CristianBravoCristianMundaca 2.4`;

-- Volcando estructura para tabla CristianBravoCristianMundaca 2.4.Cafe
CREATE TABLE IF NOT EXISTS `Cafe` (
  `cafe_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cafe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla CristianBravoCristianMundaca 2.4.Cafe: ~0 rows (aproximadamente)
INSERT INTO `Cafe` (`cafe_id`, `nombre`, `descripcion`, `precio`) VALUES
	(1, 'Café Latte', 'Café con leche caliente y leche.', 2000.00),
	(2, 'Café Americano', 'Café negro fuerte con doble de agua.', 2000.00),
	(3, 'Café Mocha', 'Café con leche y jarabe de chocolate.', 2000.00);

-- Volcando estructura para tabla CristianBravoCristianMundaca 2.4.Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visitas_frecuentes` int(11) DEFAULT NULL,
  `recomendaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla CristianBravoCristianMundaca 2.4.Cliente: ~0 rows (aproximadamente)
INSERT INTO `Cliente` (`cliente_id`, `nombre`, `visitas_frecuentes`, `recomendaciones`) VALUES
	(1, 'Cristian', 10, 'La Taza Dorada es para millonarios'),
	(2, 'Martin', 7, 'Excelente café y buen ambiente'),
	(3, 'Javier', 3, 'Recomiendo el croissant de queso');

-- Volcando estructura para tabla CristianBravoCristianMundaca 2.4.Detalle_Transaccion
CREATE TABLE IF NOT EXISTS `Detalle_Transaccion` (
  `detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaccion_id` int(11) DEFAULT NULL,
  `platillo_id` int(11) DEFAULT NULL,
  `cafe_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `transaccion_id` (`transaccion_id`),
  KEY `platillo_id` (`platillo_id`),
  KEY `cafe_id` (`cafe_id`),
  CONSTRAINT `Detalle_Transaccion_ibfk_1` FOREIGN KEY (`transaccion_id`) REFERENCES `Transaccion` (`transaccion_id`),
  CONSTRAINT `Detalle_Transaccion_ibfk_2` FOREIGN KEY (`platillo_id`) REFERENCES `Platillo` (`platillo_id`),
  CONSTRAINT `Detalle_Transaccion_ibfk_3` FOREIGN KEY (`cafe_id`) REFERENCES `Cafe` (`cafe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla CristianBravoCristianMundaca 2.4.Detalle_Transaccion: ~0 rows (aproximadamente)
INSERT INTO `Detalle_Transaccion` (`detalle_id`, `transaccion_id`, `platillo_id`, `cafe_id`, `cantidad`) VALUES
	(1, 1, 1, 1, 1),
	(2, 2, 2, NULL, 1),
	(3, 3, 3, 1, 2);

-- Volcando estructura para tabla CristianBravoCristianMundaca 2.4.Platillo
CREATE TABLE IF NOT EXISTS `Platillo` (
  `platillo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`platillo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla CristianBravoCristianMundaca 2.4.Platillo: ~0 rows (aproximadamente)
INSERT INTO `Platillo` (`platillo_id`, `nombre`, `descripcion`, `precio`) VALUES
	(1, 'Croissant de queso y jamón', 'Delicioso croissant relleno de queso y jamón.', 2500.00),
	(2, 'Pastel de chocolate', 'Rico pastel de chocolate casero.', 5000.00),
	(3, 'Ensalada de pollo', 'Ensalada con trozos de pollo.', 6500.00);

-- Volcando estructura para tabla CristianBravoCristianMundaca 2.4.Sucursal
CREATE TABLE IF NOT EXISTS `Sucursal` (
  `sucursal_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sucursal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla CristianBravoCristianMundaca 2.4.Sucursal: ~0 rows (aproximadamente)
INSERT INTO `Sucursal` (`sucursal_id`, `nombre`, `ubicacion`, `telefono`) VALUES
	(1, 'La Taza Dorada - Coffeeville', '574 Calle Principal, Coffeeville', '+56974454546'),
	(2, 'La Taza Dorada - Ovalle', '945 Vicuña Mackenna, Ovalle', '+56978767656');

-- Volcando estructura para tabla CristianBravoCristianMundaca 2.4.Transaccion
CREATE TABLE IF NOT EXISTS `Transaccion` (
  `transaccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transaccion_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `Transaccion_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla CristianBravoCristianMundaca 2.4.Transaccion: ~0 rows (aproximadamente)
INSERT INTO `Transaccion` (`transaccion_id`, `cliente_id`, `fecha`, `total`) VALUES
	(1, 1, '2024-05-15', 5000.00),
	(2, 2, '2024-05-14', 3500.00),
	(3, 1, '2024-05-13', 6790.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
