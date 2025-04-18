﻿use practice;
/*
-- Creating Salesman Table
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

-- Creating Orders Table
CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT FOREIGN KEY REFERENCES Salesman(salesman_id)
);

-- Creating Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT FOREIGN KEY REFERENCES Salesman(salesman_id)
);

-- Inserting Data into Salesman Table
INSERT INTO Salesman VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

-- Inserting Data into Orders Table
INSERT INTO Orders VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

-- Inserting Data into Customer Table
INSERT INTO Customer VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

-- Task 1: Display Orders Issued by Salesman 'Paul Adam'
SELECT * FROM Orders WHERE salesman_id = (SELECT salesman_id FROM Salesman WHERE name = 'Paul Adam');

-- Task 2: Display Orders Generated by London-Based Salespeople
SELECT * FROM Orders WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE city = 'London');

-- Task 3: Display Orders from Salespeople Handling Customer ID 3007
SELECT * FROM Orders WHERE salesman_id IN (SELECT salesman_id FROM Customer WHERE customer_id = 3007);

-- Task 4: Display Orders Exceeding Average Value on 10-Oct-2012
SELECT * FROM Orders WHERE ord_date = '2012-10-10' AND purch_amt > (SELECT AVG(purch_amt) FROM Orders WHERE ord_date = '2012-10-10');

-- Task 5: Display Orders Generated in New York City
SELECT * FROM Orders WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE city = 'New York');

-- Task 6: Display Commission of Salespeople in Paris
SELECT commission FROM Salesman WHERE city = 'Paris';

-- Task 7: Display Customers with ID Below 2001 Under Salesperson Mc Lyon
SELECT * FROM Customer WHERE salesman_id = (SELECT salesman_id FROM Salesman WHERE name = 'Mc Lyon') AND customer_id < 2001;

-- Task 8: Count of Customers with Above-Average Grades in New York City
SELECT COUNT(*) AS CustomerCount FROM Customer WHERE city = 'New York' AND grade > (SELECT AVG(grade) FROM Customer);

-- Task 9: Display Orders of Salespeople with Maximum Commission
SELECT * FROM Orders WHERE salesman_id = (SELECT TOP 1 salesman_id FROM Salesman ORDER BY commission DESC);

-- Task 10: Display Customers Who Placed Orders on 17th August 2012
SELECT o.*, c.cust_name FROM Orders o JOIN Customer c ON o.customer_id = c.customer_id WHERE o.ord_date = '2012-08-17';

-- Task 11: Display Salespeople with More Than One Customer
SELECT salesman_id, name FROM Salesman WHERE salesman_id IN (SELECT salesman_id FROM Customer GROUP BY salesman_id HAVING COUNT(*) > 1);

-- Task 12: Display Orders with Amount Above Average Order Value
SELECT * FROM Orders WHERE purch_amt > (SELECT AVG(purch_amt) FROM Orders);

-- Task 13: Display Orders with Amount ≥ Average Order Value
SELECT * FROM Orders WHERE purch_amt >= (SELECT AVG(purch_amt) FROM Orders);

-- Task 14: Show Order Sums by Date Exceeding Max Order by 1000
SELECT ord_date, SUM(purch_amt) FROM Orders GROUP BY ord_date HAVING SUM(purch_amt) > (SELECT MAX(purch_amt) FROM Orders) + 1000;

-- Task 15: Show All Customers If Any Are Located in London
SELECT * FROM Customer WHERE EXISTS (SELECT 1 FROM Customer WHERE city = 'London');

-- Task 16: Find Salespeople Handling Multiple Customers
SELECT s.salesman_id, s.name, s.city, s.commission FROM Salesman s WHERE s.salesman_id IN (SELECT salesman_id FROM Customer GROUP BY salesman_id HAVING COUNT(*) > 1);

-- Task 17: Find Salespeople Handling Only One Customer
SELECT s.salesman_id, s.name, s.city, s.commission FROM Salesman s WHERE s.salesman_id IN (SELECT salesman_id FROM Customer GROUP BY salesman_id HAVING COUNT(*) = 1);

-- Task 18: Find Salespeople Handling Customers with Multiple Orders
SELECT DISTINCT s.salesman_id, s.name, s.city, s.commission FROM Salesman s JOIN Customer c ON s.salesman_id = c.salesman_id WHERE c.customer_id IN (SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(*) > 1);

-- Task 19: Find Salespeople in Cities with at Least One Customer
SELECT DISTINCT s.salesman_id, s.name, s.city, s.commission FROM Salesman s JOIN Customer c ON s.city = c.city;

-- Task 20: Find Salespeople Living in a Customer's City
SELECT DISTINCT s.salesman_id, s.name, s.city, s.commission FROM Salesman s WHERE EXISTS (SELECT 1 FROM Customer c WHERE c.city = s.city);

-- Task 21: Find Salespeople with Names Alphabetically Before Customers
SELECT * FROM Salesman WHERE name < (SELECT MIN(cust_name) FROM Customer);

-- Task 22: Find Customers with Higher Grade Than Those Below New York
SELECT * FROM Customer WHERE grade > ALL (SELECT grade FROM Customer WHERE city > 'New York');

-- Task 23: Find Orders Exceeding Any Order from September 10, 2012
SELECT * FROM Orders WHERE purch_amt > ANY (SELECT purch_amt FROM Orders WHERE ord_date = '2012-09-10');

-- Task 24: Find Orders with Amount Less Than Any Order from London
SELECT * FROM Orders WHERE purch_amt < ANY (SELECT purch_amt FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer WHERE city = 'London'));

-- Task 25: Find Orders with Amount Less Than the Max Order from London
SELECT * FROM Orders WHERE purch_amt < (SELECT MAX(purch_amt) FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer WHERE city = 'London'));

-- Task 26: Find Customers with Higher Grades Than Those in New York
SELECT * FROM Customer WHERE grade > ALL (SELECT grade FROM Customer WHERE city = 'New York');

-- Task 27: Calculate Total Order Amount by Salespeople in Customer Cities
SELECT s.name, s.city, SUM(o.purch_amt) AS total_order_amount FROM Salesman s JOIN Orders o ON s.salesman_id = o.salesman_id WHERE s.city IN (SELECT DISTINCT city FROM Customer) GROUP BY s.name, s.city;

-- Task 28: Find Customers with Grades Different from Those in London
SELECT * FROM Customer WHERE grade NOT IN (SELECT grade FROM Customer WHERE city = 'London');

-- Task 29: Find Customers with Grades Different from Those in Paris
SELECT * FROM Customer WHERE grade NOT IN (SELECT grade FROM Customer WHERE city = 'Paris');

-- Task 30: Find Customers with Grades Different from Any in Dallas
SELECT * FROM Customer WHERE grade NOT IN (SELECT DISTINCT grade FROM Customer WHERE city = 'Dallas');

-- Creating item_mast Table
CREATE TABLE item_mast (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(50),
    pro_price DECIMAL(10,2),
    pro_com INT
);

-- Creating company_mast Table
CREATE TABLE company_mast (
    com_id INT PRIMARY KEY,
    com_name VARCHAR(50)
);

-- Inserting Data into company_mast Table
INSERT INTO company_mast VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

-- Inserting Data into item_mast Table
INSERT INTO item_mast VALUES
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);

-- Task 31: Calculate Average Price of Products by Manufacturer
SELECT c.com_name, AVG(i.pro_price) AS avg_price 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id 
GROUP BY c.com_name;

-- Task 32: Calculate Average Price of Manufacturer's Products (≥ 350)
SELECT c.com_name, AVG(i.pro_price) AS avg_price 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id 
WHERE i.pro_price >= 350 
GROUP BY c.com_name;

-- Task 33: Find Most Expensive Product of Each Company
SELECT i.pro_name, i.pro_price, c.com_name 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id 
WHERE i.pro_price = (SELECT MAX(pro_price) FROM item_mast WHERE pro_com = i.pro_com);

-- Creating emp_details Table
CREATE TABLE emp_details (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept INT
);

-- Inserting Data into emp_details Table
INSERT INTO emp_details VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);

-- Task 34: Find Employees with Last Name Gabriel or Dosio
SELECT * FROM emp_details WHERE emp_lname IN ('Gabriel', 'Dosio');

-- Task 35: Find Employees in Departments 89 or 63
SELECT * FROM emp_details WHERE emp_dept IN (89, 63);

-- Creating emp_department Table
CREATE TABLE emp_department (
    dpt_code INT PRIMARY KEY,
    dpt_name VARCHAR(50),
    dpt_allotment DECIMAL(10,2)
);

-- Inserting Data into emp_department Table
INSERT INTO emp_department VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);

-- Task 36: Find Employees in Departments with Allotment > Rs. 50000
SELECT e.emp_fname, e.emp_lname 
FROM emp_details e 
WHERE e.emp_dept IN (SELECT dpt_code FROM emp_department WHERE dpt_allotment > 50000);

-- Task 37: Find Departments with Sanction Amount Above Average
SELECT * FROM emp_department WHERE dpt_allotment > (SELECT AVG(dpt_allotment) FROM emp_department);

-- Task 38: Find Departments with More Than Two Employees
SELECT d.dpt_name 
FROM emp_department d 
WHERE d.dpt_code IN (SELECT emp_dept FROM emp_details GROUP BY emp_dept HAVING COUNT(*) > 2);

-- Task 39: Find Employees in Departments with Second Lowest Allotment
SELECT emp_fname, emp_lname 
FROM emp_details 
WHERE emp_dept = (SELECT TOP 1 dpt_code FROM (SELECT DISTINCT dpt_allotment, dpt_code FROM emp_department ORDER BY dpt_allotment ASC OFFSET 1 ROWS FETCH NEXT 1 ROW ONLY) AS sub);
*/

