-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2022 at 03:51 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ParcijalniIspit`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProsjekPlacaZaposlenika` ()  BEGIN
SELECT
AVG(placa) `Prosjek plaća svih zaposlenika`
FROM
	Place;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProsjekPlacaZaposlenika1` ()  BEGIN
SELECT
AVG(placa) `Prosjek plaća svih zaposlenika`
FROM
	Place;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Odjeli`
--

CREATE TABLE `Odjeli` (
  `Odjel_id` int UNSIGNED NOT NULL,
  `ImeOdjela` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Odjeli`
--

INSERT INTO `Odjeli` (`Odjel_id`, `ImeOdjela`) VALUES
(1, 'Računovodstvo'),
(2, 'Prodaja'),
(3, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `Place`
--

CREATE TABLE `Place` (
  `Zaposlenik_id` int UNSIGNED NOT NULL,
  `Placa` int UNSIGNED NOT NULL,
  `OdDatuma` date NOT NULL,
  `DoDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Place`
--

INSERT INTO `Place` (`Zaposlenik_id`, `Placa`, `OdDatuma`, `DoDatuma`) VALUES
(1, 8000, '2020-01-01', '2022-11-11'),
(2, 9000, '2020-01-01', '2022-11-11'),
(3, 7800, '2020-01-01', '2022-11-11'),
(4, 8700, '2020-01-01', '2022-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `RadnoMjesto`
--

CREATE TABLE `RadnoMjesto` (
  `Zaposlenik_id` int UNSIGNED NOT NULL,
  `RadnoMjesto` varchar(255) NOT NULL,
  `OdDatuma` date NOT NULL,
  `DoDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RadnoMjesto`
--

INSERT INTO `RadnoMjesto` (`Zaposlenik_id`, `RadnoMjesto`, `OdDatuma`, `DoDatuma`) VALUES
(1, 'Računovođa', '2020-07-17', '2022-11-02'),
(2, 'Direktor', '2021-09-23', '2022-11-05'),
(3, 'Tajnica', '2020-10-27', '2022-11-03'),
(4, 'Administrator', '2020-04-02', '2022-11-05');

-- --------------------------------------------------------

--
-- Table structure for table `VoditeljOdjela`
--

CREATE TABLE `VoditeljOdjela` (
  `Zaposlenik_id` int UNSIGNED NOT NULL,
  `Odjel_id` int UNSIGNED NOT NULL,
  `OdDatuma` date NOT NULL,
  `DoDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `VoditeljOdjela`
--

INSERT INTO `VoditeljOdjela` (`Zaposlenik_id`, `Odjel_id`, `OdDatuma`, `DoDatuma`) VALUES
(1, 1, '2020-07-13', '2022-09-11'),
(2, 3, '2020-09-01', '2022-03-18'),
(3, 2, '2020-10-16', '2022-05-14'),
(4, 2, '2020-08-27', '2022-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `Zaposlenici`
--

CREATE TABLE `Zaposlenici` (
  `Zaposlenik_id` int UNSIGNED NOT NULL,
  `Ime` varchar(255) NOT NULL,
  `Prezime` varchar(255) NOT NULL,
  `DatumRodjenja` date NOT NULL,
  `Spol` varchar(255) NOT NULL,
  `DatumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Zaposlenici`
--

INSERT INTO `Zaposlenici` (`Zaposlenik_id`, `Ime`, `Prezime`, `DatumRodjenja`, `Spol`, `DatumZaposlenja`) VALUES
(1, 'Marko', 'Horvat', '1986-04-01', 'M', '2020-12-12'),
(2, 'Ivan', 'Perić', '1991-02-09', 'M', '2020-06-12'),
(3, 'Marija', 'Ivanković', '1994-08-02', 'Ž', '2020-05-02'),
(4, 'Ivana', 'Marinković', '1995-09-06', 'Ž', '2020-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `ZaposleniciOdjeli`
--

CREATE TABLE `ZaposleniciOdjeli` (
  `Zaposlenik_id` int UNSIGNED NOT NULL,
  `Odjel_id` int UNSIGNED NOT NULL,
  `OdDatuma` date NOT NULL,
  `DoDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ZaposleniciOdjeli`
--

INSERT INTO `ZaposleniciOdjeli` (`Zaposlenik_id`, `Odjel_id`, `OdDatuma`, `DoDatuma`) VALUES
(1, 1, '2020-09-16', '2022-06-14'),
(2, 3, '2020-05-12', '2022-01-18'),
(3, 2, '2020-01-28', '2022-10-09'),
(4, 3, '2020-10-09', '2022-08-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Odjeli`
--
ALTER TABLE `Odjeli`
  ADD PRIMARY KEY (`Odjel_id`);

--
-- Indexes for table `Place`
--
ALTER TABLE `Place`
  ADD PRIMARY KEY (`Zaposlenik_id`,`OdDatuma`);

--
-- Indexes for table `RadnoMjesto`
--
ALTER TABLE `RadnoMjesto`
  ADD PRIMARY KEY (`Zaposlenik_id`,`RadnoMjesto`,`OdDatuma`);

--
-- Indexes for table `VoditeljOdjela`
--
ALTER TABLE `VoditeljOdjela`
  ADD PRIMARY KEY (`Zaposlenik_id`,`Odjel_id`),
  ADD KEY `Odjel_id` (`Odjel_id`);

--
-- Indexes for table `Zaposlenici`
--
ALTER TABLE `Zaposlenici`
  ADD PRIMARY KEY (`Zaposlenik_id`);

--
-- Indexes for table `ZaposleniciOdjeli`
--
ALTER TABLE `ZaposleniciOdjeli`
  ADD PRIMARY KEY (`Zaposlenik_id`,`Odjel_id`),
  ADD KEY `Odjel_id` (`Odjel_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Place`
--
ALTER TABLE `Place`
  ADD CONSTRAINT `Place_ibfk_1` FOREIGN KEY (`Zaposlenik_id`) REFERENCES `Zaposlenici` (`Zaposlenik_id`) ON DELETE CASCADE;

--
-- Constraints for table `RadnoMjesto`
--
ALTER TABLE `RadnoMjesto`
  ADD CONSTRAINT `RadnoMjesto_ibfk_1` FOREIGN KEY (`Zaposlenik_id`) REFERENCES `Zaposlenici` (`Zaposlenik_id`) ON DELETE CASCADE;

--
-- Constraints for table `VoditeljOdjela`
--
ALTER TABLE `VoditeljOdjela`
  ADD CONSTRAINT `VoditeljOdjela_ibfk_1` FOREIGN KEY (`Zaposlenik_id`) REFERENCES `Zaposlenici` (`Zaposlenik_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `VoditeljOdjela_ibfk_2` FOREIGN KEY (`Odjel_id`) REFERENCES `Odjeli` (`Odjel_id`) ON DELETE CASCADE;

--
-- Constraints for table `ZaposleniciOdjeli`
--
ALTER TABLE `ZaposleniciOdjeli`
  ADD CONSTRAINT `ZaposleniciOdjeli_ibfk_1` FOREIGN KEY (`Zaposlenik_id`) REFERENCES `Zaposlenici` (`Zaposlenik_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ZaposleniciOdjeli_ibfk_2` FOREIGN KEY (`Odjel_id`) REFERENCES `Odjeli` (`Odjel_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
