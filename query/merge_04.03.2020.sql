use Sample_MA
--1

/*create table bonus
		(pr_no char(4),
		bonus money default 100);

insert into bonus(pr_no) values ('p1');

drop table bonus

select * from bonus
select project_no,budget from project*/

--2

/*merge into bonus B
	using(select project_no,budget from project) E
		on (B.pr_no = E.project_no)
	when matched then
		update set B.bonus = E.budget * 0.1
	when not matched then
		insert(pr_no, bonus)
			values (E.project_no, E.budget * 0.05);*/
/*
declare @del_table table (emp_no int, emp_1name char(20))

delete employee
output deleted.emp_no, deleted.emp_1name into @del_table
where emp_no > 15000

select * from @del_table

declare @update_table table
(emp_no int,project_no char(20),
old_job char(20),new_job char(20))
update works_on
set job = null
output deleted.emp_no,deleted.project_no,deleted.job,inserted.job into @update_table
where job = 'Manager'
select * from @update_table

select * from works_on*/

drop table orders
drop table warehouse

truncate table warehouse
truncate table orders

create table warehouse (product_id int primary key,
						product_name varchar(25),
						product_count int,
						product_price money)

create table orders (product_id int primary key,
						product_name varchar(25),
						product_count int,
						product_price money)

insert into warehouse values
						(1,'Sekiro',6,15),
						(2,'Uefa',4,20),
						(3,'Myscore',12,60);

insert into orders values
						(1,'Sekiro',6,15),
						(2,'Uefa',4,20),
						(3,'Random',19,79);

select * from warehouse
select * from orders

merge warehouse as Target
using orders as Source
on (Target.product_id = Source.product_id)
when matched
	then update
		set product_count =Target.product_count + Source.product_count
when not matched by Source
	then
		delete
output deleted.*, $action ,inserted.*;