Drop database WorkerDB;

Create database WorkerDB;

use WorkerDB;

CREATE TABLE Worker (
    Worker_ID int,
    FirstName varchar(255),
     LastName varchar(255),
    Salary Int,
     Joining_Date datetime,
    Department varchar(255)
);

INSERT INTO Worker 
	(Worker_ID, FirstName, LastName, Salary, Joining_Date, Department) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');
  
   
#order by FIRST_NAME Ascending and DEPARTMENT Descending. 
SELECT *
FROM Worker
ORDER BY FirstName ASC,
         Department DESC ;
         
         
#first names “Vipul” and “Satish” from the Worker table. 
SELECT *
FROM Worker
where FirstName in ('Vipul','Satish');


#FIRST_NAME ends with ‘h’ and contains six alphabets
SELECT *
FROM Worker
where FirstName Like '_____h';


#SALARY lies between 100000 and 300000 
SELECT *
FROM Worker
where Salary between 100000 and 300000;


#fetch duplicate records having matching data in some fields of a table. 
SELECT FirstName, COUNT(FirstName) 
FROM Worker
GROUP BY FirstName
HAVING COUNT(FirstName) > 1

SELECT Department, COUNT(Department) 
FROM Worker
GROUP BY Department
HAVING COUNT(Department) > 1


# show the top 6 records of a table
SELECT *
FROM Worker
Where Worker_ID between 1 and 6;

#fetch the departments that have less than five people in them. 
SELECT Department, COUNT(Department) 
FROM Worker
GROUP BY Department
HAVING COUNT(Department) < 5


#show all departments along with the number of people in there. 
SELECT Department, COUNT(Department) 
FROM Worker
GROUP BY Department
HAVING COUNT(Department) > 0


#name of employees having the highest salary in each department. 
SELECT department, FirstName, LastName, Salary
FROM Worker
WHERE (Department, Salary) IN (
    SELECT Department, MAX(Salary)
    FROM Worker
    GROUP BY Department
)
