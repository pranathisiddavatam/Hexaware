-- Create Database
--CREATE DATABASE EcommerceDB;
--GO

-- Use the Database
USE EcommerceDB;
GO
/*
-- Create Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stockQuantity INT
);

CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE,
    total_price DECIMAL(10,2),
    shipping_address VARCHAR(255)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES orders(order_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT,
    item_amount DECIMAL(10,2)
);

-- Insert Data
INSERT INTO customers VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St, City'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '456 Elm St, Town'),
(3, 'Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5, 'David', 'Lee', 'david@example.com', '234 Cedar St, District');

INSERT INTO products VALUES
(1, 'Laptop', 'High-performance laptop', 1200.00, 10),
(2, 'Smartphone', 'Latest smartphone', 800.00, 10),
(3, 'Tablet', 'Portable tablet', 600.00, 15);

INSERT INTO cart VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3);

INSERT INTO orders VALUES
(1, 1, '2023-01-05', 1200.00, '123 Main St, City');

INSERT INTO order_items VALUES
(1, 1, 1, 2, 1600.00);

-- Task 1: Update refrigerator product price to 800.
UPDATE products SET price = 800 WHERE name = 'Refrigerator';

-- Task 2: Remove all cart items for a specific customer.
DELETE FROM cart WHERE customer_id = 1;

-- Task 3: Retrieve Products Priced Below $100.
SELECT * FROM products WHERE price < 100;

-- Task 4: Find Products with Stock Quantity Greater Than 5.
SELECT * FROM products WHERE stockQuantity > 5;

-- Task 5: Retrieve Orders with Total Amount Between $500 and $1000.
SELECT * FROM orders WHERE total_price BETWEEN 500 AND 1000;

-- Task 6: Find Products which name end with letter ‘r’.
SELECT * FROM products WHERE name LIKE '%r';

-- Task 7: Retrieve Cart Items for Customer 5.
SELECT * FROM cart WHERE customer_id = 5;

-- Task 8: Find Customers Who Placed Orders in 2023.
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE YEAR(order_date) = 2023);

-- Task 9: Determine the Minimum Stock Quantity for Each Product Category.
SELECT name, MIN(stockQuantity) FROM products GROUP BY name;

-- Task 10: Calculate the Total Amount Spent by Each Customer.
SELECT customer_id, SUM(total_price) AS total_spent FROM orders GROUP BY customer_id;

-- Task 11: Find the Average Order Amount for Each Customer.
SELECT customer_id, AVG(total_price) AS avg_order FROM orders GROUP BY customer_id;

-- Task 12: Count the Number of Orders Placed by Each Customer.
SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id;

-- Task 13: Find the Maximum Order Amount for Each Customer.
SELECT customer_id, MAX(total_price) AS max_order FROM orders GROUP BY customer_id;

-- Task 14: Get Customers Who Placed Orders Totaling Over $1000.
SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(total_price) > 1000;

-- Task 15: Subquery to Find Products Not in the Cart.
SELECT * FROM products WHERE product_id NOT IN (SELECT product_id FROM cart);

-- Task 16: Subquery to Find Customers Who Haven't Placed Orders.
SELECT * FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- Task 17: Subquery to Calculate the Percentage of Total Revenue for a Product.
SELECT product_id, (SUM(item_amount) * 100 / (SELECT SUM(item_amount) FROM order_items)) AS revenue_percentage FROM order_items GROUP BY product_id;

-- Task 18: Subquery to Find Products with Low Stock.
SELECT * FROM products WHERE stockQuantity < 5;

-- Task 19: Subquery to Find Customers Who Placed High-Value Orders.
SELECT customer_id FROM orders WHERE total_price > (SELECT AVG(total_price) FROM orders);
*/