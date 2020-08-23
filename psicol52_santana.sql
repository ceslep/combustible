-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-08-2020 a las 15:18:54
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `psicol52_santana`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(2) NOT NULL,
  `identificacion` bigint(11) DEFAULT NULL,
  `nombres` varchar(35) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `direccion` text,
  `telefono` varchar(15) DEFAULT NULL,
  `placa` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `identificacion`, `nombres`, `email`, `direccion`, `telefono`, `placa`) VALUES
(1, 0, 'Cliente Final 222222222222', 'na@nada.info', '177080', '0', ''),
(2, 10013762, 'José Fernando Muñoz', 'flowestudio@hotmail.com', '177080', '3122061173', 'NUC9C'),
(3, 9695141, 'Cesar Leandro Patiño V', 'ceslep@gmail.com', '177080', '3217603442', 'YSJ94C'),
(4, 1054922532, 'Diana Marcela Villanueva', 'marcelav2016@gmail.com', '177080', '3148736345', 'KHH648'),
(5, 4346875, 'Oscar Dario Montoya', 'toti1963@hotmail.com', '177080', '3217603442', 'IRN356'),
(6, 9695243, 'John Jairo Marin R.', 'jjmr2015@gmail.com', '177080', '3207109378', '0'),
(7, 24396439, 'Luz Marina Trejos Castro', 'trejosmary@hotmail.com', '177080', '3217603443', ''),
(8, 1056123137, 'FRAIDISMID', 'ceslep@gmail.com', 'Calle 9 # 8 04', '3218552353', 'YSJ94C'),
(9, 12345678, 'Ttttyy', 'flowestudio@hotmail.com', 'Zjxjfjdkfk', '79867979', ''),
(10, 1004767230, 'FRAIDISMID', 'ceslep@gmail.com', 'Calle 9 # 8 04', '3218552353', 'NUC9C'),
(14, 10047672301, 'FRAIDISMID', 'ceslep@gmail.com', 'Calle 9 # 8 04', '3218552353', 'YSJ94C'),
(18, 100476723019, 'FRAIDISMID', 'ceslep@gmail.com', 'Calle 9 # 8 04', '3218552353', 'YSJ94C'),
(22, 22222333, 'Cvvv', 'yuvddjdd', 'Bsjdkf', '64655', ''),
(23, 111, 'Juana de Arco', 'Juan@l.com', 'Anserma c', '666666', ''),
(26, 4344592, 'Olmedo Mejia rojas ', '', '', '', ''),
(27, 75039946, 'Miguel Ivan montoya montoya ', '', '', '3217296811', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `venta` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nGalones` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `surtidor` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `credCont` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `docIdent` bigint(11) NOT NULL,
  `placa` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nombreApellido` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `kilometraje` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `venta`, `nGalones`, `surtidor`, `credCont`, `docIdent`, `placa`, `nombreApellido`, `email`, `kilometraje`, `fecha`) VALUES
(1, '45000', '5.488', '1', 'Contado', 9695243, 'KHH648', 'John Jairo Marín R', 'jjmr2015@gmail.com', 0, '2020-08-14 17:47:57'),
(2, '35000', '4.268', '1', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 8235, '2020-08-14 18:08:53'),
(4, '80000', '9.756', '1', 'Contado', 0, '0000', 'Cliente Temporal 222222222222', '222222@222222.info', 0, '2020-08-14 18:27:27'),
(5, '78000', '8.667', '4', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 12300, '2020-08-14 18:29:32'),
(6, '25000', '2.874', '2', 'Contado', 9695243, 'KHH648', 'John Jairo Marin R.', 'jjmr2015@gmail.com', 110000, '2020-08-14 18:48:12'),
(7, '205000', '25', '1', 'Contado', 24396439, 'THR321', 'Luz Marina Trejos Castro', 'trejosmary@hotmail.com', 52800, '2020-08-14 20:08:00'),
(8, '25000', '3.049', '1', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 0, '2020-08-14 21:21:06'),
(9, '56000', '6.437', '2', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-14 21:22:01'),
(10, '43500', '5', '2', 'Contado', 0, '', 'Juan muñoz', '', 0, '2020-08-14 22:16:23'),
(11, '25000', '3.049', '1', 'Contado', 0, '', '', '', 0, '2020-08-14 22:40:09'),
(12, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-14 22:45:59'),
(13, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-14 22:47:15'),
(14, '29000', '3.222', '4', 'Contado', 0, '', '', '', 0, '2020-08-14 22:49:20'),
(15, '29000', '3.222', '4', 'Contado', 0, '', '', '', 0, '2020-08-14 22:49:20'),
(16, '29000', '3.222', '4', 'Contado', 0, '', '', '', 0, '2020-08-14 22:49:20'),
(17, '29000', '3.222', '4', 'Contado', 0, '', '', '', 0, '2020-08-14 22:49:20'),
(18, '29000', '3.222', '4', 'Contado', 0, '', '', '', 0, '2020-08-14 22:49:21'),
(19, '6000', '0.732', '1', 'Contado', 0, '0000', '', '', 2222222, '2020-08-14 22:49:46'),
(20, '23000', '2.805', '1', 'Contado', 0, '0000', 'Cliente Temporal 222222222222', '222222@222222.info', 56565, '2020-08-14 22:53:14'),
(21, '30000', '3.448', '2', 'Contado', 0, 'IRB4R4', 'Cliente Temporal 222222222222', '222222@222222.info', 120000, '2020-08-14 22:54:42'),
(22, '35000', '4.023', '2', 'Contado', 4346875, '', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-14 22:57:07'),
(23, '0', '0', '', 'Contado', 0, 'JJJ', 'Cliente Final 222222222222', 'na@nada.info', 22, '2020-08-14 23:02:19'),
(24, '0', '0', '', 'Contado', 0, 'GG', 'Cliente Final 222222222222', 'na@nada.info', 555, '2020-08-14 23:04:23'),
(25, '0', '0', '', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-14 23:30:40'),
(26, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-15 01:11:25'),
(27, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-15 01:14:17'),
(28, '779', '0.095', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-15 01:45:06'),
(29, '2460000', '300', '1', 'Crédito', 9695243, 'KKHJ123', 'John Jairo Marin R.', 'jjmr2015@gmail.com', 45600, '2020-08-15 01:46:58'),
(30, '0', '0', '', 'Contado', 0, 'INT556', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-15 02:23:59'),
(31, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-15 02:25:15'),
(32, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-15 02:25:31'),
(33, '0', '0', '', 'Contado', 0, '', '', '', 0, '2020-08-15 02:25:48'),
(34, '0', '0', '', 'Crédito', 0, '', '', '', 0, '2020-08-15 02:26:46'),
(35, '25000', '3.049', '1', 'Contado', 0, '', '', '', 0, '2020-08-15 02:28:14'),
(36, '90000', '10.976', '1', 'Contado', 1054922532, 'KHH648', 'Diana Marcela Villanueva', 'marcelav2016@gmail.com', 0, '2020-08-15 04:31:32'),
(37, '44500', '4.944', '4', 'Contado', 9695243, '0', 'John Jairo Marin R.', 'jjmr2015@gmail.com', 888888, '2020-08-15 04:33:03'),
(38, '89000', '10.854', '1', 'Contado', 0, '', '', '', 0, '2020-08-15 04:33:51'),
(39, '50000', '5.747', '2', 'Contado', 0, 'IRN356', 'Cliente Final 222222222222', 'na@nada.info', 65555, '2020-08-15 04:44:32'),
(40, '60000', '7.317', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-15 09:45:34'),
(41, '35000', '4.023', '2', 'Contado', 0, 'IRB4R4', '', '', 0, '2020-08-15 12:50:57'),
(42, '35000', '3.889', '4', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-15 12:51:41'),
(43, '18000', '2', '4', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-15 12:52:54'),
(44, '10000', '1', '3', 'Contado', 0, 'TNB354', '', '', 0, '2020-08-15 12:53:42'),
(45, '20000', '2.222', '4', 'Contado', 0, '', '', '', 0, '2020-08-15 12:55:13'),
(46, '8599', '1.049', '1', 'Contado', 0, 'UUU', '', '', 0, '2020-08-15 14:42:46'),
(47, '45000', '5', '4', 'Contado', 4346875, 'TNB354', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-15 15:11:39'),
(48, '20000', '2.439', '1', 'Contado', 0, 'DCI200', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-15 16:12:31'),
(49, '30000', '3.448', '2', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-15 16:14:32'),
(50, '8488', '1.035', '1', 'Contado', 0, '', '', '', 0, '2020-08-16 01:09:50'),
(51, '50000', '5.747', '2', 'Contado', 0, '54545', 'Cliente Final 222222222222', 'na@nada.info', 454545, '2020-08-16 01:13:45'),
(52, '56488', '6.493', '2', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 777777, '2020-08-16 01:21:12'),
(53, '125466', '15.301', '1', 'Contado', 0, 'YSJ94C', 'Cliente Final 222222222222', 'na@nada.info', 23423, '2020-08-16 01:29:21'),
(54, '3600', '0.414', '2', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 01:30:37'),
(55, '124578', '14.319', '2', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 01:32:46'),
(56, '87944', '10.109', '2', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 0, '2020-08-16 01:34:03'),
(57, '12547', '1.255', '3', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 01:34:25'),
(58, '45987', '5.286', '2', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 01:35:44'),
(59, '65987', '7.585', '2', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 0, '2020-08-16 01:36:40'),
(60, '6587', '0.803', '1', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 0, '2020-08-16 01:41:35'),
(61, '125487', '15.303', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 01:51:05'),
(62, '5487', '0.669', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 01:56:52'),
(63, '4587', '0.527', '2', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 01:59:26'),
(64, '5487', '0.669', '1', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 02:00:05'),
(65, '65877', '8.034', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 02:19:33'),
(66, '15466', '1.886', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 02:22:57'),
(67, '555626', '67.759', '1', 'Crédito', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 8487, '2020-08-16 02:23:56'),
(68, '58000', '6.667', '2', 'Contado', 0, 'YSJ94C', 'Cliente Final 222222222222', 'na@nada.info', 328888, '2020-08-16 03:48:08'),
(69, '25880', '3.156', '1', 'Contado', 0, 'IRN356', 'Cliente Final 222222222222', 'na@nada.info', 538888, '2020-08-16 04:13:58'),
(70, '558', '0.056', '3', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 12:14:54'),
(71, '50000', '5.556', '4', 'Contado', 1054922532, 'KHH648', 'Diana Marcela Villanueva', 'marcelav2016@gmail.com', 35000, '2020-08-16 12:19:53'),
(72, '50000', '5.556', '4', 'Contado', 1054922532, 'KHH648', 'Diana Marcela Villanueva', 'marcelav2016@gmail.com', 35000, '2020-08-16 12:20:11'),
(73, '50000', '5.556', '4', 'Contado', 1054922532, 'KHH648', 'Diana Marcela Villanueva', 'marcelav2016@gmail.com', 35000, '2020-08-16 12:20:12'),
(74, '50000', '6.098', '1', 'Contado', 111, 'IRN356', 'Juana de Arco', 'Juan@l.com', 6666, '2020-08-16 12:26:19'),
(75, '50000', '6.098', '1', 'Contado', 111, 'IRN356', 'Juana de Arco', 'Juan@l.com', 6666, '2020-08-16 12:26:22'),
(76, '25008', '2.874', '2', 'Contado', 111, '', 'Juana de Arco', 'Juan@l.com', 0, '2020-08-16 12:47:10'),
(77, '35000', '4.268', '1', 'Contado', 0, '', '', '', 0, '2020-08-16 13:27:41'),
(78, '35000', '4.268', '1', 'Contado', 0, '', '', '', 0, '2020-08-16 13:27:42'),
(79, '35000', '4.268', '1', 'Contado', 0, '', '', '', 0, '2020-08-16 13:27:43'),
(80, '35000', '4.268', '1', 'Contado', 0, '', '', '', 0, '2020-08-16 13:27:43'),
(81, '35000', '4.268', '1', 'Contado', 0, '', '', '', 0, '2020-08-16 13:27:43'),
(82, '56555', '6.897', '1', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 21:17:16'),
(83, '215487', '26.279', '1', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-16 21:19:16'),
(84, '28888', '3.320', '2', 'Contado', 24396439, 'THR321', 'Luz Marina Trejos Castro', 'trejosmary@hotmail.com', 5649449, '2020-08-16 21:19:24'),
(85, '65000', '7.927', '1', 'Contado', 1054922532, 'KHH648', 'Diana Marcela Villanueva', 'marcelav2016@gmail.com', 0, '2020-08-16 21:23:45'),
(86, '87450', '9.717', '4', 'Contado', 100476723019, 'YSJ94C', 'FRAIDISMID', 'ceslep@gmail.com', 0, '2020-08-16 21:40:48'),
(87, '90000', '10.345', '2', 'Contado', 0, 'ARR969', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-16 21:41:51'),
(88, '50000', '5.747', '2', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-16 21:42:12'),
(89, '4444', '0.511', '2', 'Contado', 24396439, '', 'Luz Marina Trejos Castro', 'trejosmary@hotmail.com', 0, '2020-08-16 21:49:07'),
(90, '333333', '37.037', '4', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 333333, '2020-08-16 21:53:29'),
(91, '125000', '14.368', '2', 'Contado', 111, '', 'Juana de Arco', 'Juan@l.com', 0, '2020-08-16 21:53:29'),
(92, '55555', '6.775', '1', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-16 21:54:22'),
(125487, '145000', '16.667', '2', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 0, '2020-08-16 22:43:35'),
(125488, '60000', '6.897', '2', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-17 00:37:28'),
(125489, '25000', '2.874', '2', 'Contado', 4344592, 'TNB354', 'Olmedo Mejia rojas ', '', 0, '2020-08-17 03:24:22'),
(125490, '35500', '4.080', '2', 'Contado', 0, '', '', '', 0, '2020-08-17 03:28:12'),
(125491, '15654', '1.909', '1', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-17 04:54:57'),
(125492, '12533', '1.441', '2', 'Contado', 9695141, 'YSJ94C', 'Cesar Leandro Patiño V', 'ceslep@gmail.com', 0, '2020-08-17 11:37:24'),
(125493, '3500000', '426.829', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-17 11:46:09'),
(125494, '82000', '9.425', '2', 'Contado', 4346875, 'IRN356', 'Oscar Dario Montoya', 'toti1963@hotmail.com', 0, '2020-08-17 11:47:01'),
(125495, '90000', '10.976', '1', 'Contado', 4344592, '', 'Olmedo Mejia rojas ', '', 0, '2020-08-17 12:41:12'),
(125496, '280000', '28', '3', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-17 12:43:15'),
(125497, '15478', '1.888', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-17 14:34:49'),
(125498, '200000', '20', '3', 'Contado', 4344592, 'TNB354', 'Olmedo Mejia rojas ', '', 0, '2020-08-17 14:37:54'),
(125499, '2565455', '312.860', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-17 16:16:48'),
(125500, '25478', '2.831', '4', 'Contado', 10013762, 'NUC9C', 'José Fernando Muñoz', 'flowestudio@hotmail.com', 0, '2020-08-17 16:19:20'),
(125501, '222685', '27.157', '1', 'Contado', 0, '', 'Cliente Final 222222222222', 'na@nada.info', 0, '2020-08-17 16:46:52'),
(125502, '30000', '3.333', '4', 'Contado', 75039946, 'KDW046', 'Miguel Ivan montoya montoya ', '', 0, '2020-08-17 18:32:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios_combustibles`
--

CREATE TABLE `precios_combustibles` (
  `ind` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `valor` double NOT NULL,
  `combustible` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `classBg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `classFg` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `precios_combustibles`
--

INSERT INTO `precios_combustibles` (`ind`, `tipo`, `valor`, `combustible`, `classBg`, `classFg`) VALUES
(1, 1, 8200, 'ACPM 1', 'bg-black', 'fg-white'),
(2, 2, 8700, 'GASOLINA 2', 'bg-yellow', 'fg-black'),
(3, 3, 10000, 'ACPM 3', 'bg-black', 'fg-white'),
(4, 4, 9000, 'GASOLINA 4', 'bg-yellow', 'fg-black');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docIdent` (`docIdent`);

--
-- Indices de la tabla `precios_combustibles`
--
ALTER TABLE `precios_combustibles`
  ADD PRIMARY KEY (`ind`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125503;

--
-- AUTO_INCREMENT de la tabla `precios_combustibles`
--
ALTER TABLE `precios_combustibles`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
