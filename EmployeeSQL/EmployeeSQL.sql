-- Create a Departments table
CREATE TABLE departments (
  dept_no VARCHAR(30) NOT NULL,
  dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM departments

-- Create a Dept_Emp table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(30) NOT NULL
);

-- Create a Dept_Manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  emp_no INT NOT NULL
);

-- Create a Employees table
CREATE TABLE employees (
  emp_no INT NOT NULL,
  emp_title VARCHAR(30) NOT NULL,
  birth_date VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date VARCHAR(30) NOT NULL
);

-- Create a Salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL
);

-- Create a Titles table
CREATE TABLE titles (
  title_id VARCHAR(30) NOT NULL,
  title VARCHAR(30) NOT NULL
);

-- 1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary.
SELECT i.emp_no, i.first_name, i.last_name, i.sex, f.salary
FROM employees i
JOIN salaries f
ON (i.emp_no = f.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%86%';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.
SELECT i.dept_no, i.dept_name, f.emp_no, n.first_name, n.last_name
FROM departments i
JOIN dept_manager f
ON (i.dept_no = f.dept_no)
JOIN employees n
ON (f.emp_no = n.emp_no);

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT i.emp_no, i.first_name, i.last_name, n.dept_name
FROM employees i
JOIN dept_emp f
ON (i.emp_no = f.emp_no)
JOIN departments n
ON (f.dept_no = n.dept_no);

-- 5. List first name, last name, and sex for employees whose first name
-- is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT i.emp_no, i.first_name, i.last_name, n.dept_name
FROM employees i
JOIN dept_emp f
ON (i.emp_no = f.emp_no)
JOIN departments n
ON (f.dept_no = n.dept_no)
WHERE n.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT i.emp_no, i.first_name, i.last_name, n.dept_name
FROM employees i
JOIN dept_emp f
ON (i.emp_no = f.emp_no)
JOIN departments n
ON (f.dept_no = n.dept_no)
WHERE n.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;