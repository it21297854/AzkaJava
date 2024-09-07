create database azfood;
use azfood;

CREATE TABLE azfoodtb (
    id INT AUTO_INCREMENT PRIMARY KEY,
    foodName VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(5, 2),
    description TEXT
);

INSERT INTO azfoodtb (foodName, category, price, description) VALUES
('Margherita Pizza', 'Pizza', 8.99, 'Classic Margherita with mozzarella cheese and tomato sauce'),
('Cheeseburger', 'Burger', 6.49, 'Beef burger with cheddar cheese, lettuce, and tomato'),
('Caesar Salad', 'Salad', 5.99, 'Romaine lettuce, parmesan cheese, croutons, and Caesar dressing'),
('Sushi Platter', 'Sushi', 12.50, 'Assorted sushi rolls with soy sauce and wasabi'),
('Spaghetti Bolognese', 'Pasta', 7.75, 'Spaghetti pasta with rich meat sauce'),
('Chicken Tacos', 'Mexican', 6.25, 'Soft tacos with grilled chicken, salsa, and guacamole'),
('Vegetable Stir Fry', 'Asian', 5.50, 'Mixed vegetables stir-fried with soy sauce and garlic'),
('Grilled Salmon', 'Seafood', 13.99, 'Grilled salmon fillet with lemon butter sauce'),
('Chocolate Cake', 'Dessert', 4.50, 'Rich chocolate cake with a creamy frosting'),
('Chicken Shawarma', 'Middle Eastern', 7.00, 'Grilled chicken wrapped in pita bread with garlic sauce');

select * from azfoodtb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
ALTER TABLE users ADD UNIQUE (username);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    food_id INT NOT NULL,
    customer_id VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (food_id) REFERENCES azfoodtb(id),
    FOREIGN KEY (customer_id) REFERENCES users(username)
);

select * from orders;

select * from users;

