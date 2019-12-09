--EXEC sp_rename 'Specialty', 'Speciality'

/*
* Создание трех таблиц для задания 10.1
*/
drop table Learning
--Table Students
CREATE TABLE students(ID_Isikukood nchar(11) not null constraint PK_ID_Isikukood PRIMARY KEY,
					FirstName varchar(30),
					LastName varchar(30),
					Adress varchar(25),
					Phone varchar(20),
					Email varchar(50)) 

--Table Speciality
CREATE TABLE Speciality (id_speciality INTEGER IDENTITY(10000,1) NOT NULL CONSTRAINT PK_id_speciality PRIMARY KEY, name_spec CHAR(59) NOT NULL)

--Table Groups
CREATE TABLE Groups (id_group CHAR(10) NOT NULL CONSTRAINT PK_id_group PRIMARY KEY,
	school CHAR(25) NOT NULL DEFAULT 'pohikool', CHECK (school IN ('pohikool', 'kesk kool')),
	education_lang CHAR(25) NOT NULL DEFAULT 'russian', CHECK (education_lang IN ('russian', 'eesti')),
	city CHAR(15) NOT NULL DEFAULT 'Johvi', CHECK (city IN ('Johvi', 'Sillamae')),
	groupDate_reg DATE NOT NULL DEFAULT getDate(),
	Speciality INTEGER NOT NULL,
	CONSTRAINT FK_speciality FOREIGN KEY(speciality) REFERENCES speciality (id_profession))

--Table study
CREATE TABLE Learning(sudent varchar(20) NOT NULL,
	schoolGroup CHAR(10) NOT NULL,
	edustart_date DATE NOT NULL DEFAULT getDate(),
	eduend_date DATE NULL DEFAULT getDate(),
	edustatus CHAR(20) NOT NULL, CHECK(edustatus IN ('study','finish','expelled'))),
	CONSTRAINT FK_student FOREIGN KEY(sudents) REFERENCES students(ID_Isikukood)
	CONSTRAINT FK_schoolGroup FOREiGN KEY(schoolGroup) REFERENCES Groups(id_group))

--Insert data
INSERT INTO students VALUES('12345678907','Andrei','Pupkin','Narva-20','32758276159','pupkin2278@mail.com'),
							('1234568937','Borja','Vaskin','Narva-21','32758296159','pupkin2279@mail.com'),
							('12345643907','Lena','Lahina','Narva-22','32753276159','pupkin2280@mail.com')
INSERT INTO Speciality (name_spec) VALUES('Noorem tarkvaraarendaja'),('keevitaja')
INSERT INTO Groups VALUES ('JPTVR18','pohikool','russian','Johvi',DEFAULT,10000)
INSERT INTO Groups VALUES ('JKLKV19','pohikool','english','Tallinn',DEFAULT,10001)
INSERT INTO Learning VALUES (123214392,'JPTVR18','2018-09-09',NULL,'study'),
	(123214352,'KTVRI17','2017-09-09','2017-12-09','finish'),
	(123534645,'JKTBR19','2017-09-09',DEFAULT,'expelled')
























