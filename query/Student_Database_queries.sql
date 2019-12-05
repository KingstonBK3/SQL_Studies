Use Muntjan
select * from Students
select * from Groups
select * from Speciality

create table Speciality(id_speciality int not null identity(10678,1),name nchar(50))

drop table	Learning

create table Groups(id_group varchar(8),school varchar(50) default 'Basic',education_lang varchar(50) default 'Russian',groupreg_date date,id_speciality int)

create table Learning(student varchar(50),id_group varchar(8),edustart_date date,eduend_date date,edustatus varchar(50) default 'Learning',
check(edustatus in ('finished school ','dismissed')))--Прописать


--EXEC sp_rename 'Specialty', 'Speciality'
























