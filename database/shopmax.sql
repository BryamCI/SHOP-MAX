-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2026 a las 02:58:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shopmax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_ROL`, `NOMBRE`) VALUES
(1, 'Administrador'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `ID_TIENDA` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`ID_TIENDA`, `NOMBRE`, `DIRECCION`, `TELEFONO`) VALUES
(1, 'Piura', 'Av. Grau N° 1505', '900999900'),
(2, 'Lima', 'Av. Miraflores N° 1880', '980089908'),
(3, 'Cusco', 'Av. San Antonio N° 452', '932888888');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `ID_ROL` int(11) DEFAULT NULL,
  `ID_TIENDA` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `CONTRASENA` varchar(100) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `ID_ROL`, `ID_TIENDA`, `NOMBRE`, `EMAIL`, `CONTRASENA`, `ESTADO`) VALUES
(1, 1, 1, 'Bryam Correa', 'bryamci@gmail.com', '12345', 1),
(2, 1, 2, 'Maria', 'maria@gmail.com', '1234', 1),
(3, 1, 3, 'Carlos Zapata', 'carlosz@gmail.com', '123', 1),
(4, 2, 1, 'Pedro Lopez', 'pedrol@gmail.com', '1234', 1),
(5, 2, 2, 'Pepito Nandez', 'pepiton@gmail.com', '1234', 1),
(6, 2, 2, 'Julio Nandez', 'pepiton@gmail.com', '1234', 1),
(7, 1, 1, 'Luciana Calderón', 'lucianac@gmail.com', 'luciana', 1),
(8, 2, 2, 'Paula Perez', 'paulap@gmail.com', '1234', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`ID_TIENDA`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`),
  ADD KEY `ID_TIENDA` (`ID_TIENDA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `ID_TIENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`ID_TIENDA`) REFERENCES `tienda` (`ID_TIENDA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
