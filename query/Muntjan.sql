--EXEC sp_rename 'Specialty', 'Speciality'
select * from Groups
select * from Learning
select * from Speciality
select * from students
/*
* Создание трех таблиц для задания 10.1
*/
drop table Department
--Table Students
CREATE TABLE Students(ID_Isikukood nchar(11) not null constraint PK_ID_Isikukood PRIMARY KEY,
					FirstName varchar(30),
					LastName varchar(30),
					Adress varchar(25),
					Phone varchar(20),
					Email varchar(50)) 

--Table Speciality
CREATE TABLE Speciality (id_speciality INTEGER IDENTITY(10000,1) NOT NULL CONSTRAINT PK_id_speciality PRIMARY KEY, name_spec CHAR(59) NOT NULL)

--Table Groups
CREATE TABLE Groups(id_group CHAR(10) NOT NULL CONSTRAINT PK_id_group PRIMARY KEY,
	school CHAR(25) NOT NULL DEFAULT 'pohikool', CHECK (school IN ('pohikool', 'kesk kool')),
	education_lang CHAR(25) NOT NULL DEFAULT 'russian', CHECK (education_lang IN ('russian', 'eesti','english')),
	city CHAR(15) NOT NULL DEFAULT 'Johvi', CHECK (city IN ('Johvi', 'Sillamae','Tallinn')),
	groupDate_reg DATE NOT NULL DEFAULT getDate(),
	Speciality INTEGER NOT NULL,
	CONSTRAINT FK_speciality FOREIGN KEY(Speciality) REFERENCES Speciality (id_speciality))

--Table study
CREATE TABLE Learning(Student nchar(11) NOT NULL,
	Groups CHAR(10) NOT NULL,
	edustart_date DATE NOT NULL DEFAULT getDate(),
	eduend_date DATE NULL DEFAULT getDate(),
	edustatus CHAR(20) NOT NULL, CHECK(edustatus IN ('study','finish','expelled')),
	CONSTRAINT FK_student FOREIGN KEY(Student) REFERENCES Students(ID_Isikukood),
	CONSTRAINT FK_Group FOREIGN KEY(Groups) REFERENCES Groups(id_group))

CREATE TABLE Department (Dept_ID INT IDENTITY (10000,10) NOT NULL CONSTRAINT PK_Dep_ID PRIMARY KEY, Dept_Name NVARCHAR(40) NOT NULL,
 Principal NVARCHAR(60) NOT NULL, TelNumber NVARCHAR(25), Reg_Date DATE DEFAULT GETDATE());

 INSERT INTO Department (Dept_Name,Principal,TelNumber,Reg_Date) VALUES ('IT and Multimedia', 'Ilja Varlamov', '+37253875474', DEFAULT),
('Construction and Wood', 'Timofei Egorov', '+37256897414', DEFAULT), ('Catering', 'Vasja Pupkin', '+37251478965', DEFAULT);

ALTER TABLE  DEPARTMENT drop constraint PK_Dep_ID

ALTER TABLE Speciality ADD Dept_ID INT NULL, CONSTRAINT FK_Dept_ID FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID);


select * from Department

delete from Department
--Queries
--1
SELECT firstName, lastName FROM Students INNER JOIN Learning ON StudentS.ID_Isikukood = Learning.Student;
--2
SELECT ID_group, COUNT(ID_group) AS Students FROM Training GROUP BY Group_ID;
--3
SELECT ID_group, COUNT(ID_group) AS Finish_Study FROM TLearning WHERE edustatus = 'Finished' GROUP BY ID_group;
--4
SELECT ID_group, COUNT(ID_group) FROM Learning WHERE ID_group IN (SELECT ID_group FROM Groups WHERE id_speciality IN 
(SELECT id_speciality FROM Speciality)) GROUP BY ID_group;
--5
SELECT eduand, COUNT(Students) FROM Learning WHERE ID_group IN (SELECT ID_group FROM Groups WHERE id_speciality IN 
(SELECT id_speciality FROM Speciality)) GROUP BY eduend;

--Insert data
INSERT INTO students VALUES('12345678907','Andrei','Pupkin','Narva-20','32758276159','pupkin2278@mail.com'),
							('1234568937','Borja','Vaskin','Narva-21','32758296159','pupkin2279@mail.com'),
							('12345643907','Lena','Lahina','Narva-22','32753276159','pupkin2280@mail.com')
INSERT INTO Speciality (name_spec) VALUES('Noorem tarkvaraarendaja'),('keevitaja')
INSERT INTO Groups VALUES ('JPTVR18','pohikool','russian','Johvi',DEFAULT,10000)
INSERT INTO Groups VALUES ('JKLKV19','pohikool','eesti','Sillamae',DEFAULT,10001)
INSERT INTO Learning VALUES ('12345678907','JPTVR18','2018-09-09',NULL,'study'),
	('1234568937','JKLKV19','2017-12-09',default,'finish'),
	('12345643907','JKLKV19','2017-09-09',DEFAULT,'expelled')


























