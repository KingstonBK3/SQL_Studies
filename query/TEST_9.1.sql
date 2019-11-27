use Sample_MA

select * from employee
select * from works_on
select * from emp_d1_d2
--9.1
insert into employee(emp_no,emp_fname,emp_1name,dept_no) values(11111,'Julia','Long',NULL)
--9.2(1)
create table emp_d1_d2(emp_no int not null,emp_fname nchar(9),emp_1name nchar(9),dept_no nchar(9));

insert into emp_d1_d2(emp_no,emp_fname,emp_1name,dept_no) select emp_no,emp_fname,emp_1name,dept_no from employee where dept_no='d1' or dept_no='d2';
--9.2(2)
--9.3
create table emp_in_2008(emp_no,project_no,job,enter_date) select emp_no,project_no,job,enter_date from works_on where enter_date =
