/*
-- Create Database
CREATE DATABASE CarRentalSystem;
GO
USE CarRentalSystem;
GO

-- Create Vehicle Table
CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    dailyRate DECIMAL(10,2),
    status VARCHAR(20),
    passengerCapacity INT,
    engineCapacity INT
);

-- Create Customer Table
CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phoneNumber VARCHAR(15) UNIQUE
);

-- Create Lease Table
CREATE TABLE Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT FOREIGN KEY REFERENCES Vehicle(vehicleID),
    customerID INT FOREIGN KEY REFERENCES Customer(customerID),
    startDate DATE,
    endDate DATE,
    leaseType VARCHAR(20)
);

-- Create Payment Table
CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT FOREIGN KEY REFERENCES Lease(leaseID),
    paymentDate DATE,
    amount DECIMAL(10,2)
);
-- Insert Data into Vehicle Table
INSERT INTO Vehicle (vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity) VALUES
(1, 'Toyota', 'Camry', 2022, 50.00, 'available', 4, 1450),
(2, 'Honda', 'Civic', 2023, 45.00, 'available', 7, 1500),
(3, 'Ford', 'Focus', 2022, 48.00, 'notAvailable', 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 'available', 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 'available', 4, 1800),
(6, 'Hyundai', 'Sonata', 2023, 49.00, 'notAvailable', 7, 1400),
(7, 'BMW', '3 Series', 2023, 60.00, 'available', 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 'available', 8, 2599),
(9, 'Audi', 'A4', 2022, 55.00, 'notAvailable', 4, 2500),
(10, 'Lexus', 'ES', 2023, 54.00, 'available', 4, 2500);

-- Insert Data into Customer Table
INSERT INTO Customer (customerID, firstName, lastName, email, phoneNumber) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

-- Insert Data into Lease Table
INSERT INTO Lease (leaseID, vehicleID, customerID, startDate, endDate, leaseType) VALUES
(1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'Daily'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
(5, 5, 5, '2023-05-05', '2023-05-10', 'Daily'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'Daily'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'Daily'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');

-- Insert Data into Payment Table
INSERT INTO Payment (paymentID, leaseID, paymentDate, amount) VALUES
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-09', 1500.00),
(10, 10, '2023-10-25', 80.00);

-- Task 1: Update the daily rate for a Mercedes car to 68
UPDATE Vehicle SET dailyRate = 68.00 WHERE make = 'Mercedes';

-- Task 2: Delete a specific customer and all associated leases and payments (example: customerID = 3)
DELETE FROM Payment WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID = 3);
DELETE FROM Lease WHERE customerID = 3;
DELETE FROM Customer WHERE customerID = 3;

-- Task 3: Rename "paymentDate" column to "transactionDate"
EXEC sp_rename 'Payment.paymentDate', 'transactionDate', 'COLUMN';

-- Task 4: Find a customer by email
SELECT * FROM Customer WHERE email = 'johndoe@example.com';

-- Task 5: Get active leases for a specific customer (example: customerID = 2)
SELECT * FROM Lease WHERE customerID = 2 AND endDate >= GETDATE();

-- Task 6: Find all payments by a customer with a specific phone number
SELECT * FROM Payment WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID = (SELECT customerID FROM Customer WHERE phoneNumber = '555-123-4567'));

-- Task 7: Calculate average daily rate of available cars
SELECT AVG(dailyRate) AS AvgDailyRate FROM Vehicle WHERE status = 'available';

-- Task 8: Find the car with the highest daily rate
SELECT TOP 1 * FROM Vehicle ORDER BY dailyRate DESC;

-- Task 9: Retrieve all cars leased by a specific customer (example: customerID = 5)
SELECT * FROM Vehicle WHERE vehicleID IN (SELECT vehicleID FROM Lease WHERE customerID = 5);

-- Task 10: Find the details of the most recent lease  
SELECT TOP 1 * FROM Lease ORDER BY endDate DESC;

-- Task 11: List all payments made in the year 2023  
SELECT * FROM Payment WHERE YEAR(transactionDate) = 2023;

-- Task 12: Retrieve customers who have not made any payments  
SELECT * FROM Customer  
WHERE customerID NOT IN (SELECT DISTINCT customerID FROM Lease WHERE leaseID IN (SELECT DISTINCT leaseID FROM Payment));

-- Task 13: Retrieve Car Details and Their Total Payments  
SELECT V.vehicleID, V.make, V.model, SUM(P.amount) AS TotalPayments  
FROM Vehicle V  
JOIN Lease L ON V.vehicleID = L.vehicleID  
JOIN Payment P ON L.leaseID = P.leaseID  
GROUP BY V.vehicleID, V.make, V.model;

-- Task 14: Calculate Total Payments for Each Customer  
SELECT C.customerID, C.firstName, C.lastName, SUM(P.amount) AS TotalAmountPaid  
FROM Customer C  
JOIN Lease L ON C.customerID = L.customerID  
JOIN Payment P ON L.leaseID = P.leaseID  
GROUP BY C.customerID, C.firstName, C.lastName;

-- Task 15: List Car Details for Each Lease  
SELECT L.leaseID, C.firstName, C.lastName, V.make, V.model, L.startDate, L.endDate, L.leaseType  
FROM Lease L  
JOIN Customer C ON L.customerID = C.customerID  
JOIN Vehicle V ON L.vehicleID = V.vehicleID;

-- Task 16: Retrieve Details of Active Leases with Customer and Car Information  
SELECT L.leaseID, C.firstName, C.lastName, V.make, V.model, L.startDate, L.endDate  
FROM Lease L  
JOIN Customer C ON L.customerID = C.customerID  
JOIN Vehicle V ON L.vehicleID = V.vehicleID  
WHERE L.endDate >= GETDATE();

-- Task 17: Find the Customer Who Has Spent the Most on Leases  
SELECT TOP 1 C.customerID, C.firstName, C.lastName, SUM(P.amount) AS TotalSpent  
FROM Customer C  
JOIN Lease L ON C.customerID = L.customerID  
JOIN Payment P ON L.leaseID = P.leaseID  
GROUP BY C.customerID, C.firstName, C.lastName  
ORDER BY TotalSpent DESC;

-- Task 18: List All Cars with Their Current Lease Information  
SELECT V.vehicleID, V.make, V.model, L.leaseID, L.startDate, L.endDate, C.firstName, C.lastName  
FROM Vehicle V  
LEFT JOIN Lease L ON V.vehicleID = L.vehicleID  
LEFT JOIN Customer C ON L.customerID = C.customerID;
*/


