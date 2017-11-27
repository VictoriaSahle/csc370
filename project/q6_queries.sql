--6a.
SELECT source, destination, airlineID
FROM IncomingRoutes JOIN OutgoingRoutes USING(airlineID)
WHERE IncomingRoutes.ROUTENUM = OutgoingRoutes.ROUTENUM AND(24*(ABS(outT - incT ))) < 12 AND (24*(ABS(outT -incT))) > 1;

--b.
SELECT *
FROM Passenger
WHERE arrivalID IS NOT NULL AND departID IS NOT NULL;

--c.
SELECT name, counted
FROM(
SELECT name, COUNT(arrivalID) + COUNT(departID) AS counted
From Passenger
GROUP BY name
ORDER BY counted DESC
)
WHERE  ROWNUM <=3;

--d.
CREATE VIEW DelaysDepartures AS
SELECT OutgoingRoutes.airlineID, COUNT(depID) AS numdelaysdep
FROM OutgoingRoutes JOIN Departures ON OutgoingRoutes.routeNum=Departures.routeNum
WHERE to_date(to_char(depT,'hh24:mi'),'hh24:mi') -
to_date(to_char(outT,'hh24:mi'),'hh24:mi') > 0
GROUP BY OutgoingRoutes.airlineID
ORDER BY numdelaysdep
;

CREATE VIEW DelaysArrivals AS
SELECT IncomingRoutes.airlineID, COUNT(arrID) AS numdelaysarr
FROM IncomingRoutes JOIN Arrivals ON IncomingRoutes.routeNum=Arrivals.routeNum
WHERE to_date(to_char(arrT,'hh24:mi'),'hh24:mi') -
to_date(to_char(incT,'hh24:mi'),'hh24:mi') > 0
GROUP BY IncomingRoutes.airlineID
ORDER BY numdelaysarr
;

SELECT *
 FROM
  (SELECT DECODE(x.da_id, NULL, x.dd_id, x.da_id) airlineId, MAX(totaldelays)
     FROM
       (SELECT da.airlineID da_id, dd.airlineID dd_id,da.numdelaysarr ,dd.numdelaysdep, (NVL(da.numdelaysarr, 0) + NVL(dd.numdelaysdep, 0)) totaldelays
          FROM DelaysArrivals da FULL JOIN DelaysDepartures dd ON da.airlineID = dd.airlineID
        ) x
     GROUP BY x.da_id, x.dd_id
    ORDER BY MAX(totaldelays) DESC
   )
WHERE rownum <= 1;