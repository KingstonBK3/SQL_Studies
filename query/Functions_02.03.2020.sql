use WholeSale
GO
CREATE FUNCTION txt_Name(@ProductID INT)
	RETURNS NVARCHAR (40)
	AS
		BEGIN
			DECLARE @txt_Name NVARCHAR(40)
			SELECT @txt_Name = ProductName FROM Products
			WHERE ProductID = @ProductID
			RETURN @txt_Name
		END 
GO

SELECT dbo.txt_Name(1)

select *, dbo.txt_Name(ProductID) txt_Name from OrderDetails

--=========================================================
select * from Products]
select * from Categories


go
create function Product_Category
(@CategoryID int
)
returns table
as
 return
  select ProductID,ProductName,Products.CategoryID,CategoryName,UnitPrice 
	from Products join Categories on
	Products.CategoryID = Categories.CategoryID
	Where Products.CategoryID = @CategoryID

select * from Product_Category(8)

use Sample_MA
go
create table audit_budget (project_no char(4) null,
	user_name char(16) null,
	date DATETIME null,
	budget_old float null,
	budget_new float null);
go
create trigger modify_budget
	on project after update
	as if UPDATE(budget)
begin
declare @budget_old float
declare @budget_new float
declare @project_number char(4)
select @budget_old = (select budget from deleted)
select @budget_new = (select budget from inserted)
select @project_number = (select project_no from deleted)

insert into audit_budget values
(@project_number,USER_NAME(),GETDATE(),@budget_old,@budget_new)
end

go
create trigger total_budget
	on project after update
	as if UPDATE(budget)
	begin
	declare @sum_old1 float
	declare @sum_old2 float
	declare @sum_new float
	select @sum_new = (select SUM(budget) from inserted)
	select sum_old1 =
		(select sum(p.budget)
		from project p
		where p.project_no not in
			(select d.project_no from deleted d))
	select @sum_old2 = (select sum(budget) from deleted)
	if @sum_new > (@sum_old1 + @sum_old2)*1.5
	begin
		print 'No modification of budgets'
		rollback transaction
	end
else
	print 'The modification of budgets executed'
end
		


update project
	set budget = 150000
	where project_no = 'p2'

CREATE TABLE TestTable(
[ProductId] [INT] IDENTITY(1,1) NOT NULL,
[CategoryId] [INT] NOT NULL,
[ProductName] [VARCHAR](100) NOT NULL,
[Price] [Money] NULL
)

CREATE TABLE AutitTestTable(
Id INT IDENTITY(1,1) NOT NULL,
DtChange DATETIME NOT NULL,
UserName VARCHAR(100) NOT NULL,
SQL_Command VARCHAR(100) NOT NULL,
ProductId_Old INT NULL,
ProductId_New INT NULL,
CategoryId_Old INT NULL,
CategoryId_New INT NULL,
ProductName_Old VARCHAR(100) NULL,
ProductName_New VARCHAR(100) NULL,
Price_Old MONEY NULL,
Price_New MONEY NULL,
CONSTRAINT PK_AutitTestTable PRIMARY KEY (Id)
)

CREATE TRIGGER TRG_Audit_TestTable ON TestTable
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
DECLARE @SQL_Command VARCHAR(100);
/*
Определяем, что это за операция
на основе наличия записей в таблицах inserted и deleted.
На практике, конечно же, лучше делать отдельный триггер для каждой операции
*/
IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
SET @SQL_Command = 'INSERT'
IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
SET @SQL_Command = 'UPDATE'
IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
SET @SQL_Command = 'DELETE'
-- Инструкция если происходит добавление или обновление записи
IF @SQL_Command = 'UPDATE' OR @SQL_Command = 'INSERT'
BEGIN
INSERT INTO AutitTestTable(DtChange, UserName, SQL_Command, ProductId_Old,
ProductId_New, CategoryId_Old, CategoryId_New,
ProductName_Old, ProductName_New, Price_Old, Price_New)
SELECT GETDATE(), SUSER_SNAME(), @SQL_Command, D.ProductId, I.ProductId,
D.CategoryId, I.CategoryId, D.ProductName, I.ProductName, D.Price, I.Price
FROM inserted I
LEFT JOIN deleted D ON I.ProductId = D.ProductId
END
-- Инструкция если происходит удаление записи
IF @SQL_Command = 'DELETE'
BEGIN
INSERT INTO AutitTestTable(DtChange, UserName, SQL_Command, ProductId_Old,
ProductId_New, CategoryId_Old, CategoryId_New,
ProductName_Old, ProductName_New, Price_Old, Price_New)
SELECT GETDATE(), SUSER_SNAME(), @SQL_Command,
 D.ProductId, NULL,
 D.CategoryId, NULL,
 D.ProductName, NULL,
 D.Price, NULL
FROM deleted D
END
end

--Добавляем запись
INSERT INTO TestTable
VALUES (1, 'Новый товар', 0)
--Изменяем запись
UPDATE TestTable SET ProductName = 'Наименование товара',
Price = 200
WHERE ProductName = 'Новый товар'
--Удаляем запись
DELETE TestTable WHERE ProductName = 'Наименование товара'
--Смотрим изменения
SELECT * FROM AutitTestTableDISABLE TRIGGER TRG_Audit_TestTable ON TestTable;ENABLE TRIGGER TRG_Audit_TestTable ON TestTable;