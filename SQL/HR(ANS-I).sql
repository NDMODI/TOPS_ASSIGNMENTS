USE HR;

#Display all information in the tables EMP and DEPT. 
SELECT * FROM employees;
SELECT * FROM departments;

#Display only the hire date and employee name for each employee. 
SELECT first_name AS EMPLOYEE_NAME, hire_date AS HIRE_DATE FROM employees;

#Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
SELECT CONCAT(job_id, '_ ', first_name, ' ', last_name) AS ename FROM employees;

#Display the hire date, name and department number for all clerks. 
SELECT hire_date, CONCAT(first_name, ' ' ,last_name) AS name , department_id FROM employees;

# display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 
SELECT CONCAT(employee_id,',', first_name ,',',email ,',',phone_number )AS OUTPUT FROM employees;

# Display the names and salaries of all employees with a salary greater than 2000
SELECT first_name, salary  FROM employees
WHERE salary > 2000;

#names and dates of employees with the column headers "Name" and "Start Date"
SELECT CONCAT(first_name,' ',last_name) AS Name, hire_date AS Start_Date FROM employees;

#names and hire dates of all employees in the order they were hired
SELECT CONCAT(first_name,' ',last_name) AS Name, hire_date AS Start_Date FROM employees
ORDER BY hire_date;

#names and salaries of all employees in reverse salary order. 
SELECT CONCAT(first_name,' ',last_name) AS Name, salary AS Salary FROM employees
ORDER BY salary DESC;

#'ename" and "deptno" who are all earned commission and display salary in reverse order
SELECT CONCAT(first_name,' ',last_name) AS Name, department_id AS Dept_No, salary AS Salary FROM employees
WHERE commission_pct  IS NOT NULL
ORDER BY salary DESC;

#last name and job title of all employees who do not have a manager
SELECT last_name AS Name, job_id  AS Job_ID FROM employees
WHERE manager_id  IS NULL;

SELECT e.last_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.manager_id IS NULL;


#last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT e.last_name AS Name, j.job_title  AS Job_Title, e.salary AS Salary FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title IN ('Sales Representative', 'Stock Clerk')
AND e.salary NOT IN (2500, 3500, 5000);
