INSERT INTO Screen (name, class_type, capacity) VALUES
('A', 'Gold', 120),
('B', 'Silver', 100),
('C', 'Platinum', 80),
('D', 'Gold', 90);

-- 2. Seat
INSERT INTO Seat (screen_id, seat_number) VALUES
(1, 'A1'), (1, 'A2'), (2, 'B1'), (2, 'B2');

-- 3. Movie
INSERT INTO Movie (title, genre, rating, status, poster_image_url) VALUES
('Inception', 'Sci-Fi', 8.8, 'Now Showing', 'url1'),
('Interstellar', 'Sci-Fi', 8.6, 'Now Showing', 'url2'),
('Dangal', 'Drama', 8.4, 'Now Showing', 'url3'),
('Avatar', 'Fantasy', 7.8, 'Upcoming', 'url4');

-- 4. MovieCast
INSERT INTO MovieCast (movie_id, person_name, role) VALUES
(1, 'Leonardo DiCaprio', 'Actor'),
(1, 'Christopher Nolan', 'Director'),
(2, 'Matthew McConaughey', 'Actor'),
(3, 'Aamir Khan', 'Actor');

-- 5. Review
INSERT INTO Review (movie_id, content, review_date, reviewer_name) VALUES
(1, 'Amazing concept!', '2023-06-01 12:00:00', 'Alice'),
(2, 'Visually stunning', '2023-06-02 13:00:00', 'Bob'),
(3, 'Inspirational story', '2023-06-03 14:00:00', 'Charlie'),
(4, 'Looking forward to it', '2023-06-04 15:00:00', 'David');

-- 6. ShowTable
INSERT INTO ShowTable (screen_id, movie_id, show_datetime) VALUES
(1, 1, '2023-07-01 10:00:00'),
(2, 2, '2023-07-01 13:00:00'),
(3, 3, '2023-07-01 16:00:00'),
(4, 4, '2023-07-01 19:00:00');

-- 7. ShowSeat
INSERT INTO ShowSeat (show_id, seat_id, is_available) VALUES
(1, 1, 1), (1, 2, 1), (2, 3, 0), (2, 4, 1);

-- 8. User
INSERT INTO User (name, email, phone) VALUES
('Mohammed Nawaz', 'nawaz@example.com', '9994975797'),
('Sara Khan', 'sara@example.com', '1234567890'),
('John Doe', 'john@example.com', '9988776655'),
('Emma Ali', 'emma@example.com', '8888555533');

-- 9. Membership
INSERT INTO Membership (user_id, current_points) VALUES
(1, 100), (2, 150), (3, 80), (4, 50);

-- 10. Booking
INSERT INTO Booking (user_id, show_id, booking_datetime, total_cost) VALUES
(1, 1, '2023-06-10 10:00:00', 300.00),
(2, 2, '2023-06-11 11:00:00', 250.00),
(3, 3, '2023-06-12 12:00:00', 280.00),
(4, 4, '2023-06-13 13:00:00', 320.00);

-- 11. Ticket
INSERT INTO Ticket (booking_id, show_seat_id, qr_code, delivery_method, is_downloaded, scanned_at) VALUES
(1, 1, 'QR001', 'Email', 1, '2023-06-10 10:15:00'),
(2, 2, 'QR002', 'SMS', 0, NULL),
(3, 3, 'QR003', 'Email', 1, '2023-06-12 12:30:00'),
(4, 4, 'QR004', 'SMS', 0, NULL);

-- 12. PaymentGateway
INSERT INTO PaymentGateway (name) VALUES
('Razorpay'), ('PayPal'), ('Stripe'), ('Google Pay');

-- 13. Payment
INSERT INTO Payment (booking_id, gateway_id, transaction_amount, transaction_datetime, status, failure_reason, credit_card_name, credit_card_number, expiry_date, cvv) VALUES
(1, 1, 300.00, '2023-06-10 10:05:00', 'Success', NULL, 'Mohammed Nawaz', '1234567890123456', '12/25', '123'),
(2, 2, 250.00, '2023-06-11 11:10:00', 'Failed', 'Card Declined', 'Sara Khan', '1111222233334444', '11/24', '321'),
(3, 3, 280.00, '2023-06-12 12:20:00', 'Success', NULL, 'John Doe', '9999888877776666', '10/26', '456'),
(4, 4, 320.00, '2023-06-13 13:15:00', 'Success', NULL, 'Emma Ali', '4444333322221111', '09/23', '789');

-- 14. FoodItem
INSERT INTO FoodItem (name, description, is_combo) VALUES
('Popcorn', 'Salted medium size popcorn', 0),
('Coke', 'Cold beverage', 0),
('Combo Meal', 'Burger + Coke', 1),
('Nachos', 'With cheese dip', 0);

-- 15. FoodItemSize
INSERT INTO FoodItemSize (item_id, size_name, rate) VALUES
(1, 'Medium', 80.00),
(2, 'Large', 60.00),
(3, 'One Size', 150.00),
(4, 'Regular', 90.00);

-- 16. FoodOrder
INSERT INTO FoodOrder (booking_id, screen_id, seat_id, order_datetime, total_cost, delivery_method) VALUES
(1, 1, 1, '2023-06-10 10:10:00', 230.00, 'Seat Delivery'),
(2, 2, 3, '2023-06-11 11:20:00', 180.00, 'Pick-up'),
(3, 3, 2, '2023-06-12 12:30:00', 150.00, 'Seat Delivery'),
(4, 4, 4, '2023-06-13 13:40:00', 200.00, 'Pick-up');

-- 17. FoodOrderItem
INSERT INTO FoodOrderItem (order_id, item_id, size_id, quantity, price_at_time) VALUES
(1, 1, 1, 2, 160.00),
(1, 2, 2, 1, 60.00),
(2, 3, 3, 1, 150.00),
(3, 4, 4, 2, 180.00);

-- 18. PointsTransaction
INSERT INTO PointsTransaction (user_id, amount, points_earned, transaction_datetime, transaction_type) VALUES
(1, 300.00, 30, '2023-06-10 10:20:00', 'Earned'),
(2, 250.00, 25, '2023-06-11 11:25:00', 'Earned'),
(3, 280.00, 28, '2023-06-12 12:35:00', 'Earned'),
(4, 320.00, 32, '2023-06-13 13:45:00', 'Earned');
