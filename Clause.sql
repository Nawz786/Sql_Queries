SELECT title, genre FROM Movie LIMIT 2;
SELECT name, capacity FROM Screen LIMIT 2;
SELECT name, email FROM User LIMIT 2;

-- SELECT DISTINCT
SELECT DISTINCT genre FROM Movie LIMIT 2;
SELECT DISTINCT class_type FROM Screen LIMIT 2;
SELECT DISTINCT status FROM Movie LIMIT 2;

-- SELECT with expressions
SELECT title, rating*10 AS rating_percent FROM Movie LIMIT 2;
SELECT name, CONCAT(class_type, '-', capacity) AS screen_info FROM Screen LIMIT 2;
SELECT booking_id, total_cost*0.18 AS tax FROM Booking LIMIT 2;

-- WHERE with comparison
SELECT title FROM Movie WHERE rating > 8.0 LIMIT 2;
SELECT name FROM Screen WHERE capacity >= 180 LIMIT 2;
SELECT booking_id FROM Booking WHERE total_cost < 350 LIMIT 2;

-- WHERE with LIKE
SELECT title FROM Movie WHERE title LIKE 'A%' LIMIT 2;
SELECT email FROM User WHERE email LIKE '%@gmail.com' LIMIT 2;
SELECT seat_number FROM Seat WHERE seat_number LIKE '_1' LIMIT 2;

-- WHERE with IN
SELECT title FROM Movie WHERE genre IN ('Action', 'Drama') LIMIT 2;
SELECT name FROM Screen WHERE screen_id IN (1, 3, 5) LIMIT 2;
SELECT booking_id FROM Booking WHERE user_id IN (1, 2) LIMIT 2;

-- GROUP BY with COUNT
SELECT genre, COUNT(*) FROM Movie GROUP BY genre LIMIT 2;
SELECT class_type, COUNT(*) FROM Screen GROUP BY class_type LIMIT 2;
SELECT status, COUNT(*) FROM Movie GROUP BY status LIMIT 2;

-- GROUP BY with SUM
SELECT user_id, SUM(total_cost) FROM Booking GROUP BY user_id LIMIT 2;
SELECT genre, SUM(rating) FROM Movie GROUP BY genre LIMIT 2;
SELECT screen_id, COUNT(*) FROM Showw GROUP BY screen_id LIMIT 2;

-- GROUP BY with HAVING
SELECT genre, AVG(rating) FROM Movie GROUP BY genre HAVING AVG(rating) > 8.0 LIMIT 2;
SELECT user_id, SUM(total_cost) FROM Booking GROUP BY user_id HAVING SUM(total_cost) > 500 LIMIT 2;
SELECT screen_id, COUNT(*) FROM Showw GROUP BY screen_id HAVING COUNT(*) > 1 LIMIT 2;

-- ORDER BY ascending
SELECT title, rating FROM Movie ORDER BY rating LIMIT 2;
SELECT name, capacity FROM Screen ORDER BY capacity LIMIT 2;
SELECT booking_id, total_cost FROM Booking ORDER BY total_cost LIMIT 2;

-- ORDER BY descending
SELECT title, rating FROM Movie ORDER BY rating DESC LIMIT 2;
SELECT name, capacity FROM Screen ORDER BY capacity DESC LIMIT 2;
SELECT booking_id, total_cost FROM Booking ORDER BY total_cost DESC LIMIT 2;

-- ORDER BY multiple columns
SELECT title, genre, rating FROM Movie ORDER BY genre, rating DESC LIMIT 2;
SELECT name, class_type, capacity FROM Screen ORDER BY class_type, capacity LIMIT 2;
SELECT user_id, booking_datetime, total_cost FROM Booking ORDER BY user_id, booking_datetime DESC LIMIT 2;

-- INNER JOIN
SELECT m.title, s.show_datetime FROM Showw s JOIN Movie m ON s.movie_id = m.movie_id LIMIT 2;
SELECT u.name, b.total_cost FROM Booking b JOIN User u ON b.user_id = u.user_id LIMIT 2;
SELECT sc.name, sh.show_datetime FROM Showw sh JOIN Screen sc ON sh.screen_id = sc.screen_id LIMIT 2;

-- LEFT JOIN
SELECT m.title, COUNT(r.review_id) FROM Movie m LEFT JOIN Review r ON m.movie_id = r.movie_id GROUP BY m.title LIMIT 2;
SELECT u.name, COUNT(b.booking_id) FROM User u LEFT JOIN Booking b ON u.user_id = b.user_id GROUP BY u.name LIMIT 2;
SELECT sc.name, COUNT(sh.show_id) FROM Screen sc LEFT JOIN Showw sh ON sc.screen_id = sh.screen_id GROUP BY sc.name LIMIT 2;

-- RIGHT JOIN
SELECT r.content, m.title FROM Review r RIGHT JOIN Movie m ON r.movie_id = m.movie_id LIMIT 2;
SELECT b.total_cost, u.name FROM Booking b RIGHT JOIN User u ON b.user_id = u.user_id LIMIT 2;
SELECT sh.show_datetime, sc.name FROM Showw sh RIGHT JOIN Screen sc ON sh.screen_id = sc.screen_id LIMIT 2;

-- WHERE with subquery
SELECT title FROM Movie WHERE movie_id IN (SELECT movie_id FROM Review) LIMIT 2;
SELECT name FROM User WHERE user_id IN (SELECT user_id FROM Booking WHERE total_cost > 300) LIMIT 2;
SELECT name FROM Screen WHERE screen_id IN (SELECT screen_id FROM Showw WHERE movie_id = 1) LIMIT 2;

-- FROM with subquery
SELECT avg_rating FROM (SELECT genre, AVG(rating) AS avg_rating FROM Movie GROUP BY genre) AS genre_ratings LIMIT 2;
SELECT booking_count FROM (SELECT user_id, COUNT(*) AS booking_count FROM Booking GROUP BY user_id) AS user_bookings LIMIT 2;
SELECT large_screens FROM (SELECT class_type, COUNT(*) AS large_screens FROM Screen WHERE capacity > 180 GROUP BY class_type) AS screen_counts LIMIT 2;

-- SELECT with subquery
SELECT title, (SELECT COUNT(*) FROM Review r WHERE r.movie_id = m.movie_id) AS review_count FROM Movie m LIMIT 2;
SELECT name, (SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id) AS booking_count FROM User u LIMIT 2;
SELECT name, (SELECT COUNT(*) FROM Showw s WHERE s.screen_id = sc.screen_id) AS show_count FROM Screen sc LIMIT 2;

-- UNION
SELECT name FROM User WHERE name LIKE 'K%' UNION SELECT person_name FROM MovieCast LIMIT 2;
SELECT title FROM Movie WHERE rating > 8.0 UNION SELECT name FROM Screen WHERE class_type = 'Gold' LIMIT 2;
SELECT seat_number FROM Seat WHERE screen_id = 1 UNION SELECT seat_number FROM Seat WHERE screen_id = 2 LIMIT 2;

-- INTERSECT (simulated with IN)
SELECT title FROM Movie WHERE movie_id IN (SELECT movie_id FROM Review) LIMIT 2;
SELECT name FROM User WHERE user_id IN (SELECT user_id FROM Booking) LIMIT 2;
SELECT name FROM Screen WHERE screen_id IN (SELECT screen_id FROM Showw) LIMIT 2;
