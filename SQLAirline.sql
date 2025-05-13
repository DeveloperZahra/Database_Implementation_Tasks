CREATE DATABASE Airline

USE Airline 

-- Airports Table
CREATE TABLE Airports (
    airport_code INT PRIMARY KEY,
    name VARCHAR(100) not null ,
	air_state VARCHAR(100) not null ,
    city VARCHAR(100) not null ,
  
);

-- Airplane Types Table
CREATE TABLE Airplane_Type (
    airplan_type_name VARCHAR  PRIMARY KEY,
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


ALTER TABLE Flight_Leg
   ADD airport_code INT,
	flight_no INT ;
	
	
ALTER TABLE Flight_Leg
ADD FOREIGN KEY(airport_code) REFERENCES Airports(airport_code);

Alter Table Flight_Leg
ADD FOREIGN KEY(flight_no) REFERENCES  Flights(flight_no);



ALTER TABLE Airports
ALTER COLUMN  name nvarchar(10);
EXEC sp_rename 'Airports.name', 'name', 'COLUMN';

ALTER TABLE Airports
DROP COLUMN name;

ALTER TABLE Airports
ADD CONSTRAINT UQ_Airports UNIQUE (airport_code);

ALTER TABLE Fare
DROP CONSTRAINT CK_Fare_amount;

ALTER TABLE Fare
add CONSTRAINT CK_Fare_amount check(amount between 10 and 2); 


truncate table Airplane_Type_Airport

drop table Airplane_Type_Airport
