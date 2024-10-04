SELECT * FROM Departments;
SELECT * FROM Dept_Employees;
SELECT * FROM Dept_Managers;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Titles;

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.employeeID, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM Employees
INNER JOIN Salaries
ON salaries.employeeID = employees.employeeID;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT Departments.deptID, Departments.dept_name, Dept_Managers.employeeID, employees.first_name, employees.last_name
FROM Departments
INNER JOIN Dept_Managers
ON Departments.deptID = Dept_Managers.deptID
INNER JOIN Employees
ON Dept_Managers.employeeID = Employees.employeeID;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT Employees.employeeID, employees.first_name, employees.last_name, Dept_Employees.deptID, Departments.dept_name
FROM Employees
INNER JOIN Dept_Employees
ON Employees.employeeID = Dept_Employees.employeeID
INNER JOIN Departments
ON Dept_Employees.deptID = Departments.deptID;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT Employees.employeeID, employees.first_name, employees.last_name
FROM Employees
INNER JOIN Dept_Employees ON Employees.employeeID = Dept_Employees.employeeID
INNER JOIN Departments ON Dept_Employees.deptID = Departments.deptID
WHERE Departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.employeeID, employees.first_name, employees.last_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Employees ON Employees.employeeID = Dept_Employees.employeeID
INNER JOIN Departments ON Dept_Employees.deptID = Departments.deptID
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency 
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
