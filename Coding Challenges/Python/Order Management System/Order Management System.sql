
CREATE DATABASE OrderManagementDB;
GO

USE OrderManagementDB;
GO

CREATE SCHEMA OMS;
GO

CREATE TABLE OMS.Users (
    userId INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(10) CHECK (role IN ('Admin', 'User')) NOT NULL
);
GO

CREATE TABLE OMS.Products (
    productId INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    description TEXT,
    price FLOAT CHECK (price >= 0),
    quantityInStock INT CHECK (quantityInStock >= 0),
    type VARCHAR(20) CHECK (type IN ('Electronics', 'Clothing')) NOT NULL,
    brand VARCHAR(50),
    warrantyPeriod INT,
    size VARCHAR(10),
    color VARCHAR(20)
);
GO

CREATE TABLE OMS.Orders (
    orderId INT PRIMARY KEY IDENTITY(1,1),
    userId INT NOT NULL,
    orderDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (userId) REFERENCES OMS.Users(userId)
);
GO

CREATE TABLE OMS.OrderDetails (
    orderDetailId INT PRIMARY KEY IDENTITY(1,1),
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    FOREIGN KEY (orderId) REFERENCES OMS.Orders(orderId) ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES OMS.Products(productId)
);
GO
