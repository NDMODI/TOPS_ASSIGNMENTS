USE HR;

#employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, give each column an appropriate label.
SELECT 
    SUBSTR(UPPER(last_name), 2, 4) AS Modified_Last_Name
FROM employees;

#employee's first name and last name along with a " in between, and also display the month on which the employee has joined.
SELECT CONCAT(first_name , ' ',last_name) AS Full_Name,
    hire_date AS Join_Month
FROM employees;

#employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5%, along with the bonus amount of 1500 each.
SELECT 
    last_name,
    CASE
        WHEN salary * 0.5 > 10000 THEN ROUND( salary * 1.1 + 1500,2)
        ELSE ROUND(salary * 1.115 + 1500,2)
    END AS New_Salary
FROM employees;


#employee ID by appending two zeros after the 2nd digit and 'E' in the end, department id, salary, and the manager name all in upper case. If the manager name consists of 'z', replace it with '$!'


#employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names.
SELECT 
CONCAT( UPPER(SUBSTR(last_name, 1, 1)), LOWER(SUBSTR(last_name, 2)))
 AS Modified_Last_Name,
    LENGTH(last_name) AS Name_Length
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

# last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $
SELECT 
    last_name,
    LPAD(CONCAT('$', FORMAT(salary, 2)), 15, '$') AS SALARY
FROM employees;

#employee's name if it is a palindrome.
SELECT 
    CONCAT(first_name, ' ', last_name) AS Full_Name
FROM employees
WHERE 
    CONCAT(first_name, last_name) = REVERSE(CONCAT(first_name, last_name));


#First names of all employees with initcaps.
SELECT 
    CONCAT(UCASE(SUBSTRING(first_name, 1, 1)), LCASE(SUBSTRING(first_name, 2))) AS First_Name
FROM employees;

#From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.


#Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. 
SELECT CONCAT(LOWER(SUBSTRING(first_name,1,1)),LOWER(last_name),'@systechusa.com') AS "E-mail Address", first_name FROM employees;

#names and job titles of all employees with the same job as Trenna.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee_Name,
    e.job_id AS Job_Title
FROM employees e
JOIN employees t ON e.job_id = t.job_id AND t.first_name = 'Trenna';

#names and department name of all employees working in the same city as Trenna.


#name of the employee whose salary is the lowest.
SELECT CONCAT(first_name, ' ', last_name) AS Employee_Name FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

#names of all employees except the lowest paid.
SELECT CONCAT(first_name, ' ', last_name) AS Employee_Name FROM employees 
WHERE salary > (SELECT MIN(salary) FROM employees);
