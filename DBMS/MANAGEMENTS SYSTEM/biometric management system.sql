-- Create a database for the biometric management system
CREATE DATABASE IF NOT EXISTS biometric_system;
USE biometric_system;

-- Create a table for employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    position VARCHAR(50)
);

-- Create a table for biometric information
CREATE TABLE biometrics (
    biometric_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    fingerprint_data BLOB,
    facial_recognition_data BLOB,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into the 'employees' table
INSERT INTO employees (first_name, last_name, department, position)
VALUES
    ('John', 'Doe', 'IT', 'Developer'),
    ('Jane', 'Smith', 'HR', 'Manager');

-- Insert sample data into the 'biometrics' table
INSERT INTO biometrics (employee_id, fingerprint_data, facial_recognition_data)
VALUES
    (1, 'FingerprintDataJohn', 'FacialRecognitionDataJohn'),
    (2, 'FingerprintDataJane', 'FacialRecognitionDataJane');

-- Query to retrieve employee information with biometric data
SELECT employees., biometrics.
FROM employees
JOIN biometrics ON employees.employee_id = biometrics.employee_id;