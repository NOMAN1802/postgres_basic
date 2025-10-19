create Table employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

create table depertments(
    dept_id INT,
    dept_name VARCHAR(50)
);


INSERT INTO employees(emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102);

INSERT INTO depertments(dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'Engineering');

SELECT * FROM employees;
SELECT * FROM depertments;

--cross join
SELECT * FROM employees CROSS JOIN depertments;

--Natural join
SELECT * FROM employees NATURAL JOIN depertments;

drop table employees;
drop table depertments;