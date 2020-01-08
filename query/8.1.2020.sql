/*create table MyUniqueTable
	(UniqueColumn uniqueidentifier default newid(),
	Characters varchar(10))

go
insert into MyUniqueTable(Characters) values ('abc')
insert into MyUniqueTable values (newid(), 'def')
go
select * from MyUniqueTable
drop table MyUniqueTable
create table MyTimestampTable
(PriKey int primary key , timestamp);

insert into MyTimestampTable(PriKey) values (100);

insert into MyTimestampTable(PriKey) values (120);

update MyTimestampTable
	set PriKey = 150 where PriKey = 120

select * from MyTimestampTable;

use WholeSale

select  ProductID,ProductName,UnitsInStock,
cast(ProductID as char(5)) + ProductName + ' ' 
+ cast(UnitsInStock as char(5)) 
from Products

select ProductID,ProductName,UnitsInStock,
cast(ProductID as char(5))
from Products*/

use Sample_MA

select * from works_on
select * from employee
select * from project

select works_on.project_no,project_name,count(*)
from works_on inner join project on
works_on.project_no = project.project_no
group by works_on.project_no,project_name