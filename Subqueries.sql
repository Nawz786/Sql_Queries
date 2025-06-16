-- 1. Scalar Subquery: Get user with highest points
SELECT name, email
FROM User
WHERE user_id = (
    SELECT user_id
    FROM Membership
    ORDER BY current_points DESC
    LIMIT 1
);

-- 2. Column Subquery: Movies with at least one review
SELECT title
FROM Movie
WHERE movie_id IN (
    SELECT movie_id FROM Review
);

-- 3. Row Subquery: Booking with same total cost and date as booking_id = 1
SELECT *
FROM Booking
WHERE (total_cost, booking_datetime) = (
    SELECT total_cost, booking_datetime
    FROM Booking
    WHERE booking_id = 1
);

-- 4. Table Subquery: Average booking cost per user
SELECT user_id, AVG(total_cost) AS avg_cost
FROM (
    SELECT user_id, total_cost FROM Booking
) AS sub
GROUP BY user_id;

-- 5. Correlated Subquery: Users who booked more than 1 ticket
SELECT u.name
FROM User u
WHERE (
    SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id
) > 1;

-- 6. EXISTS Subquery: Movies that have reviews
SELECT title
FROM Movie m
WHERE EXISTS (
    SELECT 1 FROM Review r WHERE r.movie_id = m.movie_id
);

-- 7. NOT EXISTS Subquery: Movies without reviews
SELECT title
FROM Movie m
WHERE NOT EXISTS (
    SELECT 1 FROM Review r WHERE r.movie_id = m.movie_id
);

-- 8. ALL Subquery: Movies with rating > all reviewed movies
SELECT title
FROM Movie
WHERE rating > ALL (
    SELECT rating FROM Movie WHERE movie_id IN (SELECT movie_id FROM Review)
);

-- 9. ANY Subquery: Movies with rating > any reviewed movie
SELECT title
FROM Movie
WHERE rating > ANY (
    SELECT rating FROM Movie WHERE movie_id IN (SELECT movie_id FROM Review)
);

-- 10. Nested Subquery: Users who booked the top-rated movie
SELECT name
FROM User
WHERE user_id IN (
    SELECT user_id FROM Booking
    WHERE show_id IN (
        SELECT show_id FROM ShowTable
        WHERE movie_id = (
            SELECT movie_id FROM Movie
            ORDER BY rating DESC LIMIT 1
        )
    )
);
