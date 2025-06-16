SELECT 
    Booking.booking_id,
    User.name AS user_name,
    ShowTable.show_datetime
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id
INNER JOIN ShowTable ON Booking.show_id = ShowTable.show_id;

-- FULL OUTER JOIN between Users and Bookings
SELECT 
    User.user_id,
    User.name,
    Booking.booking_id
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

SELECT 
    User.user_id,
    User.name,
    Booking.booking_id
FROM User
RIGHT JOIN Booking ON User.user_id = Booking.user_id;

-- Show all users, even those who haven't made a booking
SELECT 
    User.user_id,
    User.name,
    Booking.booking_id
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id;

-- Every user with every food item 
SELECT 
    User.name,
    FoodItem.name AS food_item
FROM User
CROSS JOIN FoodItem;
