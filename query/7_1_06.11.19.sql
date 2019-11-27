USE Sample_MA;

SELECT emp_fname, emp_lname FROM Employee WHERE dept_no = (SELECT dept_no FROM Department WHERE dept_name = 'Research'); -- Подзапросы и операторы сравнения

SELECT * FROM Employee WHERE dept_no IN (SELECT dept_no FROM Department WHERE location = 'Dallas'); -- Оператор IN работает со списком

SELECT emp_lname FROM Employee WHERE emp_no IN (SELECT emp_no FROM Works_On WHERE project_no IN (SELECT project_no FROM Project WHERE project_name = 'Apollo')); -- Выборка фамилий всех сотрудников, работающих над проектом Apollo


SELECT emp_no, project_no, job FROM Works_On WHERE enter_data > ANY (SELECT enter_data FROM Works_On); -- Выборка табельного номера сотрудника, номера проекта и названия должности для сотрудников, которые приступили к работе над проектами позже мин. даты любого из проектов


SELECT emp_lname FROM Employee WHERE 'p3' IN (SELECT project_no FROM Works_On WHERE Works_On.emp_no = Employee.emp_no); -- Выборка фамилий всех сотрудников, работающих над проектом p3

SELECT emp_lname FROM Employee WHERE EXISTS (SELECT * FROM Works_On WHERE Employee.emp_no = Works_On.emp_no AND project_no = 'p1'); -- Выборка фамилий всех сотрудников, работающих над проектом p1

SELECT emp_lname FROM Employee WHERE NOT EXISTS (SELECT * FROM Department WHERE Employee.dept_no = Department.dept_no AND location = 'Seattle'); -- Выборка фамилий сотрудников, чей отдел не расположен в Сиэтле


-- 6.18 - 6.23 SUBQUERY

--Aleksander Russovits

SELECT * FROM Department WHERE dept_no = (SELECT TOP(1) dept_no FROM Employee GROUP BY(dept_no) ORDER BY COUNT(dept_no) DESC); --6.18 (a)

SELECT * FROM Department WHERE dept_no = (SELECT TOP(1) dept_no FROM Employee GROUP BY(dept_no) ORDER BY COUNT(dept_no)); --6.18 (b)

SELECT location FROM Department WHERE dept_no = (SELECT TOP(1) dept_no FROM Employee GROUP BY(dept_no) ORDER BY COUNT(dept_no)); --6.19

SELECT * FROM Employee WHERE dept_no IN (SELECT dept_no FROM Department WHERE location = 'Seattle' OR location = 'Dallas'); -- 6.20

SELECT emp_fname,emp_lname FROM Employee WHERE emp_no = (SELECT emp_no FROM Works_On WHERE enter_data = '2007-01-04'); --6.21(a)

SELECT emp_fname,emp_lname FROM Employee WHERE emp_no IN (SELECT emp_no FROM Works_On WHERE enter_data LIKE '2008-01%' OR enter_data LIKE '2008-02%'); --6.21(b)

SELECT * FROM Employee WHERE emp_no IN (SELECT emp_no FROM Works_On WHERE job = 'Clerk' OR dept_no = 'd3'); --6.22

SELECT project_name FROM Project WHERE project_no IN (SELECT project_no FROM Works_On WHERE job = 'Clerk') -- 6.23 Вместо = нужно IN

-- Потому что IN может возвращать больше 1 значения


SELECT * FROM Employee

select * from department


-- сколько сотрудников в каждом отделе
/*2*/
SELECT top 1 dept_no, COUNT(dept_no) AS Kolichestvo_Sotrudnikov FROM Employee GROUP BY dept_no ORDER BY 2 DESC--В ПОРЯДКЕ УБЫВАНИЯ top1
/*3*/
select * from department where dept_no IN(select dept_no from employee group by dept_no having count(dept_no)=(SELECT top 1 COUNT(dept_no) AS count_dept_no FROM employee GROUP BY dept_no ORDER BY 1 DESC))

--=========================================
/*1variant*/
select employee.*, department.* from employee inner join department on department.dept_no= employee.dept_no;
/*2variant*/
select employee.*, department.* from employee, department where department.dept_no=employee.dept_no;
/*соедененние 2ух таблиц*/
select * from works_on join on works_on.emp_no=employee.emp_no join department on employee.dept_no=department.dept_no
/**/
select * from employee left join works_on on employee.emp_no=works_on.emp_no

select * from works_on right join project on project.project_no=works_on.project_no

insert into employee values(99999, 'Kim','KIM', null) 

select * from employee

insert into department values('d4','Marketing','Liverpool'),('d5','Deals','New York'),('d6','Transfers','Madrid')

select * from department

delete from department where dept_no = 'd4'

select * from works_on

update works_on set job='IT' where job is not null