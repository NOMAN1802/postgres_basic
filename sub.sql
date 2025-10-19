CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employees (employee_name, department_name, salary, hire_date) VALUES
('John Doe', 'HR', 60000.00, '2022-01-10'),
('Jane Smith', 'Marketing', 75000.50, '2021-05-25'),
('Bob Johnson', 'Finance', 80000.75, '2020-11-15'),
('Alice Williams', 'IT', 90000.25, '2019-08-03'),
('David Lee', 'Sales', 65000.50, '2020-03-18'),
('Sara Brown', 'Engineering', 70000.00, '2021-09-28'),
('Mike Miller', 'Customer Support', 55000.75, '2022-02-05'),
('Emily Davis', 'Administration', 95000.00, '2018-12-12'),
('Chris Wilson', 'Research', 72000.50, '2020-06-30'),
('Amy White', 'Quality Assurance', 68000.25, '2021-11-09'),
('John Johnson', 'HR', 62000.00, '2022-01-15'),
('Jessica Thompson', 'Marketing', 78000.50, '2021-06-05'),
('Michael Harris', 'Finance', 85000.75, '2020-11-25'),
('Emma Martinez', 'IT', 92000.25, '2019-09-15'),
('James Taylor', 'Sales', 67000.50, '2020-04-08'),
('Sophia Anderson', 'Engineering', 72000.00, '2021-10-10'),
('William Jackson', 'Customer Support', 56000.75, '2022-02-10'),
('Olivia Nelson', 'Administration', 97000.00, '2018-12-20'),
('Daniel White', 'Research', 73000.50, '2020-07-05'),
('Ava Wilson', 'Quality Assurance', 69000.25, '2021-11-15'),
('Matthew Brown', 'HR', 63000.00, '2022-01-20'),
('Emily Garcia', 'Marketing', 76000.50, '2021-06-15'),
('Christopher Allen', 'Finance', 86000.75, '2020-12-05'),
('Andrew Cook', 'Sales', 68000.50, '2020-04-18'),
('Grace Hill', 'Engineering', 73000.25, '2021-09-12'),
('Jacob Scott', 'Customer Support', 54000.50, '2022-03-05'),
('Natalie Adams', 'Administration', 96000.00, '2018-11-25'),
('Benjamin Carter', 'Research', 74000.25, '2020-08-10'),
('Victoria Evans', 'Quality Assurance', 70000.50, '2021-12-01'),
('Ethan Rivera', 'IT', 91000.75, '2019-07-20');


DROP TABLE employees;

SELECT * FROM employees;

-- sub query
--Retrive all employees whose salary is grater than the hight salary in the 'HR' department --- 63k


select max(salary) from employees
where department_name = 'HR';

SELECT * FROM employees 
WHERE salary > (select max(salary) from employees
where department_name = 'HR');

--Sub query useage
--SELECT --- have to return single/multiple values or single column
--FROM
--WHERE
--Using sub query in SELECT clause
select round(sum(salary)) from employees;
select *, (select round(sum(salary)) from employees) from employees;

--Using sub query in GROUP BY clause
select department_name,sum(salary) from employees
group by department_name;

--Using sub query in FROM clause
--2 part 
--main/outer query-- select department_name from  
--sub/inner query -- (select department_name,sum(salary) from employees group by department_name) as sum_salary;
select department_name from (select department_name,sum(salary) from employees group by department_name) as sum_salary;

--Using sub query with IN operator
--Retrive all employees who are working in departments having 'R' in their department name
SELECT employee_name,department_name, salary FROM employees where department_name IN(SELECT department_name from employees where department_name LIKE '%R%')