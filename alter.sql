-- Active: 1751093441853@@127.0.0.1@5432@ph
SELECT * from person2;

ALTER TABLE person2
  ADD COLUMN email VARCHAR(25) DEFAULT 'bytespate.name@gmail.com' NOT NULL;

INSERT INTO person2 VALUES(6,'Mahmud', 37, 'bytespate.liton');

ALTER table person2
 DROP COLUMN email;

 ALTER TABLE person2
 RENAME COLUMN age to user_age;


 ALTER TABLE person2
  alter COLUMN user_name type VARCHAR(50);

  alter table person2
  alter COLUMN user_age set NOT NULL;

  alter table person2 
  alter column user_age drop not null;

-- add constraint
  ALTER table person2
  ADD constraint unique_person2_user_age UNIQUE(user_age);

--multiple primary key is not allowed
  alter table person2
  add constraint pk_person2_id PRIMARY KEY(id);

  -- remove constraint

  alter table person2
  drop constraint unique_person2_user_age;

  -- drop the entire table

  DROP table person2;


  -- delete the table recorde-  row but table structure will be same 

truncate table person2;


   