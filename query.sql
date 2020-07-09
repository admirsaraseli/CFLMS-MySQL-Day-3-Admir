-- Exercise 1
select count(*)  FROM employees;

SELECT table_name, table_rows
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'employees'
   
-- Exercise 2
SELECT count(*) AS employees_Mark FROM `employees` where employees.first_name = "Mark";

-- Exercise 3
SELECT count(*) FROM `employees` where employees.first_name = "Eric" and employees.last_name LIKE "A%";

-- Exercise 4
SELECT first_name, last_name, year(`hire_date`) as year FROM `employees` where year(`hire_date`) >= 1985;

-- Exercise 5
SELECT first_name, last_name, year(`hire_date`) as year FROM `employees` where year(`hire_date`) BETWEEN 1990 and 1997;

-- Exercise 6
SELECT *
FROM employees
WHERE emp_no IN
(
SELECT emp_no FROM `salaries` where salary > 70000 
GROUP BY emp_no
);

-- Exercise 7
SELECT * FROM employees
INNER JOIN dept_emp on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE employees.hire_date >= '1992-01-01'
AND departments.dept_name = 'Research'

-- Exercise 8
SELECT * 
from salaries
INNER JOIN employees on employees.emp_no = salaries.emp_no
INNER JOIN dept_emp on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = "Finance"
AND employees.hire_date >= "1985-01-01"
AND salaries.salary > 75000
group by employees.emp_no

-- Exercise 9
SELECT employees.*, salaries.salary, titles.title, TITLES.to_date as rightworking
from salaries
INNER JOIN employees on employees.emp_no = salaries.emp_no
INNER JOIN titles on titles.emp_no = employees.emp_no
WHERE TITLES.to_date = "9999-01-01" 
GROUP BY employees.emp_no

-- Exercise 10
SELECT employees.*, salaries.salary, titles.title, titles.to_date AS rightworking
FROM salaries
INNER JOIN employees ON employees.emp_no = salaries.emp_no
INNER JOIN titles on titles.emp_no = employees.emp_no
WHERE titles.to_date = "9999-01-01"
AND titles.title = "manager"
GROUP BY employees.emp_no

-- Bonus query
SELECT * FROM `employees` 
JOIN titles ON employees.emp_no = titles.emp_no 
JOIN salaries ON employees.emp_no = salaries.emp_no 
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no 
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no