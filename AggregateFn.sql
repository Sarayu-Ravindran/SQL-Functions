CREATE TABLE Instructor (
    Instructor_Name varchar(20) PRIMARY KEY,
    Instructor_Affiliation char(10)
);

CREATE TABLE Student (
    Student_ID int PRIMARY KEY,
    Student_Name varchar(100) NOT NULL,
    Student_DOB Date,
    Address varchar(100),
    City varchar(100),
    State char(2),
    Zip char(5)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name varchar(100) NOT NULL,
    Instructor_Name varchar(20),
    Tuition DECIMAL(7,2)
);

CREATE TABLE Registration (
    Student_ID INT,
    Student_Name varchar(100),
    Course_ID INT,
    Course_Name varchar(100),
    Registration_Number INT,
    Registration_Date DATE,
    Actual_Tuition DECIMAL(7,2),
    PRIMARY KEY (Student_ID, Course_ID)
);

INSERT INTO Student VALUES (101, 'Luke Skywalker', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'Lars Moisture Farm', 'Tatooine', 'NY', '10001');

INSERT INTO Course VALUES (1, 'Introduction to the Force', 'Obi-wan Kenobi', 200);
INSERT INTO Course VALUES (2, 'Moisture Farming for Dummies', 'Owen Lars', 100);
INSERT INTO Course VALUES (3, 'Throat Choking 101', 'Darth Sidious', 999.99);
INSERT INTO Course VALUES (4, 'Dogabah Surviving Camp', 'Yoda', 2.99);
INSERT INTO Course VALUES (5, 'Lightsaber Fighting', 'Obi-wan Kenobi', 299);
INSERT INTO Course VALUES (6, 'Becoming a Jedi Ghost', 'Yoda', 299);

INSERT INTO Instructor VALUES ('Obi-wan Kenobi', 'Jedi');
INSERT INTO Instructor VALUES ('Anakin Skywalker', 'Jedi');
INSERT INTO Instructor VALUES ('Yoda', 'Jedi');
INSERT INTO Instructor VALUES ('Darth Sidious', 'Sith');

INSERT INTO Registration VALUES (101, 'Luke Skywalker', 1, 'Introduction to the Force', 100, TO_DATE('2019-10-10', 'YYYY-MM-DD'), 180);
INSERT INTO Registration VALUES (101, 'Luke Skywalker', 2, 'Moisture Farming for Dummies', 101, TO_DATE('2019-10-10', 'YYYY-MM-DD'), NULL);
INSERT INTO Registration VALUES (101, 'Luke Skywalker', 3, 'Lightsaber Fighting with Dad', 102, TO_DATE('2019-01-23', 'YYYY-MM-DD'), 50);
INSERT INTO Registration VALUES (102, 'Leah Skywalker', 1, 'Introduction to the Force', 103, TO_DATE('2019-10-10', 'YYYY-MM-DD'), 200);
INSERT INTO Registration VALUES (102, 'Leah Skywalker', 7, 'Public Speaking', 104, TO_DATE('2019-10-10', 'YYYY-MM-DD'), 500);


------------------------------------------------
-- Aggregation Functions
------------------------------------------------

SELECT SUM(Actual_Tuition)
FROM Registration;

SELECT AVG(Tuition)
FROM Course;

SELECT MIN(Tuition), MAX(Tuition)
FROM Course;

-- COUNT functions
SELECT COUNT(*) FROM Course;
SELECT COUNT(Instructor_Name) FROM Course;
SELECT COUNT(DISTINCT Instructor_Name) FROM Course;

-- NULL handling
CREATE TABLE NULL_IN_FUNCTIONS (ID INT);

INSERT INTO NULL_IN_FUNCTIONS VALUES (-1);
INSERT INTO NULL_IN_FUNCTIONS VALUES (1);
INSERT INTO NULL_IN_FUNCTIONS VALUES (1);
INSERT INTO NULL_IN_FUNCTIONS VALUES (2);
INSERT INTO NULL_IN_FUNCTIONS VALUES (3);
INSERT INTO NULL_IN_FUNCTIONS VALUES (NULL);

SELECT SUM(ID) FROM NULL_IN_FUNCTIONS;

-- NULL is neither MIN nor MAX
SELECT MIN(ID) FROM NULL_IN_FUNCTIONS;
SELECT MAX(ID) FROM NULL_IN_FUNCTIONS;

-- NULL is not counted in AVG
SELECT AVG(ID) FROM NULL_IN_FUNCTIONS;

-- Count with NULL
SELECT COUNT(ID) FROM NULL_IN_FUNCTIONS;
SELECT COUNT(*) FROM NULL_IN_FUNCTIONS;
SELECT COUNT(ID) FROM NULL_IN_FUNCTIONS;
SELECT COUNT(DISTINCT ID) FROM NULL_IN_FUNCTIONS;



DROP TABLE Student;
DROP TABLE Course;
DROP TABLE Instructor;
DROP TABLE Registration;