--create database Test_MA

use Test_MA

/*CREATE TABLE [Сотрудники](
  [Табельный номер] int,
  [ФИО] nvarchar(30),
  [Дата рождения] date,
  [E-mail] nvarchar(30),
  [Должность] nvarchar(30),
  [Отдел] nvarchar(30)
)

DROP TABLE [Сотрудники]*/
/*
CREATE TABLE Employees(
  ID int,
  Name nvarchar(30),
  Birthday date,
  Email nvarchar(30),
  Position nvarchar(30),
  Department nvarchar(30)
)

-- обновление поля ID
ALTER TABLE Employees ALTER COLUMN ID int NOT NULL

-- обновление поля Name
ALTER TABLE Employees ALTER COLUMN Name nvarchar(30) NOT NULL

ALTER TABLE Employees ALTER COLUMN ID int NOT NULL

INSERT Employees(ID,Position,Department,Name) VALUES
(1000,N'Директор',N'Администрация',N'Иванов И.И.'),
(1001,N'Программист',N'ИТ',N'Петров П.П.'),
(1002,N'Бухгалтер',N'Бухгалтерия',N'Сидоров С.С.'),
(1003,N'Старший программист',N'ИТ',N'Андреев А.А.')
*/
drop table Employees
/*
CREATE TABLE Employees(
  ID int NOT NULL,
  Name nvarchar(30) NOT NULL,
  Birthday date,
  Email nvarchar(30),
  Position nvarchar(30),
  Department nvarchar(30)
)

ALTER TABLE Employees ALTER COLUMN Name nvarchar(30) NULL

ALTER TABLE Employees ALTER COLUMN Name nvarchar(30)

ALTER TABLE Employees ADD CONSTRAINT PK_Employees PRIMARY KEY(ID)

DROP TABLE Employees
*/
/*
CREATE TABLE Employees(
  ID int NOT NULL,
  Name nvarchar(30) NOT NULL,
  Birthday date,
  Email nvarchar(30),
  Position nvarchar(30),
  Department nvarchar(30),
  CONSTRAINT PK_Employees PRIMARY KEY(ID) -- описываем PK после всех полей, как ограничение
)

INSERT Employees(ID,Position,Department,Name) VALUES
(1000,N'Директор',N'Администрация',N'Иванов И.И.'),
(1001,N'Программист',N'ИТ',N'Петров П.П.'),
(1002,N'Бухгалтер',N'Бухгалтерия',N'Сидоров С.С.'),
(1003,N'Старший программист',N'ИТ',N'Андреев А.А.')

ALTER TABLE Employees DROP CONSTRAINT PK_Employees
*/
/*
CREATE TABLE #Temp(
  ID int,
  Name nvarchar(30)
)

SELECT ID,Name
INTO #Temp
FROM Employees

DROP TABLE #Temp
*/
CREATE TABLE Positions(
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Positions PRIMARY KEY,
  Name nvarchar(30) NOT NULL
)

CREATE TABLE Departments(
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Departments PRIMARY KEY,
  Name nvarchar(30) NOT NULL
)


INSERT Positions(Name)
SELECT DISTINCT Position
FROM Employees
WHERE Position IS NOT NULL

INSERT Departments(Name)
SELECT DISTINCT Department
FROM Employees
WHERE Department IS NOT NULL

SELECT * FROM Positions

SELECT * FROM Departments
/*
-- добавляем поле для ID должности
ALTER TABLE Employees ADD PositionID int
-- добавляем поле для ID отдела
ALTER TABLE Employees ADD DepartmentID int
--Одной командой
ALTER TABLE Employees ADD PositionID int, DepartmentID int

ALTER TABLE Employees ADD CONSTRAINT FK_Employees_PositionID
FOREIGN KEY(PositionID) REFERENCES Positions(ID)

ALTER TABLE Employees ADD CONSTRAINT FK_Employees_DepartmentID
FOREIGN KEY(DepartmentID) REFERENCES Departments(ID)

UPDATE e
SET
  PositionID=(SELECT ID FROM Positions WHERE Name=e.Position),
  DepartmentID=(SELECT ID FROM Departments WHERE Name=e.Department)
FROM Employees e

select * from Employees

ALTER TABLE Employees DROP COLUMN Position,Department

SELECT e.ID,e.Name,p.Name PositionName,d.Name DepartmentName
FROM Employees e
LEFT JOIN Departments d ON d.ID=e.DepartmentID
LEFT JOIN Positions p ON p.ID=e.PositionID

ALTER TABLE Employees ADD ManagerID int

ALTER TABLE Employees ADD CONSTRAINT FK_Employees_ManagerID
FOREIGN KEY (ManagerID) REFERENCES Employees(ID)
*/
drop table Employees
/*
CREATE TABLE Employees(
  ID int NOT NULL,
  Name nvarchar(30),
  Birthday date,
  Email nvarchar(30),
  PositionID int,
  DepartmentID int,
  ManagerID int,
CONSTRAINT PK_Employees PRIMARY KEY (ID),
CONSTRAINT FK_Employees_DepartmentID FOREIGN KEY(DepartmentID) REFERENCES Departments(ID)
ON DELETE CASCADE,
CONSTRAINT FK_Employees_PositionID FOREIGN KEY(PositionID) REFERENCES Positions(ID),
CONSTRAINT FK_Employees_ManagerID FOREIGN KEY (ManagerID) REFERENCES Employees(ID)
)

INSERT Employees (ID,Name,Birthday,PositionID,DepartmentID,ManagerID)VALUES
(1000,N'Иванов И.И.','19550219',2,1,NULL),
(1001,N'Петров П.П.','19831203',3,3,1003),
(1002,N'Сидоров С.С.','19760607',1,2,1000),
(1003,N'Андреев А.А.','19820417',4,3,1000)

DELETE Departments WHERE ID=3

SELECT * FROM Employees

UPDATE Departments
SET
  ID=30
WHERE ID=3

-- даем разрешение на добавление/изменение IDENTITY значения
SET IDENTITY_INSERT Departments ON

INSERT Departments(ID,Name) VALUES(3,N'ИТ')

-- запрещаем добавление/изменение IDENTITY значения
SET IDENTITY_INSERT Departments OFF

TRUNCATE TABLE Employees

INSERT Employees (ID,Name,Birthday,PositionID,DepartmentID,ManagerID)VALUES
(1000,N'Иванов И.И.','19550219',2,1,NULL),
(1001,N'Петров П.П.','19831203',3,3,1003),
(1002,N'Сидоров С.С.','19760607',1,2,1000),
(1003,N'Андреев А.А.','19820417',4,3,1000)
 
UPDATE Employees SET Email='i.ivanov@test.tt' WHERE ID=1000
UPDATE Employees SET Email='p.petrov@test.tt' WHERE ID=1001
UPDATE Employees SET Email='s.sidorov@test.tt' WHERE ID=1002
UPDATE Employees SET Email='a.andreev@test.tt' WHERE ID=1003

ALTER TABLE Employees ADD CONSTRAINT UQ_Employees_Email UNIQUE(Email)

ALTER TABLE Employees ADD HireDate date NOT NULL DEFAULT SYSDATETIME()

ALTER TABLE Employees ADD DEFAULT SYSDATETIME() FOR HireDate--Если hiredate существует

ALTER TABLE Employees ADD CONSTRAINT DF_Employees_HireDate DEFAULT SYSDATETIME() FOR HireDate

INSERT Employees(ID,Name,Email)VALUES(1004,N'Сергеев С.С.','s.sergeev@test.tt')

select * from Employees

ALTER TABLE Employees ADD CONSTRAINT CK_Employees_ID CHECK(ID BETWEEN 1000 AND 1999)

INSERT Employees(ID,Email) VALUES(2000,'test@test.tt')

INSERT Employees(ID,Email) VALUES(1500,'test@test.tt')

DROP TABLE Employees
*/
/*
CREATE TABLE Employees(
  ID int NOT NULL,
  Name nvarchar(30),
  Birthday date,
  Email nvarchar(30),
  PositionID int,
  DepartmentID int,
  HireDate date NOT NULL DEFAULT SYSDATETIME(), -- для DEFAULT я сделаю исключение
CONSTRAINT PK_Employees PRIMARY KEY (ID),
CONSTRAINT FK_Employees_DepartmentID FOREIGN KEY(DepartmentID) REFERENCES Departments(ID),
CONSTRAINT FK_Employees_PositionID FOREIGN KEY(PositionID) REFERENCES Positions(ID),
CONSTRAINT UQ_Employees_Email UNIQUE (Email),
CONSTRAINT CK_Employees_ID CHECK (ID BETWEEN 1000 AND 1999)
)

INSERT Employees (ID,Name,Birthday,Email,PositionID,DepartmentID)VALUES
(1000,N'Иванов И.И.','19550219','i.ivanov@test.tt',2,1),
(1001,N'Петров П.П.','19831203','p.petrov@test.tt',3,3),
(1002,N'Сидоров С.С.','19760607','s.sidorov@test.tt',1,2),
(1003,N'Андреев А.А.','19820417','a.andreev@test.tt',4,3)

ALTER TABLE Employees DROP CONSTRAINT PK_Employees
ALTER TABLE Employees DROP CONSTRAINT UQ_Employees_Email

ALTER TABLE Employees ADD CONSTRAINT PK_Employees PRIMARY KEY NONCLUSTERED (ID)
ALTER TABLE Employees ADD CONSTRAINT UQ_Employees_Email UNIQUE CLUSTERED (Email)

SELECT * FROM Employees
*/
DROP TABLE Employees

CREATE TABLE Employees(
  ID int NOT NULL,
  Name_emp nvarchar(30),
  Birthday date,
  Email nvarchar(30),
  Position_ID int,
  Department_ID int,
  HireDate date NOT NULL CONSTRAINT DF_Employees_HireDate DEFAULT SYSDATETIME(),
  ManagerID int,
CONSTRAINT PK_Employees PRIMARY KEY (ID),
CONSTRAINT FK_Employees_Department_ID FOREIGN KEY(Department_ID) REFERENCES Departments(ID),
CONSTRAINT FK_Employees_Position_ID FOREIGN KEY(Position_ID) REFERENCES Positions(ID),
CONSTRAINT FK_Employees_ManagerID FOREIGN KEY (ManagerID) REFERENCES Employees(ID),
CONSTRAINT UQ_Employees_Email UNIQUE(Email),
CONSTRAINT CK_Employees_ID CHECK(ID BETWEEN 1000 AND 1999))
--INDEX IDX_Employees_Name(Name_emp))--INDEX уже есть


INSERT Employees (ID,Name_emp,Birthday,Email,Position_ID,Department_ID,ManagerID)VALUES
(1000,N'Иванов И.И.','19550219','i.ivanov@test.tt',2,1,NULL),
(1001,N'Петров П.П.','19831203','p.petrov@test.tt',3,3,1003),
(1002,N'Сидоров С.С.','19760607','s.sidorov@test.tt',1,2,1000),
(1003,N'Андреев А.А.','19820417','a.andreev@test.tt',4,3,1000)
)