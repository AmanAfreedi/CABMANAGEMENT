CREATE DATABASE cab_booking;
USE cab_booking;



CREATE TABLE cabs (
    cab_id INT PRIMARY KEY AUTO_INCREMENT,
    cab_number VARCHAR(10) NOT NULL UNIQUE,
    driver_name VARCHAR(50) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE
);


CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    cab_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cab_id) REFERENCES cabs(cab_id)
);