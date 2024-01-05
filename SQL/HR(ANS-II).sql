USE HR;

# maximum, minimum and average salary and commission
SELECT MAX(salary),MAX(commission_pct),MIN(salary),MIN(commission_pct),AVG(salary),AVG(commission_pct) FROM employees;

#department number, total salary payout and total commission payout for each department
SELECT e.department_id AS Department_Id, SUM(e.salary) AS Total_Salary, SUM(e.commission_pct) AS Total_Commission FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id;

# department number and number of employees in each department
SELECT department_id, COUNT(employee_id) FROM employees
GROUP BY department_id;

#department number and total salary of employees in each department
SELECT department_id AS Department_Id, SUM(salary) AS Total_Salary FROM employees
GROUP BY department_id;

#employee's name who doesn't earn a commission. Order the result set without using the column name
SELECT CONCAT(first_name, ' ', last_name) AS Employee_Name FROM employees
WHERE commission_pct IS NULL
ORDER BY 1;

#employees name, department id and commission. If an Employee doesn't EARN commission, then display as 'No commission'.
SELECT first_name, salary, 
       CASE
           WHEN commission_pct > 0 THEN commission_pct
           ELSE 'No Commission'
       END AS Commission
FROM employees;


#employee's name, salary and commission multiplied by 2. If an Employee oesn't earn the commission, then display as 'No commission.
SELECT first_name, salary,
CASE
    WHEN commission_pct > 0 THEN commission_pct * 2
    ELSE 'No Commission'
END AS Commission
FROM employees;

#employee's name, department id who have the first name same as another eployee in the same department
SELECT e.first_name, e.department_id
FROM employees e
WHERE e.first_name IN (
    SELECT first_name
    FROM employees
    WHERE department_id = e.department_id
    GROUP BY first_name
    HAVING COUNT(first_name) > 1
);


#Display the sum of salaries of the employees working under each Manager.
SELECT SUM(salary) AS Total_Salary, manager_id AS Manager FROM employees
group by manager_id;


#Select the Managers name, the count of employees working under and the department ID of the manager.
SELECT e.manager_id, CONCAT(m.first_name, ' ', m.last_name) AS manager_name, COUNT(*) AS employee_count, m.department_id
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY e.manager_id, m.first_name, m.last_name, m.department_id;

#Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, e.department_id, e.salary, CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE SUBSTRING(e.last_name, 2, 1) = 'a'
GROUP BY e.first_name, e.last_name, e.department_id, e.salary, m.first_name, m.last_name;


#Select the maximum salary of each department along with the department id
SELECT MAX(salary), department_id FROM employees
group by department_id;


#Display the average of sum of the salaries and group the result with the department id.Order the result with the department id.
SELECT department_id, AVG(Total_Salary) AS Avg_Total_Salary
FROM (
    SELECT department_id, SUM(salary) AS Total_Salary
    FROM employees
    GROUP BY department_id
) subquery
GROUP BY department_id
ORDER BY department_id;



#Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT commission_pct,
    CASE
        WHEN commission_pct IS NOT NULL THEN salary * 0.1
        ELSE 1
    END AS Calculated_Commission
FROM employees;



