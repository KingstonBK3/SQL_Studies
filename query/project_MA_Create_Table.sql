--use master
use Projects_MA

/*create database Projects_MA
	on (name=Projects_MA_dat,
		filename = 'D:\PTVR18\SQL\Databases\Projects_MA.mdf',
		size = 5,
		maxsize = 100,
		filegrowth = 5)
	log on 
		(name = Projects_MA_log,
		filename = 'D:\PTVR18\SQL\Databases\Projects_MA.ldf',
		size = 10,
		maxsize = 100,
		filegrowth = 10);*/

--1
/*create table product
(product_no integer identity(10000,1) not null ,product_name char(30) not null,price money);
insert into product(product_name,price) values ('garderob',null),('sasung', 210),('fony', 17.23)
select * from product
DROP TABLE product */
--2
/*
create table product
(product_id	 int identity(10000,1) not null ,product_name char(30) not null,price money,date_reg datetime default Getdate());
insert into product(product_name,price,date_reg) values ('garderob',145.89,DEFAULT),('Fony',56.90,'04/12/2019')
select * from product
truncate table product--полная очистка таблицы*/
DROP TABLE Sales
--3
create table product
(product_id	int identity(1000,1) not null constraint pk_profukt primary key,product_name char(30) not null,price money,date_reg datetime default Getdate());
insert into product(product_name,price,date_reg) values ('garderob',145.89,DEFAULT),('Fony',56.90,'04/12/2019')

create table customer 
(cust_no int not null identity(1000,10) constraint pk_cost primary key,
cust_group char(3) null,
check (cust_group in ('c1','c2','c10')));

insert into customer(cust_group) values ('c1'),('c2'),('c10')

select * from customer
select * from product
select * from Sales

create table Sales (sales_ID int not null identity(1000,1),
product int,
sales_count int default 1,
date_registration date default getdate(),
date_recieving date default getdate()+3,
check(date_recieving>=date_registration),
constraint sales_id primary key(sales_ID),
constraint product_ID foreign key(product)
references product (product_id));
