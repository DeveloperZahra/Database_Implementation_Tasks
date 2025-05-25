--Schema
--create databse Movie_Streaming

CREATE DATABASE Movie_Streaming 

--USE DATABASE 
USE Movie_Streaming

--====CREATE USERS TABLE====
CREATE TABLE Users (
UserID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE,
SubscriptionType VARCHAR(20)  -- Free, Basic, Premium
);
--======CREATE MOVIES TABLE===
CREATE TABLE Movies (
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT,
DurationMinutes INT
);

--=======CREATE WatchHistory TABLE======
CREATE TABLE WatchHistory(
WatchID INT PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(UserID),
MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
WatchDate DATE,
WatchDuration INT -- in minutes
);

--=====Sample Data Insertion===
--====Users TABLE=====

INSERT INTO Users (UserID, FullName, Email, JoinDate, SubscriptionType) VALUES
(1, 'Ali Al Hinai', 'ali@example.com', '2024-01-01', 'Premium'),
(2, 'Noor Al Busaidi', 'noor@example.com', '2024-02-15', 'Basic'),
(3, 'Hassan Al Rawahi', 'hassan@example.com', '2024-03-10', 'Free'),
(4, 'Muna Al Lawati', 'muna@example.com', '2024-04-05', 'Premium'),
(5, 'Salim Al Zadjali', 'salim@example.com', '2024-05-01', 'Basic');

SELECT * FROM Users

--====Movies TABLE===

INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMinutes) VALUES
(1, 'The Silent Ocean', 'Sci-Fi', 2023, 120),
(2, 'Omani Roots', 'Documentary', 2022, 90),
(3, 'Fast Track', 'Action', 2024, 130),
(4, 'Code & Coffee', 'Drama', 2023, 110),
(5, 'The Last Byte', 'Thriller', 2023, 105);

SELECT * FROM Movies

--===WatchHistory TABLE======

INSERT INTO WatchHistory (WatchID, UserID, MovieID, WatchDate, WatchDuration) VALUES
(1, 1, 1, '2025-05-10', 120),
(2, 2, 2, '2025-05-11', 80),
(3, 3, 3, '2025-05-12', 60),
(4, 4, 1, '2025-05-12', 90),
(5, 5, 5, '2025-05-13', 105);

SELECT * FROM WatchHistory

----================================AGGERGATION TASKS===========================
--==================Beginner Level (Basic Practice) ==================================
--=======1.Total Number of Users=====
SELECT COUNT (*) AS Total_Number_of_Users FROM Users

--====2. Average Duration of All Movies=====
SELECT * FROM WatchHistory
SELECT AVG(WatchDuration) AS Average_WatchDuration FROM WatchHistory

--======3. Total Watch Time=====
SELECT SUM (WatchDuration) AS TotalWatch FROM WatchHistory

--======4. Number of Movies per Genre ========
SELECT COUNT(MovieID) AS Number_of_movies , Genre
FROM Movies
GROUP BY Genre

--====5. Earliest User Join Date =====
SELECT MIN (JoinDate) AS Join_Date FROM Users

--===6. Latest Movie Release Year====
SELECT MAX(ReleaseYear) AS LatestMovieReleaseYear FROM Movies

--==================Intermediate Level (Deeper Insights) =================================
--=====7. Number of Users Per Subscription Type=====
SELECT COUNT(UserID) AS Number_of_Users,SubscriptionType
FROM Users
GROUP BY SubscriptionType

--======8. Total Watch Time per User===
SELECT SUM(WatchDuration) AS Total_Watch_Time  , UserID 
FROM WatchHistory
GROUP BY UserID

--=====9. Average Watch Duration per Movie========
SELECT AVG(WatchDuration) AS Average_Watch_Duration  , MovieID 
FROM WatchHistory
GROUP BY MovieID

--====10. Average Watch Time per Subscription Type=====
SELECT AVG(WH.WatchDuration) AS Average_Watch_Duration , Users.SubscriptionType
FROM WatchHistory WH join Users 
ON Users.UserID = WH.UserID
GROUP BY Users.SubscriptionType

--===11. Number of Views per Movie (Including Zero) ======
SELECT COUNT(UserID) as number_of_views , MovieID
FROM WatchHistory
GROUP BY MovieID

--===12. Average Movie Duration per Release Year =========
SELECT AVG(WH.WatchDuration) AS  Average_Watch_Duration , Movies.ReleaseYear
FROM WatchHistory WH join Movies 
ON  Movies.MovieID = WH.MovieID
GROUP BY  Movies.ReleaseYear

--==================Advanced Level (Challenging Scenarios) =================================
--====13. Most Watched Movie===========
SELECT TOP 1 SUM(WH.WatchDuration) AS Most_Watched_Movie , Movies.Title
FROM WatchHistory WH join Movies
ON Movies.MovieID = WH.MovieID
GROUP BY Movies.Title

--=====14. Users Who Watched More Than 100 Minutes========
SELECT SUM(WH.WatchDuration) AS Minutes_Of_Watch , Users.FullName
FROM WatchHistory WH join Users
ON Users.UserID = WH.UserID
GROUP BY Users.FullName
HAVING SUM(WH.WatchDuration) > 100

--===15. Total Watch Time per Genre =======
SELECT SUM(WH.WatchDuration) AS Total_Watch_Time , Movies.Genre
FROM WatchHistory WH join Movies
ON Movies.MovieID = WH.MovieID
GROUP BY Movies.Genre

--===16.  Identify Binge Watchers (Users Who Watched 2 or More Movies in One Day)====
SELECT COUNT(WH.WatchID) AS MoviesWatched , WH.WatchDate, Users.FullName
FROM WatchHistory WH join Users
ON Users.UserID = WH.UserID
GROUP BY Users.FullName ,  WH.WatchDate
HAVING  COUNT(WH.WatchID) >=2

--=====17. Genre Popularity (Total Watch Duration by Genre========
                                                                                                                                                                                                                                                                              













