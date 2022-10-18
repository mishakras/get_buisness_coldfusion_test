CREATE TABLE users
(
id int PRIMARY KEY, 
user_login nvarchar(20) NOT NULL UNIQUE,
user_name nvarchar(20) NOT NULL,
last_name nvarchar(20) NOT NULL,
user_password nvarchar(20) NOT NULL
)

CREATE TABLE errors
(
id int PRIMARY KEY, 
number int NOT NULL UNIQUE,
short_desc nvarchar(60) NOT NULL,
full_desc nvarchar(500) NOT NULL,
user_id int NOT NULL,
error_status nvarchar(10) NOT NULL,
error_time_available nvarchar(15) NOT NULL,
error_critical nvarchar(10) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
)

CREATE TABLE error_history
(
id int PRIMARY KEY, 
error_id int NOT NULL, 
created date NOT NULL UNIQUE,
error_action nvarchar(50) NOT NULL,
comment nvarchar(100) NOT NULL,
user_id int NOT NULL,
FOREIGN KEY (error_id) REFERENCES errors(id),
FOREIGN KEY (user_id) REFERENCES users(id)
)