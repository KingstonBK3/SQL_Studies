use Partnership

--create database Partnership

drop table reference_data

/*Справочная информация об квартирах*/

create table reference_data(number_of_apartment int primary key,
area float,type_of_heating varchar(30) default 'Central',
check (type_of_heating in ('gas','electrical','Central')),
percent_heating float,Isikukood varchar(11));

/*Внешний ключ связанный с таблицей Owners FK_Isikukood*/

alter table reference_data
add constraint FK_Isikukood foreign key(Isikukood)
references Owners(Isikukood)

/*Информация об владельцах*/

create table Owners (Isikukood varchar(11) Primary key,
Firstname varchar(40),Surname varchar(40),
Phone_Number varchar(10),Email varchar(20));

/**/


