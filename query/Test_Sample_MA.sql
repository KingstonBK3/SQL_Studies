use Sample_MA
select * from employee

select *
from employee
where emp_no = 25348 and emp_1name='Smith' or emp_fname='Matthew' and dept_no='d1'

--==================================================================================

select * 
from project
where budget between 90000 and 120000

--=======================================

select * from works_on

select * 
from works_on
where job is not null and project_no='p2' --null and not null

--=======================================

select *, ISNULL(job, 'new data')
from works_on

--================

select * from employee

select * 
from employee
where emp_fname LIKE 'e%'

--=========================

select GETDATE()

select *, YEAR(enter_date) as aastat
from works_on
where YEAR(enter_date)=2006

--=================================
--======Praktika 09/10/019=========
/*
¬ыполните выборку всех строк из таблицы works_on
*/
--5.1
SELECT * FROM works_on
--5.2
SELECT *
FROM works_on
WHERE job='Clerk'
--5.3
SELECT *
FROM works_on
WHERE emp_no < 10000 AND project_no='p2'
--5.4
SELECT emp_no, YEAR(enter_date) AS asstat FROM works_on WHERE YEAR(enter_date) = 2007
SELECT emp_no, YEAR(enter_date) AS asstat FROM works_on WHERE YEAR(enter_date) BETWEEN 2007 AND 2019
--5.5
SELECT * 
FROM works_on
WHERE project_no='p1' and job='Analysty' or job='Manager'
--5.6
SELECT * 
FROM works_on
where project_no='p2' and job is null
--5.7
SELECT * 
FROM employee
where emp_fname like '%tt%';
--5.8
SELECT * 
FROM employee
where emp_1name like '_o%' or emp_1name like '_a%' and emp_1name like '%es';
--5.9
select *
from project
where budget<100000 or budget>300000
--5.10
SELECT emp_fname, emp_lname FROM employee 
SELECT emp_fname, emp_lname FROM employee WHERE emp_fname NOT LIKE '%[y]%' AND emp_fname NOT LIKE '%[x]%' AND emp_lname NOT LIKE '%[y]%' AND emp_lname NOT LIKE '%[x]%'