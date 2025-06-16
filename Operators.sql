-- 1. Comparison Operators (=, <, >, <=, >=, <>)
SELECT name, email FROM User WHERE user_id = 1;
SELECT title, rating FROM Movie WHERE rating > 8.5;
SELECT title FROM Movie WHERE rating <= 8.4;
SELECT * FROM Movie WHERE genre <> 'Fantasy';

-- 2. Logical Operators (AND, OR, NOT)
SELECT * FROM User WHERE name = 'Sara Khan' AND phone = '1234567890';
SELECT * FROM Movie WHERE genre = 'Sci-Fi' OR rating > 8.5;
SELECT * FROM Movie WHERE NOT genre = 'Drama';

-- 3. Arithmetic Operators (+, -, *, /, %)
SELECT total_cost, total_cost + 50 AS with_convenience_fee FROM Booking;
SELECT total_cost, total_cost * 0.9 AS discounted FROM Booking;
SELECT 10 % 3 AS mod_result;

-- 4. BETWEEN Operator
SELECT * FROM Movie WHERE rating BETWEEN 8.0 AND 9.0;
SELECT * FROM Booking WHERE total_cost BETWEEN 250 AND 320;

-- 5. IN Operator
SELECT * FROM Movie WHERE genre IN ('Sci-Fi', 'Fantasy');
SELECT * FROM User WHERE name IN ('Mohammed Nawaz', 'Emma Ali');

-- 6. NOT IN Operator
SELECT * FROM Movie WHERE genre NOT IN ('Drama', 'Fantasy');

-- 7. LIKE Operator (pattern matching)
SELECT * FROM User WHERE email LIKE '%@example.com';
SELECT * FROM Movie WHERE title LIKE 'In%';    
SELECT * FROM Movie WHERE title LIKE '%lar';   

-- 8. IS NULL / IS NOT NULL
SELECT * FROM Ticket WHERE scanned_at IS NULL;
SELECT * FROM Ticket WHERE scanned_at IS NOT NULL;

-- 9. EXISTS Operator
SELECT * FROM Movie m
WHERE EXISTS (
    SELECT 1 FROM Review r WHERE r.movie_id = m.movie_id
);

-- 10. CASE
SELECT 
  name,
  CASE 
    WHEN current_points >= 100 THEN 'Gold Member'
    WHEN current_points >= 50 THEN 'Silver Member'
    ELSE 'Bronze Member'
  END AS membership_level
FROM Membership m
JOIN User u ON u.user_id = m.user_id;
