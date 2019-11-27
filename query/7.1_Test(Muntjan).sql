/*7.1Praltika*/
USE Sample_MA
/*6.18-6.23*/
SELECT * FROM Department WHERE dept_no = (SELECT TOP(1) dept_no FROM Employee GROUP BY(dept_no) ORDER BY COUNT(dept_no) DESC); --6.18

SELECT location FROM Department WHERE dept_no = (SELECT TOP(1) dept_no FROM Employee GROUP BY(dept_no) ORDER BY COUNT(dept_no)); --6.19

SELECT * FROM Employee WHERE dept_no IN (SELECT dept_no FROM Department WHERE location = 'Seattle' OR location = 'Dallas'); -- 6.20

SELECT emp_fname,emp_lname FROM Employee WHERE emp_no = (SELECT emp_no FROM Works_On WHERE enter_data = '2007-01-04'); --6.21??

SELECT emp_fname,emp_lname FROM Employee WHERE emp_no IN (SELECT emp_no FROM Works_On WHERE enter_data LIKE '2008-01%' OR enter_data LIKE '2008-02%'); --6.21??

SELECT * FROM Employee WHERE emp_no IN (SELECT emp_no FROM Works_On WHERE job = 'Clerk' OR dept_no = 'd3'); --6.22

SELECT project_name FROM Project WHERE project_no IN (SELECT project_no FROM Works_On WHERE job = 'Clerk') -- 6.23

/*ѕотому что IN может возвращать больше 1 значени€*/