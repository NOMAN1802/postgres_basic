/*  
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions.  
*/  

-- Table-Level Events:  
  -- INSERT, UPDATE, DELETE, TRUNCATE  
-- Database-Level Events  
  -- Database Startup, Database Shutdown, Connection start and end etc  

-- CREATE TRIGGER trigger_name  
-- [BEFORE | AFTER | INSTEAD OF] [INSERT | UPDATE | DELETE | TRUNCATE]  
-- ON table_name  
-- [FOR EACH ROW]  
-- EXECUTE FUNCTION function_name();

CREATE TABLE my_users(
  user_name VARCHAR(50),
  user_email VARCHAR(100)
);

INSERT INTO my_users (user_name, user_email) VALUES
('Noma','noman@gmail.com'),
('Emon','emon@gmail.com'),
('Rafi','rafi@gmail.com');

SELECT * FROM my_users;


CREATE TABLE deleted_users_audit(
  user_name VARCHAR(50),
  user_email VARCHAR(100),
  deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM deleted_users_audit;


----- Creating a function to be executed by the trigger
CREATE  OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
  INSERT INTO deleted_users_audit
  VALUES (OLD.user_name, OLD.user_email,now());
  RAISE NOTICE 'User % with email % has been deleted.', OLD.user_name, OLD.user_email;  
  RETURN OLD;
END;
$$;


CREATE OR REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();


-- Deleting a user to see the trigger in action
DELETE FROM my_users WHERE user_name = 'Rafi';