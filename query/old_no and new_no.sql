use WholeSale

select OrderID,CustomerID,OrderDate 
from Orders
	where CustomerID = 'HAnAR'
		and OrderDate >= '1998-04-01'
		and OrderDate <  '1998-07-01'

declare @cust_id as varchar(5),
@orderdate_from as date,
@orderdate_to as date
	set @cust_id = 'HANAR';
	set @orderdate_from = '1998-04-01';
	set @orderdate_to = '1998-07-01';
		select OrderID,CustomerID,OrderDate 
			from Orders
				where CustomerID = @cust_id
				and OrderDate >= @orderdate_from
				and OrderDate < @orderdate_to
go

create proc CustomerOrders
@cust_id varchar(5),
@orderdate_form date = '19960101',
@orderdate_to date = '20001231',
@numrows int = 0 output
as
begin
	set nocount on 
	select OrderID,CustomerID,OrderDate from Orders
		where CustomerID = @cust_id
		and OrderDate >=@orderdate_form
		and OrderDate < @orderdate_to
	set @numrows = @@ROWCOUNT
end
go

if OBJECT_ID('CustomerOrders', 'P') is not null 
drop proc	CustomerOrders
GO

use Sample_MA
go
create procedure modify_empno
(@old_no integer, @new_no integer)
	as update employee
		set emp_no = @new_no
		where emp_no = @old_no
	UPDATE works_on
		SET emp_no = @new_no
		where emp_no= @old_no

exec modify_empno
@old_no = 2581, @new_no = 55452