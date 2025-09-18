-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2025 a las 07:29:12
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_Afiliacion_Empleados` (IN `num` INT)   BEGIN
	SELECT usuario.Doc_Ident, usuario.Nomb_Comp, eps.Nomb_EPS, afiliacion.Fech_Solici, afiliacion.Estado, afiliacion.Descripción
    FROM afiliacion
    INNER JOIN usuario ON usuario.Doc_Ident = afiliacion.Doc_Ident
    INNER JOIN eps ON afiliacion.Cod_EPS = eps.Cod_EPS
    WHERE usuario.Doc_Ident = num;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_Comunicados_Empleado` (IN `cod` INT)   BEGIN
	SELECT usuario.Doc_Ident, usuario.Nomb_Comp, comunicacion_disciplinaria.Tip_Comun, 				comunicacion_disciplinaria.Asunto, comunicacion_disciplinaria.Descripción
    FROM comunicacion_disciplinaria
    INNER JOIN usuario ON usuario.Doc_Ident = comunicacion_disciplinaria.Doc_Iden
    WHERE usuario.Doc_Ident = cod;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_Datos_Usuario` (IN `doc` INT)   BEGIN
	SELECT *
    FROM usuario
    WHERE Doc_Ident = doc;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `Cod_Act` int(12) NOT NULL,
  `Nomb_Act` varchar(40) NOT NULL,
  `Fecha_Ini` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Fecha_Act` date NOT NULL,
  `Descripción` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`Cod_Act`, `Nomb_Act`, `Fecha_Ini`, `Fecha_Fin`, `Fecha_Act`, `Descripción`) VALUES
(31, 'Reunión de equipo', '2025-08-25', '2025-08-25', '2025-08-20', 'Reunión semanal para planificar tareas del equipo'),
(32, 'Entrega proyecto', '2025-08-28', '2025-08-28', '2025-08-20', 'Entrega del proyecto de desarrollo de software'),
(33, 'Capacitación interna', '2025-08-26', '2025-08-27', '2025-08-20', 'Capacitación sobre nuevas herramientas de desarrollo'),
(34, 'Mantenimiento sistema', '2025-08-29', '2025-08-29', '2025-08-20', 'Mantenimiento preventivo del sistema principal'),
(35, 'Revisión de documentación', '2025-08-30', '2025-08-30', '2025-08-20', 'Revisión y actualización de la documentación del proyecto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliacion`
--

CREATE TABLE `afiliacion` (
  `Cod_Afi` int(11) NOT NULL,
  `Fech_Solici` date DEFAULT current_timestamp(),
  `Cod_EPS` int(12) NOT NULL,
  `Nit_Emp` int(20) DEFAULT 900123456,
  `Estado` varchar(20) DEFAULT 'Pendiente',
  `Doc_Ident` int(12) NOT NULL,
  `Tip_Afil` varchar(20) DEFAULT 'Nueva',
  `Regimen` varchar(20) NOT NULL,
  `Descripción` varchar(150) DEFAULT 'Afiliación Nueva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `afiliacion`
--

INSERT INTO `afiliacion` (`Cod_Afi`, `Fech_Solici`, `Cod_EPS`, `Nit_Emp`, `Estado`, `Doc_Ident`, `Tip_Afil`, `Regimen`, `Descripción`) VALUES
(21, '2025-08-23', 101010, 900123456, 'Pendiente', 114557748, 'Nueva', 'Contributivo', 'Afiliación inicial a'),
(22, '2025-08-23', 202020, 900123456, 'Aprobado', 114568875, 'Nueva', 'Subsidiado', 'Afiliación inicial a'),
(23, '2025-08-23', 101010, 900123456, 'Pendiente', 147859745, 'Nueva', 'Subsidiado', 'Afiliación inicial a'),
(24, '2025-08-23', 404040, 900123456, 'Aprobado', 778964415, 'Nueva', 'Subsidiado', 'Afiliación inicial a'),
(25, '2025-08-23', 505050, 900123456, 'Pendiente', 1159784562, 'Nueva', 'Contributivo', 'Afiliación inicial a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `Cod_Banc` int(12) NOT NULL,
  `Nomb_Banc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`Cod_Banc`, `Nomb_Banc`) VALUES
(40, 'BANCO AGRARIO'),
(30, 'BANCO DE BOGOTA'),
(50, 'BANCO NU'),
(10, 'BANCOLOMBIA'),
(20, 'BBVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `Cod_Cargo` int(12) NOT NULL,
  `Nomb_Cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`Cod_Cargo`, `Nomb_Cargo`) VALUES
(205, 'Asistente Administrativo'),
(202, 'Contador'),
(203, 'Desarrollador de Software'),
(204, 'Diseñador UX/UI'),
(201, 'Gerente General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificacion`
--

CREATE TABLE `certificacion` (
  `Cod_Cert` int(12) NOT NULL,
  `Descripción` varchar(150) NOT NULL,
  `Tip_Cert` varchar(20) NOT NULL,
  `Fech_Emi` datetime NOT NULL DEFAULT current_timestamp(),
  `Doc_Iden` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificacion`
--

INSERT INTO `certificacion` (`Cod_Cert`, `Descripción`, `Tip_Cert`, `Fech_Emi`, `Doc_Iden`) VALUES
(41, 'Certificado laboral', 'Laboral', '2025-08-20 00:00:00', 114557748),
(42, 'Certificado de afiliación a EPS', 'Afiliación EPS', '2025-08-20 00:00:00', 114568875),
(43, 'Certificado bancario', 'Bancaria', '2025-08-20 00:00:00', 147859745),
(44, 'Certificado de salario', 'Laboral', '2025-08-20 00:00:00', 778964415),
(45, 'Certificado de prestaciones sociales', 'RRHH', '2025-08-20 00:00:00', 1159784562);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicacion_disciplinaria`
--

CREATE TABLE `comunicacion_disciplinaria` (
  `Cod_Not` int(12) NOT NULL,
  `Fech_Emi` date NOT NULL,
  `Asunto` varchar(35) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Fech_Ini` date NOT NULL,
  `Fech_Fin` date NOT NULL,
  `Doc_Iden` int(12) NOT NULL,
  `Tip_Comun` varchar(20) NOT NULL,
  `Descripción` text NOT NULL,
  `Nomb_Res` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunicacion_disciplinaria`
--

INSERT INTO `comunicacion_disciplinaria` (`Cod_Not`, `Fech_Emi`, `Asunto`, `Estado`, `Fech_Ini`, `Fech_Fin`, `Doc_Iden`, `Tip_Comun`, `Descripción`, `Nomb_Res`) VALUES
(51, '2025-08-20', 'Suspención Temporal', 'Pendiente', '2025-08-21', '2025-08-25', 114557748, 'Memorando', 'El empleado se porto agresivo e insulto a un compañero se aplicara suspensión temporal', 'Ronaldo Stiven Franco Duran'),
(52, '2025-08-20', 'Malas labores', 'Pendiente', '2025-08-22', '2025-08-26', 114568875, 'Llamado de atención', 'El empleado no realiza correctamente bien su trabajo', 'Tatiana Cruz Molina'),
(53, '2025-08-20', 'Abandono de labores', 'Pendiente', '2025-08-23', '2025-08-27', 147859745, 'Memorando', 'El empleado se retiro del trabajo sin excusa pertinente', 'Ronaldo Stiven Franco Duran'),
(54, '2025-08-20', 'Mal desempeño', 'Pendiente', '2025-08-24', '2025-08-28', 778964415, 'Llamado de atención', 'El empleado no esta capacitado para desempeñar sus labores\r\n', 'Tatiana Cruz Molina'),
(55, '2025-08-20', 'Robo', 'Pendiente', '2025-08-25', '2025-08-29', 1159784562, 'Memorando', 'El empleado robo material de la empresa', 'Ronaldo Stiven Franco Duran');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `Cod_Contrato` int(12) NOT NULL,
  `Descripción` text NOT NULL,
  `Doc_Iden` int(12) NOT NULL,
  `Fecha_Ing` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Tip_Contrato` varchar(20) NOT NULL,
  `Horar_Trab` varchar(30) NOT NULL,
  `Mod_Trab` varchar(20) NOT NULL,
  `Salario` float NOT NULL,
  `Aux_Trans` float NOT NULL,
  `Form_Pago` varchar(20) NOT NULL,
  `Nit_Emp` int(12) NOT NULL,
  `Jorn_Lab` varchar(20) NOT NULL,
  `Tip_Salar` varchar(20) NOT NULL,
  `Cod_Carg` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`Cod_Contrato`, `Descripción`, `Doc_Iden`, `Fecha_Ing`, `Fecha_Fin`, `Tip_Contrato`, `Horar_Trab`, `Mod_Trab`, `Salario`, `Aux_Trans`, `Form_Pago`, `Nit_Emp`, `Jorn_Lab`, `Tip_Salar`, `Cod_Carg`) VALUES
(5001, 'Contrato indefinido para gerente general', 114557748, '2024-01-15', '2026-01-15', 'Indefinido', '40 horas', 'Presencial', 4500000, 162000, 'Transferencia Bancar', 900123456, 'Tiempo completo', 'Mensual', 201),
(5002, 'Contrato a término fijo como contador', 114568875, '2024-03-01', '2025-03-01', 'Fijo', '40 horas', 'Híbrido', 2800000, 162000, 'Transferencia Bancar', 900123456, 'Tiempo completo', 'Mensual', 202),
(5003, 'Contrato indefinido como desarrollador de software', 147859745, '2024-02-10', '2026-02-10', 'Indefinido', '40 horas', 'Remoto', 3200000, 162000, 'Transferencia Bancar', 900123456, 'Tiempo completo', 'Mensual', 203),
(5004, 'Contrato de prestación de servicios para diseñador UX/UI', 778964415, '2024-04-05', '2024-10-05', 'Prestación de servic', '20 horas', 'Remoto', 1800000, 0, 'Transferencia Bancar', 900123456, 'Medio tiempo', 'Honorarios', 204),
(5005, 'Contrato de aprendizaje como asistente administrativo', 1159784562, '2024-05-01', '2025-05-01', 'Aprendizaje', '30 horas', 'Presencial', 1200000, 162000, 'Efectivo', 900123456, 'Medio tiempo', 'Mensual', 205);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_empleado`
--

CREATE TABLE `documentos_empleado` (
  `id_Archivo` int(11) NOT NULL,
  `Doc_Iden` int(20) NOT NULL,
  `Nombre_Archivo` varchar(100) NOT NULL,
  `Ruta_Archivo` varchar(255) NOT NULL,
  `Fecha_Subida` datetime NOT NULL DEFAULT current_timestamp(),
  `Obligatorio` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documentos_empleado`
--

INSERT INTO `documentos_empleado` (`id_Archivo`, `Doc_Iden`, `Nombre_Archivo`, `Ruta_Archivo`, `Fecha_Subida`, `Obligatorio`) VALUES
(1, 114557748, 'Contrato_Ronaldo.pdf', 'https://drive.google.com/drive/u/0/folders/1lBfdIUI-VX6TftfEi91VgjmDTlh56-42/Contrato_Ronaldo.pdf', '2025-08-24 21:24:07', 1),
(2, 114568875, 'Afiliacion_EPS_Angela.pdf', 'https://drive.google.com/drive/u/0/folders/1lBfdIUI-VX6TftfEi91VgjmDTlh56-42/Afiliacion_EPS_Angela.pdf', '2025-08-24 21:24:07', 1),
(3, 147859745, 'Certificado_Bancario_Tatiana.pdf', 'https://drive.google.com/drive/u/0/folders/1lBfdIUI-VX6TftfEi91VgjmDTlh56-42/Certificado_Bancario_Tatiana.pdf', '2025-08-24 21:24:07', 1),
(4, 778964415, 'Entrega_Prestaciones_Willington.pdf', 'https://drive.google.com/drive/u/0/folders/1lBfdIUI-VX6TftfEi91VgjmDTlh56-42/Entrega_Prestaciones_Willington.pdf', '2025-08-24 21:24:07', 0),
(5, 1159784562, 'Capacitacion_Omar.pdf', 'https://drive.google.com/drive/u/0/folders/1lBfdIUI-VX6TftfEi91VgjmDTlh56-42/Capacitacion_Omar.pdf', '2025-08-24 21:24:07', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Doc_Ident` int(12) NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  `Num_Cuen` varchar(30) NOT NULL,
  `Cod_EPS` int(12) NOT NULL,
  `Fond_Pens` varchar(30) NOT NULL,
  `Cod_Ban` int(12) NOT NULL,
  `Est_Empleado` varchar(20) NOT NULL,
  `Discapacidad` varchar(30) NOT NULL,
  `Nacionalidad` varchar(25) NOT NULL,
  `Estado_Civ` varchar(15) NOT NULL,
  `Grupo_San` varchar(4) NOT NULL,
  `Profesion` varchar(30) NOT NULL,
  `RH` varchar(4) NOT NULL,
  `Tip_Cuen` varchar(15) NOT NULL,
  `Fec_Exp_Doc` date NOT NULL,
  `Descripción` varchar(200) NOT NULL,
  `Fond_Cesa` varchar(30) NOT NULL,
  `Regimen` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Doc_Ident`, `Dirección`, `Num_Cuen`, `Cod_EPS`, `Fond_Pens`, `Cod_Ban`, `Est_Empleado`, `Discapacidad`, `Nacionalidad`, `Estado_Civ`, `Grupo_San`, `Profesion`, `RH`, `Tip_Cuen`, `Fec_Exp_Doc`, `Descripción`, `Fond_Cesa`, `Regimen`) VALUES
(114557748, 'calle 58 sur #98a-61', '014278456213', 101010, 'Colpensiones', 20, 'Activo', 'Ninguna', 'Colombia', 'Soltero', 'O', 'Desarrolldaro Backend', '+', 'Ahorros', '2024-10-18', 'Prioridad', 'Porvenir', 'Contributivo'),
(114568875, 'Carrera 20 #15-30', '010245678912', 202020, 'Protección', 40, 'Activo', 'Ninguna', 'Colombia', 'Soltera', 'A', 'Diseñadora Gráfica', '-', 'Ahorros', '2024-09-12', 'Contrato indefinido', 'Porvenir', 'Subsidiado'),
(147859745, 'Calle 45 #67-89', '015478965321', 101010, 'Colpensiones', 10, 'Activo', 'Ninguna', 'Colombia', 'Soltera', 'B', 'Auxiliar Administrativa', '+', 'Corriente', '2023-11-05', 'Contrato a término fijo', 'Colfondos', 'Subsidiado'),
(778964415, 'Transversal 8 #98-12', '017896543210', 404040, 'Colpensiones', 20, 'Activo', 'Visual leve', 'Colombia', 'Casado', 'AB', 'Ingeniero de Sistemas', '+', 'Ahorros', '2022-05-20', 'Contrato por prestación de servicios', 'Skandia', 'Contributivo'),
(1159784562, 'Diagonal 80 #120-45', '016325478901', 505050, 'Protección', 30, 'Activo', 'Ninguna', 'Colombia', 'Soltero', 'O', 'Analista de Datos', '-', 'Ahorros', '2024-01-10', 'Contrato de aprendizaje', 'Porvenir', 'Subsidiado');

--
-- Disparadores `empleado`
--
DELIMITER $$
CREATE TRIGGER `tr_delete_empleado` AFTER DELETE ON `empleado` FOR EACH ROW BEGIN
	DELETE FROM afiliacion
    WHERE Doc_Ident = OLD.Doc_Ident;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_update_empleado` AFTER UPDATE ON `empleado` FOR EACH ROW BEGIN
	UPDATE afiliacion
    SET 
    	Cod_EPS = NEW.Cod_EPS,
        Doc_Ident = NEW.Doc_Ident,
       	Regimen = NEW.Regimen
    WHERE Doc_Ident = OLD.Doc_Ident;
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_insert_afiliacion` AFTER INSERT ON `empleado` FOR EACH ROW BEGIN
	INSERT INTO afiliacion(Cod_EPS, Doc_Ident, Regimen) 
    VALUES ( NEW.Cod_EPS, NEW.Doc_Ident,NEW.Regimen);
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `empleadosporvenir`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `empleadosporvenir` (
`Doc_Ident` int(12)
,`Nomb_Comp` varchar(50)
,`Fond_Cesa` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `empleados_eps`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `empleados_eps` (
`Doc_Ident` int(12)
,`Nomb_Comp` varchar(50)
,`Nomb_EPS` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `empleados_pensiones_bancos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `empleados_pensiones_bancos` (
`Doc_Ident` int(12)
,`Nomb_Comp` varchar(50)
,`Fond_Pens` varchar(30)
,`Nomb_Banc` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Nit_Emp` int(12) NOT NULL,
  `Num_Tel` varchar(15) NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  `Raz_Soc` varchar(50) NOT NULL,
  `Tip_Emp` varchar(30) NOT NULL,
  `Misión` varchar(150) NOT NULL,
  `Nomb_Repr` varchar(50) NOT NULL,
  `Act_Eco` varchar(40) NOT NULL,
  `Visión` varchar(50) NOT NULL,
  `Reg_Trib` varchar(50) NOT NULL,
  `Fech_Cre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`Nit_Emp`, `Num_Tel`, `Dirección`, `Raz_Soc`, `Tip_Emp`, `Misión`, `Nomb_Repr`, `Act_Eco`, `Visión`, `Reg_Trib`, `Fech_Cre`) VALUES
(900123456, '6017894561', 'Avenida Caracas #45-20, Bogotá', 'Tech Solutions S.A.S.', 'Privada', 'Ofrecer soluciones tecnológicas innovadoras que impulsen la transformación digital de nuestros clientes.', 'Ronaldo Stiven Franco Durán', 'Desarrollo de software y consultoría tec', 'Ser líderes en el sector tecnológico colombiano pa', 'Régimen Ordinario', '2015-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `Cod_EPS` int(12) NOT NULL,
  `Nomb_EPS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`Cod_EPS`, `Nomb_EPS`) VALUES
(101010, 'Capital Salud'),
(202020, 'Nueva EPS'),
(303030, 'Salud Total'),
(404040, 'Sura EPS'),
(505050, 'Cafam EPS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inasistencia`
--

CREATE TABLE `inasistencia` (
  `Cod_Inasis` int(12) NOT NULL,
  `Fech_Inasis` date NOT NULL,
  `Doc_Iden` int(12) NOT NULL,
  `Descripción` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inasistencia`
--

INSERT INTO `inasistencia` (`Cod_Inasis`, `Fech_Inasis`, `Doc_Iden`, `Descripción`) VALUES
(11, '2025-08-23', 114557748, 'Faltó por enfermedad'),
(12, '2025-08-23', 114568875, 'Llegó tarde a clase'),
(13, '2025-08-23', 147859745, 'No asistió a la sesión'),
(14, '2025-08-23', 778964415, 'Faltó por viaje familiar'),
(15, '2025-08-23', 1159784562, 'Llegó tarde por transporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidad`
--

CREATE TABLE `incapacidad` (
  `Cod_Inc` int(12) NOT NULL,
  `Nit_Emp` int(12) NOT NULL,
  `Descripción` varchar(200) NOT NULL,
  `Motivo` varchar(25) NOT NULL,
  `Fech_Ini` date NOT NULL,
  `Fech_Fin` date NOT NULL,
  `Fech_Radi` date NOT NULL,
  `Tip_Inc` varchar(20) NOT NULL,
  `Responsable` varchar(50) NOT NULL,
  `Doc_Iden` int(12) NOT NULL,
  `Valor_Porc_Pago` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incapacidad`
--

INSERT INTO `incapacidad` (`Cod_Inc`, `Nit_Emp`, `Descripción`, `Motivo`, `Fech_Ini`, `Fech_Fin`, `Fech_Radi`, `Tip_Inc`, `Responsable`, `Doc_Iden`, `Valor_Porc_Pago`) VALUES
(1001, 900123456, 'Reposo médico por fiebre y malestar general', 'Gripa fuerte', '2025-02-10', '2025-02-15', '2025-02-11', 'Temporal', 'Dr. Juan Pérez', 114557748, 100),
(1002, 900123456, 'Reposo por accidente doméstico', 'Esguince de tobillo', '2025-01-20', '2025-02-05', '2025-01-21', 'Temporal', 'Dra. Andrea Torres', 114568875, 80),
(1003, 900123456, 'Incapacidad postoperatoria', 'Cirugía menor', '2025-03-01', '2025-03-20', '2025-03-02', 'Temporal', 'Dr. Carlos Medina', 147859745, 100),
(1004, 900123456, 'Reposo por enfermedad respiratoria', 'Bronquitis aguda', '2025-02-05', '2025-02-12', '2025-02-06', 'Temporal', 'Dra. Juliana Gómez', 778964415, 100),
(1005, 900123456, 'Reposo médico por fractura', 'Fractura de brazo izquier', '2025-01-10', '2025-02-25', '2025-01-11', 'Temporal', 'Dr. Felipe Ramírez', 1159784562, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestacion_social`
--

CREATE TABLE `prestacion_social` (
  `Cod_Prest` int(12) NOT NULL,
  `Tip_Pres` varchar(20) NOT NULL,
  `Fecha_Perio_Ini` date NOT NULL,
  `Fecha_Perio_fin` date NOT NULL,
  `Doc_Inden` int(12) NOT NULL,
  `Cod_Contrato` int(12) NOT NULL,
  `Nit_Emp` int(12) NOT NULL,
  `Enti_Desti` varchar(20) NOT NULL,
  `Descripció` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestacion_social`
--

INSERT INTO `prestacion_social` (`Cod_Prest`, `Tip_Pres`, `Fecha_Perio_Ini`, `Fecha_Perio_fin`, `Doc_Inden`, `Cod_Contrato`, `Nit_Emp`, `Enti_Desti`, `Descripció`) VALUES
(0, 'Cesantías', '2024-01-15', '2024-12-31', 114557748, 5001, 900123456, 'Porvenir', 'Depósito de cesantías correspondientes al año laboral 2024'),
(1, 'Cesantías', '2024-01-15', '2024-12-31', 114557748, 5001, 900123456, 'Porvenir', 'Depósito de cesantías correspondientes al año laboral 2024'),
(2, 'Intereses Cesantías', '2024-01-15', '2024-12-31', 114568875, 5002, 900123456, 'Porvenir', 'Pago de intereses a las cesantías del período 2024'),
(3, 'Vacaciones', '2025-01-10', '2025-01-24', 147859745, 5003, 900123456, 'Empleado', 'Disfrute de vacaciones correspondientes al período trabajado en 2024'),
(4, 'Prima', '2024-06-01', '2024-06-30', 778964415, 5004, 900123456, 'Protección', 'Pago de prima de servicios de mitad de año 2024'),
(5, 'Prima', '2024-12-01', '2024-12-31', 1159784562, 5005, 900123456, 'Protección', 'Pago de prima de servicios de diciembre 2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `Cod_Rep` int(12) NOT NULL,
  `Tipo_Rep` varchar(20) NOT NULL,
  `Fecha_Emis` date NOT NULL,
  `Nomb_Rep` varchar(25) NOT NULL,
  `Descripción` varchar(150) NOT NULL,
  `Tipo_Form` varchar(20) NOT NULL,
  `Doc_Ident` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`Cod_Rep`, `Tipo_Rep`, `Fecha_Emis`, `Nomb_Rep`, `Descripción`, `Tipo_Form`, `Doc_Ident`) VALUES
(61, 'Inasistencia', '2025-08-20', 'Reporte Semanal', 'Registro de inasistencias del empleado durante la semana', 'PDF', 114557748),
(62, 'Incapacidad', '2025-08-21', 'Reporte Médico', 'Resumen de incapacidades médicas presentadas por el empleado', 'PDF', 114568875),
(63, 'Inasistencia', '2025-08-22', 'Reporte Mensual', 'Registro de ausencias y retardos durante el mes', 'Excel', 147859745),
(64, 'Incapacidad', '2025-08-23', 'Reporte Médico', 'Incapacidades presentadas y autorizaciones correspondientes', 'PDF', 778964415),
(65, 'Inasistencia', '2025-08-24', 'Reporte Semanal', 'Seguimiento de inasistencias y puntualidad de los empleados', 'Excel', 1159784562);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Cod_Rol` int(12) NOT NULL,
  `Nomb_Rol` varchar(35) NOT NULL,
  `Descripción` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Cod_Rol`, `Nomb_Rol`, `Descripción`) VALUES
(1010, 'Empleado', 'Acceso limitado al sistema, solo puede consultar, registrar y actualizar la información relacionada con sus funciones.'),
(2020, 'Administrador', 'Tiene acceso total al sistema, puede gestionar usuarios, roles, permisos y realizar cambios en toda la información.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Doc_Ident` int(12) NOT NULL,
  `Tipo_Doc` varchar(6) NOT NULL,
  `Num_Tele` varchar(15) NOT NULL,
  `Contraseña` varchar(25) NOT NULL,
  `Nomb_Usua` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Nomb_Comp` varchar(50) NOT NULL,
  `Fecha_Nac` date NOT NULL,
  `Sexo` varchar(15) NOT NULL,
  `Cod_Rol` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Doc_Ident`, `Tipo_Doc`, `Num_Tele`, `Contraseña`, `Nomb_Usua`, `Correo`, `Nomb_Comp`, `Fecha_Nac`, `Sexo`, `Cod_Rol`) VALUES
(114557748, 'C.C', '3113167548', 'ronald@777', 'Ronaltix', 'ronad@gmail.com', 'Ronaldo Stiven Franco Duran', '2006-09-03', 'Masculino', 2020),
(114568875, 'C.C', '3453166987', 'agela@777', 'Agelxnau', 'Angela@gmail.com', 'Angela Tatitana Gonzales Pinto', '2006-08-09', 'Femenino', 1010),
(147859745, 'C.C', '3457899675', 'tatis@777', 'GatitaGG', 'tatiana@gmail.com', 'Briyid Tatiana Cruz Molina', '2005-07-02', 'Femenino', 2020),
(778964415, 'C.C', '3743698945', 'willi@777', 'Astronauta', 'willi@gmail.com', 'Willington Guzman Arias', '2000-02-04', 'Masculino', 1010),
(1145577486, 'C.C', '31435698', 'lolamento', 'Lolito', 'lolito@gmail.com', 'Fercho Stiven Ramirez Ruiz', '2006-08-07', 'Masculino', 1010),
(1159784562, 'C.C', '3143155987', 'omar@777', 'Omar99', 'Omar@gmail.com', 'Omar Andres Marcano', '2004-08-08', 'Masculino', 1010);

-- --------------------------------------------------------

--
-- Estructura para la vista `empleadosporvenir`
--
DROP TABLE IF EXISTS `empleadosporvenir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empleadosporvenir`  AS SELECT `usuario`.`Doc_Ident` AS `Doc_Ident`, `usuario`.`Nomb_Comp` AS `Nomb_Comp`, `empleado`.`Fond_Cesa` AS `Fond_Cesa` FROM (`usuario` join `empleado` on(`usuario`.`Doc_Ident` = `empleado`.`Doc_Ident`)) WHERE `empleado`.`Fond_Cesa` = 'Porvenir' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `empleados_eps`
--
DROP TABLE IF EXISTS `empleados_eps`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empleados_eps`  AS SELECT `usuario`.`Doc_Ident` AS `Doc_Ident`, `usuario`.`Nomb_Comp` AS `Nomb_Comp`, `eps`.`Nomb_EPS` AS `Nomb_EPS` FROM ((`empleado` join `usuario` on(`usuario`.`Doc_Ident` = `empleado`.`Doc_Ident`)) join `eps` on(`empleado`.`Cod_EPS` = `eps`.`Cod_EPS`)) WHERE `eps`.`Cod_EPS` = 101010 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `empleados_pensiones_bancos`
--
DROP TABLE IF EXISTS `empleados_pensiones_bancos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empleados_pensiones_bancos`  AS SELECT `usuario`.`Doc_Ident` AS `Doc_Ident`, `usuario`.`Nomb_Comp` AS `Nomb_Comp`, `empleado`.`Fond_Pens` AS `Fond_Pens`, `banco`.`Nomb_Banc` AS `Nomb_Banc` FROM ((`empleado` join `usuario` on(`usuario`.`Doc_Ident` = `empleado`.`Doc_Ident`)) join `banco` on(`empleado`.`Cod_Ban` = `banco`.`Cod_Banc`)) WHERE `empleado`.`Fond_Pens` = 'Colpensiones' AND `banco`.`Nomb_Banc` = 'BBVA' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`Cod_Act`),
  ADD UNIQUE KEY `Cod_Act` (`Cod_Act`),
  ADD UNIQUE KEY `Nomb_Act` (`Nomb_Act`);

--
-- Indices de la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD PRIMARY KEY (`Cod_Afi`),
  ADD UNIQUE KEY `Cod_Afi` (`Cod_Afi`),
  ADD KEY `fk_afiliacion1` (`Cod_EPS`),
  ADD KEY `fk_afiliacion2` (`Doc_Ident`),
  ADD KEY `empresa3` (`Nit_Emp`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`Cod_Banc`),
  ADD UNIQUE KEY `Cod_Banc` (`Cod_Banc`),
  ADD UNIQUE KEY `Nomb_Banc` (`Nomb_Banc`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`Cod_Cargo`),
  ADD UNIQUE KEY `Cod_Cargo` (`Cod_Cargo`),
  ADD UNIQUE KEY `Nomb_Cargo` (`Nomb_Cargo`);

--
-- Indices de la tabla `certificacion`
--
ALTER TABLE `certificacion`
  ADD PRIMARY KEY (`Cod_Cert`),
  ADD UNIQUE KEY `Cod_Cert` (`Cod_Cert`),
  ADD KEY `fk_certificacion1` (`Doc_Iden`);

--
-- Indices de la tabla `comunicacion_disciplinaria`
--
ALTER TABLE `comunicacion_disciplinaria`
  ADD PRIMARY KEY (`Cod_Not`),
  ADD UNIQUE KEY `Cod_Not` (`Cod_Not`),
  ADD KEY `fk_comunicacion1` (`Doc_Iden`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`Cod_Contrato`),
  ADD UNIQUE KEY `Cod_Contrato` (`Cod_Contrato`),
  ADD KEY `documento2` (`Doc_Iden`),
  ADD KEY `cargo1` (`Cod_Carg`),
  ADD KEY `empresa2` (`Nit_Emp`);

--
-- Indices de la tabla `documentos_empleado`
--
ALTER TABLE `documentos_empleado`
  ADD PRIMARY KEY (`id_Archivo`),
  ADD UNIQUE KEY `Nombre_Archivo` (`Nombre_Archivo`),
  ADD UNIQUE KEY `id_Archivo` (`id_Archivo`),
  ADD KEY `documento9` (`Doc_Iden`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD KEY `eps1` (`Cod_EPS`),
  ADD KEY `banco1` (`Cod_Ban`),
  ADD KEY `fk_documento9` (`Doc_Ident`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Nit_Emp`),
  ADD UNIQUE KEY `Nit_Emp` (`Nit_Emp`),
  ADD UNIQUE KEY `Num_Tel` (`Num_Tel`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`Cod_EPS`),
  ADD UNIQUE KEY `Cod_EPS` (`Cod_EPS`);

--
-- Indices de la tabla `inasistencia`
--
ALTER TABLE `inasistencia`
  ADD PRIMARY KEY (`Cod_Inasis`),
  ADD UNIQUE KEY `Cod_Inasis` (`Cod_Inasis`),
  ADD KEY `fk_inasistencia1` (`Doc_Iden`);

--
-- Indices de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD PRIMARY KEY (`Cod_Inc`),
  ADD UNIQUE KEY `Cod_Inc` (`Cod_Inc`),
  ADD KEY `fk_incapacidad1` (`Doc_Iden`),
  ADD KEY `fk_nitEmp` (`Nit_Emp`);

--
-- Indices de la tabla `prestacion_social`
--
ALTER TABLE `prestacion_social`
  ADD PRIMARY KEY (`Cod_Prest`),
  ADD UNIQUE KEY `Cod_Prest` (`Cod_Prest`),
  ADD KEY `fk_prestacion1` (`Doc_Inden`),
  ADD KEY `fk_prestacion2` (`Cod_Contrato`),
  ADD KEY `empresa4` (`Nit_Emp`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`Cod_Rep`),
  ADD UNIQUE KEY `Cod_Rep` (`Cod_Rep`),
  ADD KEY `fk_reporte1` (`Doc_Ident`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Cod_Rol`),
  ADD UNIQUE KEY `Cod_Rol` (`Cod_Rol`),
  ADD UNIQUE KEY `Nomb_Rol` (`Nomb_Rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Doc_Ident`),
  ADD UNIQUE KEY `Doc_Iden` (`Doc_Ident`),
  ADD UNIQUE KEY `Correo` (`Correo`),
  ADD UNIQUE KEY `Num_Tele` (`Num_Tele`),
  ADD UNIQUE KEY `Nomb_Usua` (`Nomb_Usua`),
  ADD KEY `usuario1` (`Cod_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  MODIFY `Cod_Afi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `documentos_empleado`
--
ALTER TABLE `documentos_empleado`
  MODIFY `id_Archivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD CONSTRAINT `empresa3` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_afiliacion1` FOREIGN KEY (`Cod_EPS`) REFERENCES `eps` (`Cod_EPS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_afiliacion2` FOREIGN KEY (`Doc_Ident`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `certificacion`
--
ALTER TABLE `certificacion`
  ADD CONSTRAINT `fk_certificacion1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comunicacion_disciplinaria`
--
ALTER TABLE `comunicacion_disciplinaria`
  ADD CONSTRAINT `fk_comunicacion1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `cargo1` FOREIGN KEY (`Cod_Carg`) REFERENCES `cargo` (`Cod_Cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento2` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa2` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `documentos_empleado`
--
ALTER TABLE `documentos_empleado`
  ADD CONSTRAINT `documento9` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `banco1` FOREIGN KEY (`Cod_Ban`) REFERENCES `banco` (`Cod_Banc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eps1` FOREIGN KEY (`Cod_EPS`) REFERENCES `eps` (`Cod_EPS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documento9` FOREIGN KEY (`Doc_Ident`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inasistencia`
--
ALTER TABLE `inasistencia`
  ADD CONSTRAINT `fk_inasistencia1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD CONSTRAINT `fk_incapacidad1` FOREIGN KEY (`Doc_Iden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nitEmp` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestacion_social`
--
ALTER TABLE `prestacion_social`
  ADD CONSTRAINT `empresa4` FOREIGN KEY (`Nit_Emp`) REFERENCES `empresa` (`Nit_Emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestacion1` FOREIGN KEY (`Doc_Inden`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestacion2` FOREIGN KEY (`Cod_Contrato`) REFERENCES `contrato` (`Cod_Contrato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `fk_reporte1` FOREIGN KEY (`Doc_Ident`) REFERENCES `usuario` (`Doc_Ident`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario1` FOREIGN KEY (`Cod_Rol`) REFERENCES `rol` (`Cod_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
