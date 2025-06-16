-- 1. UPPER: Convert movie title to uppercase
SELECT title, UPPER(title) AS upper_title FROM Movie;

-- 2. LOWER: Convert user names to lowercase
SELECT name, LOWER(name) AS lower_name FROM User;

-- 3. LENGTH: Find length of reviewer names
SELECT reviewer_name, LENGTH(reviewer_name) AS name_length FROM Review;

-- 4. CONCAT: Combine first name and email
SELECT name, email, CONCAT(name, ' - ', email) AS contact_info FROM User;

-- 5. SUBSTRING: Extract first 5 characters of movie titles
SELECT title, SUBSTRING(title, 1, 5) AS short_title FROM Movie;

-- 6. REPLACE: Replace '@example.com' with '@mail.com' in emails
SELECT email, REPLACE(email, '@example.com', '@mail.com') AS updated_email FROM User;

-- 7. INSTR: Find position of '@' in email
SELECT email, INSTR(email, '@') AS at_position FROM User;

-- 8. TRIM: Remove spaces around movie genres
SELECT genre, CONCAT('|', genre, '|') AS raw, CONCAT('|', TRIM(genre), '|') AS trimmed FROM Movie;

-- 9. LPAD: Pad seat numbers with 0 to make them 4 digits
SELECT seat_number, LPAD(seat_number, 4, '0') AS padded_seat FROM Seat;

-- 10. RPAD: Pad user names to 20 chars with '*'
SELECT name, RPAD(name, 20, '*') AS padded_name FROM User;
