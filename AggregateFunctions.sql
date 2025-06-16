-- 1. COUNT: Total number of bookings
SELECT COUNT(*) AS total_bookings FROM Booking;

-- 2. SUM: Total earnings from all bookings
SELECT SUM(total_cost) AS total_earnings FROM Booking;

-- 3. AVG: Average movie rating
SELECT AVG(rating) AS avg_movie_rating FROM Movie;

-- 4. MIN: Earliest show time
SELECT MIN(show_datetime) AS earliest_show FROM ShowTable;

-- 5. MAX: Latest booking date
SELECT MAX(booking_datetime) AS latest_booking FROM Booking;

-- 6. GROUP BY: Total bookings per user
SELECT user_id, COUNT(*) AS user_booking_count
FROM Booking
GROUP BY user_id;

-- 7. GROUP BY with SUM: Total points per user from Membership
SELECT user_id, SUM(current_points) AS total_points
FROM Membership
GROUP BY user_id;

-- 8. GROUP BY with AVG: Average movie rating by genre
SELECT genre, AVG(rating) AS avg_rating
FROM Movie
GROUP BY genre;

-- 9. HAVING: Only genres with average rating above 8
SELECT genre, AVG(rating) AS avg_rating
FROM Movie
GROUP BY genre
HAVING AVG(rating) > 8;

-- 10. JOIN + GROUP BY + Aggregate: Total amount spent by each user
SELECT u.name, SUM(b.total_cost) AS total_spent
FROM User u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id;
