Create Table departments(
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);
Select * From departments;

Create Table dept_emp(
	emp_no INT,
	dept_no VARCHAR(30)
);
Select * From dept_emp;

Create Table dept_manager(
	dept_no VARCHAR(30),
	emp_no SERIAL PRIMARY KEY
);
Select * From dept_manager;

Create Table employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30),
	hire_date DATE
);
Select * From employees;

Create Table salaries(
	emp_no SERIAL PRIMARY KEY,
	salary INT
);
Select * From salaries;

Create Table titles(
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30)
);
Select * From titles;

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_dept_no
FOREIGN KEY (dept_no)
REFERENCES departments(dept_no);

ALTER TABLE employees
ADD CONSTRAINT fk_emptitle_title_id
Foreign Key (emp_title_id)
References titles(title_id);

Alter Table employees
Add Constraint fk_empno_salary
Foreign Key (emp_no)
References salaries(emp_no);

Alter Table salaries
Add Constraint fk_empno_salary
Foreign Key (emp_no)
References employees(emp_no);

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no;

SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;

SELECT
    dm.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    dept_manager dm
JOIN
    departments d ON dm.dept_no = d.dept_no
JOIN
    employees e ON dm.emp_no = e.emp_no;

SELECT
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    de.dept_no AS department_number,
    d.dept_name AS department_name
FROM
    dept_emp de
JOIN
    employees e ON de.emp_no = e.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no;

SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');

SELECT
    last_name,
    COUNT(*) AS frequency_count
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency_count DESC;






