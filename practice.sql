create table employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    depertment_id INT REFERENCES departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);


CREATE table departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

drop Table employees;
drop table departments;


insert into departments(department_name) VALUES
('Human Resources'),
('Engineering'),
('Marketing'),
('Sales'),
('Customer Support'),
('Research and Development'),
('Finance'),
('IT'),
('Administration'),
('Product Management'),
('Quality Assurance'),
('Business Development'),
('Training and Development'),
('Finance'),
('IT Support')
;


INSERT into employees(employee_name, depertment_id, salary, hire_date) VALUES
('Alice', 1, 60000.00, '2022-01-15'),
('Bob', 2, 75000.00, '2021-06-20'),
('Charlie', 3, 50000.00, '2023-03-10'),
('David', 4, 80000.00, '2020-11-05'),
('Eve', 5, 55000.00, '2022-08-25'),
('Frank', 6, 70000.00, '2019-12-30'),
('Grace', 7, 65000.00, '2021-04-18'),
('Hannah', 8, 72000.00, '2020-09-22'),
('Ian', 9, 58000.00, '2023-02-14'),
('Jack', 10, 62000.00, '2021-07-29'),
('Kathy', 11, 64000.00, '2022-05-10'),
('Leo', 12, 68000.00, '2020-10-15'),
('Mia', 13, 59000.00, '2023-01-20'),
('Nina', 14, 71000.00, '2021-03-05'),
('Oscar', 15, 53000.00, '2022-09-30'),
('Paul', 3, 77000.00, '2019-11-25'),
('Quinn', 2, 54000.00, '2023-04-10'),
('Rita', 12, 60000.00, '2021-08-15'),
('Sam', 2, 65000.00, '2020-12-20'),
('Tina', 15, 72000.00, '2022-02-28');   
SELECT * FROM employees;
SELECT * FROM departments;

--Inner Join to retrive empolyee and depertment information
select * from employees as e
INNER JOIN departments as d on e.depertment_id = d.department_id; 


-- Show dept name and avarage salary
select d.department_name, round(AVG(e.salary)) AS average_salary
from employees as e
 join departments as d ON e.depertment_id = d.department_id
GROUP BY d.department_name;

-- Count of employees in each department
select d.department_name, COUNT(e.employee_id) AS employee_count
from employees as e
 join departments as d ON e.depertment_id = d.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;

--Find the department name with the highest average salary--

SELECT department_name, round(avg(salary)) as avg_salary 
FROM employees JOIN departments ON employees.depertment_id = departments.department_id
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1;


--count employee hired each year

select extract(year from hire_date) as hire_year, count(*) from employees
 GROUP BY hire_year;

 CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

 INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2022-01-05', 100.50),
(2, '2022-01-07', 200.75),
(3, '2022-01-10', 150.25),
(4, '2022-01-15', 300.80),
(5, '2022-01-20', 180.90),
(3, '2022-01-25', 90.00),
(2, '2022-02-01', 120.75),
(3, '2022-02-01', 250.50),
(1, '2022-02-05', 180.25),
(1, '2023-03-05', 180.25);

DROP TABLE orders;
SELECT * FROM orders;

-- Find customers who have placed more than two orders and calculate the total amount spent by each of these customers.

select customer_id ,count(*),round(avg(total_amount)) as avg_amount from orders
 GROUP BY customer_id
 HAVING count(*) > 2;

 -- Find the total amount of prder placed each month in year2022
 SELECT extract(month from order_date) as month, sum(total_amount) 
 FROM orders WHERE extract(year from order_date) = 2022
GROUP BY month;