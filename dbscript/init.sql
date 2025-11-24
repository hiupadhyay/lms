CREATE DATABASE IF NOT EXISTS lms;
USE lms;

CREATE TABLE IF NOT EXISTS Book (
    ISBN VARCHAR(64) NOT NULL PRIMARY KEY,
    title VARCHAR(255),
    cover VARCHAR(128),
    publisher VARCHAR(255),
    pages INT,
    available INT
);

CREATE TABLE IF NOT EXISTS order_details (
    booking_id VARCHAR(64) NOT NULL PRIMARY KEY,
    ISBN VARCHAR(64),
    booking_date DATE,
    quantity INT,
    CONSTRAINT fk_order_book FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE IF NOT EXISTS user (
    id VARCHAR(64) NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    dob VARCHAR(64),
    address VARCHAR(255),
    password VARCHAR(255)
);
