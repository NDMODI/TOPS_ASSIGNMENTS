USE HR;

#last name and hire date of any employee in the same department as SALES
SELECT last_name, hire_date FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'SALES');

# display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending
SELECT employee_id, last_name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary; 
   
#displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a'u
SELECT employee_id, last_name FROM employees
WHERE department_id IN (
    SELECT department_id FROM employees
    WHERE last_name LIKE '%au%'
);

#last name, department number, and job ID of all employees whose department location is Munich                                     
SELECT first_name, last_name, employee_id, job_id FROM employees  
WHERE department_id = (SELECT department_id FROM departments 
WHERE location_id = (SELECT location_id FROM locations WHERE city ='Munich'));
   

#last name and salary of every employee who reports to Kaufling
SELECT e.last_name, e.salary FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.last_name = 'Kaufling';

#department number, last name, and job ID for every employee in the Accounting department
SELECT department_id, last_name, job_id FROM employees 
WHERE department_id = (SELECT department_id FROM departments
WHERE department_name = 'Accounting');


#display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name
SELECT employee_id, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM employees 
WHERE last_name LIKE '%au%');


#names of all employees whose job title is the same as anyone in the sales dept
SELECT e.last_name FROM employees e
WHERE job_id IN (SELECT job_id FROM employees 
WHERE department_id = (SELECT department_id FROM departments 
WHERE department_name = 'SALES'));


#list of employees showing raise percentages, employee IDs, and salaries based on their departments
SELECT '05% raise' raise, employee_id, salary, salary *.05 new_salary FROM   employees
WHERE  department_id IN (10,50, 110)
UNION
SELECT '10% raise', employee_id, salary, salary * .10 FROM   employees
WHERE  department_id = 60
UNION
SELECT '15% raise', employee_id, salary, salary * .15 FROM   employees
WHERE  department_id IN (20, 80)
UNION
SELECT 'no raise', employee_id, salary, salary FROM   employees
WHERE  department_id = 90;


#top three earners in the EMPLOYEES table along with their last names and salaries
SELECT last_name, salary FROM employees
ORDER BY salary DESC
LIMIT 3;

#display the names of all employees with their salary and commission earned (with "O" for null commission),


#display the Managers (name) with top three salaries along with their salaries and department information




