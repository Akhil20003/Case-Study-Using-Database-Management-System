-- Create a database for the e-commerce system
CREATE DATABASE IF NOT EXISTS ecommerce_system;
USE ecommerce_system;

-- Create a table for products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Create a table for customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(200)
);

-- Create a table for orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create a table for order items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data into the 'products' table
INSERT INTO products (product_name, category, price, stock_quantity)
VALUES
    ('Laptop', 'Electronics', 999.99, 50),
    ('Smartphone', 'Electronics', 499.99, 100),
    ('Running Shoes', 'Fashion', 79.99, 200);

-- Insert sample data into the 'customers' table
INSERT INTO customers (first_name, last_name, email, address)
VALUES
    ('John', 'Doe', 'john@example.com', '123 Main St'),
    ('Jane', 'Smith', 'jane@example.com', '456 Oak St');

-- Insert sample data into the 'orders' table
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
    (1, NOW(), 999.99),
    (2, NOW(), 579.98);

-- Insert sample data into the 'order_items' table
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 999.99),
    (2, 2, 2, 199.98);