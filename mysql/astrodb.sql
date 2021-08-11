-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-02-2021 a las 22:27:21
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `astrodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeta`
--

CREATE TABLE `planeta` (
  `idPlaneta` int(4) NOT NULL,
  `nombre` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planeta`
--

INSERT INTO `planeta` (`idPlaneta`, `nombre`) VALUES
(93, 'Tierra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `satelite`
--

CREATE TABLE `satelite` (
  `idSatelite` int(4) NOT NULL,
  `periodo` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `peso` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `medida` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `idPlaneta` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `satelite`
--

INSERT INTO `satelite` (`idSatelite`, `periodo`, `peso`, `medida`, `idPlaneta`) VALUES
(10, '251', '10500000', 'libras', 93);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(4) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tipoUsuario` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuario`, `password`, `tipoUsuario`) VALUES
(2, 'admin', 'admin', 'administrador'),
(4, 'edgar', 'edgar', NULL),
(5, 'jose', 'jose', NULL),
(6, 'pepe', 'pepe', NULL),
(11, 'Sara', 'Sara', NULL),
(12, 'Yolanda', 'yola', NULL),
(13, 'David', 'david', NULL),
(14, 'Paco', 'paco', NULL),
(15, 'gonzalo', 'g', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `planeta`
--
ALTER TABLE `planeta`
  ADD PRIMARY KEY (`idPlaneta`);

--
-- Indices de la tabla `satelite`
--
ALTER TABLE `satelite`
  ADD PRIMARY KEY (`idSatelite`),
  ADD KEY `idPlaneta` (`idPlaneta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `planeta`
--
ALTER TABLE `planeta`
  MODIFY `idPlaneta` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `satelite`
--
ALTER TABLE `satelite`
  MODIFY `idSatelite` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `satelite`
--
ALTER TABLE `satelite`
  ADD CONSTRAINT `satelite_ibfk_1` FOREIGN KEY (`idPlaneta`) REFERENCES `planeta` (`idPlaneta`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
