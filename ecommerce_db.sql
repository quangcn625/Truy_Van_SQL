CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO users (username, password, email, phone) 
VALUES 
    ('sonnguyen', '123456789', 'thuyenle032@gmail.com', '092912912'),
    ('quangcuon', '123456789', 'abcde@gmail.com', '092912913');
    
select * from ecommerce_db