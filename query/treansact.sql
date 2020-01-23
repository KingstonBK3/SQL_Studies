use Sample_MA
--=======================================================
declare @avg_budget money, @extra_budget money,@project char(3)
	set @extra_budget =15000
	set @project = 'p1'
	select @avg_budget = avg(budget) from project
	if(select budget 
		from project
		where project_no=@project) < @avg_budget
	begin
		update project
			set budget = budget + @extra_budget
			where project_no=@project
		print 'Budget for '+@project+' increased by @extra_budget'
	end
	else
		print 'Budget for '+@project+' unchanged'
--=====================================================

-- Pассчитаем баланс счета через несколько лет с учетом
-- процентной ставки:
--===================================================
CREATE TABLE #Accounts ( CreatedAt DATE, Balance MONEY)
--=====================================================
DECLARE @rate FLOAT = 0.065, @period INT = 5,
@sum MONEY = 10000, @date DATE = GETDATE()
WHILE @period > 0
BEGIN
INSERT INTO #Accounts VALUES(@date, @sum)
SET @period = @period - 1
SET @date = DATEADD(year, 1, @date)
SET @sum = @sum + @sum * @rate
END
GO
SELECT * FROM #Accounts
--=============================================
-- BREAK - позвол€ет завершить цикл
-- CONTINUE - перейти к новой итерации
--=============================================
DECLARE @number INT = 1
WHILE @number < 10
	BEGIN
		PRINT CONVERT(NVARCHAR, @number)
		SET @number = @number + 1
		IF @number = 7
			BREAK
		IF @number = 4
			CONTINUE
		PRINT N' онец итерации'
	END
--=========================================
declare @errorvar int
update employee
	set dept_no = 'd4'
	where emp_no = 2581
set @errorvar = @@error
if @errorvar <> 0
	print 'Error ='+cast(@errorvar as nvarchar(8));
	print N'Ќарушение целостности данных'--n перед текстом unicode
go
--==========================================
select rand()
select rand(125)
select 20*rand()
select convert(int,50*rand()+50)
--=========================================
--19.1
create table employee_30
(emp_no int primary key not null,
emp_fname nchar(30),emp_1name nchar(20),dept_no nchar(15))

select * from employee_30
select * from employee

declare @fname nchar(30),@1name nchar(20),@dept_no nchar(15)
set @fname = 'Andrei'
set @1name = 'Petrovich'
set @dept_no = 'd1'
while(select count(emp_no) 
	from employee_30) <= 30
	begin
		update employee_30 set emp_no = emp_no+1,
		emp_fname = @fname,emp_1name = @1name,dept_no = @dept_no
	end





