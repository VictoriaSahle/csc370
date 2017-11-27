--5a.
SELECT *
FROM  Routes
WHERE airlineID = 1234;

--b.
SELECT routenum
From OutgoingRoutes
WHERE destination = 'Dubai'
UNION
SELECT routenum
From IncomingRoutes
Where source = 'Dubai';

--c. Change hour/min as you wish. Also confirm exact (hour/min) time that has been stored in database.
SELECT *
FROM Departures
WHERE (24*ABS(depT-to_date('2016-04-01 00:00', 'YYYY-MM-DD hh24:mi')) <= 1)
UNION
SELECT *
FROM Arrivals
WHERE (24*ABS(arrT-to_date('2016-04-01 00:00', 'YYYY-MM-DD hh24:mi')) <= 1);


 --d.  
SELECT *
FROM Passenger
WHERE arrivalID =2 OR departID =2;

--e.
SELECT bID
FROM Baggage
WHERE passengerID =  '7'; 

--f.
SELECT gate
FROM Gates
WHERE isfree = 'Y';

--g.
UPDATE Gates
SET isfree = 'Y'
WHERE gate = 'C15';

--4.
DELETE FROM Routes WHERE rnum = 1004;