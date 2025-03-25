use mydata;
--1
--CREATE TABLE Employees (EmployeeID INT PRIMARY KEY,Name NVARCHAR(100),Department VARCHAR(50),Salary INT);
/*INSERT INTO Employees (EmployeeID, Name, Department, Salary) VALUES
(101, 'Rajesh', 'HR', 60000),
(102, 'Priya', 'IT', 75000),
(103, 'Anjali', 'HR', 55000),
(104, 'Vikram', 'Finance', 48000),
(105, 'Neha', 'HR', 45000),
(106, 'Rohan', 'Marketing', 52000),
(107, 'Sneha', 'HR', 65000),
(108, 'Amit', 'IT', 72000),
(109, 'Pooja', 'HR', 53000),
(110, 'Arjun', 'Sales', 47000);*/

/*SELECT Name
FROM Employees
WHERE Department = 'HR' AND Salary > 50000;*/

--2
/*CREATE TABLE Orders (OrderID INT PRIMARY KEY,CustomerID INT,OrderDate DATE,OrderAmount DECIMAL(10,2));

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(201, 101, '2024-03-01', 5000),
(202, 102, '2024-03-02', 7000),
(203, 101, '2024-03-05', 4000),
(204, 103, '2024-03-06', 6500),
(205, 104, '2024-03-07', 3000),
(206, 102, '2024-03-08', 7200),
(207, 105, '2024-03-09', 5500),
(208, 101, '2024-03-10', 6000);

SELECT CustomerID, COUNT(*) AS DuplicateCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1;*/

--3
/*CREATE TABLE Sales (SaleID INT PRIMARY KEY,ProductID INT,Quantity INT,SaleDate DATE);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 101, 5, '2024-03-01'),
(2, 102, 8, '2024-03-02'),
(3, 101, 3, '2024-03-03'),
(4, 103, 10, '2024-03-04'),
(5, 104, 6, '2024-03-05'),
(6, 102, 7, '2024-03-06'),
(7, 101, 4, '2024-03-07'),
(8, 103, 5, '2024-03-08'),
(9, 104, 2, '2024-03-09'),
(10, 102, 9, '2024-03-10');

SELECT ProductID, SUM(Quantity) AS TotalQuantitySold
FROM Sales
GROUP BY ProductID
ORDER BY TotalQuantitySold DESC;*/

--4

--CREATE TABLE Transact (TransactionID INT PRIMARY KEY,AccountID INT,TransactionDate DATE,Amount DECIMAL(10,2));
/*INSERT INTO Transact (TransactionID, AccountID, TransactionDate, Amount) VALUES
(1, 1001, '2024-02-15', 5000.00),
(2, 1002, '2024-03-05', 12000.50),
(3, 1003, '2024-03-10', 7500.75),
(4, 1001, '2024-03-15', 9000.00),
(5, 1004, '2024-03-18', 4500.00),
(6, 1002, '2024-03-22', 11000.00),
(7, 1003, '2024-03-25', 6700.25),
(8, 1005, '2024-03-27', 8200.00),
(9, 1001, '2024-03-28', 1500.00),
(10, 1004, '2024-03-29', 3000.50);

SELECT *
FROM Transact
WHERE TransactionDate >= DATEADD(DAY, -30, '2024-03-30');*/

--5

/*CREATE TABLE Products (ProductID INT PRIMARY KEY,ProductName VARCHAR(100),Price DECIMAL(10,2),StockQuantity INT);

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity) VALUES
(1, 'Laptop', 50000.00, 50),
(2, 'Smartphone', 25000.00, 150),
(3, 'Headphones', 1500.00, 75),
(4, 'Tablet', 30000.00, 30),
(5, 'Smartwatch', 10000.00, 90),
(6, 'Monitor', 12000.00, 200),
(7, 'Keyboard', 2000.00, 80),
(8, 'Mouse', 800.00, 300);

UPDATE Products
SET Price = Price * 1.10
WHERE StockQuantity < 100;

SELECT * FROM Products;*/

--6
/*
CREATE TABLE UserN (UserID INT PRIMARY KEY,Username VARCHAR(100),Email VARCHAR(100),Status VARCHAR(20),LastLoginDate DATE);

INSERT INTO UserN (UserID, Username, Email, Status, LastLoginDate) VALUES
(1, 'Rajesh Kumar', 'rajesh@gmail.com', 'active', '2024-02-15'),
(2, 'Priya Sharma', 'priya@gmail.com', 'inactive', '2022-12-10'),
(3, 'Amit Verma', 'amit@gmail.com', 'inactive', '2023-03-05'),
(4, 'Suresh Reddy', 'suresh@gmail.com', 'active', '2024-01-20'),
(5, 'Neha Gupta', 'neha@gmail.com', 'inactive', '2022-09-25'),
(6, 'Vikram Singh', 'vikram@gmail.com', 'inactive', '2021-11-15'),
(7, 'Ananya Iyer', 'ananya@gmail.com', 'active', '2024-03-10');

DELETE FROM UserN
WHERE Status = 'inactive'
AND LastLoginDate < DATEADD(YEAR, -1, GETDATE());

SELECT * FROM UserN;
*/

--9
/*
CREATE TABLE NProducts (ProductID INT PRIMARY KEY,ProductName VARCHAR(100),Category VARCHAR(50),Discount VARCHAR(20));

INSERT INTO NProducts (ProductID, ProductName, Category, Discount) VALUES
(1, 'Laptop', 'Electronics', '10%'),
(2, 'Smartphone', 'Electronics', '5%'),
(3, 'Headphones', 'Accessories', NULL),
(4, 'Tablet', 'Electronics', NULL),
(5, 'Smartwatch', 'Accessories', '15%'),
(6, 'Monitor', 'Electronics', NULL),
(7, 'Keyboard', 'Accessories', '8%'),
(8, 'Mouse', 'Accessories', NULL);

SELECT 
    ProductName, 
    ISNULL(Discount, 'No Discount') AS Discount
FROM NProducts;
*/



