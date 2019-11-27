use Sample_MA

select * from works_on

select project_no,job from works_on group by project_no,job;

select MAX(emp_no) from employee;

select emp_no,emp_1name from employee where emp_no= (select MIN(emp_no)from employee);

select * from employee where emp_no= (select emp_no from works_on where enter_date=(select MAX(enter_date)from works_on where job = 'Manager'))
--================================================================
select Sample_MA

select project_no, COUNT(distinct job) job_count from works_on group by project_no;

select project_no, COUNT(job) job_count from works_on group by project_no;

select job,COUNT(*)job_count from works_on group by job;

select COUNT(*), COUNT(job) as job_ON,COUNT(*)- COUNT(job) as job_Null from works_on;

select project_no,COUNT(project_no) as CountPr from works_on group by project_no having COUNT(*) < 4;