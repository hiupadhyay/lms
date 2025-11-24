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

-- Seed data
INSERT INTO Book (ISBN, title, cover, publisher, pages, available) VALUES
('9780134685991', 'Effective Java', 'Hardcover', 'Addison-Wesley', 416, 3),
('9781617294945', 'Spring in Action', 'Paperback', 'Manning', 520, 5),
('9781491950357', 'Designing Data-Intensive Applications', 'Hardcover', 'O''Reilly Media', 616, 2)
ON DUPLICATE KEY UPDATE title = VALUES(title);

INSERT INTO order_details (booking_id, ISBN, booking_date, quantity) VALUES
('order-1', '9780134685991', CURRENT_DATE, 1),
('order-2', '9781617294945', CURRENT_DATE, 2)
ON DUPLICATE KEY UPDATE ISBN = VALUES(ISBN);

INSERT INTO user (id, name, dob, address, password) VALUES
('user-1', 'Demo User', '1990-01-01', 'demo@example.com', 'password')
ON DUPLICATE KEY UPDATE name = VALUES(name);
