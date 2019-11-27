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

create table product
(product_no integer identity(10000,1) not null ,product_name char(30) not null,price money);
insert into product(product_name,price) values ('garderob',null),('sasung', 210),('fony', 17.23)
select * from product 
