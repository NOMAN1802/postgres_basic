-- non materialized view example
--A view is a virtual table based on the result set of an SQL query.

--View is  like a virtual table based on the result-set of an SQL statement.
--It contains rows and columns, just like a real table.
--The fields in a view are fields from one or more real tables in the database.     
CREATE View dept_avg_salary AS
select department_name,round(avg(salary)) from employees
GROUP BY department_name;

select department_name,avg(salary) from employees
GROUP BY department_name;

SELECT * FROM dept_avg_salary;


--Drop view
DROP VIEW dept_avg_salary;


--Subqueries with views
CREATE View high_earners AS
SELECT * FROM employees 
WHERE salary > (select round(avg(salary)) from employees);

SELECT * FROM high_earners;

DROP VIEW high_earners;

create View  test_view AS
SELECT employee_name,department_name, salary FROM employees where department_name IN(SELECT department_name from employees where department_name LIKE '%R%');

SELECT * FROM test_view;

--MATERIALIZED VIEW example
--A materialized view is a database object that contains the results of a query.
--It is similar to a view, but unlike a view, which is a virtual table,
--a materialized view stores the query result physically and requires storage space.
CREATE MATERIALIZED VIEW dept_total_salary AS
select department_name,round(sum(salary)) from employees
GROUP BY department_name;


SELECT * FROM dept_total_salary;

