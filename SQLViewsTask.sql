CREATE DATABASE RealWorldStyle

 USE RealWorldStyle 

-- CREATE Employees Table:
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary INT,
    DeptID INT
);

--CREATE Departments Table:
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100),
    Location VARCHAR(100)
);

--SHOW ALL INFORMATION INTO THE TABLES 

INSERT INTO Employees (EmpID, Name, Salary, DeptID)
VALUES
    (1, 'Alice', 60000, 101),
    (2, 'Bob', 45000, 102),
    (3, 'Charlie', 75000, 101),
    (4, 'Diana', 50000, 103),
    (5, 'Eve', 68000, 102);

SELECT * FROM Employees
---
INSERT INTO Departments (DeptID, DeptName, Location)
VALUES
    (101, 'Engineering', 'New York'),
    (102, 'Sales', 'Chicago'),
    (103, 'HR', 'San Francisco');

SELECT * FROM Departments

---------------- 1. Create a View `HighEarners`-----
   -- Show employee `Name` and `Salary` for employees earning more than 60,000
   CREATE VIEW HighEarners AS
SELECT Name, Salary
FROM Employees
WHERE Salary > 60000;
GO

SELECT * FROM HighEarners;

----2. Create a View `EmpDepartmentInfo`
-- - Join Employees and Departments tables.
 -- - Show: `Name`, `Salary`, `DeptName`, `Location`

 CREATE VIEW EmpDepartmentInfo AS
SELECT 
    E.Name,
    E.Salary,
    D.DeptName,
    D.Location
FROM 
    Employees E
JOIN 
    Departments D ON E.DeptID = D.DeptID;
GO

SELECT * FROM EmpDepartmentInfo; 

----3. Create a View `ChicagoEmployees`
-- - Show employees working in the Chicago department

CREATE VIEW ChicagoEmployees AS
SELECT 
    E.Name,
    E.Salary,
    D.DeptName,
    D.Location
FROM 
    Employees E
JOIN 
    Departments D ON E.DeptID = D.DeptID
WHERE 
    D.Location = 'Chicago';
GO

SELECT * FROM ChicagoEmployees;

---4.  Update the View `HighEarners`
 --  - Modify it to also include `DeptID`

 CREATE OR ALTER VIEW HighEarners AS
SELECT 
    Name,
    Salary,
    DeptID
FROM 
    Employees
WHERE 
    Salary > 60000;
GO


SELECT * FROM HighEarners;

---5. Try to Update Data Through View
 -- - Try updating an employee's salary through the `HighEarners` view.
  -- - Was it allowed? Why or why not?

  UPDATE HighEarners
SET Salary = 80000
WHERE Name = 'Eve';

---6.  Delete the View `ChicagoEmployees`
  -- - Use `DROP VIEW`

DROP VIEW ChicagoEmployees;

----------Bonus Challenge------------

--Create a view `DepartmentStats` that shows:
---`DeptName`
--- Number of employees in each department ===== (Hint: Use `GROUP BY` and `COUNT()`)

CREATE VIEW DepartmentStats AS
SELECT 
    D.DeptName,
    COUNT(E.EmpID) AS EmployeeCount
FROM 
    Departments D
LEFT JOIN 
    Employees E ON D.DeptID = E.DeptID
GROUP BY 
    D.DeptName;
GO

SELECT * FROM DepartmentStats;

