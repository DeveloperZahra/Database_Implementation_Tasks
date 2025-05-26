-- USE ITI DATABASE 
USE ITI

--SHOW ALL INFORMATION FOR THE TABLES 

SELECT * FROM Course

SELECT * FROM  Department

SELECT * FROM Ins_Course

SELECT * FROM Instructor

SELECT * FROM Stud_Course 

SELECT * FROM Student 

SELECT * FROM Topic 
---------------------------------------
--===1.Create a scalar function that takes date and returns Month name of that date==========

CREATE FUNCTION GetMonthName (@InputDate DATE)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @MonthName VARCHAR(20)
    SET @MonthName = DATENAME(MONTH, @InputDate)
    RETURN @MonthName
END

--==2. Create a multi-statements table-valued function that takes 2 integers and returns the values between them=====
CREATE FUNCTION GetNumbersBetween
(
    @Start INT,
    @End INT
)
RETURNS @ResultTable TABLE
(
    Number INT
)
AS
BEGIN
    DECLARE @Current INT
    SET @Current = @Start

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @ResultTable (Number)
        VALUES (@Current)
        
        SET @Current = @Current + 1
    END

    RETURN
END

--===3. Create inline function that takes Student No and returns Department Name with Student full name=======================
CREATE FUNCTION GetStudentInfo
(
    @StudentId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        S.St_Fname + ' ' + S.St_Lname AS FullName,
        D.Dept_Name AS DepartmentName
    FROM 
        Student S
    INNER JOIN 
        Department D ON S.Dept_Id = D.Dept_Id
    WHERE 
        S.St_Id = @StudentId 
);
