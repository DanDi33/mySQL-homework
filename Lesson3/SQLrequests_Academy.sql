create database if not exists Academy;
-- drop database Academy;
use Academy;
create table Curators (
	id int auto_increment primary key,
    Name varchar (20) not null,
    Surname varchar(30) not null
);
create table Faculties (
	id int auto_increment primary key,
    Financing decimal  not null check (Financing>=0) default 0,
    Name varchar (100) not null unique
);
create table Departments (
	id int auto_increment primary key,
	Name varchar (100) not null unique,
    Financing decimal  not null check (Financing>=0) default 0,
    FacultyId int not null,
    foreign key (FacultyId) references Faculties(id)
);
create table Groups1 (
	id int auto_increment primary key,
	Name varchar (10) not null unique,
    Year int not null check(Year>=1 and Year<=5),
    DepartmentId int not null,
    foreign key (DepartmentId) references Departments(id)
);
create table GroupsCurators (
	id int auto_increment primary key,
    CuratorId int not null,
    GroupId int not null,
    foreign key (CuratorId) references Curators(id),
    foreign key (GroupId) references Groups1(id)
);
create table Subjects (
	id int auto_increment primary key,
	Name varchar (100) not null unique
);
create table Teachers (
	id int auto_increment primary key,
	Name varchar (20) not null,
	Surname varchar(30) not null,
	Salary  decimal not null check (Salary>0)
);
create table Lectures (
	id int auto_increment primary key,
    LectureRoom varchar(30) not null,
    SubjectId int not null,
    TeacherId int not null,
    foreign key (SubjectId) references Subjects(id),
    foreign key (TeacherId) references Teachers(id)
);
create table GroupsLectures (
	id int auto_increment primary key,
    GroupId int not null,
    LectureId int not null,
	foreign key (GroupId) references Groups1(id),
    foreign key (LectureId) references Lectures(id)
);
insert into Teachers(Name,Surname,Salary)
values('Ivan','Ivanov',30000),
	('Ivan','Petrov',35000),
	('Sergey','Filatov',33000),
	('Tom','Ford',23000),
	('Paris','Filton',13000)
;
insert into Faculties (Name, Financing)
values('Еxact sciences', 1000000),
	('Humanities',1500000)
;
insert into Departments(Name,Financing,FacultyId)
values('Mathematic',300000, (select id from Faculties where Name = 'Еxact sciences'))
;
insert into Departments(Name,Financing,FacultyId)
values('physics',500000, (select id from Faculties where Name = 'Еxact sciences')),
	('chemistry',200000, (select id from Faculties where Name = 'Еxact sciences'))
;
insert into Curators (Name,Surname)
	select Name,Surname from Teachers where Salary>=30000;
    
insert into Groups1(Name,Year,DepartmentId)
values('M121',3,(select id from Departments where Name = 'Mathematic')),
	('M122',2,(select id from Departments where Name = 'Mathematic')),
	('M123',1,(select id from Departments where Name = 'Mathematic')),
	('P123',1,(select id from Departments where Name = 'physics')),
	('P122',2,(select id from Departments where Name = 'physics')),
	('P222',2,(select id from Departments where Name = 'physics')),
	('P121',3,(select id from Departments where Name = 'physics')),
	('C119',5,(select id from Departments where Name = 'chemistry')),
	('C120',4,(select id from Departments where Name = 'chemistry')),
	('C121',3,(select id from Departments where Name = 'chemistry')),
	('C122',2,(select id from Departments where Name = 'chemistry')),
	('C123',1,(select id from Departments where Name = 'chemistry'))
;
insert into GroupsCurators(CuratorId,GroupId)
values((select id from Curators where Surname='Ivanov'),(select id from Groups1 where Name='M121')),
	((select id from Curators where Surname='Ivanov'),(select id from Groups1 where Name='M122')),
	((select id from Curators where Surname='Ivanov'),(select id from Groups1 where Name='M123')),
	((select id from Curators where Surname='Petrov'),(select id from Groups1 where Name='P123')),
	((select id from Curators where Surname='Petrov'),(select id from Groups1 where Name='P122')),
	((select id from Curators where Surname='Petrov'),(select id from Groups1 where Name='P222')),
	((select id from Curators where Surname='Petrov'),(select id from Groups1 where Name='P121')),
	((select id from Curators where Surname='Filatov'),(select id from Groups1 where Name='C119')),
	((select id from Curators where Surname='Filatov'),(select id from Groups1 where Name='C120')),
	((select id from Curators where Surname='Filatov'),(select id from Groups1 where Name='C121')),
	((select id from Curators where Surname='Filatov'),(select id from Groups1 where Name='C122')),
	((select id from Curators where Surname='Filatov'),(select id from Groups1 where Name='C123'))
;
insert into Subjects (Name)
values('History'),
	('Physics'),
	('Chemistry'),
	('Algebra'),
	('Geometry'),
	('Philosophy'),
	('English'),
	('Design'),
	('Biology'),
	('Computer Science'),
	('Python'),
	('Databases'),
	('JavaScript'),
	('Literature')
    ;
    insert into Lectures (LectureRoom,SubjectId,TeacherId)
    values (101,(select id from Subjects where Name='History'),(select id from Teachers where Surname = 'Ivanov')),
		(102,(select id from Subjects where Name='Physics'),(select id from Teachers where Surname = 'Petrov')),
		(103,(select id from Subjects where Name='Chemistry'),(select id from Teachers where Surname = 'Petrov')),
		(104,(select id from Subjects where Name='Algebra'),(select id from Teachers where Surname = 'Petrov')),
		(105,(select id from Subjects where Name='Geometry'),(select id from Teachers where Surname = 'Petrov')),
		(201,(select id from Subjects where Name='Philosophy'),(select id from Teachers where Surname = 'Ivanov')),
		(202,(select id from Subjects where Name='English'),(select id from Teachers where Surname = 'Ivanov')),
		(203,(select id from Subjects where Name='Design'),(select id from Teachers where Surname = 'Filatov')),
		(204,(select id from Subjects where Name='Biology'),(select id from Teachers where Surname = 'Ivanov')),
		(205,(select id from Subjects where Name='Computer Science'),(select id from Teachers where Surname = 'Filatov')),
		(206,(select id from Subjects where Name='Python'),(select id from Teachers where Surname = 'Filatov')),
		(207,(select id from Subjects where Name='Databases'),(select id from Teachers where Surname = 'Filatov')),
		(301,(select id from Subjects where Name='JavaScript'),(select id from Teachers where Surname = 'Filatov')),
		(302,(select id from Subjects where Name='Literature'),(select id from Teachers where Surname = 'Ivanov'))
        ;
	insert into GroupsLectures (GroupId,LectureId)
    values((select id from Groups1 where Name = 'M121'),(select id from Lectures where LectureRoom = '101' )),
		((select id from Groups1 where Name = 'M121'),(select id from Lectures where LectureRoom = '102' )),
		((select id from Groups1 where Name = 'M121'),(select id from Lectures where LectureRoom = '103' )),
		((select id from Groups1 where Name = 'M121'),(select id from Lectures where LectureRoom = '104' )),
		((select id from Groups1 where Name = 'M122'),(select id from Lectures where LectureRoom = '102' )),
		((select id from Groups1 where Name = 'M122'),(select id from Lectures where LectureRoom = '104' )),
		((select id from Groups1 where Name = 'M122'),(select id from Lectures where LectureRoom = '201' )),
		((select id from Groups1 where Name = 'M122'),(select id from Lectures where LectureRoom = '203' )),
		((select id from Groups1 where Name = 'M123'),(select id from Lectures where LectureRoom = '105' )),
		((select id from Groups1 where Name = 'M123'),(select id from Lectures where LectureRoom = '201' )),
		((select id from Groups1 where Name = 'M123'),(select id from Lectures where LectureRoom = '202' )),
		((select id from Groups1 where Name = 'M123'),(select id from Lectures where LectureRoom = '203' )),
		((select id from Groups1 where Name = 'P123'),(select id from Lectures where LectureRoom = '204' )),
		((select id from Groups1 where Name = 'P123'),(select id from Lectures where LectureRoom = '205' )),
		((select id from Groups1 where Name = 'P123'),(select id from Lectures where LectureRoom = '206' )),
		((select id from Groups1 where Name = 'P123'),(select id from Lectures where LectureRoom = '207' )),
		((select id from Groups1 where Name = 'P122'),(select id from Lectures where LectureRoom = '301' )),
		((select id from Groups1 where Name = 'P122'),(select id from Lectures where LectureRoom = '302' )),
		((select id from Groups1 where Name = 'P122'),(select id from Lectures where LectureRoom = '101' )),
		((select id from Groups1 where Name = 'P122'),(select id from Lectures where LectureRoom = '102' )),
		((select id from Groups1 where Name = 'P222'),(select id from Lectures where LectureRoom = '103' )),
		((select id from Groups1 where Name = 'P222'),(select id from Lectures where LectureRoom = '201' )),
		((select id from Groups1 where Name = 'P222'),(select id from Lectures where LectureRoom = '204' )),
		((select id from Groups1 where Name = 'P222'),(select id from Lectures where LectureRoom = '301' )),
		((select id from Groups1 where Name = 'P121'),(select id from Lectures where LectureRoom = '302' )),
		((select id from Groups1 where Name = 'P121'),(select id from Lectures where LectureRoom = '102' )),
		((select id from Groups1 where Name = 'P121'),(select id from Lectures where LectureRoom = '202' )),
		((select id from Groups1 where Name = 'C119'),(select id from Lectures where LectureRoom = '104' )),
		((select id from Groups1 where Name = 'C119'),(select id from Lectures where LectureRoom = '105' )),
		((select id from Groups1 where Name = 'C119'),(select id from Lectures where LectureRoom = '206' )),
		((select id from Groups1 where Name = 'C119'),(select id from Lectures where LectureRoom = '207' )),
		((select id from Groups1 where Name = 'C120'),(select id from Lectures where LectureRoom = '203' )),
		((select id from Groups1 where Name = 'C120'),(select id from Lectures where LectureRoom = '202' )),
		((select id from Groups1 where Name = 'C120'),(select id from Lectures where LectureRoom = '201' )),
		((select id from Groups1 where Name = 'C121'),(select id from Lectures where LectureRoom = '105' )),
		((select id from Groups1 where Name = 'C121'),(select id from Lectures where LectureRoom = '104' )),
		((select id from Groups1 where Name = 'C121'),(select id from Lectures where LectureRoom = '102' )),
		((select id from Groups1 where Name = 'C121'),(select id from Lectures where LectureRoom = '103' )),
		((select id from Groups1 where Name = 'C122'),(select id from Lectures where LectureRoom = '101' )),
		((select id from Groups1 where Name = 'C122'),(select id from Lectures where LectureRoom = '301' )),
		((select id from Groups1 where Name = 'C122'),(select id from Lectures where LectureRoom = '201' )),
		((select id from Groups1 where Name = 'C122'),(select id from Lectures where LectureRoom = '302' )),
		((select id from Groups1 where Name = 'C122'),(select id from Lectures where LectureRoom = '102' )),
		((select id from Groups1 where Name = 'C123'),(select id from Lectures where LectureRoom = '202' )),
		((select id from Groups1 where Name = 'C123'),(select id from Lectures where LectureRoom = '203' )),
		((select id from Groups1 where Name = 'C123'),(select id from Lectures where LectureRoom = '204' )),
		((select id from Groups1 where Name = 'C123'),(select id from Lectures where LectureRoom = '205' )),
		((select id from Groups1 where Name = 'C123'),(select id from Lectures where LectureRoom = '206' ))
;

-- Part 1
-- 1
select T.Surname, T.Name, G.Name as Group_of_students 
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId = T.id
group by Surname,Name,Group_of_students 
order by Group_of_students 
;

    
-- 2
select F.Name as Faculty from Faculties as F
join Departments as D on FacultyId = F.id
where D.Financing>F.Financing
;

-- 3
select C.Surname, C.Name, G.Name as Groups_of_students
from GroupsCurators as GC
join Groups1 as G on GC.GroupId= G.id 
join Curators as C on GC.CuratorId = C.id
;
    
-- 4
select T.Surname, T.Name, G.Name as Group_of_students 
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId = T.id
group by Surname,Name,Group_of_students 
having Group_of_students = 'C123' 
;

-- 5
select T.Surname, T.Name, F.Name as Faculties
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Departments as D on DepartmentId = D.id
join Faculties as F on FacultyId = F.id
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId = T.id
group by Surname,Name,Faculties
;

-- 6
select D.Name, G.Name
from Groups1 as G
join Departments as D on DepartmentId = D.id
;

-- 7
select T.Surname,T.Name,S.Name as Subjects
from Lectures as L
join Teachers as T on L.TeacherId=T.id
join Subjects as S on L.SubjectId=S.id
having Surname='Filatov'
;

-- 8
select D.Name as Department, S.Name as Subject
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Departments as D on DepartmentId = D.id
join Lectures as L on GL.LectureId = L.id
join Subjects as S on L.TeacherId = S.id
group by Department,Subject
having S.Name='History'
;
-- 9
select G.Name as Grps, F.Name as Faculty
from Groups1 as G
join Departments as D on DepartmentId = D.id
right join Faculties as F on FacultyId=F.id
having Faculty = 'Humanities'
-- having Faculty = 'Еxact sciences'
;

-- 10
select G.Name as Grps, F.Name as Faculty
from Groups1 as G
join Departments as D on DepartmentId = D.id
join Faculties as F on FacultyId=F.id
where G.Year=5
;

-- 11
select T.Surname,T.Name,S.Name as Subjects,G.Name as Grps
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId = T.id
join Subjects as S on L.SubjectId=S.id
where L.LectureRoom = '201'
order by Grps
;

-- Part 2
create table Students (
id int auto_increment primary key,
	Surname varchar(30) not null,
	Name varchar(20) not null,
	Rating int not null,
	check (Rating>=0 and Rating<=5)
);
insert into Students (Surname,Name,Rating)
values('Абрамян', 'Ренат',4),
	('Александрова', 'Анна',5),
    ('Арестович','Ксения',5),
    ('Байжаксин', 'Амир',4),
    ('Барабанова', 'Полина',3),
    ('Бастраков', 'Кирилл',2),
    ('Батанина', 'Дарья',0),
    ('Белошевская', 'Софья',1),
    ('Бондаренко', 'Виктория',3),
    ('Воловатова', 'Екатерина',4),
    ('Володина', 'Виктория',2),
    ('Воронцов', 'Константин',3),
    ('Галкин', 'Денис',4),
    ('Герасимова', 'Анастасия',5),
    ('Герасимова', 'Екатерина',3),
    ('Глухов', 'Дмитрий',5),
    ('Гречаный', 'Артём', 4),
    ('Гурский', 'Милан',5),
    ('Гусейнова', 'Кристина', 2),
    ('Давыдкина', 'Алина',3),
    ('Джишкариани', 'Тина',5),
    ('Дигурова', 'Карина',2),
    ('Доманькина', 'Юлия',4),
    ('Душечкина', 'Софья',5),
    ('Есликова', 'Александра',3),
    ('Жукова', 'Наталия',2),
    ('Зуйкова', 'Екатерина',1),
    ('Иванов', 'Дмитрий',3),
    ('Калашникова','Наталия',4),
    ('Калушин', 'Даниил',5),
    ('Камнев', 'Егор',3),
    ('Карлов', 'Илья', 4),
    ('Керницкий', 'Максим',3),
    ('Кобзарь', 'Любовь',2),
    ('Коваль', 'Егор',3),
    ('Козлова', 'Анна',4),
    ('Комерзан', 'Артём',5),
    ('Конюх', 'Даниил',3),
    ('Корнев', 'Егор',2),
	('Коробкин', 'Александр',4),
    ('Костылев', 'Дмитрий', 5),
    ('Кузьмина', 'Анна',3),
    ('Куклина', 'София',0),
    ('Кучеров', 'Тимур',1),
    ('Лебедева', 'Анжелика',4),
    ('Леонидов', 'Ярослав',4),
    ('Литвиненко', 'Анна',3),
    ('Лихач', 'Александра',4),
    ('Лопаева', 'Екатерина',3),
    ('Мажаров', 'Сергей',4),
    ('Макаренко', 'Виктория',3),
    ('Максимова', 'Виктория',2),
    ('Мальцев', 'Данил',4),
    ('Маматова', 'Диана',3),
    ('Мартынцова', 'Василиса',4),
    ('Медова', 'Алина',4),
    ('Мешкова', 'Виктория',3),
    ('Мурашкина', 'Ксения',4),
    ('Назаров', 'Артур',1),
    ('Новиков', 'Денис',5),
    ('Оруджова', 'Эсмира',2),
    ('Отрадина', 'Анна',3),
    ('Петров', 'Матвей',2),
    ('Ромашкин','Андрей',4),
    ('Самойлова', 'Елизавета',2),
    ('Скрипина', 'Дарья',1),
    ('Строганова','Арина',3),
    ('Сулоева', 'Карина', 4),
    ('Толстиков', 'Павел',3),
    ('Федкин', 'Вячеслав', 2),
    ('Хакимова', 'Камила', 1),
    ('Чэнь', 'Юньфей',4),
    ('Чишковский', 'Денис',3),
    ('Шаблий', 'Тимур',4),
    ('Шишмолин', 'Устин',3),
    ('Шишов', 'Даниил',2),
    ('Шлык', 'Елена',5)
;

create table GroupsStudents (
	id int primary key auto_increment,
	GroupId int not null,
	StudentId int not null,
    foreign key (GroupId) references Groups1(id),
    foreign key (StudentId) references Students(id)
);

insert into GroupsStudents(GroupId,StudentId)
values((select id from Groups1 where name='M121'),1),
	((select id from Groups1 where name='M121'),2),
	((select id from Groups1 where name='M121'),3),
	((select id from Groups1 where name='M121'),4),
	((select id from Groups1 where name='M121'),5),
	((select id from Groups1 where name='M121'),6),
	((select id from Groups1 where name='M121'),7),
	((select id from Groups1 where name='M121'),8),
	((select id from Groups1 where name='M121'),9),
	((select id from Groups1 where name='M122'),10),
	((select id from Groups1 where name='M122'),11),
	((select id from Groups1 where name='M122'),12),
	((select id from Groups1 where name='M122'),13),
	((select id from Groups1 where name='M122'),14),
	((select id from Groups1 where name='M122'),15),
	((select id from Groups1 where name='M122'),16),
	((select id from Groups1 where name='M123'),17),
	((select id from Groups1 where name='M123'),18),
	((select id from Groups1 where name='M123'),19),
	((select id from Groups1 where name='M123'),20),
	((select id from Groups1 where name='M123'),21),
	((select id from Groups1 where name='M123'),22),
	((select id from Groups1 where name='M123'),23),
	((select id from Groups1 where name='M123'),24),
	((select id from Groups1 where name='M123'),25),
	((select id from Groups1 where name='P123'),26),
	((select id from Groups1 where name='P123'),27),
	((select id from Groups1 where name='P123'),28),
	((select id from Groups1 where name='P123'),29),
	((select id from Groups1 where name='P123'),30),
	((select id from Groups1 where name='P123'),31),
	((select id from Groups1 where name='P123'),32),
	((select id from Groups1 where name='P123'),33),
	((select id from Groups1 where name='P122'),34),
	((select id from Groups1 where name='P122'),35),
	((select id from Groups1 where name='P122'),36),
	((select id from Groups1 where name='P122'),37),
	((select id from Groups1 where name='P222'),38),
	((select id from Groups1 where name='P222'),39),
	((select id from Groups1 where name='P222'),40),
	((select id from Groups1 where name='P121'),41),
	((select id from Groups1 where name='P121'),42),
	((select id from Groups1 where name='P121'),43),
	((select id from Groups1 where name='P121'),44),
	((select id from Groups1 where name='P121'),45),
	((select id from Groups1 where name='P121'),46),
	((select id from Groups1 where name='P121'),47),
	((select id from Groups1 where name='P121'),48),
	((select id from Groups1 where name='P121'),49),
	((select id from Groups1 where name='P121'),50),
	((select id from Groups1 where name='C119'),51),
	((select id from Groups1 where name='C119'),52),
	((select id from Groups1 where name='C119'),53),
	((select id from Groups1 where name='C119'),54),
	((select id from Groups1 where name='C119'),55),
	((select id from Groups1 where name='C119'),56),
	((select id from Groups1 where name='C119'),57),
	((select id from Groups1 where name='C119'),58),
	((select id from Groups1 where name='C120'),59),
	((select id from Groups1 where name='C120'),60),
	((select id from Groups1 where name='C120'),61),
	((select id from Groups1 where name='C120'),62),
	((select id from Groups1 where name='C121'),63),
	((select id from Groups1 where name='C121'),64),
	((select id from Groups1 where name='C121'),65),
	((select id from Groups1 where name='C121'),66),
	((select id from Groups1 where name='C122'),67),
	((select id from Groups1 where name='C122'),68),
	((select id from Groups1 where name='C122'),69),
	((select id from Groups1 where name='C122'),70),
	((select id from Groups1 where name='C123'),71),
	((select id from Groups1 where name='C123'),72),
	((select id from Groups1 where name='C123'),73),
	((select id from Groups1 where name='C123'),74),
	((select id from Groups1 where name='C123'),75),
	((select id from Groups1 where name='C123'),76),
	((select id from Groups1 where name='C123'),77)
;

-- drop table GroupsStudents;
-- 1.1
select D.Name as Department, count(distinct L.TeacherId) as 'Quantity of Teachers'
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Departments as D on DepartmentId = D.id
join Lectures as L on GL.LectureId = L.id
group by Department
;

-- 1.2
select T.Surname, T.Name,count(GL.LectureId) as 'Quantity of Lectures'
from GroupsLectures as GL
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId = T.id
group by Surname, Name
having Surname = 'Petrov'
;

-- 1.3
select L.LectureRoom, count(GL.LectureId) as 'Quantity of lectures'
from GroupsLectures as GL
join Lectures as L on GL.LectureId = L.id
group by LectureRoom
having LectureRoom = '102'
;

-- 1.4
select L.LectureRoom, count(GL.LectureId) as 'Quantity of lectures'
from GroupsLectures as GL
join Lectures as L on GL.LectureId = L.id
group by LectureRoom
;

-- 1.5
select T.Surname, T.Name, count(GS.StudentId) as 'Quantity of Students'
from GroupsLectures as GL
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId = T.id
join Groups1 as G on GL.GroupId = G.id
join GroupsStudents as GS on GS.GroupId=G.id
group by Surname,Name
having Surname='Filatov' and Name='Sergey'
;

-- 1.6
select F.Name as Faculty, avg(T.Salary) as 'AVG salary'
from GroupsLectures as GL
join Groups1 as G on GL.GroupId = G.id
join Departments as D on G.DepartmentId = D.id
join Faculties as F on D.FacultyId=F.id
join Lectures as L on GL.LectureId = L.id
join Teachers as T on L.TeacherId=T.id
group by Faculty
;

-- 1.7
select G.Name as 'Groups', count(GS.StudentId) as Quantity
from GroupsStudents as GS
join Groups1 as G on GS.GroupId = G.id
group by G.Name
;

-- 1.8
select avg(Financing) as AVG_fin
from Departments
;

-- 1.9
select concat(Surname,' ', T.Name) as Fullname, count(L.SubjectId) as 'Quantity of Lectures'
from Teachers as T
join Lectures as L on L.TeacherId = T.id
group by Fullname
;

-- 1.10
-- 1.11
select L.LectureRoom, count(L.SubjectId) as 'Quntity of Subjects'
from Lectures as L
join GroupsLectures as GL on GL.LectureId = L.id
join Groups1 as G on GL.GroupId = G.id
join Departments as D on G.DepartmentId = D.id
group by LectureRoom
order by LectureRoom
;

-- 1.12
select F.Name, count(distinct L.SubjectId) as 'Quntity of Subjects'
from Lectures as L
join GroupsLectures as GL on GL.LectureId = L.id
join Groups1 as G on GL.GroupId = G.id
join Departments as D on G.DepartmentId = D.id
join Faculties as F on D.FacultyId = F.id
group by Name
;

-- 1.13
select L.LectureRoom, concat(T.Surname,' ', T.Name) as Fullname, count(L.SubjectId) as 'Quntity of Subjects'
from Lectures as L
join GroupsLectures as GL on GL.LectureId = L.id
join Groups1 as G on GL.GroupId = G.id
join Departments as D on G.DepartmentId = D.id
join Teachers as T on L.TeacherId = T.id
group by LectureRoom, Fullname
order by LectureRoom
;

-- 2.1
-- 2.2
-- 2.3
select G.Name as 'Groups', avg(S.Rating) as 'AVG rating'
from GroupsStudents as GS
join Groups1 as G on GS.GroupId = G.id
join Students as S on GS.StudentId = S.id
group by G.Name
having avg(S.Rating)> 
	(select avg(S.Rating)
		from GroupsStudents as GS
		join Groups1 as G on GS.GroupId = G.id
		join Students as S on GS.StudentId = S.id
		group by G.Name
		having G.Name = 'P222')
;

-- 2.4
select concat(Name,' ',Surname) as Fullname, salary 
from Teachers as T
where salary>(
	select avg(salary) 
    from Teachers
    );

-- 2.5
select G.Name, count(GS.CuratorId) as 'Quantity of curators'
from GroupsCurators as GS 
join Groups1 as G on GS.GroupId=G.id
group by Name
having count(GS.CuratorId)>1
;

-- 2.6
select G.Name, avg(S.Rating) as GrpRating from
GroupsStudents as GS
join Students as S on GS.StudentId = S.id
join Groups1 as G on GS.GroupId = G.id
group by Name
having GrpRating<(
	select min(TabRating.GrpRating) 
	from
	(select G.Name, avg(S.Rating) as GrpRating 
		from GroupsStudents as GS
		join Students as S on GS.StudentId = S.id
		join Groups1 as G on GS.GroupId = G.id
		where G.Year = 5
		group by Name) as TabRating
	);
    
-- 2.7

-- 2.8
select S.Name as Subject, concat(Surname,' ', T.Name) as Fullname, count(L.SubjectId) as 'Quantity of Lectures'
from Teachers as T
join Lectures as L on L.TeacherId = T.id
join Subjects as S on L.SubjectId=S.id
join GroupsLectures as GL on GL.LectureId = L.id
group by Subject, Fullname
;

-- 2.9
select S.Name as Subject, count(L.SubjectId) as 'Quantity of Lectures'
from Lectures as L 
join Subjects as S on L.SubjectId=S.id
join GroupsLectures as GL on GL.LectureId = L.id
group by Subject
order by count(L.SubjectId) asc limit 1
;

-- 2.10
select D.Name as Department, count(GL.LectureId) as 'Quantity of Lectures', count(distinct GS.StudentId) as 'Quantity of students'
from Lectures as L 
join GroupsLectures as GL on GL.LectureId = L.id
join Groups1 as G on GL.groupId = G.id
join Departments as D on G.DepartmentId = D.id
join GroupsStudents as GS on GS.GroupId = G.id
group by Department
;