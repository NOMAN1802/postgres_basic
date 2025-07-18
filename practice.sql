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
select  from employees as e
 join departments as d USING(department_id);