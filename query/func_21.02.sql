use Sample_MA
go
create function compute_costs (@percent int=10)
returns decimal(16, 2)
	begin
		declare @additional_costs dec(14,2),
			@sum_budget dec(16,2)
		select @sum_budget = sum(budget)
			from project
		set @additional_costs = @sum_budget * @percent/100
		return @additional_costs
	end

select project_no,project_name 
	from project where budget < dbo.compute_costs(25)

create function 
employees_in_project (@pr_number char(4))
	returns table 
	as return (select emp_fname,emp_1name from works_on,employee
							where employee.emp_no = works_on.emp_no and project_no = @pr_number)

select * from employees_in_project('p3')

create function get_flname2(@Fam varchar(20))
returns table
with schemabinding
as
	return
	(
	select emp_no,emp_fname+' '+emp_1name as flname 
	from dbo.employee where emp_fname = @Fam
	)

select * from get_flname2('Kim')

select * from employee