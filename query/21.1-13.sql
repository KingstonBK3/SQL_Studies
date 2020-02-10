use Sample_MA
-- 21.1
go
create view d1_employees
as select emp_no, emp_fname, emp_1name, dept_no
from employee
where dept_no = 'd1'
select * from d1_employees
--21.2
go
create view without_budget
as select project_no, project_name
from project
select * from without_budget
--21.3
go
create view project_2007 as
select employee.emp_no as emp_no1, employee.emp_fname as first_name, employee.emp_1name as last_name,works_on.enter_date FROM employee,works_on where MONTH(works_on.enter_date) >=6
	INNER JOIN employee on employee.emp_no = works_on.emp_no
group by employee.emp_no,employee.emp_fname,employee.emp_1name,works_on.enter_date
select * from project_2007
--21.4
go
create view project_2007_2 as
select emp_fname as first_name,emp_1name as last_name from project_2007
select * from project_2007_2
--21.5
go 
create view d1_employees_2 as
select emp_1name from d1_employees where emp_1name like 'm%'
select * from d1_employees_2
--21.6

select * from employee
select * from  works_on

