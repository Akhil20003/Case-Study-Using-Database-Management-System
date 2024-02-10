-- Create a database for the library management system
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Create a table for books
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(50),
    publication_year INT,
    available_quantity INT
);

-- Create a table for borrowers (students or members)
CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(200),
    contact_number VARCHAR(15)
);

-- Create a table for transactions (checkouts and returns)
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    borrower_id INT,
    transaction_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Insert sample data into the 'books' table
INSERT INTO books (title, author, genre, publication_year, available_quantity)
VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 5),
    ('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
    ('1984', 'George Orwell', 'Dystopian', 1949, 7);

-- Insert sample data into the 'borrowers' table
INSERT INTO borrowers (first_name, last_name, address, contact_number)
VALUES
    ('John', 'Doe', '123 Main St', '555-1234'),
    ('Jane', 'Smith', '456 Oak St', '555-5678');

-- Insert sample data into the 'transactions' table (checkouts)
INSERT INTO transactions (book_id, borrower_id, transaction_date, due_date)
VALUES
    (1, 1, '2023-01-15', '2023-02-15'),
    (2, 2, '2023-01-20', '2023-02-20');

-- Insert sample data into the 'transactions' table (returns)
UPDATE transactions SET return_date = '2023-02-10' WHERE transaction_id = 1;
UPDATE transactions SET return_date = '2023-02-18' WHERE transaction_id = 2;