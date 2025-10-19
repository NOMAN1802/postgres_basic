select * from employees;

EXPLAIN ANALYZE
SELECT * FROM employees WHERE employee_name = 'Andrew Cook';

-- Create an index on employee_name column
CREATE INDEX idx_employee_name ON employees(employee_name);

SHOW data_directory;