--CREATE DATABASE OF ApplicationSystem
CREATE DATABASE ApplicationSystem

-- USE DATABASE 
USE  ApplicationSystem

--CREATE Trainees Table 
CREATE TABLE Trainees ( 
    TraineeID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    Program VARCHAR(50), 
    GraduationDate DATE 
); 

--CREATE Job Applicants Table 

CREATE TABLE Applicants ( 
    ApplicantID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    Source VARCHAR(20), -- e.g., "Website", "Referral" 
    AppliedDate DATE 
);

--=======INSERT INFORMATION INTO THE TABLES========= 
-- Insert into Trainees 

INSERT INTO Trainees VALUES 
(1, 'Layla Al Riyami', 'layla.r@example.com', 'Full Stack .NET', '2025-04-30'), 
(2, 'Salim Al Hinai', 'salim.h@example.com', 'Outsystems', '2025-03-15'), 
(3, 'Fatma Al Amri', 'fatma.a@example.com', 'Database Admin', '2025-05-01'); 

SELECT * FROM Trainees

-- Insert into Applicants 
INSERT INTO Applicants VALUES 
(101, 'Hassan Al Lawati', 'hassan.l@example.com', 'Website', '2025-05-02'), 
(102, 'Layla Al Riyami', 'layla.r@example.com', 'Referral', '2025-05-05'), -- same person as 
(103, 'Aisha Al Farsi', 'aisha.f@example.com', 'Website', '2025-04-28');


SELECT * FROM Applicants

--====================Part 1: UNION Practice=======================
--===== List all unique people who either trained or applied for a job=======
--========*Show their full names and emails======
--=======*Use UNION (not UNION ALL) to avoid duplicates=====
SELECT FullName, Email
FROM Trainees

UNION  -- This removes duplicates

SELECT FullName, Email
FROM Applicants;

--=========2. Now use UNION ALL. What changes in the result?======
--=========* Explain why one name appears twice.=======


SELECT FullName, Email
FROM Trainees

UNION ALL  -- Includes duplicates

SELECT FullName, Email
FROM Applicants;
--===UNION ALL includes all rows from both tables without removing duplicates.
--===So if someone appears in both the Trainees and Applicants tables with the same name and email, they will appear twice in the result.

--========3.Find people who are in both tables=========
--==You must use INTERSECT if supported, or simulate it using INNER JOIN on Email=====


SELECT FullName, Email
FROM Trainees

intersect 

SELECT FullName, Email
FROM Applicants;

--==INNER JOIN

SELECT T.FullName, T.Email
FROM Trainees T
INNER JOIN Applicants A
    ON T.Email = A.Email;

--==================== Part 2: DROP, DELETE, TRUNCATE Observation=======================
--===Let’s test destructive commands==
--==4.. Try DELETE FROM Trainees WHERE Program = 'Outsystems'=====
--==*Check if the table structure still exists====

 DELETE FROM Trainees WHERE Program = 'Outsystems' --Deletes data (rows) from the Trainees table where the Program is 'Outsystems'

--====5.Try TRUNCATE TABLE Applicants.======
--======*What happens to the data? Can you roll it back?=====

TRUNCATE TABLE Applicants --All rows in the Applicants table are immediately and permanently removed.

--The table structure remains — columns, constraints, indexes stay intact.

--The table is now empty, just like after a DELETE FROM Applicants without a WHERE clause — but much faster and less resource-intensive.

---====6. Try DROP TABLE Applicants======
--=====*What happens if you run a SELECT after that?===
DROP TABLE Applicants --The entire Applicants table is permanently deleted.

--This means:

--==All data is gone.

--==All columns, indexes, and constraints are gone.

--==The table no longer exists in the database
--====================Part 3: Self-Discovery & Applied Exploration=======================
--========*Write a query to find all trainees whose emails appear in the applicants table. 

SELECT * FROM Trainees WHERE Email = (
SELECT Email
FROM Trainees
INTERSECT
SELECT Email
FROM Applicants
);
--=====*Delete all applicants whose email matches someone in the trainees table. 
DELETE FROM Applicants WHERE Email = (
SELECT Email
FROM Trainees
INTERSECT
SELECT Email
FROM Applicants
);


--==========================Batch Script & Transactions=============================
--====▪ Starts a transaction 
--====▪ Tries to insert two new applicants 
--====▪ The second insert should have a duplicate ApplicantID (to force failure) 
--====▪ Rollback the whole transaction if any error occurs 

begin try
	begin transaction
INSERT INTO Applicants VALUES (104, 'Zahra Al Al Amri', 'zahra.a@example.com', 'Referral', '2025
05-10'); 
INSERT INTO Applicants VALUES (104, 'Error User', 'error@example.com', 'Website', '2025-05
11'); -- Duplicate ID 
	commit
end try
begin catch
	ROLLBACK 
	select ERROR_LINE() ,ERROR_MESSAGE(), ERROR_NUMBER()
end catch