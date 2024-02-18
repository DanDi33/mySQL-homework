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