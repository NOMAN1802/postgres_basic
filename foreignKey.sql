create table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);


create table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
)


alter Table post
    alter COLUMN user_id
    SET NOT NULL;

select * FROM "user";
select * FROM post;

INSERT into "user"(username) VALUES('akash'),('batash'),('sagor'),('nodi');

insert into post (title, user_id
) VALUES
('Enjoying sunny day with akash', 2),
('Batash just shared a amizing recepie', 1),
('Explore a adventure with sagor', 4),
('Nodi"s wishdom always leave me inspire', 4);


