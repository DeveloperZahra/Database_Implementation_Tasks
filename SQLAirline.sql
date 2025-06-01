--=============create Airline database=========
CREATE DATABASE Airline
--=============use Airline database=====================
USE Airline 
--======================DDL=======================================
-- Airports Table
CREATE TABLE Airports (
    airport_code INT PRIMARY KEY,
    name VARCHAR(100) not null ,
	air_state VARCHAR(100) not null ,
    city VARCHAR(100) not null ,
  
);

-- Airplane Types Table
CREATE TABLE Airplane_Type (
    airplan_type_name VARCHAR PRIMARY KEY,
   company VARCHAR(100) UNIQUE,
   max_seat INT 
);


-- Airplane Type Airport Table
CREATE TABLE Airplane_Type_Airport (
     airplan_type_name VARCHAR REFERENCES Airplane_Type( airplan_type_name),
     airport_code INT REFERENCES Airports( airport_code),
    PRIMARY KEY (  airplan_type_name, airport_code)
); 


-- Airplanes Table 
CREATE TABLE Airplanes (
    airplane_id INT PRIMARY KEY,
    airplan_type_name VARCHAR REFERENCES  Airplane_Type(airplan_type_name),
    total_number_of_seats INT ,
  
);


-- Flights Table
CREATE TABLE Flights (
    flight_no INT  PRIMARY KEY,
    restrictions VARCHAR(100) UNIQUE,
    weekdays DATE,
	Airline VARCHAR(100) not null ,
    airplane_id INT REFERENCES Airplanes(airplane_id)
);

-- Flight Leg Table
CREATE TABLE Flight_Leg (
    leg_no INT PRIMARY KEY,
    flight_no INT REFERENCES Flights(flight_no),
    airport_code INT REFERENCES Airports(airport_code)
   
);


-- Fares Table
CREATE TABLE Fare (
    fare_code INT  PRIMARY KEY,
    flight_no INT REFERENCES Flights (flight_no),
    fare_relationship VARCHAR(50),  
    amount  DECIMAL(10, 2)
);



-- Leg Instance Table 
CREATE TABLE Leg_instance (
    Leg_date DATE PRIMARY KEY,
   leg_no  INT REFERENCES Flight_Leg(leg_no ),
     airport_code INT REFERENCES   Airports ( airport_code),
	 airplane_id INT REFERENCES   Airplanes (  airplane_id),
	no_of_arrival_seate INT null ,
    departure_time TIMESTAMP,
    arrival_time TIME
);


-- Reservation Table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    customer_name VARCHAR(100) not null ,
    customer_Phone INT not null ,
    Leg_date DATE  REFERENCES Leg_instance (Leg_date)

);

--add the change in Flight_Leg table 

ALTER TABLE Flight_Leg
   ADD airport_code INT,
	flight_no INT ;
	
	
ALTER TABLE Flight_Leg
ADD FOREIGN KEY(airport_code) REFERENCES Airports(airport_code);

Alter Table Flight_Leg
ADD FOREIGN KEY(flight_no) REFERENCES  Flights(flight_no);

--Drop and exect in Airports table 

ALTER TABLE Airports
ALTER COLUMN  name nvarchar(10);
EXEC sp_rename 'Airports.name', 'name', 'COLUMN';

ALTER TABLE Airports
DROP COLUMN name;

ALTER TABLE Airports
ADD CONSTRAINT UQ_Airports UNIQUE (airport_code);

--drop the constraints and add in Fare table 

ALTER TABLE Fare
DROP CONSTRAINT CK_Fare_amount;

ALTER TABLE Fare
add CONSTRAINT CK_Fare_amount check(amount between 10 and 2); 

-- truncate and drop Airplane_Type_Airport table 


truncate table Airplane_Type_Airport

drop table Airplane_Type_Airport
------------------------------------------------------------------------DML-----------------------------------------------------------------------------

--insert data to Airport table 

INSERT INTO Airports (airport_code, name, City, air_state) VALUES
(1,'Muscat International Airport', 'Muscat', 'Muscat Governorate'),
(2,'Oman International Airport', 'oman', 'oman Region'),
(3,'Alduqm International Airport', 'duqm', 'duqm Region'),
(4,'sohar International Airport', 'sohar', 'sohar Province'),
(5,'Almudhaibi International Airport', 'mudhaibi', 'mudhaibi Region'),
(6,'sur International Airport', 'sur', 'sur Region');

SELECT * FROM Airports;


--insert data to Airplane_Type table 
INSERT INTO Airplane_Type (airplan_type_name, Company, max_seat) VALUES
('Boeing', 'Boeing', 189),
('Airbus', 'Airbus', 180),
('Boeing', 'Boeing', 396),
('Airbus', 'Airbus', 350),
('Embraer', 'Embraer', 132);

SELECT * FROM Airplane_Type;

--insert data to Airplane table 
INSERT INTO Airplanes (airplane_id, airplan_type_name,  total_number_of_seats) VALUES
(10, 'Airbus',  180),
(20, 'Airbus',  350),
(30, 'Boeing',  189 ),
(40, 'Boeing ', 396),
(50, 'Embraer', 132 );

SELECT * FROM Airplanes;


--insert data to Flight table 
INSERT INTO Flights (flight_no, restrictions, weekdays, Airline) VALUES
(12, 'Saudia', 127),          -- Daily (binary 1111111)
('Qatar Airways', 62),    -- Monday to Friday (binary 0111110)
('Emirates', 65),         -- Sunday and Saturday (binary 1000001)
('Oman Air', 4),          -- Tuesday only (binary 0000100)
('Etihad Airways', 28);   -- Wednesday to Friday (binary 0011100)

SELECT * FROM Flight;      



--insert data to Flight_Leg table 
INSERT INTO Flight_Leg (leg_no, Airport_code, flight_no) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

SELECT * FROM Flight_Leg;


--insert data to Fare table 
INSERT INTO Fare (amount, fare_relationship, flight_no) VALUES
(450, 'Non-refundable, no date change', 1),
(600, 'Refundable with fee, date change allowed', 2),
(350, 'Non-refundable, baggage not included', 3),
(800, 'Fully refundable, includes meals and baggage', 4),
(500, 'Non-refundable, date change allowed with fee', 5);

SELECT * FROM Fare;


--insert data to Leg_Instance table 
INSERT INTO Leg_instance (Leg_date, departure_time, arrival_time, no_of_arrival_seate, airport_code, airplane_id, leg_no) VALUES
('2025-06-01', '08:00:00', '10:00:00', 150, 1, 1, 1),
('2025-06-02', '12:30:00', '14:45:00', 140, 2, 2, 2),
('2025-06-03', '09:15:00', '11:45:00', 175, 3, 3, 3),
('2025-06-04', '16:00:00', '18:20:00', 190, 4, 4, 4),
('2025-06-05', '06:45:00', '09:00:00', 120, 5, 5, 5);

SELECT * FROM Leg_Instance;