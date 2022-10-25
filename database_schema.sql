use [get_buisness_coldfusion_test]

DROP TABLE IF EXISTS dbo.error_history;
DROP TABLE IF EXISTS dbo.errors;
DROP TABLE IF EXISTS dbo.users;
CREATE TABLE users
(
id int IDENTITY PRIMARY KEY, 
user_login nvarchar(20) NOT NULL UNIQUE,
user_name nvarchar(20) NOT NULL,
last_name nvarchar(20) NOT NULL,
user_password nvarchar(20) NOT NULL
);

CREATE TABLE errors
(
number int IDENTITY PRIMARY KEY,
created date NOT NULL,
short_desc nvarchar(60) NOT NULL,
full_desc nvarchar(500) NOT NULL,
user_id int NOT NULL,
error_status nvarchar(10) NOT NULL,
error_time_available nvarchar(15) NOT NULL,
error_critical nvarchar(10) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE error_history
(
id int IDENTITY PRIMARY KEY, 
error_id int NOT NULL, 
created date NOT NULL,
error_action nvarchar(50) NOT NULL,
comment nvarchar(100) NOT NULL,
user_id int NOT NULL,
FOREIGN KEY (error_id) REFERENCES errors(number),
FOREIGN KEY (user_id) REFERENCES users(id)
);