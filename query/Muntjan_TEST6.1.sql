use Sample_MA
/*6.11*/
select location,count(location) as count_location from department group by location
/*6.12*/
/*DISTINCT ������������ ��� �������� ���������� �������� �������, GROUP BY ���������� ������ �� ������ ���� ����*/
/*6.13*/
/*��� GROUP BY ��� �������� NULL ���������� ��� ������, �� ���� ��� ����������� �� ����, ����������� NULL-��������, ��� ����� ������ ������� � ���� ������.*/
/*6.14*/
/*COUNT(*)-������ ���������� ���� ������� � �������.COUNT(column)-������� ������������ ���������� ������� (�����) �������.*/
/*6.15*/
select MAX(emp_no) as max_emp_no from employee
/*6.16*/
select * from employee
select * from department
select * from project
select * from works_on
/*a*/
select dept_no,COUNT(dept_no) as dept_count from employee group by dept_no
/*b*/
select project_no,COUNT(project_no) as project_count from works_on group by project_no
/*c*/
select emp_no,COUNT(*) as count_job from works_on group by emp_no
/*6.17*/
select job,COUNT(*) from works_on group by job having COUNT(*) >=2