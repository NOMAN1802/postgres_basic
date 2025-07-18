create table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- On delete cascade
create table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
)

-- on delete set null

CREATE Table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL    
);


--On delete set default
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT DEFAULT 2
);
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


-- Insertion constraint on INSERT post
-- Atempting to insert a post with a user id that does not exist in the "user" table will result in an error.
-- Inserting a post with a valid user id that exists in the "user" table will succeed.
-- Attempting to insert a post without specifing a user id.


DELETE FROM "user"
 WHERE id = 4;

 DROP TABLE post;
 DROP Table "user";


-- Deletion constraint on delete user
-- Restrict Deletion --> ON DELETE RESTRICT / ON DELETE NO ACTION(default behavior)
-- Cascade Deletion --> ON DELETE CASCADE
-- Set Default value --> ON DELETE SET DEFAULT
-- Set Null value --> ON DELETE SET NULL
