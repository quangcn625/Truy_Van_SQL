
create database chatapp;

use chatapp;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password, email) 
VALUES ('legiaquang', '123456', 'quangcn625@gmail.com');

select * from users;