-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 26, 2024 at 05:51 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PhoneBook`
--

-- --------------------------------------------------------

--
-- Table structure for table `Companies`
--

CREATE TABLE `Companies` (
  `id` int NOT NULL,
  `type` varchar(15) NOT NULL,
  `companyName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Companies`
--

INSERT INTO `Companies` (`id`, `type`, `companyName`) VALUES
(1, 'УК', 'УК Люкс'),
(2, 'УК', 'Оникс'),
(3, 'УК', 'БэстСтрой'),
(4, 'УК', 'ГУК'),
(5, 'УК', 'КЭЧ'),
(6, 'ТСЖ', 'ТСН «Высотка»'),
(7, 'ТСЖ', 'ТСЖ \"Кондоминиум №1'),
(8, 'ТСЖ', 'ТСЖ \"Большие Ременники\"'),
(9, 'Подрядчик', 'Горизонт'),
(10, 'Подрядчик', 'АДС');

-- --------------------------------------------------------

--
-- Table structure for table `FIO`
--

CREATE TABLE `FIO` (
  `id` int NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `patronymic` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `FIO`
--

INSERT INTO `FIO` (`id`, `lastName`, `firstName`, `patronymic`) VALUES
(1, 'Данилов', 'Дмитрий', 'Олегович'),
(2, 'Белякова', 'Оксана', 'Анатольевна');

-- --------------------------------------------------------

--
-- Table structure for table `Phones`
--

CREATE TABLE `Phones` (
  `id` int NOT NULL,
  `type` varchar(15) NOT NULL,
  `number` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Phones`
--

INSERT INTO `Phones` (`id`, `type`, `number`) VALUES
(1, 'раб', '544935'),
(2, 'раб', '366958'),
(3, 'сот', '9005551111'),
(4, 'сот', '9206262222');

-- --------------------------------------------------------

--
-- Table structure for table `Professions`
--

CREATE TABLE `Professions` (
  `id` int NOT NULL,
  `profession` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Professions`
--

INSERT INTO `Professions` (`id`, `profession`) VALUES
(1, 'Директор'),
(2, 'Исполнительный директор'),
(3, 'Диспетчер');

-- --------------------------------------------------------

--
-- Table structure for table `Workers`
--

CREATE TABLE `Workers` (
  `id` int NOT NULL,
  `companyId` int NOT NULL,
  `fioId` int NOT NULL,
  `professionId` int NOT NULL,
  `phoneId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Workers`
--

INSERT INTO `Workers` (`id`, `companyId`, `fioId`, `professionId`, `phoneId`) VALUES
(1, 10, 1, 1, 4),
(2, 10, 1, 1, 2),
(3, 10, 2, 3, 2),
(4, 9, 2, 2, 1),
(5, 9, 2, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FIO`
--
ALTER TABLE `FIO`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Phones`
--
ALTER TABLE `Phones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Professions`
--
ALTER TABLE `Professions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Workers`
--
ALTER TABLE `Workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyId` (`companyId`),
  ADD KEY `phoneId` (`phoneId`),
  ADD KEY `professionId` (`professionId`),
  ADD KEY `fioId` (`fioId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Companies`
--
ALTER TABLE `Companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `FIO`
--
ALTER TABLE `FIO`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Phones`
--
ALTER TABLE `Phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Professions`
--
ALTER TABLE `Professions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Workers`
--
ALTER TABLE `Workers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Workers`
--
ALTER TABLE `Workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`),
  ADD CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`phoneId`) REFERENCES `Phones` (`id`),
  ADD CONSTRAINT `workers_ibfk_3` FOREIGN KEY (`professionId`) REFERENCES `Professions` (`id`),
  ADD CONSTRAINT `workers_ibfk_4` FOREIGN KEY (`fioId`) REFERENCES `FIO` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
