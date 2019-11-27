USE WholeSale

select * from Orders
select * from Products
/*1*/
select YEAR(OrderDate) as aastat,COUNT(OrderDate) as order_count from Orders where YEAR(OrderDate)= 1996 group by YEAR(OrderDate)
/*2*/
