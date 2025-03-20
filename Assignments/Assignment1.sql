Use TechShop
--Task1.1-Create the DataBase
--create database TechShop

--Task1.2,1.3,1.4-Create Tables&keys
--CREATE TABLE "Customers" (CustomerID INT IDENTITY(1,1) PRIMARY KEY, FirstName VARCHAR(50),LastName VARCHAR(50),Email VARCHAR(100) UNIQUE,Phone VARCHAR(15),Address TEXT);
--CREATE TABLE "Products" (ProductID INT IDENTITY(1,1) PRIMARY KEY,ProductName VARCHAR(100),Description TEXT,Price DECIMAL(10,2));
--CREATE TABLE "Orders" (OrderID INT IDENTITY(1,1) PRIMARY KEY,CustomerID INT,OrderDate DATE,TotalAmount DECIMAL(10,2),FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
--CREATE TABLE "OrderDetails" (OrderDetailID INT PRIMARY KEY,OrderID INT,ProductID INT,Quantity INT,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
--CREATE TABLE "Inventory" (InventoryID INT IDENTITY(1,1) PRIMARY KEY,ProductID INT,QuantityInStock INT,LastStockUpdate DATE,FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

--Task1.5-insert data
/*INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john@example.com', '1234567890', '123 Street, NY'),
('Alice', 'Smith', 'alice@example.com', '9876543210', '456 Road, CA'),
('Bob', 'Johnson', 'bob@example.com', '5678901234', '789 Avenue, TX'),
('Emma', 'Brown', 'emma@example.com', '1112223333', '101 Main St, FL'),
('Michael', 'Davis', 'michael@example.com', '4445556666', '202 Elm St, IL'),
('Olivia', 'Wilson', 'olivia@example.com', '7778889999', '303 Pine St, WA'),
('James', 'Taylor', 'james@example.com', '6667778888', '404 Cedar St, OH'),
('Sophia', 'Anderson', 'sophia@example.com', '5556667777', '505 Birch St, AZ'),
('William', 'Martinez', 'william@example.com', '3334445555', '606 Oak St, MI'),
('Isabella', 'Garcia', 'isabella@example.com', '2223334444', '707 Maple St, NV');*/

/*INSERT INTO Products (ProductName, Description, Price) VALUES
('Laptop', 'High-end gaming laptop', 1200.00),
('Smartphone', 'Latest model smartphone', 800.00),
('Tablet', 'Lightweight tablet with stylus', 600.00),
('Smartwatch', 'Wearable tech with health tracking', 250.00),
('Wireless Earbuds', 'Noise-canceling earbuds with long battery life', 150.00),
('Bluetooth Speaker', 'Portable speaker with deep bass', 100.00),
('Gaming Mouse', 'High precision mouse with RGB lighting', 75.00),
('Mechanical Keyboard', 'RGB mechanical keyboard with tactile switches', 130.00),
('External Hard Drive', '2TB storage with fast transfer speeds', 200.00),
('Webcam', '1080p HD webcam with built-in microphone', 90.00);*/

/*INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-03-01', 2000.00),
(2, '2025-03-02', 800.00),
(3, '2025-03-03', 1200.00),
(4, '2025-03-04', 250.00),
(5, '2025-03-05', 150.00),
(6, '2025-03-06', 100.00),
(7, '2025-03-07', 75.00),
(8, '2025-03-08', 130.00),
(9, '2025-03-09', 200.00),
(10, '2025-03-10', 90.00);*/

/*INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1);*/

/*INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 10, '2025-03-01'),
(2, 20, '2025-03-01'),
(3, 15, '2025-03-01'),
(4, 25, '2025-03-02'),
(5, 30, '2025-03-02'),
(6, 40, '2025-03-02'),
(7, 35, '2025-03-03'),
(8, 50, '2025-03-03'),
(9, 60, '2025-03-04'),
(10, 70, '2025-03-04');*/

--Task2.1-Retrieve the Names and Emails of All Customers
/*SELECT FirstName, LastName, Email 
FROM Customers;*/

--Task2.2-List All Orders with Their Order Dates and Corresponding Customer Names
/*SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;*/

--Task2.3-Insert a New Customer Record
/*INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St, NY');*/

--Task2.4-Update Prices of All Products by Increasing Them by 10%
/*UPDATE Products 
SET Price = Price * 1.10;*/

--Task2.5-Delete a Specific Order and Its Associated Order Details
/*DECLARE @OrderID INT = 1; 
DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;*/

--Task2.6-Insert a New Order
/*INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) 
VALUES (1, '2025-03-20', 500.00);*/

--Task2.7-Update Contact Information of a Specific Customer
/*DECLARE @CustomerID INT = 1; 
DECLARE @NewEmail VARCHAR(255) = 'new.email@example.com';
DECLARE @NewAddress VARCHAR(255) = '456 New St, LA';
UPDATE Customers 
SET Email = @NewEmail, Address = @NewAddress 
WHERE CustomerID = @CustomerID;*/

--Task2.8-Recalculate and Update the Total Cost of Each Order
/*UPDATE Orders 
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price) 
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);*/

--Task2.9-Delete All Orders and Order Details for a Specific Customer
/*DECLARE @CustomerID INT = 1;
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);
DELETE FROM Orders WHERE CustomerID = @CustomerID;*/

--Task2.10-Insert a New Electronic Gadget into the Products Table
/*INSERT INTO Products (ProductName, Description, Price) 
VALUES ('Smartphone', 'Latest 5G smartphone with 128GB storage', 699.99);*/

--Task2.11-Update the Status of a Specific Order
--ALTER TABLE Orders ADD Status VARCHAR(50);
/*DECLARE @OrderID INT = 1;
DECLARE @NewStatus VARCHAR(50) = 'Shipped';
UPDATE Orders 
SET Status = @NewStatus 
WHERE OrderID = @OrderID;*/

--Task2.12-Calculate and Update the Number of Orders Placed by Each Customer
--ALTER TABLE Customers ADD OrderCount INT DEFAULT 0;
/*UPDATE Customers 
SET OrderCount = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);*/
























