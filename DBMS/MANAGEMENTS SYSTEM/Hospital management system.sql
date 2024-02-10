-- Create a database for the hospital management system
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;

-- Create a table for patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address VARCHAR(100)
);

-- Create a table for doctors
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(50),
    contact_number VARCHAR(15)
);

-- Create a table for appointments
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);


-- Insert sample data into the 'patients' table
INSERT INTO patients (first_name, last_name, gender, date_of_birth, contact_number, address)
VALUES
    ('John', 'Doe', 'Male', '1990-01-01', '1234567890', '123 Main St'),
    ('Jane', 'Smith', 'Female', '1985-05-15', '9876543210', '456 Oak St');

-- Insert sample data into the 'doctors' table
INSERT INTO doctors (first_name, last_name, specialty, contact_number)
VALUES
    ('Dr. Smith', 'Cardiologist', 'Cardiology', '5551112233'),
    ('Dr. Johnson', 'Orthopedic Surgeon', 'Orthopedics', '5552223344');

-- Insert sample data into the 'appointments' table
INSERT INTO appointments (patient_id, doctor_id, appointment_date)
VALUES
    (1, 1, '2023-01-15 10:00:00'),
    (2, 2, '2023-01-20 14:30:00');

-- Query to retrieve patient, doctor, and appointment information
SELECT patients., doctors.*, appointments.
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id;