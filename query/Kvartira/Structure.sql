use Partnership

--create database Partnership

/*Вывод таблиц*/
select * from reference_data
select * from Owners
select * from TariffsArea
/*Справочная информация об квартирах*/

create table reference_data(number_of_apartment int primary key,
area float,type_of_heating varchar(30) default 'Central',
check (type_of_heating in ('gas','electrical','Central')),
percent_heating float,Isikukood varchar(11));

/*Ввод инфомации в таблицу*/

insert into reference_data values
(

1,30.4,'gas', 7,'84567439865',
2,60.7,'Central',100,'62456758943',
3,140.3,'Central',100,'53467798098',
4,160.8,'electrical',17,'35577809898',
5,35.5,'Central',100,'45768978098',
6,77.4,'electrical',18,'62456758943',
7,80.9,'gas',11,'65546679784',
8,88.4,'Central',100,'54375894375',
9,45,8,'gas',9,'58398475983',
10,57.9,'Central',100,'74577568655',
11,72.8,'electrical',18,'89578457345'
);

/*Внешний ключ связанный с таблицей Owners FK_Isikukood*/

alter table reference_data
add constraint FK_Isikukood foreign key(Isikukood)
references Owners(Isikukood)

/*Информация об владельцах*/

create table Owners (Isikukood varchar(11) Primary key,
Firstname varchar(40),Surname varchar(40),
Phone_Number varchar(10),Email varchar(20));

/*Ввод информации в таблицу*/

insert into Owners values
(
'84567439865','Andrei','Muntjan','58276159','mun.and@gmail.com',
'62456758943','Billy','Gilmour','246423764','bi.gi@gmail.com',
'53467798098','Roberto','Firmino','6353465','bo.fr@outlook.com',
'35577809898','Daniel','Radcliff','2543543','da.ra@gmail.com',
'45768978098','Boby','Robson','543543','bo.ro@gmail.com',
'65546679784','Alex','Gray','943233','al.gr@gmail.com',
'54375894375','Fred','McCarty','645633','fr.mc@gmail.com',
'58398475983','Erron','Black','654645','er.bl@gmail.com',
'74577568655','Michael','Jordan','747645','mi.jr@gmail.com',
'89578457345','Elwis','Presley','856746','el.pre@gmail.com'
)

/*Таблица тарифов(стоимость площади 1м*2)*/

create table TariffsArea (TariffID int identity(1,1) primary key not null,TariffDate date,TariffPrice money,AcceptedDate date)

drop table Tariffs

/*Вводим информацию*/

insert into TariffsArea values ('2019-03-05',0.61,'2019-03-10',
								'2020-05-09',0.71,'2020-06-03')
/*Таблица тарифов(стоимости единицы потребляемого тепла)*/

create table TariffsHeaitng (TariffID int identity(1,1) primary key not null,TariffDate date,TariffPrice money,AcceptedDate date)

drop table TariffsHeaitng

/*Вводим информацию*/

insert into TariffsHeaitng values ('2019-07-05',0.61,'2019-08-12',
								'2020-05-09',0.71,'2020-06-03')
