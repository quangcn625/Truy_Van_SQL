use data_sensor;

CREATE TABLE sensor1(
    id INT AUTO_INCREMENT PRIMARY KEY,
    temperature FLOAT NOT NULL,
    humidity FLOAT NOT NULL,
    light FLOAT NOT NULL,
    windSpeed FLOAT NOT NULL,
    time TIMESTAMP
);

CREATE TABLE device_activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    activity_time TIMESTAMP
);

INSERT INTO device_activity (device_name, status, activity_time) 
VALUES ('Quạt', 'On', '2024-10-10 11:32:58');

INSERT INTO sensor1 (temperature, humidity, light, windSpeed, rain, time) 
VALUES (25, 61.2, 305.5, 25, 51, '2024-10-10 11:32:58');

-- --xóa bảng và bắt đầu lại id=1 --
TRUNCATE TABLE sensor1;

select * from sensor1 limit 10 offset 0;

select * from sensor1 order by id desc limit 5;

SELECT * FROM sensor WHERE time >= '2024-10-09 00:00:00' and time <= '2024-10-09 23:59:59';

select * from device_activity;

SELECT COUNT(*) FROM device_activity WHERE activity_time >= '2024-10-30 17:40:58' AND activity_time <= '2024-10-30 17:50:58' 
											AND status = 'On' and device_name = 'Đèn cảnh bảo';

TRUNCATE TABLE device_activity;

select count(*) from sensor1;
select * from sensor1 
	where time >= '2024-10-16 16:10:00' and time <= '2024-10-16 16:10:59'
    order by rain desc;
select * from sensor1
	order by rain desc
    limit 5;
    
select count(*) from device_activity where device_name = 'Quạt' and status = 'On';

select humidity from sensor1 where humidity=44;

CREATE TABLE device_activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    activity_time TIMESTAMP
);

CREATE TABLE solancanhbao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    solan FLOAT NOT NULL,
    time TIMESTAMP
);

select * from solancanhbao;
TRUNCATE TABLE solancanhbao;

select * from solancanhbao 
	order by id desc
    limit 1;
    
SELECT count(*) FROM sensor1 WHERE windSpeed >= 60 ORDER BY windSpeed DESC LIMIT 5;

-- C1: 
SELECT
  COUNT(CASE WHEN device_name = 'Đèn' AND status = 'On' THEN 1 END) AS count_den,
  COUNT(CASE WHEN device_name = 'Quạt' AND status = 'On' THEN 1 END) AS count_quat,
  COUNT(CASE WHEN device_name = 'Điều hòa' AND status = 'On' THEN 1 END) AS count_dieuhoa,
  COUNT(CASE WHEN device_name = 'Đèn cảnh báo' AND status = 'On' THEN 1 END) AS count_dencanhbao
FROM device_activity
WHERE activity_time >= '2024-11-06 00:00:00'
  AND activity_time <= '2024-11-06 23:59:59';

-- C2:
SELECT
  COUNT(IF(device_name = 'Đèn' AND status = 'On', 1, null)) AS count_den,
  COUNT(IF(device_name = 'Quạt' AND status = 'On', 1, null)) AS count_quat,
  COUNT(IF(device_name = 'Điều hòa' AND status = 'On', 1, null)) AS count_dieuhoa,
  COUNT(IF(device_name = 'Đèn cảnh báo' AND status = 'On', 1, null)) AS count_dencanhbao
FROM device_activity
WHERE activity_time BETWEEN '2024-11-06 00:00:00' AND '2024-11-06 23:59:59';