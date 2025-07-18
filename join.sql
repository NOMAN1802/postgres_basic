create table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);



create table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) 
);


select * FROM "user";
select * FROM post;

INSERT into "user"(username) VALUES('akash'),('batash'),('sagor'),('nodi');

insert into post (title, user_id
) VALUES
('Enjoying sunny day with akash', 2),
('Batash just shared a amizing recepie', 1),
('Explore a adventure with sagor', 4),
('Nodi"s wishdom always leave me inspire', 4);

select * FROM "user";
select * FROM post;

select title,username from post
JOIN "user" on post.user_id = "user".id;

select * from post
JOIN "user" on post.user_id = "user".id;
-- Inner Join -Inner join- same
select "user".id from post
JOIN "user" on post.user_id = "user".id;
 -- alias
 --INNER join
select * from post as p
INNER JOIN "user" as u on p.user_id = u.id;

insert into post (id,title, user_id
) VALUES
(5,'This is a test post title',NULL );

-- Left Join -Left outer join- same
select p.id, p.title, u.username from post as p
LEFT JOIN "user" as u on p.user_id = u.id;

-- Right Join -Right outer join- same
select p.id, p.title, u.username from post as p
RIGHT JOIN "user" as u on p.user_id = u.id;

-- Full Join -Full outer join- same
select p.id, p.title, u.username from post as p
FULL JOIN "user" as u on p.user_id = u.id;

--cross join   
select * from post as p
CROSS JOIN "user" as u;

-- Nantural Join - - must have common columd 
select * from post as p
NATURAL JOIN "user" as u;