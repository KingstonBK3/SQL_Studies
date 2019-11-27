USE WholeSale

SELECT  * FROM Customers WHERE Country='Canada' /*1*/

SELECT * FROM Customers WHERE PostalCode ='1010' or PostalCode='8010' /*2*/

SELECT * FROM Customers WHERE Fax is null /*3*/

SELECT * FROM Customers WHERE Region is not null /*4*/

SELECT * FROM Customers WHERE Region is null and Fax is null /*5*/

SELECT * FROM Customers WHERE Phone LIKE '%555%'/*6*/

SELECT * FROM Customers WHERE ContactTitle='Owner' and Country='Mexico' or Country='USA'/*NOT DONE #7*/

SELECT * FROM Customers WHERE ContactName like '%Sven%'/*8*/

SELECT DISTINCT(Country) FROM Customers/*9*/

SELECT * FROM Customers WHERE CustomerID LIKE 'B%' OR CustomerID LIKE 'C%' OR CustomerID LIKE 'D%' OR CustomerID LIKE 'E%'/*10*/

SELECT * FROM Customers WHERE CustomerID  NOT LIKE '%A' AND CustomerID  NOT LIKE '%O'/*11*/

SELECT * FROM Customers WHERE ContactTitle LIKE '%Sales%'/*12*/

SELECT * FROM Customers WHERE ContactTitle LIKE '%Manager%' AND ContactTitle NOT LIKE '%Sales%'/*13*/

SELECT * FROM Customers WHERE City LIKE '% % %'/*14*/

SELECT * FROM Orders WHERE OrderDate LIKE '%1996%'/*15*/

SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-08-01' AND '1997-08-31'/*16*/

SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-07-01' AND '1997-07-31' AND CustomerID='GREAL'/*17*/

SELECT * FROM Products WHERE UnitPrice > 50 AND UnitsInStock < 5/*18*/

SELECT UnitPrice,ProductID,UnitsInStock,UnitPrice*UnitsInStock as SUMMA FROM Products/*19*/

SELECT TOP 4* FROM Orders/*20*/

