USE Sample_MA
SELECT * FROM department
SELECT * FROM employee
SELECT * FROM project
SELECT * FROM works_on
--======================
SELECT dept_no,dept_name
FROM department


SELECT location
FROM department

SELECT *
	FROM works_on
	WHERE enter_date = '2007-01-04'

SELECT *, LEFT(project_no,1) AS symbol
FROM project


