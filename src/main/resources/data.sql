INSERT INTO book (isbn, title, cover, publisher, pages, available) VALUES
('9780134685991', 'Effective Java', 'Hardcover', 'Addison-Wesley', 416, 3),
('9781617294945', 'Spring in Action', 'Paperback', 'Manning', 520, 5),
('9781491950357', 'Designing Data-Intensive Applications', 'Hardcover', 'O''Reilly Media', 616, 2),
('9780132350884', 'Clean Code', 'Paperback', 'Prentice Hall', 464, 4),
('9780321125217', 'Domain-Driven Design', 'Hardcover', 'Addison-Wesley', 560, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

INSERT INTO order_details (booking_id, isbn, booking_date, quantity) VALUES
('order-1', '9780134685991', CURRENT_DATE, 1),
('order-2', '9781617294945', CURRENT_DATE, 2)
ON DUPLICATE KEY UPDATE isbn = VALUES(isbn);

INSERT INTO `user` (id, name, dob, address, password) VALUES
('user-1', 'Demo User', '1990-01-01', 'demo@example.com', 'password')
ON DUPLICATE KEY UPDATE name = VALUES(name);
