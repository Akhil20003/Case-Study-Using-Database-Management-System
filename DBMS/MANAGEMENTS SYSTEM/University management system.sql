-- Create a database for the university
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- Create a table for students
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(200)
);

-- Create a table for courses
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    department VARCHAR(50),
    credits INT
);

-- Create a table for professors
CREATE TABLE professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

-- Create a table for enrollments
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create a table for teaching assignments
CREATE TABLE teaching_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT,
    course_id INT,
    semester VARCHAR(20),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample data into the 'students' table
INSERT INTO students (first_name, last_name, date_of_birth, address)
VALUES
    ('John', 'Doe', '1995-05-15', '123 Main St'),
    ('Jane', 'Smith', '1998-02-28', '456 Oak St');

-- Insert sample data into the 'courses' table
INSERT INTO courses (course_name, department, credits)
VALUES
    ('Introduction to Computer Science', 'Computer Science', 3),
    ('Calculus I', 'Mathematics', 4);

-- Insert sample data into the 'professors' table
INSERT INTO professors (first_name, last_name, department)
VALUES
    ('Dr. Johnson', 'Computer Science', 'Computer Science'),
    ('Dr. Anderson', 'Mathematics', 'Mathematics');

-- Insert sample data into the 'enrollments' table
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-01-20');

-- Insert sample data into the 'teaching_assignments' table
INSERT INTO teaching_assignments (professor_id, course_id, semester)
VALUES
    (1, 1, 'Spring 2023'),
    (2, 2, 'Spring 2023');