use Sample_MA

select * from works_on

select job,project_no from works_on group by job,project_no

select * from employee

select MAX(emp_no) as max_emp_no from employee

select * from employee where emp_no=(select MAX(emp_no) from employee)

select max(enter_date) from works_on where job='Manager'

select * from employee where emp_no=(select emp_no from works_on where enter_date=(select max(enter_date) from works_on where job='Manager'))

select COUNT(*) all_row,COUNT(job),COUNT(*)- COUNT(job) as count_null from works_on

select project_no,COUNT(*) count_project from works_on group by project_no having COUNT(*) < 4

select emp_fname,emp_1name,dept_no from employee where emp_no < 20000 order by emp_1name,emp_fname
