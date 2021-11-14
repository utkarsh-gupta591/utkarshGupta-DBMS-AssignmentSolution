/*3*/
select count(pss.Gender) as "Females"
from Passenger pss
where pss.Distance>=600 and pss.Gender="F";
select count(pss.Gender) as "Males"
from Passenger pss
where pss.Distance>=600 and pss.Gender="M";

/*4*/
select min(Price.price)
from Price
where Price.Bus_Type="Sleeper";

/*5*/
select pss.Passenger_name
from Passenger as pss
where Passenger_name like 'S%';

/*6*/
select pss.Passenger_name, pss.Boarding_City,
pss.Destination_City, pss.Bus_Type, p.Price
from passenger as pss
inner join price as p
on pss.Distance=p.Distance;

/*7*/
select pss.Passenger_name, p.Price
from passenger pss
inner join price p
on pss.Bus_Type="Sitting" AND pss.Distance=1000;

/*8*/
select p.Bus_Type, p.Price
from passenger as pss
inner join price as p
on pss.Distance=p.Distance and pss.Passenger_name="Pallavi";

/*9*/
select distinct Distance 
from passenger
order by Distance desc;

/*10*/
SELECT ALL Passenger_name, Distance/sum(Distance) as Distance
FROM passenger;

/*11*/
delimiter &&
create procedure displayDistanceAndPrice()
begin
select p.Distance, p.Price, 
case
when p.Price > 1000 then 'Expensive'
when p.Price<=1000 and p.Price>500 then 'Average Cost'
else 'Cheap'
end as Verdict
from Price p;
end &&
call displayDistanceAndPrice();