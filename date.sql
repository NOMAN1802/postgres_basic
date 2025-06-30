-- showtime zone
SHOW TIMEZONE;

-- time stamp
select now(); -- current date and time

--casting
select now()::date; -- current date


select now()::time; -- current time

select current_date; -- current date

create Table tsz(ts TIMESTAMP WITHOUT TIME ZONE, tsz TIMESTAMP WITH TIME ZONE);

insert into tsz values ('2025-06-29 11:00:00', '2025-06-29 11:00:00');

select * from tsz;

-- date formating
select to_char(now(), 'YYYY/MM/DD'); -- format date as YYYY/MM/D

select to_char(now(), 'YYYY-MM-DD HH24:MI:SS'); -- format date as YYYY-MM-DD HH24:MI:SS

select to_char(now(), 'Day, DD Month YYYY'); -- format date as Day, DD Month YYYY

select to_char(now(), 'DDD'); -- day of the year
select to_char(now(), 'WW'); -- week of the year
select to_char(now(), 'D'); -- day of the week (1-7, where 1 is Sunday)

select CURRENT_DATE - INTERVAL '1 year'; -- 1 year ago
select CURRENT_DATE + INTERVAL '1 year'; -- 1 year 

select age(CURRENT_DATE, '1994-05-17'); -- age from a specific date

select *, age(current_date,dob) from students;

SELECT extract(year from '1994-05-17'::date); -- extract year from date
SELECT extract(month from '1994-05-17'::date); -- extract month from date   
SELECT extract(day from '1994-05-17'::date); -- extract day from date  

-- type casting
select '2025-06-29'::date; -- cast string to date
select 1:: BOOLEAN; -- cast integer to boolean
select 'true':: BOOLEAN; -- cast string to boolean
select 'false':: BOOLEAN; -- cast string to boolean
