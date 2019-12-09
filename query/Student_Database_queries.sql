--EXEC sp_rename 'Specialty', 'Speciality'

/*
* Создание трех таблиц для задания 10.1
*/

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
	edustatus CHAR(20) NOT NULL, CHECK(study_status IN ('study','finish','expelled')),
	CONSTRAINT FK_sudent FOREiGN KEY(sudent) REFERENCES student (ID_Isikukood),
	CONSTRAINT FK_schoolGroup FOREiGN KEY(schoolGroup) REFERENCES Groups (id_group))

--Insert data
INSERT INTO Speciality (name_spec) VALUES('Noorem tarkvaraarendaja'),('keevitaja')
INSERT INTO Groups VALUES ('JPTVR18','pohikool','russian','Johvi',DEFAULT,10000)
INSERT INTO Groups VALUES ('JKLKV19','pohikool','english','Tallinn',DEFAULT,10001)
INSERT INTO Learning VALUES (123214392,'JPTVR18','2018-09-09',NULL,'study'),
	(123214352,'KTVRI17','2017-09-09','2017-12-09','finish'),
	(123534645,'JKTBR19','2017-09-09',DEFAULT,'expelled')
























