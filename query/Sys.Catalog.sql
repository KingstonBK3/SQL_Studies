USE Sample_MA;

-- ������� �������������� �������, ��������������
--������������ � ���� ������� ��� ������� employee

SELECT OBJECT_ID, principal_id, type FROM sys.objects WHERE name = 'employee'

--������� ���� ���� ������ ���� ������
--Sample_AR, ������� �������� ������� project_no

SELECT sys.objects.name FROM  sys.objects INNER JOIN sys.columns
ON  sys.objects.object_id = sys.columns.object_id
WHERE sys.objects.type = 'U' AND sys.columns.name = 'project_no'

-- ����������� ��������� ������� employee

SELECT sys.database_principals.name FROM sys.database_principals INNER JOIN sys.objects
ON sys.database_principals.principal_id = sys.objects.schema_id
WHERE sys.objects.name = 'employee' AND sys.objects.type = 'U'

-- ��������� �������� ���������

EXEC sp_rename @objname = Department, @newname = subdivision

--������������� ��������� ��������� sp_configure

EXEC sp_configure 'show advanced options',1 ;

RECONFIGURE WITH OVERRIDE;
-- ������������� ���������� 
-- ������ ����� �������� �������� �������������� ����������

EXEC sp_configure 'fill factor', 100

-- ��������� fill factor ������������� �������� 100
-- �������� fill factor ��������� ����� ��������� � ��������� ��� ������� ��������

RECONFIGURE WITH OVERRIDE;

-- ������������� ���������� 

sp_help 'Employee'  -- �������� ��������� - ��� �������
sp_help 'CHAR' -- ��� ������ 

-- ��������� �������

SELECT OBJECT_ID FROM sys.objects -- ������������� �������
WHERE name = 'Employee'; 

-- �������������
SELECT OBJECT_ID('Employee') -- ��������� �������

-- ������ ��������� ��������� ������� ��� ������� � ��������� ������� ��������

SELECT DB_ID ('Sample_AR')
SELECT DB_NAME(7)

SELECT OBJECT_ID('bonus')
SELECT OBJECT_NAME(597577167)

sp_helpuser
SELECT USER_NAME(1)
SELECT USER_ID('dbo')

GO
	IF	OBJECTPROPERTY (OBJECT_ID('dbo.Employee'), 'IsTable') = 1
		PRINT 'This is a table.'
	ELSE IF OBJECTPROPERTY (OBJECT_ID('dbo.Employee'), 'IsTable') = 0
		PRINT 'This is not a table.'
	ELSE IF OBJECTPROPERTY (OBJECT_ID('dbo.Employee'), 'IsTable') IS NULL
		PRINT 'ERROR: this is not a valid object';
GO


