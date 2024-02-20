-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 20 2024 г., 16:53
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
-- Структура таблицы `GroupsStudents`
--

CREATE TABLE `GroupsStudents` (
  `id` int NOT NULL,
  `GroupId` int NOT NULL,
  `StudentId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `GroupsStudents`
--

INSERT INTO `GroupsStudents` (`id`, `GroupId`, `StudentId`) VALUES
(1, 14, 1),
(2, 14, 2),
(3, 14, 3),
(4, 14, 4),
(5, 14, 5),
(6, 14, 6),
(7, 14, 7),
(8, 14, 8),
(9, 14, 9),
(10, 15, 10),
(11, 15, 11),
(12, 15, 12),
(13, 15, 13),
(14, 15, 14),
(15, 15, 15),
(16, 15, 16),
(17, 16, 17),
(18, 16, 18),
(19, 16, 19),
(20, 16, 20),
(21, 16, 21),
(22, 16, 22),
(23, 16, 23),
(24, 16, 24),
(25, 16, 25),
(26, 17, 26),
(27, 17, 27),
(28, 17, 28),
(29, 17, 29),
(30, 17, 30),
(31, 17, 31),
(32, 17, 32),
(33, 17, 33),
(34, 18, 34),
(35, 18, 35),
(36, 18, 36),
(37, 18, 37),
(38, 19, 38),
(39, 19, 39),
(40, 19, 40),
(41, 20, 41),
(42, 20, 42),
(43, 20, 43),
(44, 20, 44),
(45, 20, 45),
(46, 20, 46),
(47, 20, 47),
(48, 20, 48),
(49, 20, 49),
(50, 20, 50),
(51, 21, 51),
(52, 21, 52),
(53, 21, 53),
(54, 21, 54),
(55, 21, 55),
(56, 21, 56),
(57, 21, 57),
(58, 21, 58),
(59, 22, 59),
(60, 22, 60),
(61, 22, 61),
(62, 22, 62),
(63, 23, 63),
(64, 23, 64),
(65, 23, 65),
(66, 23, 66),
(67, 24, 67),
(68, 24, 68),
(69, 24, 69),
(70, 24, 70),
(71, 25, 71),
(72, 25, 72),
(73, 25, 73),
(74, 25, 74),
(75, 25, 75),
(76, 25, 76),
(77, 25, 77);

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
-- Структура таблицы `Students`
--

CREATE TABLE `Students` (
  `id` int NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Rating` int NOT NULL
) ;

--
-- Дамп данных таблицы `Students`
--

INSERT INTO `Students` (`id`, `Surname`, `Name`, `Rating`) VALUES
(1, 'Абрамян', 'Ренат', 4),
(2, 'Александрова', 'Анна', 5),
(3, 'Арестович', 'Ксения', 5),
(4, 'Байжаксин', 'Амир', 4),
(5, 'Барабанова', 'Полина', 3),
(6, 'Бастраков', 'Кирилл', 2),
(7, 'Батанина', 'Дарья', 0),
(8, 'Белошевская', 'Софья', 1),
(9, 'Бондаренко', 'Виктория', 3),
(10, 'Воловатова', 'Екатерина', 4),
(11, 'Володина', 'Виктория', 2),
(12, 'Воронцов', 'Константин', 3),
(13, 'Галкин', 'Денис', 4),
(14, 'Герасимова', 'Анастасия', 5),
(15, 'Герасимова', 'Екатерина', 3),
(16, 'Глухов', 'Дмитрий', 5),
(17, 'Гречаный', 'Артём', 4),
(18, 'Гурский', 'Милан', 5),
(19, 'Гусейнова', 'Кристина', 2),
(20, 'Давыдкина', 'Алина', 3),
(21, 'Джишкариани', 'Тина', 5),
(22, 'Дигурова', 'Карина', 2),
(23, 'Доманькина', 'Юлия', 4),
(24, 'Душечкина', 'Софья', 5),
(25, 'Есликова', 'Александра', 3),
(26, 'Жукова', 'Наталия', 2),
(27, 'Зуйкова', 'Екатерина', 1),
(28, 'Иванов', 'Дмитрий', 3),
(29, 'Калашникова', 'Наталия', 4),
(30, 'Калушин', 'Даниил', 5),
(31, 'Камнев', 'Егор', 3),
(32, 'Карлов', 'Илья', 4),
(33, 'Керницкий', 'Максим', 3),
(34, 'Кобзарь', 'Любовь', 2),
(35, 'Коваль', 'Егор', 3),
(36, 'Козлова', 'Анна', 4),
(37, 'Комерзан', 'Артём', 5),
(38, 'Конюх', 'Даниил', 3),
(39, 'Корнев', 'Егор', 2),
(40, 'Коробкин', 'Александр', 4),
(41, 'Костылев', 'Дмитрий', 5),
(42, 'Кузьмина', 'Анна', 3),
(43, 'Куклина', 'София', 0),
(44, 'Кучеров', 'Тимур', 1),
(45, 'Лебедева', 'Анжелика', 4),
(46, 'Леонидов', 'Ярослав', 4),
(47, 'Литвиненко', 'Анна', 3),
(48, 'Лихач', 'Александра', 4),
(49, 'Лопаева', 'Екатерина', 3),
(50, 'Мажаров', 'Сергей', 4),
(51, 'Макаренко', 'Виктория', 3),
(52, 'Максимова', 'Виктория', 2),
(53, 'Мальцев', 'Данил', 4),
(54, 'Маматова', 'Диана', 3),
(55, 'Мартынцова', 'Василиса', 4),
(56, 'Медова', 'Алина', 4),
(57, 'Мешкова', 'Виктория', 3),
(58, 'Мурашкина', 'Ксения', 4),
(59, 'Назаров', 'Артур', 1),
(60, 'Новиков', 'Денис', 5),
(61, 'Оруджова', 'Эсмира', 2),
(62, 'Отрадина', 'Анна', 3),
(63, 'Петров', 'Матвей', 2),
(64, 'Ромашкин', 'Андрей', 4),
(65, 'Самойлова', 'Елизавета', 2),
(66, 'Скрипина', 'Дарья', 1),
(67, 'Строганова', 'Арина', 3),
(68, 'Сулоева', 'Карина', 4),
(69, 'Толстиков', 'Павел', 3),
(70, 'Федкин', 'Вячеслав', 2),
(71, 'Хакимова', 'Камила', 1),
(72, 'Чэнь', 'Юньфей', 4),
(73, 'Чишковский', 'Денис', 3),
(74, 'Шаблий', 'Тимур', 4),
(75, 'Шишмолин', 'Устин', 3),
(76, 'Шишов', 'Даниил', 2),
(77, 'Шлык', 'Елена', 5);

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
-- Индексы таблицы `GroupsStudents`
--
ALTER TABLE `GroupsStudents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GroupId` (`GroupId`),
  ADD KEY `StudentId` (`StudentId`);

--
-- Индексы таблицы `Lectures`
--
ALTER TABLE `Lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SubjectId` (`SubjectId`),
  ADD KEY `TeacherId` (`TeacherId`);

--
-- Индексы таблицы `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT для таблицы `GroupsStudents`
--
ALTER TABLE `GroupsStudents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT для таблицы `Lectures`
--
ALTER TABLE `Lectures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Students`
--
ALTER TABLE `Students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
-- Ограничения внешнего ключа таблицы `GroupsStudents`
--
ALTER TABLE `GroupsStudents`
  ADD CONSTRAINT `groupsstudents_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `Groups1` (`id`),
  ADD CONSTRAINT `groupsstudents_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`id`);

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
