INSERT INTO Airlines(acode, name, website) VALUES(1234,'Emirates','www.emirates.com');
INSERT INTO Airlines(acode, name, website) VALUES(5678,'Air Canada','www.aircanada.com');
INSERT INTO Airlines(acode, name, website) VALUES(9876,'Lufthansa','lufthansa.com');
        
INSERT INTO Routes(rnum, airlineID, planemodel) VALUES(1000,1234,'Boeing 777');
INSERT INTO Routes(rnum, airlineID, planemodel) VALUES(1001,1234,'Emirates SkyCargo');
INSERT INTO Routes(rnum, airlineID, planemodel) VALUES(1002,5678,'Airbus A319');
INSERT INTO Routes(rnum, airlineID, planemodel) VALUES(1004,5678,'Helijet B890');
INSERT INTO Routes(rnum, airlineID, planemodel) VALUES(1005,1234,'Airbus 0002');
INSERT INTO Routes(rnum, airlineID, planemodel) VALUES(1006,1234,'Airbus 777');
        
INSERT INTO Gates(gate, isfree) VALUES('A15','N');
INSERT INTO Gates(gate, isfree) VALUES('C55','N');
INSERT INTO Gates(gate, isfree) VALUES('Z17','Y');
 
--When testing queries related to time, make sure the time in the hour/min is also set to how you wish
INSERT INTO DepartureV(depID, depT, airlineID, routeNum, gate) VALUES(7,'16-04-01',1234,1005,'C55');
INSERT INTO DepartureV(depID, depT, airlineID, routeNum, gate) VALUES(4,'16-04-10',5678,1004,'C55');
INSERT INTO DepartureV(depID, depT, airlineID, routeNum, gate) VALUES(3,'16-04-03',5678,1002,'A15');
INSERT INTO DepartureV(depID, depT, airlineID, routeNum, gate) VALUES(5,'16-04-03',1234,1006,'Z17');
        
INSERT INTO ArrivalV(arrID, arrT, airlineID, routeNum, gate) VALUES(2,'16-04-01',1234,1001,'Z17');
INSERT INTO ArrivalV(arrID, arrT, airlineID, routeNum, gate) VALUES(3,'16-04-05',1234,1005,'C55');
  
INSERT INTO OutgoingRoutes(routeNum, airlineID, destination, outT) VALUES(1006,1234,'New York','16-11-03');
INSERT INTO OutgoingRoutes(routeNum, airlineID, destination, outT) VALUES(1004,5678,'Houstan','16-04-10');
INSERT INTO OutgoingRoutes(routeNum, airlineID, destination, outT) VALUES(1002,5678,'Cancun','16-04-01');
INSERT INTO OutgoingRoutes(routeNum, airlineID, destination, outT) VALUES(1005,1234,'Hawaii','16-06-02');
    
INSERT INTO IncomingRoutes(routeNum, airlineID, source, incT) VALUES(1000,1234,'Dubai','16-04-01');
INSERT INTO IncomingRoutes(routeNum, airlineID, source, incT) VALUES(1001,1234,'Jeddah','16-03-30');
INSERT INTO IncomingRoutes(routeNum, airlineID, source, incT) VALUES(1002,5678,'Seattle','16-04-01');
INSERT INTO IncomingRoutes(routeNum, airlineID, source, incT) VALUES(1005,1234,'Vancouver','16-04-05');

INSERT INTO Baggage(bID, weight, passengerID) VALUES(99727,36,7);
INSERT INTO Baggage(bID, weight, passengerID) VALUES(99722,57,2);
INSERT INTO Baggage(bID, weight, passengerID) VALUES(99700,63,3);
INSERT INTO Baggage(bID, weight, passengerID) VALUES(99718,28,4);
  
INSERT INTO PassengersV(pID, name, gov_issued_id, dob, pob, arrivalID, departID) VALUES(7,'Jay-Z',115543,'69-09-05','Brooklyn, NY',2,4);
INSERT INTO PassengersV(pID, name, gov_issued_id, dob, pob, arrivalID, departID) VALUES(2,'Joanna Haweta',678999,'91-01-02','New York, NY',2,3);
INSERT INTO PassengersV(pID, name, gov_issued_id, dob, pob, arrivalID) VALUES(3,'Solange Knowles',7459229,'87-05-11','Houstan, TX',2);
INSERT INTO PassengersV(pID, name, gov_issued_id, dob, pob, departID) VALUES(4,'Jessica Jones',711093,'90-12-06','San Fransico, CA',3);

        
 
    
  

  
 