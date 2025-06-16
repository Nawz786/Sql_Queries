CREATE DATABASE MovieBookingDB;
USE MovieBookingDB;
-- 1. Screen
CREATE TABLE Screen (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class_type VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

-- 2. Seat
CREATE TABLE Seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);

-- 3. Movie
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    status VARCHAR(50) NOT NULL,
    poster_image_url VARCHAR(500),
    language VARCHAR(50) DEFAULT 'English'
);

-- 4. MovieCast
CREATE TABLE MovieCast (
    cast_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    person_name VARCHAR(255) NOT NULL,
    role VARCHAR(100) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- 5. Review
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    content TEXT NOT NULL,
    review_date DATETIME NOT NULL,
    reviewer_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- 6. ShowTable
CREATE TABLE ShowTable (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_datetime DATETIME NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- 7. ShowSeat
CREATE TABLE ShowSeat (
    show_seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT NOT NULL,
    seat_id INT NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT 1,
    FOREIGN KEY (show_id) REFERENCES ShowTable(show_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);

-- 8. User
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

-- 9. Membership
CREATE TABLE Membership (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    current_points INT NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- 10. Booking
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    booking_datetime DATETIME NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (show_id) REFERENCES ShowTable(show_id)
);

-- 11. Ticket
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    show_seat_id INT NOT NULL,
    qr_code VARCHAR(500) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    is_downloaded BOOLEAN NOT NULL DEFAULT 0,
    scanned_at DATETIME,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (show_seat_id) REFERENCES ShowSeat(show_seat_id)
);

-- 12. PaymentGateway
CREATE TABLE PaymentGateway (
    gateway_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 13. Payment
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    gateway_id INT NOT NULL,
    transaction_amount DECIMAL(10,2) NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    failure_reason VARCHAR(255),
    credit_card_name VARCHAR(100),
    credit_card_number VARCHAR(20),
    expiry_date VARCHAR(10),
    cvv VARCHAR(10),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (gateway_id) REFERENCES PaymentGateway(gateway_id)
);

-- 14. FoodItem
CREATE TABLE FoodItem (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    is_combo BOOLEAN NOT NULL DEFAULT 0
);

-- 15. FoodItemSize
CREATE TABLE FoodItemSize (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    size_name VARCHAR(50) NOT NULL,
    rate DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id)
);

-- 16. FoodOrder
CREATE TABLE FoodOrder (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    screen_id INT NOT NULL,
    seat_id INT NOT NULL,
    order_datetime DATETIME NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);

-- 17. FoodOrderItem
CREATE TABLE FoodOrderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    size_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_time DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES FoodOrder(order_id),
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id),
    FOREIGN KEY (size_id) REFERENCES FoodItemSize(size_id)
);

-- 18. PointsTransaction
CREATE TABLE PointsTransaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    points_earned INT NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
