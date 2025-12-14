USE demo_db;

CREATE TABLE departments (
	dept_id INT auto_increment KEY,
    dept_name VARCHAR(50) UNIQUE NOT NUll
);

CREATE TABLE employees (
	emp_id INT auto_increment PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    CONSTRAINT fk_department FOREIGN KEY (dept_id)
		references  departments(dept_id)
);

DROP TABLE departments;

INSERT INTO departments(dept_name)
VALUES (null);

INSERT INTO departments(dept_name)
VALUES ("IT"),('FINANCE');

SELECT * FROM departments;
SELECT * FROM employees;

INSERT INTO employees (emp_name, salary, dept_id)
VALUES ('Alice', 5000, 1);

INSERT INTO employees (emp_name, salary, dept_id)
VALUES ('Maddy', 6000, null);
INSERT INTO employees (emp_name, salary, dept_id)
VALUES ('Bob', 10000, 3);

INSERT INTO employees (emp_name, salary, dept_id)
VALUES 
('Charlie', 5500, 3),
('Eva', 3500, 2);

-- DDL
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

ALTER TABLE employees
DROP COLUMN email;

SELECT * FROM employees;


UPDATE employees
SET salary = salary + 5000
WHERE emp_name ='Alice';

DELETE FROM employees
WHERE emp_name = 'Eva';

-- JOINS

SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id= d.dept_id;

-- left outer join
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id= d.dept_id;

-- right join

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id= d.dept_id;

-- count : find how many employees in each department
SELECT d.dept_name, count(emp_id)
FROM employees e
INNER JOIN departments d
on e.dept_id = d.dept_id
GROUP BY d.dept_id;
-- average + having : find departments whose average salary > 55000
