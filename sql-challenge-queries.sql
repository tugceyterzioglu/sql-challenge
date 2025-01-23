-- Query 1: List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
JOIN Salaries s ON e.emp_no = s.emp_no;

-- Query 2: List all employees by department
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name, e.sex
FROM Employees e
JOIN Dept_emp de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no;

-- Query 3: Find the average salary for each department
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM Salaries s
JOIN Dept_emp de ON s.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name;

-- Query 4: List all managers by department
SELECT d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM Dept_manager dm
JOIN Employees e ON dm.emp_no = e.emp_no
JOIN Departments d ON dm.dept_no = d.dept_no;

-- Query 5: Find the highest salary in each department
SELECT d.dept_name, MAX(s.salary) AS max_salary
FROM Salaries s
JOIN Dept_emp de ON s.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name;

-- Query 6: List employees hired after a certain date
SELECT emp_no, first_name, last_name, hire_date
FROM Employees
WHERE hire_date > '2000-01-01';

-- Query 7: Count the number of employees in each department
SELECT d.dept_name, COUNT(de.emp_no) AS employee_count
FROM Dept_emp de
JOIN Departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name;

-- Query 8: List employees with salaries above a certain threshold
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM Employees e
JOIN Salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 80000;

-- Query 9: Find the most recent hire for each department
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name, e.hire_date
FROM Employees e
JOIN Dept_emp de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE e.hire_date = (
    SELECT MAX(hire_date)
    FROM Employees e2
    JOIN Dept_emp de2 ON e2.emp_no = de2.emp_no
    WHERE de2.dept_no = de.dept_no
)
ORDER BY d.dept_name;

-- Query 10: Find the salary range (min and max) for each department
SELECT d.dept_name, MIN(s.salary) AS min_salary, MAX(s.salary) AS max_salary
FROM Salaries s
JOIN Dept_emp de ON s.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name;

-- Query 11: Find employees who worked as managers
SELECT dm.emp_no, e.first_name, e.last_name, d.dept_name
FROM Dept_manager dm
JOIN Employees e ON dm.emp_no = e.emp_no
JOIN Departments d ON dm.dept_no = d.dept_no;