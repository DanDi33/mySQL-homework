
CREATE TABLE `Professions`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `profession` VARCHAR(50) NOT NULL
);
insert Professions (profession)
values
	('Директор'),
	('Исполнительный директор'),
	('Диспетчер');
CREATE TABLE `FIO`(
    `id` int AUTO_INCREMENT PRIMARY KEY,
    `lastName` VARCHAR(30) NOT NULL,
    `firstName` VARCHAR(30) NOT NULL,
    `patronymic` VARCHAR(30) NOT NULL
);
insert FIO (lastName,firstName,patronymic)
values
	('Данилов','Дмитрий','Олегович'),
	('Белякова','Оксана','Анатольевна');
CREATE TABLE `Phones`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(15) NOT NULL,
    `number` VARCHAR(25) NOT NULL
);
insert Phones (type,number)
values
	('раб','544935'),
	('раб','366958'),
	('сот','9005551111'),
	('сот','9206262222');
CREATE TABLE `Companies`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(15) NOT NULL,
    `companyName` VARCHAR(30) NOT NULL
);
insert Companies (type,companyName)
values
('УК','УК Люкс'),
('УК','Оникс'),
('УК','БэстСтрой'),
('УК','ГУК'),
('УК','КЭЧ'),
('ТСЖ','ТСН «Высотка»'),
('ТСЖ','ТСЖ "Кондоминиум №1'),
('ТСЖ','ТСЖ "Большие Ременники"'),
('Подрядчик','Горизонт'),
('Подрядчик','АДС')
;

CREATE TABLE `Workers`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `companyId` INT NOT NULL,
    `fioId` INT NOT NULL,
    `professionId` INT NOT NULL,
    `phoneId` INT,
    FOREIGN KEY(`companyId`) REFERENCES `Company`(`id`),
    FOREIGN KEY(`phoneId`) REFERENCES `Phones`(`id`),
    FOREIGN KEY(`professionId`) REFERENCES `Professions`(`id`),
    FOREIGN KEY(`fioId`) REFERENCES `FIO`(`id`)
);
insert Workers (companyId,fioId,professionId,phoneId)
values
(10,1,1,4),
(10,1,1,2),
(10,2,3,2),
(9,2,2,1),
(9,2,2,3);

select PhoneBook.Workers.id,
PhoneBook.Companies.companyName as Company,
PhoneBook.Professions.profession as Profession,
PhoneBook.FIO.lastName as LastName,
PhoneBook.FIO.firstName as FirstName,
PhoneBook.FIO.patronymic as Patronymic,
PhoneBook.Phones.number as Number
from PhoneBook.Workers,PhoneBook.FIO,PhoneBook.Professions,PhoneBook.Phones,PhoneBook.Companies
where PhoneBook.Workers.companyId = PhoneBook.Companies.id
and PhoneBook.Workers.fioId = PhoneBook.FIO.id
and PhoneBook.Workers.professionId = PhoneBook.Professions.id
and PhoneBook.Workers.phoneId = PhoneBook.Phones.id;
select PhoneBook.Phones.number as Number
from PhoneBook.Workers,PhoneBook.FIO,PhoneBook.Phones,PhoneBook.Companies
where PhoneBook.Workers.companyId = PhoneBook.Companies.id
and PhoneBook.Workers.phoneId = PhoneBook.Phones.id
and PhoneBook.Workers.fioId = PhoneBook.FIO.id
and PhoneBook.FIO.lastName = 'Белякова'
and PhoneBook.Companies.companyName = 'АДС'
;