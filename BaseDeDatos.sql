-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.29 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla herramienta_alquiler.alquiler
CREATE TABLE IF NOT EXISTS `alquiler` (
  `id` int NOT NULL,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`,`username`,`fecha`) USING BTREE,
  KEY `FK_usuario` (`username`) USING BTREE,
  CONSTRAINT `FK_herramienta` FOREIGN KEY (`id`) REFERENCES `herramienta` (`id`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla herramienta_alquiler.alquiler: ~29 rows (aproximadamente)
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` (`id`, `username`, `fecha`) VALUES
	(1, 'juancho', '2022-10-03 19:33:05'),
	(1, 'juancho', '2022-10-03 19:33:09'),
	(1, 'juancho', '2022-10-04 16:09:55'),
	(1, 'juancho', '2022-10-04 19:28:30'),
	(1, 'juancho', '2022-10-04 19:28:34'),
	(1, 'juancho', '2022-10-04 19:32:20'),
	(1, 'juancho', '2022-10-04 19:32:21'),
	(1, 'juancho', '2022-10-04 21:10:47'),
	(1, 'juancho', '2022-10-04 21:14:59'),
	(1, 'juancho', '2022-10-04 21:15:04'),
	(1, 'juancho', '2022-10-05 16:23:09'),
	(1, 'juancho', '2022-10-05 16:24:03'),
	(1, 'juancho', '2022-10-05 16:48:05'),
	(1, 'juancho', '2022-10-05 16:57:01'),
	(1, 'juancho', '2022-10-05 18:49:34'),
	(2, 'juancho', '2022-10-04 19:39:07'),
	(2, 'juancho', '2022-10-04 20:04:44'),
	(2, 'juancho', '2022-10-04 20:16:33'),
	(2, 'juancho', '2022-10-04 20:20:43'),
	(2, 'juancho', '2022-10-04 20:21:27'),
	(2, 'juancho', '2022-10-04 20:22:11'),
	(2, 'juancho', '2022-10-05 16:08:37'),
	(2, 'juancho', '2022-10-05 16:08:39'),
	(2, 'juancho', '2022-10-05 16:40:25'),
	(2, 'juancho', '2022-10-05 16:41:46'),
	(2, 'juancho', '2022-10-05 16:54:44'),
	(2, 'juancho', '2022-10-05 17:00:23'),
	(2, 'juancho', '2022-10-05 17:11:57'),
	(1, 'Tomas', '2022-10-04 20:04:12'),
	(2, 'Tomas', '2022-10-04 20:04:15');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;

-- Volcando estructura para tabla herramienta_alquiler.herramienta
CREATE TABLE IF NOT EXISTS `herramienta` (
  `id` int NOT NULL,
  `producto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` float(22,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla herramienta_alquiler.herramienta: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `herramienta` DISABLE KEYS */;
INSERT INTO `herramienta` (`id`, `producto`, `descripcion`, `precio`, `cantidad`) VALUES
	(1, 'Taladro percutor', 'Trupper 650W, 120v', 15000.00, 4),
	(2, 'taladro inalambrico', 'DeWalt 340 W, 20V', 30000.00, 4),
	(3, 'Lijadora orbital', 'Truper 200W 120v', 16000.00, 20),
	(4, 'Soldadora inverter', 'Furius 180A, 110V/220V', 50000.00, 12),
	(5, 'Lijadora de banda y disco', 'Truper 370 W, 120V', 50000.00, 10),
	(6, 'Mototool', 'EQUIDEPIN 340 W, 120V', 20000.00, 25),
	(7, 'Pulidora', 'Makita 540 W, 12000 Rpm', 10000.00, 19),
	(8, 'Polichadora', 'Makita 1200 W, 120V', 20000.00, 18),
	(9, 'Sierra circular', 'Galax pro 5500 Rpm, 120V', 30000.00, 18),
	(10, 'Caladora', 'Protool 1180 W, 120V', 20000.00, 18),
	(11, 'Compresor de aire', 'Pretul 1100 W, 116 psi, 120V', 40000.00, 15);
/*!40000 ALTER TABLE `herramienta` ENABLE KEYS */;

-- Volcando estructura para tabla herramienta_alquiler.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contrasena` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `saldo` double(22,2) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla herramienta_alquiler.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`username`, `contrasena`, `nombre`, `apellidos`, `email`, `saldo`, `telefono`, `direccion`) VALUES
	('juancho', '123456', 'Juan', 'Lopez Gomez', 'juanc@gamil.com', 100001.00, '12345678', 'cartagena'),
	('laura', '123456', 'Laura', 'Castro', 'laca@gmail.com', 150000.00, '12345678', 'palomino'),
	('marv_f', '123456', 'Marvin', 'Fuentes', 'marvinfuentes@gmail.com', 1250000.00, '3005548796', 'valledupar'),
	('Tomas', '1234', 'Tomas', 'Montes', 'tom@gmail.com', 300.00, '30000000', 'palomino');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
