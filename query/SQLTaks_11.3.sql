CREATE DATABASE cars_MA
	ON (NAME = projects_dat, FILENAME = 'E:\SQLtasks\Queries\cars_MA.mdf', SIZE = 5, MAXSIZE = 100, FILEGROWTH = 5)
	LOG ON (NAME = projects_log, FILENAME = 'E:\SQLtasks\Queries\cars_MA.ldf', SIZE = 10, MAXSIZE = 100, FILEGROWTH = 10)

use cars_MA

CREATE TABLE cars(mark VARCHAR(30),
	model VARCHAR(30),
	startYear DATE,
	price MONEY,
    status VARCHAR(4) DEFAULT 'Yes', CHECK (status in ('Yes','No')))

INSERT INTO cars VALUES 
	('Merc','W124','1.12.1997',800,DEFAULT),
	('NisAN','380d','1.12.2014',10000,DEFAULT),
	('BMWS','a5','1.12.1992',1000,DEFAULT) 

ALTER TABLE cars ADD condition VARCHAR(15) DEFAULT 'good' NULL

INSERT INTO cars (condition) VALUES ('good')

INSERT INTO cars VALUES 
	('Mercedes','A20','2.10.1995',200,DEFAULT,'bad'),
	('BMW','37az','3.11.2016',11000,DEFAULT,'normal') 

ALTER TABLE cars DROP CONSTRAINT DF__cars__condition__22AA2996
ALTER TABLE cars ADD CONSTRAINT default_condition DEFAULT 'normal' FOR condition

INSERT INTO cars VALUES ('Hundai','Tura','2.09.2017',16000,DEFAULT,DEFAULT),('Tayota','56','2.09.2015',5000,DEFAULT,DEFAULT)

ALTER TABLE cars ADD reg_code INTEGER IDENTITY(2017000, 1)

SET IDENTITY_INSERT cars ON
INSERT cars (reg_code) VALUES (20180000)
SET IDENTITY_INSERT cars OFF

INSERT INTO cars VALUES ('Hundai','Tura','2.09.2017',16000,DEFAULT,DEFAULT)

ALTER TABLE cars ADD PRIMARY KEY(reg_code)

UPDATE cars SET price = price - ((price * 20) / 100) WHERE price < 2000

CREATE TABLE customer(isikukood VARCHAR(30) PRIMARY KEY,F_name VARCHAR(30), S_name VARCHAR(30) NOT NULL, email VARCHAR(30), tel VARCHAR(30))

INSERT INTO customer VALUES(502053452912,'Andrei', 'Muntjan','andrei.muntjan@gmail.com','+3725678793'),(51238211243,'Vasja', 'Pupkin','Vasja.Pupkin@gmail.com','+37247237489')

CREATE TABLE customer_cars(reg_code INTEGER,
	isikukood VARCHAR(30),
	date_reg DATETIME DEFAULT getdate(),
	PRIMARY KEY (reg_code,isikukood))

INSERT INTO customer_cars VALUES (2017004,50208302215,DEFAULT),(2017007,51233213315,DEFAULT)

UPDATE cars SET status = 'No' WHERE reg_code IN (SELECT reg_code FROM cars WHERE reg_code IN (SELECT reg_code FROM customer_cars ))

ALTER TABLE customer_cars ADD CONSTRAINT FK_cars FOREIGN KEY(reg_code) REFERENCES cars (reg_code)

ALTER TABLE customer_cars ADD CONSTRAINT FK_customer FOREIGN KEY(isikukood) REFERENCES customer (isikukood)

SELECT * FROM customer_cars
SELECT * FROM cars 
SELECT * FROM customer
SELECT * FROM customer_cars