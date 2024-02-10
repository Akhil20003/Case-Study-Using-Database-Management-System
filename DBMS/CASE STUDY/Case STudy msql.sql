-- Create Database
CREATE DATABASE casestudy;
-- Use the Database
USE casestudy;
-- Create Train Table
CREATE TABLE Train (
    Train_ID INT PRIMARY KEY,
    Train_Name VARCHAR(100),
    Departure_Station VARCHAR(100),
    Arrival_Station VARCHAR(100),
    Departure_Time TIME,
    Arrival_Time TIME,
    Total_Seats INT,
    Available_Seats INT
);
-- Insert data into Train Table
INSERT INTO Train (Train_ID, Train_Name, Departure_Station, Arrival_Station, Departure_Time, Arrival_Time, Total_Seats, Available_Seats)
VALUES
(1, 'Express 101', 'Guntur', 'Chennai', '08:00:00', '10:40:00', 200, 180),
(2, 'Express 101', 'Guntur', 'Chennai', '08:00:00', '10:40:00', 200, 180),
(3, 'Express 101', 'Guntur', 'Chennai', '08:00:00', '10:40:00', 200, 180);
select * from Train;

-- Create Passenger Table
CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact_Number VARCHAR(20),
    Address TEXT
);
-- Insert data into Passenger Table
INSERT INTO Passenger (Passenger_ID, Name, Contact_Number, Address) 
VALUES 
(1, 'Akhil', '8179421105', '123 Neerukonda, Guntur, AP'),
(2, 'Arun', '7654799332', '456 kuragallu, Guntur, AP'),
(3, 'Ameen', '8273645980', '789 nidamaru, Guntur, AP');
select * from Passenger;

-- Create Reservation Table
CREATE TABLE Reservation (
    Reservation_ID INT PRIMARY KEY,
    Passenger_ID INT,
    Train_ID INT,
    Seat_Number INT,
    Date DATE,
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Train_ID) REFERENCES Train(Train_ID)
);
-- Insert data into Reservation Table
INSERT INTO Reservation (Reservation_ID, Passenger_ID, Train_ID, Seat_Number, Date)
VALUES
(1, 1, 1, 5, '2023-10-27'),
(2, 2, 2, 6, '2023-10-27'),
(3, 3, 3, 7, '2023-10-27');
select * from Reservation;
-- Create Ticket Table
CREATE TABLE Ticket (
    Ticket_ID INT PRIMARY KEY,
    Reservation_ID INT,
    Fare DECIMAL(10, 2),
    Payment_Status VARCHAR(20),
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID)
);
-- Insert data into Ticket Table
INSERT INTO Ticket (Ticket_ID, Reservation_ID, Fare, Payment_Status)
VALUES
(1, 1, 100.00, 'Paid'),
(2, 2, 100.00, 'Paid'),
(3, 3, 100.00, 'Paid');
select* from Ticket;
-- Create Station Table
CREATE TABLE Station (
    Station_ID INT PRIMARY KEY,
    Station_Name VARCHAR(100),
    Location VARCHAR(100)
);
-- Insert data into Station Table
INSERT INTO Station (Station_ID, Station_Name, Location)
VALUES
(1, 'Guntur', 'Mangalagiri, AP'),
(2, 'Guntur', 'Mangalagiri, AP'),
(3, 'Guntur', 'Mangalagiri, AP');
select * from Station;
-- Create Employee Table
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100),
    Contact_Number VARCHAR(20)
);
-- Insert data into Employee Table
INSERT INTO Employee (Employee_ID, Name, Position, Contact_Number)
VALUES
(1, 'Abhinav', 'Conductor', '9875436210'),
(2, 'Lohith', 'Ticket Agent', '1234567899'),
(3, 'Venky', 'Engineer', '8764538290');
select * from Employee;
