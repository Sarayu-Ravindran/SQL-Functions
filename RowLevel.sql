INSERT INTO Game
VALUES 
    ('Tampa Bay Buccaneers', 31, 26, 'Green Bay Packers', '2021-01-24', '15:03:00', 'Fox', 'Conference Championships'),
    ('Buffalo Bills', 24, 38, 'Kansas City Chiefs', '2021-01-24', '18:40:00', 'CBS', 'Conference Championships'),
    ('Kansas City Chiefs', 9, 31, 'Tampa Bay Buccaneers', '2021-02-07', '18:30:00', 'CBS', 'Super Bowl LV');

	SELECT distinct Round from Game;
	SELECT HomeScore,AwayScore FROM Game WHERE TV='Fox';
	SELECT HomeScore+AwayScore as "total_scores",* FROM Game WHERE (HomeScore+AwayScore)>50;

	CREATE TABLE Game1 (
    Year INT NOT NULL,
    GameDate DATE NOT NULL,
    GameTime TIME NOT NULL,
    Round VARCHAR(50),
    Stadium VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    HomeTeam VARCHAR(50) NOT NULL,
    HomeGoals INT,
    AwayGoals INT,
    AwayTeam VARCHAR(50) NOT NULL,
    Winner VARCHAR(50),
    PRIMARY KEY (GameDate, GameTime)
);

INSERT INTO Game1 (Year, GameDate, GameTime, Round, Stadium, City, Country, HomeTeam, HomeGoals, AwayGoals, AwayTeam, Winner)
VALUES 
    (2002,'2002-06-30', '20:00:00','Final', 'International Stadium', 'Yokohama', 'Korea/Japan', 'Germany', 0, 2, 'Brazil','Brazil'),
    (2006,'2006-07-09', '20:00:00','Final', 'Olympiastadion', 'Berlin', 'Germany', 'Italy', 1, 1, 'France','Italy');
			 			

INSERT INTO Game1
VALUES 
    (2010,'2010-07-11', '20:20:00','Final', 'Soccer City Stadium', 'Johannesburg', 'South Africa', 'Netherlands', 0, 1, 'Spain','Spain'),
    (2014,'2014-07-13', '16:00:00','Final', 'Estadio do Maracana', 'Rio De Janeiro', 'Brazil', 'Germany', 1, 0, 'Argentina','Germany');

SELECT 	Country,City from Game1; 	

SELECT 	HomeGoals,AwayGoals from Game1 WHERE HomeTeam = 'Germany' ; 

SELECT HomeGoals+AwayGoals as "Totalgoals",* FROM Game1 WHERE (HomeGoals+AwayGoals)>1;

CREATE TABLE Student (

ID int,

Name varchar(20));



INSERT INTO Student VALUES (101, 'Miker');

INSERT INTO Student VALUES (102, 'Erica');

UPDATE Student SET Name = 'Mike' WHERE ID = 101;
ALTER TABLE Student
ADD DOB DATE;

INSERT INTO Student VALUES (103,'Chen', '01/23/2000')

SELECT * FROM Student
WHERE DOB IS NULL;

CREATE TABLE GAME2 (
    Year INTEGER,   -- Proper indentation will make your code more readable.
    GameDate DATE PRIMARY KEY, -- Note that primary key does not need to be the first column of table.
    GameTime TIME,
    Round CHAR(5),
    Stadium VARCHAR(50),
    City VARCHAR(100),
    Country VARCHAR(100),
    HomeTeam VARCHAR(20),
    HomeGoals INTEGER,
    AwayGoals INTEGER,
    AwayTeam VARCHAR(20),
    Winner VARCHAR(20) 
);

DELETE FROM GAME2  
WHERE Year = 2021;

CREATE TABLE Students (
    Student_ID int PRIMARY KEY,
    Student_Name varchar(100) NOT NULL,
    Student_DOB Date,
    Address varchar(100),
    City varchar(100),
    State char(2),
    Zip char(5)
);

INSERT INTO Students VALUES (101, 'Luke Skywalker', '2000-01-01', 'Lars Moisture Farm', 'Tatooine', 'NY', '10001');
SELECT * FROM Students;
-- ::
SELECT Zip::INTEGER FROM Students;
SELECT Zip::DECIMAL(9,2) FROM Students;
SELECT TO_NUMBER('$1,234.00', 'L999g999.99') FROM Students;

-- String concatenation (both CHAR and VARCHAR)
SELECT Student_Name || ':' || City FROM Students;
SELECT Student_Name || ':' || City AS Student_City FROM Students;

-- Length/upper/Lower (both CHAR and VARCHAR)
SELECT LENGTH(Student_Name) FROM Students;
SELECT UPPER(Student_Name) FROM Students;
SELECT LOWER(Student_Name) FROM Students;

SELECT POSITION('S' in Student_Name) FROM Students;
SELECT POSITION('s' in Student_Name) FROM Students;

SELECT REPLACE(Student_Name, 'Skywalker', 'Starkiller') FROM Students;
-- Trivia: In the earlier drafts of the original Star Wars movie, the protagonist's name was Luke Starkiller.

SELECT SUBSTRING(Student_Name, 1, 4) FROM Students;
SELECT LEFT(Student_Name, 6) FROM Students;

-- TO_CHAR
SELECT TO_CHAR(1234.56, '000000.00') FROM Students;

SELECT TO_CHAR(Student_DOB, 'YYYY-MM-DD') FROM Students;
SELECT TO_CHAR(Student_DOB, 'MON DD, YYYY') FROM Students;

-- TO_DATE
SELECT TO_DATE('Feb 24, 2000', 'MON DD, YYYY') FROM Students;
-- This will fail because format string does not match the value
SELECT TO_DATE('Feb 24, 2000', 'MM DD, YYYY') FROM Students;

SELECT CURRENT_DATE - Student_DOB FROM Students;
SELECT Student_DOB + 365 FROM Students;
SELECT AGE(Student_DOB) FROM Students;

SELECT DATE_PART('Y', Student_DOB) FROM Students;
SELECT DATE_PART('Month', Student_DOB) FROM Students;

-- CASE
SELECT 
	CASE 
		WHEN Student_DOB >= '2001-01-01' THEN '21st Century'
		ELSE '20th Century'
	END
FROM Students;

-- It is a good practice to always add an ELSE branch
-- Otherwise you will get a NULL
SELECT 
	CASE 
		WHEN Student_DOB >= '2001-01-01' THEN '21st Century'
	END
FROM Students;

DROP TABLE Student;
DROP TABLE Students;







