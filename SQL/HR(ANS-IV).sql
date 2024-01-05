USE HR;

# last name, department number, and department name for all employees
SELECT e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

#unique list of all jobs that are in department 4. Include the location of the department in the output:


#employee last name, department name, location id, and city of all employees who earn commission
SELECT e.last_name, d.department_name, l.location_id, l.city FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

#employee last name and department name of all employees who have an 'a' in their last name
SELECT e.last_name, d.department_name FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE '%a%';

#last name, job, department number, and department name for all employees who work in Munich
SELECT e.last_name, j.job_title, e.department_id, d.department_name FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Munich';

#employee last name and employee number along with their manager's last name and manager number
SELECT e.last_name AS employee_last_name, e.employee_id AS employee_number,
       m.last_name AS manager_last_name, e.manager_id AS manager_number
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

#employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager)
SELECT e.last_name AS employee_last_name, e.employee_id AS employee_number,
       m.last_name AS manager_last_name, e.manager_id AS manager_number
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

#employees last name, department number, and all the employees who work in the same department as a given employee Assuming the given employee's ID is 100,


#name, job, department name, salary, grade for all employees. Derive grade based on salary (>=24000=A, >=12000=B, <30000=C)
SELECT e.last_name AS Employee_name, j.job_title, d.department_name, e.salary,
       CASE
           WHEN e.salary >= 24000 THEN 'A'
           WHEN e.salary >= 12000 THEN 'B'
           ELSE 'C'
       END AS Grade
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id;

# names and hire date for all employees who were hired before their managers along with their manager names and hire date. Label the columns as Employee name, emp_hire_date, manager name, man_hire_date
SELECT e.last_name AS "Employee name", e.hire_date AS emp_hire_date,
       m.last_name AS "Manager name", m.hire_date AS man_hire_date
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;









