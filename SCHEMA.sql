CREATE TABLE departments(
	dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30)
);
	
CREATE TABLE dept_emp(
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE
);
	
CREATE TABLE dept_manager(
	dept_no VARCHAR(30),
	emp_no VARCHAR(30),
	from_date DATE,
	to_date DATE);
	
CREATE TABLE employees(
	emp_no VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(2),
	hire_date DATE);
	
CREATE TABLE salaries(
	emp_no VARCHAR(30),
	salary INTEGER,
	from_date DATE,
	to_date DATE);
	
CREATE TABLE titles(
	emp_no VARCHAR(30),
	title VARCHAR(30),
	from_date DATE,
	to_date DATE);