create database company

use company

-- Department Table
CREATE TABLE Department (
   Dnumber INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL,
    Mgr_ssn INT NULL,
    Mgr_Start_Date DATE not null ,

);


-- Employee Table
CREATE TABLE Employee (
    EmployeeSsn  INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
	Minit VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Bdate DATE  ,
    EAddress VARCHAR(50) not null ,
    Sex VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    Dnumber INT,
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);



-- dept_Locations table 

CREATE TABLE dept_Locations (
  Dlocation  VARCHAR(20) NOT NULL,
   Dnumber INT,
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
	);

-- Project Table
CREATE TABLE Project (
    Pnumber  INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
	PLocation VARCHAR (20) not null ,
    Dnumber INT,
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

-- Works_On Table (junction table)
CREATE TABLE Works_On (
    EmployeeSsn  INT,
    Pnumber INT,
    HoursWorked DECIMAL(5,2),
    PRIMARY KEY (EmployeeSsn , Pnumber),
    FOREIGN KEY (EmployeeSsn) REFERENCES Employee(EmployeeSsn ),
    FOREIGN KEY (Pnumber) REFERENCES Project(Pnumber)
);


-- Dependent Table
CREATE TABLE Dependent (
    DependentID INT PRIMARY KEY,
    Dependent_name VARCHAR(100) NOT NULL,
	 Dependent_Sex VARCHAR(100) NOT NULL,
	  Dependent_Bdate  DATE,
	   Relationship VARCHAR(50),
       EmployeeSsn INT, 
    FOREIGN KEY (EmployeeSsn) REFERENCES Employee(EmployeeSsn)
);

-- rename employee table 

EXEC sp_rename 'Employee', 'Employees';

