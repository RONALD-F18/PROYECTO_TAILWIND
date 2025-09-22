-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2025 a las 08:39:17
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
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `Cod_Act` int(12) NOT NULL,
  `Nomb_Act` varchar(40) DEFAULT NULL,
  `Fecha_Ini` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Fecha_Act` date DEFAULT NULL,
  `Descripción` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliacion`
--

CREATE TABLE `afiliacion` (
  `Cod_Afi` int(12) NOT NULL,
  `Fech_Solici` date DEFAULT NULL,
  `Cod_EPS` int(12) DEFAULT NULL,
  `Nit_Emp` int(12) DEFAULT NULL,
  `Doc_Soporte` varchar(200) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Doc_Ident` int(12) DEFAULT NULL,
  `Tip_Afil` varchar(20) DEFAULT NULL,
  `Regimen` varchar(20) DEFAULT NULL,
  `Descripción` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `Cod_Banc` int(12) NOT NULL,
  `Nomb_Banc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `Cod_Cargo` int(12) NOT NULL,
  `Nomb_Cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificacion`
--

CREATE TABLE `certificacion` (
  `Cod_Cert` int(12) NOT NULL,
  `Descripción` varchar(150) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Tip_Cert` varchar(20) DEFAULT NULL,
  `Fech_Emi` date DEFAULT NULL,
  `Doc_Iden` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicacion_disciplinaria`
--

CREATE TABLE `comunicacion_disciplinaria` (
  `Cod_Not` int(12) NOT NULL,
  `Fech_Emi` date DEFAULT NULL,
  `Asunto` varchar(35) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT NULL,
  `Fech_Ini` date DEFAULT NULL,
  `Fech_Fin` date DEFAULT NULL,
  `Doc_Iden` int(12) DEFAULT NULL,
  `Tip_Comun` varchar(20) DEFAULT NULL,
  `Descripción` text DEFAULT NULL,
  `Nomb_Res` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `Cod_Contrato` int(12) NOT NULL,
  `Descripción` text DEFAULT NULL,
  `Doc_Iden` int(12) DEFAULT NULL,
  `Fecha_Ing` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Firmas` varchar(200) DEFAULT NULL,
  `Tip_Contrato` varchar(20) DEFAULT NULL,
  `Horar_Trab` varchar(30) DEFAULT NULL,
  `Mod_Trab` varchar(20) DEFAULT NULL,
  `Salario` float DEFAULT NULL,
  `Aux_Trans` float DEFAULT NULL,
  `Form_Pago` varchar(20) DEFAULT NULL,
  `Nit_Emp` int(12) DEFAULT NULL,
  `Jorn_Lab` varchar(20) DEFAULT NULL,
  `Tip_Salar` varchar(20) DEFAULT NULL,
  `Cod_Carg` int(12) DEFAULT NULL,
  `Doc_Soporte` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Doc_Ident` int(12) NOT NULL,
  `Dirección` varchar(50) DEFAULT NULL,
  `Num_Cuen` int(20) DEFAULT NULL,
  `Cod_EPS` int(12) DEFAULT NULL,
  `Fond_Pens` varchar(30) DEFAULT NULL,
  `Cod_Ban` int(12) DEFAULT NULL,
  `Est_Emp` varchar(20) DEFAULT NULL,
  `Discapacidad` varchar(30) DEFAULT NULL,
  `Doc_Anteced` varchar(200) DEFAULT NULL,
  `Nacionalidad` varchar(25) DEFAULT NULL,
  `Estado_Civ` varchar(15) DEFAULT NULL,
  `Grupo_San` varchar(4) DEFAULT NULL,
  `Profesion` varchar(30) DEFAULT NULL,
  `RH` varchar(4) DEFAULT NULL,
  `Tip_Cuen` varchar(15) DEFAULT NULL,
  `Fec_Exp_Doc` date DEFAULT NULL,
  `Descripción` varchar(200) DEFAULT NULL,
  `Fond_Cesa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Nit_Emp` int(12) NOT NULL,
  `Num_Tel` varchar(15) DEFAULT NULL,
  `Dirección` varchar(50) DEFAULT NULL,
  `Raz_Soc` varchar(50) DEFAULT NULL,
  `Tip_Emp` varchar(30) DEFAULT NULL,
  `Misión` varchar(150) DEFAULT NULL,
  `Nomb_Repr` varchar(50) DEFAULT NULL,
  `Act_Eco` varchar(40) DEFAULT NULL,
  `Visión` varchar(50) DEFAULT NULL,
  `Reg_Trib` varchar(50) DEFAULT NULL,
  `Fech_Cre` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `Cod_EPS` int(12) NOT NULL,
  `Nomb_EPS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inasistencia`
--

CREATE TABLE `inasistencia` (
  `Cod_Inasis` int(12) NOT NULL,
  `Fech_Fin` date DEFAULT NULL,
  `Motivo` varchar(50) DEFAULT NULL,
  `Tip_Inasi` varchar(20) DEFAULT NULL,
  `Fech_Ini` date DEFAULT NULL,
  `Fech_Regis` date DEFAULT NULL,
  `Doc_Iden` int(12) DEFAULT NULL,
  `Descripción` varchar(150) DEFAULT NULL,
  `Doc_Soporte` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidad`
--

CREATE TABLE `incapacidad` (
  `Cod_Inc` int(12) NOT NULL,
  `Nit_Emp` int(12) DEFAULT NULL,
  `Descripción` varchar(200) DEFAULT NULL,
  `Doc_Soporte` varchar(200) DEFAULT NULL,
  `Motivo` varchar(25) DEFAULT NULL,
  `Fech_Ini` date DEFAULT NULL,
  `Fech_Fin` date DEFAULT NULL,
  `Fech_Radi` date DEFAULT NULL,
  `Tip_Inc` varchar(20) DEFAULT NULL,
  `Responsable` varchar(50) DEFAULT NULL,
  `Doc_Iden` int(12) DEFAULT NULL,
  `Valor_Porc_Pago` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestacion_social`
--

CREATE TABLE `prestacion_social` (
  `Cod_Prest` int(12) NOT NULL,
  `Tip_Pres` varchar(20) DEFAULT NULL,
  `Fecha_Perio_Ini` date DEFAULT NULL,
  `Fecha_Perio_fin` date DEFAULT NULL,
  `Doc_Inden` int(12) DEFAULT NULL,
  `Cod_Contrato` int(12) DEFAULT NULL,
  `Nit_Emp` int(12) DEFAULT NULL,
  `Enti_Desti` varchar(20) DEFAULT NULL,
  `Descripció` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `Cod_Rep` int(12) NOT NULL,
  `Tipo_Rep` varchar(20) DEFAULT NULL,
  `Fecha_Emis` date DEFAULT NULL,
  `Nomb_Rep` varchar(25) DEFAULT NULL,
  `Descripción` varchar(150) DEFAULT NULL,
  `Tipo_Form` varchar(20) DEFAULT NULL,
  `Doc_Ident` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Cod_Rol` int(12) NOT NULL,
  `Nomb_Rol` varchar(35) DEFAULT NULL,
  `Descripción` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Doc_Iden` int(12) NOT NULL,
  `Tipo_Doc` varchar(6) DEFAULT NULL,
  `Num_Tele` varchar(15) DEFAULT NULL,
  `Contraseña` varchar(25) DEFAULT NULL,
  `Nomb_Usua` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Nomb_Comp` varchar(50) DEFAULT NULL,
  `Fecha_Nac` date DEFAULT NULL,
  `Sexo` varchar(15) DEFAULT NULL,
  `Cod_Rol` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`Cod_Act`);

--
-- Indices de la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD PRIMARY KEY (`Cod_Afi`),
  ADD KEY `fk_afiliacion1` (`Cod_EPS`),
  ADD KEY `fk_afiliacion2` (`Doc_Ident`),
  ADD KEY `empresa3` (`Nit_Emp`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`Cod_Banc`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`Cod_Cargo`);

--
-- Indices de la tabla `certificacion`
--
ALTER TABLE `certificacion`
  ADD PRIMARY KEY (`Cod_Cert`),
  ADD KEY `fk_certificacion1` (`Doc_Iden`);

--
-- Indices de la tabla `comunicacion_disciplinaria`
--
ALTER TABLE `comunicacion_disciplinaria`
  ADD PRIMARY KEY (`Cod_Not`),
  ADD KEY `fk_comunicacion1` (`Doc_Iden`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`Cod_Contrato`),
  ADD KEY `documento2` (`Doc_Iden`),
  ADD KEY `cargo1` (`Cod_Carg`),
  ADD KEY `empresa2` (`Nit_Emp`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Doc_Ident`),
  ADD KEY `eps1` (`Cod_EPS`),
  ADD KEY `banco1` (`Cod_Ban`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Nit_Emp`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`Cod_EPS`);

--
-- Indices de la tabla `inasistencia`
--
ALTER TABLE `inasistencia`
  ADD PRIMARY KEY (`Cod_Inasis`),
  ADD KEY `fk_inasistencia1` (`Doc_Iden`);

--
-- Indices de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD PRIMARY KEY (`Cod_Inc`),
  ADD KEY `fk_incapacidad1` (`Doc_Iden`);

--
-- Indices de la tabla `prestacion_social`
--
ALTER TABLE `prestacion_social`
  ADD PRIMARY KEY (`Cod_Prest`),
  ADD KEY `fk_prestacion1` (`Doc_Inden`),
  ADD KEY `fk_prestacion2` (`Cod_Contrato`),
  ADD KEY `empresa4` (`Nit_Emp`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`Cod_Rep`),
  ADD KEY `fk_reporte1` (`Doc_Ident`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Cod_Rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Doc_Iden`),
  ADD KEY `usuario1` (`Cod_Rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD CONSTRAINT `empresa3` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_afiliacion1` FOREIGN KEY (`Cod_EPS`) REFERENCES `eps` (`Cod_EPS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_afiliacion2` FOREIGN KEY (`Doc_Ident`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `certificacion`
--
ALTER TABLE `certificacion`
  ADD CONSTRAINT `fk_certificacion1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comunicacion_disciplinaria`
--
ALTER TABLE `comunicacion_disciplinaria`
  ADD CONSTRAINT `fk_comunicacion1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `cargo1` FOREIGN KEY (`Cod_Carg`) REFERENCES `cargo` (`Cod_Cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento2` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa2` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `banco1` FOREIGN KEY (`Cod_Ban`) REFERENCES `banco` (`Cod_Banc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento1` FOREIGN KEY (`Doc_Ident`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eps1` FOREIGN KEY (`Cod_EPS`) REFERENCES `eps` (`Cod_EPS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inasistencia`
--
ALTER TABLE `inasistencia`
  ADD CONSTRAINT `fk_inasistencia1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD CONSTRAINT `fk_incapacidad1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestacion_social`
--
ALTER TABLE `prestacion_social`
  ADD CONSTRAINT `empresa4` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestacion1` FOREIGN KEY (`Doc_Inden`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestacion2` FOREIGN KEY (`Cod_Contrato`) REFERENCES `contrato` (`Cod_Contrato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `fk_reporte1` FOREIGN KEY (`Doc_Ident`) REFERENCES `usuario` (`Doc_Iden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario1` FOREIGN KEY (`Cod_Rol`) REFERENCES `rol` (`Cod_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
