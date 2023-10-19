Drop database StudentDB;

CREATE DATABASE StudentDB;

USE StudentDB;

CREATE TABLE Student (
    StdID INT,
    StdName VARCHAR(255),
    Sex VARCHAR(255),
    Percentage INT,
    Class INT,
    Sec CHAR(1),
    DOB DATE,
    Streams VARCHAR(255)
);

INSERT INTO Student 
(StdID, StdName, Sex, Percentage, Class, Sec, DOB, Streams) VALUES
(1001, 'AKSHRA SHARMA', 'FEMALE', 77, 11, 'A', '2005-02-21', 'Science'),
(1002, 'JIYA JOSHI', 'FEMALE', 83, 11, 'B', '2006-01-01', 'Commerce'),
(1003, 'YASH SAXENA', 'MALE', 90, 12, 'B', '2005-07-10', 'Science'),
(1004, 'MOHINI KAPOOR', 'FEMALE', 82, 11, 'B', '2003-11-16', 'Commerce'),
(1005, 'HARSHIT KUMAR', 'MALE', 79, 12, 'A', '2006-04-01', 'Science'),
(1006, 'MEHAR SURTI', 'FEMALE', 60, 12, 'A', '2006-10-17', 'Commerce'),
(1007, 'SUHANI RAJ', 'FEMALE', 66, 11, 'A', '2004-09-22', 'Commerce'),
(1008, 'SAHIL SARASWAT', 'MALE', 55, 12, 'B', '1998-08-13', 'Science'),
(1009, 'RAGHAV GANGWAR', 'MALE', 74, 11, 'A', '2006-01-30', 'Commerce'),
(1010, 'TANMAY AGARWAL', 'MALE', 65, 12, 'A', '2000-02-26', 'Science'),
(1011, 'MANSI DAS', 'FEMALE', 55, 11, 'B', '2004-05-24', 'Science'),
(1012, 'NIKUNJ AGARWAL', 'MALE', 49, 12, 'A', '2006-12-18', 'Commerce'),
(1013, 'AKRITI SAXENA', 'FEMALE', 89, 12, 'B', '2004-11-25', 'Science'),
(1014, 'TANI RASTOGI', 'FEMALE', 82, 12, 'A', '2008-11-10', 'Commerce');


#display all the records form STUDENT table
SELECT * FROM Student ;


#name and date of birth from the table STUDENT
SELECT StdName AS STUDENT_NAME , DOB AS DATE_OF_BIRTH FROM Student;


#any name and date of birth from the table STUDENT
SELECT StdID AS ID, StdName AS STUDENT_NAME , DOB AS DATE_OF_BIRTH FROM Student
WHERE StdID=1010;


#percentage is greater of equal to 80
SELECT * FROM Student 
WHERE Percentage>=80;


#student name, stream and percentage where percentage of student is more than 80
SELECT * FROM Student 
WHERE Percentage>80; 

#records of science students whose percentage is more than 75 
SELECT * FROM Student 
WHERE Percentage>75 AND Streams ='Science';