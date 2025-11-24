CREATE TABLE IF NOT EXISTS book (
    isbn VARCHAR(64) NOT NULL PRIMARY KEY,
    title VARCHAR(255),
    cover VARCHAR(128),
    publisher VARCHAR(255),
    pages INT,
    available INT
);

CREATE TABLE IF NOT EXISTS order_details (
    booking_id VARCHAR(64) NOT NULL PRIMARY KEY,
    isbn VARCHAR(64),
    booking_date DATE,
    quantity INT,
    CONSTRAINT fk_order_book FOREIGN KEY (isbn) REFERENCES book(isbn)
);

CREATE TABLE IF NOT EXISTS `user` (
    id VARCHAR(64) NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    dob VARCHAR(64),
    address VARCHAR(255),
    password VARCHAR(255)
);
