--fix dep_emp table,  couldn't upload data because had emp_no as PK, fixed in schema file too!
DROP TABLE dept_emp;

CREATE TABLE dept_emp(
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE
);

--check my data uploaded correctly
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--QUESTION 1 (list details for each employee)
SELECT * FROM employees

--QUESTION 2 (list employees hired in 1986)
SELECT first_name, last_name
FROM employees 
WHERE "hire_date" >= '1986-01-01' AND "hire_date" < '1986-12-31';

--QUESTION 3 (list manager of each dept and corresponding info)
--join departments and dept_manager, and dept_manager and employees
SELECT departments.dept_no, departments.dept_name, dept_manager.from_date, dept_manager.to_date, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no;

--QUESTION 4 (list dept of each employee plus name, dept name, and empl number)
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no;

--QUESTION 5 (list all employees whose name is Hercules and last name starts with B)
SELECT first_name, last_name
FROM employees
WHERE "first_name" = 'Hercules' AND "last_name" LIKE 'B%';

--QUESTION 6 (list all employess in Sales dept; number, names, dept name)
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no
WHERE "dept_name" = 'Sales';

--QUESTION 7 (list all employees in Sales and Development dept; emp_no, last, first, and dept name)
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no 
WHERE "dept_name" = 'Sales'
UNION
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no 
WHERE "dept_name" = 'Development'

--QUESTION 8 (list freq count of employees last names in desc order)
SELECT last_name, COUNT(last_name) as quantity
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;