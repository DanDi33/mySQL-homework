-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 29, 2024 at 11:05 AM
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
  `companyName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Companies`
--

INSERT INTO `Companies` (`id`, `companyName`) VALUES
(1, 'УК Люкс'),
(2, 'Оникс'),
(3, 'БэстСтрой'),
(4, 'ГУК'),
(5, 'КЭЧ'),
(6, 'ТСН «Высотка»'),
(7, 'ТСЖ \"Кондоминиум №1'),
(8, 'ТСЖ \"Большие Ременники\"'),
(9, 'Горизонт'),
(10, 'АДС');

-- --------------------------------------------------------

--
-- Table structure for table `FIO`
--

CREATE TABLE `FIO` (
  `id` int NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `patronymic` varchar(30) DEFAULT NULL
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
  `typeId` int NOT NULL,
  `number` varchar(25) NOT NULL,
  `fioId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Phones`
--

INSERT INTO `Phones` (`id`, `typeId`, `number`, `fioId`) VALUES
(1, 2, '544935', NULL),
(2, 2, '366958', NULL),
(3, 1, '9005551111', 2),
(4, 1, '9206262222', 1);

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
-- Table structure for table `Types`
--

CREATE TABLE `Types` (
  `id` int NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Types`
--

INSERT INTO `Types` (`id`, `type`) VALUES
(1, 'Сотовый'),
(2, 'Рабочий'),
(3, 'Домашний');

-- --------------------------------------------------------

--
-- Table structure for table `Workers`
--

CREATE TABLE `Workers` (
  `id` int NOT NULL,
  `companyId` int NOT NULL,
  `fioId` int NOT NULL,
  `professionId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Workers`
--

INSERT INTO `Workers` (`id`, `companyId`, `fioId`, `professionId`) VALUES
(1, 10, 1, 1),
(2, 10, 2, 3),
(3, 9, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `WorkPhone`
--

CREATE TABLE `WorkPhone` (
  `id` int NOT NULL,
  `workerId` int NOT NULL,
  `phoneId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `WorkPhone`
--

INSERT INTO `WorkPhone` (`id`, `workerId`, `phoneId`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 1);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `fioId` (`fioId`);

--
-- Indexes for table `Professions`
--
ALTER TABLE `Professions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Types`
--
ALTER TABLE `Types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Workers`
--
ALTER TABLE `Workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyId` (`companyId`),
  ADD KEY `professionId` (`professionId`),
  ADD KEY `fioId` (`fioId`);

--
-- Indexes for table `WorkPhone`
--
ALTER TABLE `WorkPhone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workerId` (`workerId`),
  ADD KEY `phoneId` (`phoneId`);

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
-- AUTO_INCREMENT for table `Types`
--
ALTER TABLE `Types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Workers`
--
ALTER TABLE `Workers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `WorkPhone`
--
ALTER TABLE `WorkPhone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Phones`
--
ALTER TABLE `Phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`fioId`) REFERENCES `FIO` (`id`);

--
-- Constraints for table `Workers`
--
ALTER TABLE `Workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`),
  ADD CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`professionId`) REFERENCES `Professions` (`id`),
  ADD CONSTRAINT `workers_ibfk_3` FOREIGN KEY (`fioId`) REFERENCES `FIO` (`id`);

--
-- Constraints for table `WorkPhone`
--
ALTER TABLE `WorkPhone`
  ADD CONSTRAINT `workphone_ibfk_1` FOREIGN KEY (`workerId`) REFERENCES `Workers` (`id`),
  ADD CONSTRAINT `workphone_ibfk_2` FOREIGN KEY (`phoneId`) REFERENCES `Phones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
