-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 18 2024 г., 11:20
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Academy`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Curators`
--

CREATE TABLE `Curators` (
  `id` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Curators`
--

INSERT INTO `Curators` (`id`, `Name`, `Surname`) VALUES
(1, 'Ivan', 'Ivanov'),
(2, 'Ivan', 'Petrov'),
(3, 'Sergey', 'Filatov');

-- --------------------------------------------------------

--
-- Структура таблицы `Departments`
--

CREATE TABLE `Departments` (
  `id` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Financing` decimal(10,0) NOT NULL DEFAULT '0',
  `FacultyId` int NOT NULL
) ;

--
-- Дамп данных таблицы `Departments`
--

INSERT INTO `Departments` (`id`, `Name`, `Financing`, `FacultyId`) VALUES
(1, 'Mathematic', '300000', 1),
(2, 'physics', '500000', 1),
(3, 'chemistry', '1200000', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Faculties`
--

CREATE TABLE `Faculties` (
  `id` int NOT NULL,
  `Financing` decimal(10,0) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL
) ;

--
-- Дамп данных таблицы `Faculties`
--

INSERT INTO `Faculties` (`id`, `Financing`, `Name`) VALUES
(1, '1000000', 'Еxact sciences'),
(2, '1500000', 'Humanities');

-- --------------------------------------------------------

--
-- Структура таблицы `Groups1`
--

CREATE TABLE `Groups1` (
  `id` int NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Year` int NOT NULL,
  `DepartmentId` int NOT NULL
) ;

--
-- Дамп данных таблицы `Groups1`
--

INSERT INTO `Groups1` (`id`, `Name`, `Year`, `DepartmentId`) VALUES
(14, 'M121', 3, 1),
(15, 'M122', 2, 1),
(16, 'M123', 1, 1),
(17, 'P123', 1, 2),
(18, 'P122', 2, 2),
(19, 'P222', 2, 2),
(20, 'P121', 3, 2),
(21, 'C119', 5, 3),
(22, 'C120', 4, 3),
(23, 'C121', 3, 3),
(24, 'C122', 2, 3),
(25, 'C123', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `GroupsCurators`
--

CREATE TABLE `GroupsCurators` (
  `id` int NOT NULL,
  `CuratorId` int NOT NULL,
  `GroupId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `GroupsCurators`
--

INSERT INTO `GroupsCurators` (`id`, `CuratorId`, `GroupId`) VALUES
(1, 1, 14),
(2, 1, 15),
(3, 1, 16),
(4, 2, 17),
(5, 2, 18),
(6, 2, 19),
(7, 2, 20),
(8, 3, 21),
(9, 3, 22),
(10, 3, 23),
(11, 3, 24),
(12, 3, 25);

-- --------------------------------------------------------

--
-- Структура таблицы `GroupsLectures`
--

CREATE TABLE `GroupsLectures` (
  `id` int NOT NULL,
  `GroupId` int NOT NULL,
  `LectureId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `GroupsLectures`
--

INSERT INTO `GroupsLectures` (`id`, `GroupId`, `LectureId`) VALUES
(1, 14, 1),
(2, 14, 2),
(3, 14, 3),
(4, 14, 4),
(5, 15, 2),
(6, 15, 4),
(7, 15, 6),
(8, 15, 8),
(9, 16, 5),
(10, 16, 6),
(11, 16, 7),
(12, 16, 8),
(13, 17, 9),
(14, 17, 10),
(15, 17, 11),
(16, 17, 12),
(17, 18, 13),
(18, 18, 14),
(19, 18, 1),
(20, 18, 2),
(21, 19, 3),
(22, 19, 6),
(23, 19, 9),
(24, 19, 13),
(25, 20, 14),
(26, 20, 2),
(27, 20, 7),
(28, 21, 4),
(29, 21, 5),
(30, 21, 11),
(31, 21, 12),
(32, 22, 8),
(33, 22, 7),
(34, 22, 6),
(35, 23, 5),
(36, 23, 4),
(37, 23, 2),
(38, 23, 3),
(39, 24, 1),
(40, 24, 13),
(41, 24, 6),
(42, 24, 14),
(43, 24, 2),
(44, 25, 7),
(45, 25, 8),
(46, 25, 9),
(47, 25, 10),
(48, 25, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `Lectures`
--

CREATE TABLE `Lectures` (
  `id` int NOT NULL,
  `LectureRoom` varchar(30) NOT NULL,
  `SubjectId` int NOT NULL,
  `TeacherId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Lectures`
--

INSERT INTO `Lectures` (`id`, `LectureRoom`, `SubjectId`, `TeacherId`) VALUES
(1, '101', 1, 1),
(2, '102', 2, 2),
(3, '103', 3, 2),
(4, '104', 4, 2),
(5, '105', 5, 2),
(6, '201', 6, 1),
(7, '202', 7, 1),
(8, '203', 8, 3),
(9, '204', 9, 1),
(10, '205', 10, 3),
(11, '206', 11, 3),
(12, '207', 12, 3),
(13, '301', 13, 3),
(14, '302', 14, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Subjects`
--

CREATE TABLE `Subjects` (
  `id` int NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Subjects`
--

INSERT INTO `Subjects` (`id`, `Name`) VALUES
(4, 'Algebra'),
(9, 'Biology'),
(3, 'Chemistry'),
(10, 'Computer Science'),
(12, 'Databases'),
(8, 'Design'),
(7, 'English'),
(5, 'Geometry'),
(1, 'History'),
(13, 'JavaScript'),
(14, 'Literature'),
(6, 'Philosophy'),
(2, 'Physics'),
(11, 'Python');

-- --------------------------------------------------------

--
-- Структура таблицы `Teachers`
--

CREATE TABLE `Teachers` (
  `id` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Salary` decimal(10,0) NOT NULL
) ;

--
-- Дамп данных таблицы `Teachers`
--

INSERT INTO `Teachers` (`id`, `Name`, `Surname`, `Salary`) VALUES
(1, 'Ivan', 'Ivanov', '30000'),
(2, 'Ivan', 'Petrov', '35000'),
(3, 'Sergey', 'Filatov', '33000'),
(4, 'Tom', 'Ford', '23000'),
(5, 'Paris', 'Filton', '13000');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Curators`
--
ALTER TABLE `Curators`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `FacultyId` (`FacultyId`);

--
-- Индексы таблицы `Faculties`
--
ALTER TABLE `Faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Индексы таблицы `Groups1`
--
ALTER TABLE `Groups1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `DepartmentId` (`DepartmentId`);

--
-- Индексы таблицы `GroupsCurators`
--
ALTER TABLE `GroupsCurators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CuratorId` (`CuratorId`),
  ADD KEY `GroupId` (`GroupId`);

--
-- Индексы таблицы `GroupsLectures`
--
ALTER TABLE `GroupsLectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GroupId` (`GroupId`),
  ADD KEY `LectureId` (`LectureId`);

--
-- Индексы таблицы `Lectures`
--
ALTER TABLE `Lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SubjectId` (`SubjectId`),
  ADD KEY `TeacherId` (`TeacherId`);

--
-- Индексы таблицы `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Индексы таблицы `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Curators`
--
ALTER TABLE `Curators`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Departments`
--
ALTER TABLE `Departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Faculties`
--
ALTER TABLE `Faculties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Groups1`
--
ALTER TABLE `Groups1`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `GroupsCurators`
--
ALTER TABLE `GroupsCurators`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `GroupsLectures`
--
ALTER TABLE `GroupsLectures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `Lectures`
--
ALTER TABLE `Lectures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Subjects`
--
ALTER TABLE `Subjects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Departments`
--
ALTER TABLE `Departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `Faculties` (`id`);

--
-- Ограничения внешнего ключа таблицы `Groups1`
--
ALTER TABLE `Groups1`
  ADD CONSTRAINT `groups1_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`id`);

--
-- Ограничения внешнего ключа таблицы `GroupsCurators`
--
ALTER TABLE `GroupsCurators`
  ADD CONSTRAINT `groupscurators_ibfk_1` FOREIGN KEY (`CuratorId`) REFERENCES `Curators` (`id`),
  ADD CONSTRAINT `groupscurators_ibfk_2` FOREIGN KEY (`GroupId`) REFERENCES `Groups1` (`id`);

--
-- Ограничения внешнего ключа таблицы `GroupsLectures`
--
ALTER TABLE `GroupsLectures`
  ADD CONSTRAINT `groupslectures_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `Groups1` (`id`),
  ADD CONSTRAINT `groupslectures_ibfk_2` FOREIGN KEY (`LectureId`) REFERENCES `Lectures` (`id`);

--
-- Ограничения внешнего ключа таблицы `Lectures`
--
ALTER TABLE `Lectures`
  ADD CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`SubjectId`) REFERENCES `Subjects` (`id`),
  ADD CONSTRAINT `lectures_ibfk_2` FOREIGN KEY (`TeacherId`) REFERENCES `Teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
