-- create a table

create table students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50)  NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(50),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)

);

-- insert data

INSERT into students(first_name,last_name,age,grade,course,email,blood_group,dob,country)

VALUES
('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', 'O+', '2004-05-20', 'USA'),
('Alice', 'Smith', 22, 'B', 'Physics', 'alice.smith@example.com', 'A-', '2002-03-15', 'Canada'),
('Robert', 'Brown', 21, 'A', 'Chemistry', 'robert.brown@example.com', 'B+', '2003-07-08', 'UK'),
('Emily', 'Clark', 19, 'C', 'Biology', 'emily.clark@example.com', 'AB+', '2005-11-02', 'Australia'),
('David', 'Wilson', 23, 'B', 'Math', 'david.wilson@example.com', 'O-', '2001-04-10', 'USA'),
('Sophia', 'Hall', 20, 'A', 'English', 'sophia.hall@example.com', 'A+', '2004-09-25', 'Germany'),
('James', 'Lopez', 22, 'B', 'Computer Science', 'james.lopez@example.com', 'B-', '2002-06-12', 'Mexico'),
('Isabella', 'Lee', 20, 'A', 'Engineering', 'isabella.lee@example.com', 'O+', '2004-01-30', 'South Korea'),
('Liam', 'Harris', 21, 'C', 'Physics', 'liam.harris@example.com', 'AB-', '2003-03-19', 'Ireland'),
('Mia', 'Martin', 18, 'B', 'History', 'mia.martin@example.com', 'A-', '2006-12-05', 'Spain'),
('Noah', 'Thompson', 19, 'A', 'Economics', 'noah.thompson@example.com', 'B+', '2005-10-11', 'USA'),
('Olivia', 'Walker', 21, 'B', 'Sociology', 'olivia.walker@example.com', 'O+', '2003-02-22', 'France'),
('Elijah', 'Young', 22, 'A', 'Philosophy', 'elijah.young@example.com', 'A+', '2002-08-14', 'Italy'),
('Ava', 'King', 20, 'C', 'Statistics', 'ava.king@example.com', 'AB+', '2004-07-07', 'India'),
('William', 'Scott', 23, 'B', 'Architecture', 'william.scott@example.com', 'B-', '2001-01-17', 'USA'),
('Charlotte', 'Green', 19, 'A', 'Anthropology', 'charlotte.green@example.com', 'O-', '2005-06-09', 'New Zealand'),
('Benjamin', 'Adams', 20, 'A', 'Law', 'benjamin.adams@example.com', 'A-', '2004-03-03', 'Canada'),
('Amelia', 'Baker', 21, 'B', 'Political Science', 'amelia.baker@example.com', 'B+', '2003-05-25', 'UK'),
('Lucas', 'Nelson', 18, 'A', 'Music', 'lucas.nelson@example.com', 'AB-', '2006-09-01', 'Norway'),
('Harper', 'Carter', 20, 'A', 'Design', 'harper.carter@example.com', 'O+', '2004-12-29', 'Netherlands');


INSERT INTO students(first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('Ethan', 'Reed', 21, 'B', 'Geography', NULL, '2003-10-05', 'A+', 'Sweden'),
('Abigail', 'Murphy', 19, 'C', 'Psychology', NULL, '2005-02-18', 'B-', 'Denmark');


-- show all data
SELECT * FROM students;

SELECT first_name, age, course FROM students;

-- "" = COLUMN '' = STRING

SELECT email as "student email", last_name as "name "FROM students;

--ORDER BY   == sort the result set

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY age DESC;


-- DISTINCT = remove duplicate values

SELECT DISTINCT country FROM students;

-- select student from USA  
SELECT * from students where country = 'USA';

-- select students 'B' grade in physics course
SELECT * FROM students
 WHERE course ='Physics' AND grade = 'B';

 -- select student with specific blood group 'O+'

 SELECT * FROM students
  where blood_group = 'O+';
 
-- select students from USA or Australia
SELECT * from students
where country = 'USA'  OR country = 'Australia';

-- select students from USA or Australia with age 20    
SELECT * from students
where (country = 'USA'  OR country = 'Australia') AND age = 20;

-- filter out students from USA
select * from students ag
where country <> 'USA';

--function
-- upper() = convert string to uppercase
SELECT upper(first_name) as Name_in_uppercase, * FROM students;

-- concat() = concatenate two or more strings - scalar function
SELECT concat(first_name, ' ', last_name) as "Full Name" from students;

select length(first_name) from students;

-- aggregate function
-- count() = count the number of rows
SELECT count(*) as "Total Students" FROM students;
-- count() with condition
SELECT avg(age) as avrage_age FROM students;

-- max() = find the maximum valu
SELECT max(age) as "Oldest Student" FROM students;

-- min() = find the minimum value
SELECT min(age) as "Youngest Student" FROM students;

-- combine aggregate function with scalar function
select max(length(first_name)) from students;

-- When we compare somthing with NULL, it will return NULL

SELECT * FROM students
s WHERE email = NULL;
-- so we need to use IS NULL or IS NOT NULL
SELECT * FROM students WHERE email IS NULL;

-- COALESCE() = return the first non-null value from the list of values
select COALESCE(email, 'No Email Provided') as "Email" from students;

-- m ultiple or condition

select * from students
where country= 'USA' or country = 'Canada' or country = 'UK';

-- or we can use IN operator
select * from students where country in ('USA','UK','Canada');

-- NOT IN operator
select * from students 
where country not in ('USA','UK','Canada');

--between operator
select * from students 
where age between 19 and 21;

select * from students 
where dob BETWEEN '2000-01-01' AND '2003-12-31';

-- LIKE operator  -- case insensitive
-- used for pattern matching in strings 

-- % = zero or more characters
-- _ = single character   

select * from students
where first_name LIKE 'A%'; -- starts with A

select * from students
where first_name LIKE '%a'; -- ends with a
select * from students
where first_name LIKE '%a%'; -- contains a

select * from students
where first_name LIKE '_a%'; -- second character is a

select * from students
where first_name LIKE 'A__'; -- starts with A and has two characters after A

-- NOT LIKE operator
select * from students
where first_name NOT LIKE 'A%'; -- does not start with A

-- ILIKE operator  -- case insensitive
select * from students
where first_name ILIKE 'a%'; -- case insensitive, does not start with A 

-- LIMIT operator
-- used to limit the number of rows returned by a query 

select * from students LIMIT 5; -- limit the number of rows returned

select * from students where country in ('USA','UK','Canada') LIMIT 5; -- limit the number of rows returned with condition
-- OFFSET operator
-- used to skip a number of rows before starting to return rows from the query
select * from students LIMIT 5 OFFSET 5 * 0; -- skip the first 5 rows and return the next 5 rows
select * from students LIMIT 5 OFFSET 5 * 1; -- skip the first 10 rows and return the next 5 rows
select * from students LIMIT 5 OFFSET 5 * 2; -- skip the first 15 rows and return the next 5 rows     
-- OFFSET without LIMIT
select * from students OFFSET 5; -- skip the first 5 rows and return all the remaining rows 

-- delete data
DELETE from student;

select * FROM students where country = 'USA';

DELETE from students
 WHERE grade = 'B' and country = 'USA'  ;