CREATE DATABASE quanlyhocvien;
USE quanlyhocvien;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE monhoc (
    monhoc_id INT AUTO_INCREMENT PRIMARY KEY,
    ten_monhoc VARCHAR(100) NOT NULL,
    user_id INT,  -- Khóa ngoại trỏ đến bảng user
    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Thêm 2 user
INSERT INTO user (name)
VALUES 
('Nguyen Van A'),
('Tran Thi B');

-- Thêm môn học, gán cho user_id tương ứng
INSERT INTO monhoc (ten_monhoc, user_id)
VALUES
('Toán cao cấp', 1),
('Vật lý đại cương', 1),
('Lập trình Java', 2);

select u.name, count(mh.monhoc_id) as 'số lượng' from user as u
	left join monhoc as mh on u.user_id = mh.user_id
    group by u.user_id, u.name;

SELECT 
    u.name, 
    COUNT(mh.monhoc_id) AS 'số lượng'
FROM user AS u
LEFT JOIN monhoc AS mh ON u.user_id = mh.user_id
GROUP BY u.user_id, u.name;

create database todolist;
use todolist;

CREATE TABLE list (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('TODO', 'IN_PROGRESS', 'DONE') DEFAULT 'TODO',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    list_id VARCHAR(36),
    CONSTRAINT fk_task_list FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE tag (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    color VARCHAR(20)
);

INSERT INTO list (name, color) VALUES
('Work', '#FF5733'),
('Personal', '#33C1FF'),
('Shopping', '#75FF33'),
('Study', '#FF33EC');

INSERT INTO tag (name, color) VALUES
('Urgent', '#FF0000'),
('Low Priority', '#00FF00'),
('Home', '#0000FF'),
('Office', '#FFA500'),
('Important', '#800080');

INSERT INTO task (title, description, status, list_id) VALUES
('Fix login bug', 'Resolve the issue where users cannot log in on mobile', 'IN_PROGRESS', 1),
('Buy groceries', 'Need to buy milk, eggs, and bread', 'TODO',1),
('Prepare presentation', 'Finish slides for Monday meeting', 'IN_PROGRESS',2),
('Clean the house', 'General cleaning and organizing', 'TODO',2),
('Submit assignment', 'Submit Java Spring Boot homework', 'DONE',3),
('Read a book', 'Continue reading “Clean Code”', 'TODO',3),
('Workout', 'Gym session for 1 hour', 'DONE',4),
('Plan weekend trip', 'Choose destination and budget', 'TODO',4);

select * from task;

select t.id, t.title, t.description, t.status from task as t
	join list as l on l.id = t.list_id
	






