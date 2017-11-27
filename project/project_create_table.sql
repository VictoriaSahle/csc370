--Constraints for question 2 also included.

CREATE TABLE Airlines(
	acode INT PRIMARY KEY,
	name VARCHAR(50),
	website VARCHAR(50)

);

CREATE TABLE Routes(
	rnum INT,
	airlineID INT,
	planemodel VARCHAR(50),
  PRIMARY KEY(rnum, airlineID)
  
);

CREATE TABLE OutgoingRoutes(
	routeNum INT,
	airlineID INT,
	destination VARCHAR(50),
	outT date,
  CONSTRAINT x
      FOREIGN KEY(routeNum, airlineID) references Routes(rnum, airlineID)
      ON DELETE CASCADE

);


CREATE TABLE IncomingRoutes(
	routeNum INT,
	airlineID INT,
	source VARCHAR(50),
	incT date,
  CONSTRAINT y
        FOREIGN KEY(routeNum, airlineID) references Routes(rnum, airlineID)
        ON DELETE CASCADE
  
);

CREATE TABLE Gates(
	gate VARCHAR(10) PRIMARY KEY,
	isfree CHAR(1)
);

CREATE TABLE Departures(
	depID INT PRIMARY KEY,
	depT date,
	airlineID INT,
	routeNum INT,
  gate VARCHAR(50),
  FOREIGN KEY(gate) references Gates(gate),
  CONSTRAINT xx
        FOREIGN KEY(routeNum, airlineID) references Routes(rnum, airlineID)
        ON DELETE CASCADE
	
);


CREATE TABLE Arrivals(
	arrID INT PRIMARY KEY,
	arrT date,
	airlineID INT,
	routeNum INT,
  gate VARCHAR(50),
  FOREIGN KEY(gate) references Gates(gate),
  CONSTRAINT yy
          FOREIGN KEY(routeNum, airlineID) references Routes(rnum, airlineID)
          ON DELETE CASCADE
  
);

CREATE OR REPLACE VIEW DepartureV AS 
  SELECT depID,depT,airlineID,routeNum,gate 
  FROM Departures X
  WHERE NOT EXISTS (
       SELECT depID
       FROM Departures
       WHERE gate = X.gate AND  (ABS (24*(depT - X.depT))) <=1
       UNION
       SELECT arrID
       FROM Arrivals
       WHERE gate = X.gate AND  (ABS (24*(arrT - X.depT))) <=1
  )
WITH CHECK OPTION;

CREATE OR REPLACE VIEW ArrivalV AS 
  SELECT arrID,arrT ,airlineID,routeNum,gate 
  FROM Arrivals X
  WHERE NOT EXISTS (
      SELECT depID
       FROM Departures
       WHERE gate = X.gate AND  (ABS (24*(depT - X.arrT))) <=1
       UNION
       SELECT arrID
       FROM Arrivals
       WHERE gate = X.gate AND  (ABS (24*(arrT - X.arrT))) <=1
  )
WITH CHECK OPTION;

CREATE TABLE Passenger(
	pID INT PRIMARY KEY,
	name VARCHAR(50),
	gov_issued_id INT,
	dob DATE,
	pob VARCHAR(50),
	arrivalID INT,
	departID INT,
	FOREIGN KEY(arrivalID) references Arrivals(arrID),
	FOREIGN KEY(departID) references Departures(depID)
  
);

CREATE OR REPLACE VIEW PassengersV AS 
  SELECT*
  FROM Passenger X
  WHERE NOT EXISTS (
        SELECT pID, arrID, depID, arrT, depT 
        FROM Passenger JOIN Departures ON Passenger.departID = Departures.depID JOIN Arrivals       
                    ON Passenger.arrivalID = Arrivals.arrID
        WHERE pID = X.pID AND (24*(ABS( arrT- depT ))) >=0
  )
WITH CHECK OPTION;


CREATE TABLE Baggage(
	bID INT PRIMARY KEY,
	weight INT,
	passengerID INT,
	FOREIGN KEY(passengerID) references Passenger(pID)
  
);

--If you need to drop the tables:
--DROP TABLE Baggage;
--DROP TABLE Passenger;
--DROP TABLE Arrivals;
--DROP TABLE Departures;
--DROP TABLE IncomingRoutes;
--DROP TABLE OutgoingRoutes;
--DROP TABLE ROUTES;
--DROP TABLE AIRLINES;
--DROP TABLE GATES;

--DROP VIEW DepartureV;
--DROP VIEW ArrivalV;
--DROP VIEW PassengersV;