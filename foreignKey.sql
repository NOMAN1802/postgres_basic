create table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);


create table post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
)