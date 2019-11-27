use Muntjan

select * from Students

select *, left(isikukood,1) as sugu,SUBSTRING(isikukood,2,2) as aasta from Students