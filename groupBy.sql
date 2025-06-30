select * from students;
-- agree get function return single value
select country, count(*), avg(age) from students
  GROUP BY country;
 -- filter GROUP BY  HAVING to show only countries with average above age 21.
select country, avg(age) from students
  GROUP BY country
  HAVING avg(age) > 21; -- filter groups based on aggregate function    

  -- Count student born in each year
  select extract(year from dob) as birth_year, count(*)
    from students
    GROUP BY birth_year;
    