
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
    `firstName` VARCHAR(30),
    `patronymic` VARCHAR(30)
);
insert FIO (lastName,firstName,patronymic)
values
	('Данилов','Дмитрий','Олегович'),
	('Белякова','Оксана','Анатольевна');
create table Type(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(15) NOT NULL);
insert Types(type)
values ('Сотовый'),
	('Рабочий'),
	('Домашний');

CREATE TABLE `Companies`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `companyName` VARCHAR(30) NOT NULL
);
insert Companies (companyName)
values
('УК Люкс'),
('Оникс'),
('БэстСтрой'),
('ГУК'),
('КЭЧ'),
('ТСН «Высотка»'),
('ТСЖ "Кондоминиум №1'),
('ТСЖ "Большие Ременники"'),
('Горизонт'),
('АДС')
;

CREATE TABLE `Workers`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `companyId` INT NOT NULL,
    `fioId` INT NOT NULL,
    `professionId` INT NOT NULL,
    FOREIGN KEY(`companyId`) REFERENCES `Companies`(`id`),
    FOREIGN KEY(`professionId`) REFERENCES `Professions`(`id`),
    FOREIGN KEY(`fioId`) REFERENCES `FIO`(`id`)
);
insert Workers (companyId,fioId,professionId)
values
(10,1,1),
(10,2,3),
(9,2,2);

CREATE TABLE `Phones`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `typeId` int NOT NULL,
    `number` VARCHAR(25) NOT NULL unique,
    fioId int,
    FOREIGN KEY(fioId) REFERENCES FIO(id)
);
insert Phones (typeId,number,fioId)
values
	(2,'544935',null),
	(2,'366958',null),
	(1,'9005551111',2),
	(1,'9206262222',1);
create table WorkPhones(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `workerId` int NOT NULL,
    `phoneId` int NOT NULL,
    FOREIGN KEY(workerId) REFERENCES Workers(id),
    FOREIGN KEY(phoneId) REFERENCES Phones(id)
    );
insert WorkPhones (workerId,phoneId)
values (1,2),
	(2,2),
	(3,1);

select PhoneBook.Workers.id,
PhoneBook.Companies.companyName as Company,
PhoneBook.Professions.profession as Profession,
PhoneBook.FIO.lastName as LastName,
PhoneBook.FIO.firstName as FirstName,
PhoneBook.FIO.patronymic as Patronymic,
PhoneBook.Types.type as Type,
PhoneBook.Phones.number as Number
from PhoneBook.Workers,PhoneBook.FIO,PhoneBook.Professions,PhoneBook.Phones,PhoneBook.WorkPhone,PhoneBook.Companies,PhoneBook.Types
where PhoneBook.Workers.companyId = PhoneBook.Companies.id
and PhoneBook.Workers.fioId = PhoneBook.FIO.id
and PhoneBook.Workers.professionId = PhoneBook.Professions.id
and PhoneBook.WorkPhone.phoneId = PhoneBook.Phones.id
and PhoneBook.WorkPhone.workerId = PhoneBook.Workers.id
and PhoneBook.Phones.typeId = PhoneBook.Types.id
;
select PhoneBook.FIO.id, 
	PhoneBook.FIO.lastName,
    PhoneBook.FIO.firstName,
    PhoneBook.FIO.patronymic,
    PhoneBook.Types.type,
    PhoneBook.Phones.number
from PhoneBook.FIO,PhoneBook.Phones, PhoneBook.Types
where PhoneBook.Phones.fioId = PhoneBook.FIO.id
and PhoneBook.Phones.typeId = PhoneBook.Types.id
;
