
/*USE prac;

-- Create an Employees table
CREATE TABLE Employees (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    department VARCHAR(50)
);

-- Insert sample data
INSERT INTO Employees VALUES 
(1, 'Alice', 'HR'),
(2, 'Bob', 'IT'),
(3, 'Charlie', 'Finance'),
(4, 'David', 'IT');

-- Create a Products table for additional testing
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Insert sample data into Products table
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Mobile Phone', 'Electronics'),
(3, 'Table', 'Furniture'),
(4, 'Chair', 'Furniture');

-- 1. Find the index of 't' in 'Customer'
SELECT CHARINDEX('t', 'Customer') AS "Character Index";  -- Output: 3

-- 2. Get ASCII character for 65
SELECT CHAR(65) AS "Character";  -- Output: A

-- 3. Concatenate two strings
SELECT CONCAT('Python', ' SQL Server') AS "Concat";  -- Output: Python SQL Server

-- 4. Check the byte size of 'Python'
SELECT DATALENGTH('Python') AS "Data Length";  -- Output: 6

-- 5. Check phonetic similarity
SELECT DIFFERENCE('Juicy', 'Jucy') AS "Difference";  -- Output: 4

-- 6. Format a date
DECLARE @d DATETIME = '12/01/2018';
SELECT FORMAT(@d, 'd', 'en-US') AS 'US English Result',
       FORMAT(@d, 'd', 'no') AS 'Norwegian Result',
       FORMAT(@d, 'd', 'zu') AS 'Zulu Result';

-- 7. Get first 3 characters
SELECT LEFT('Python Programming', 3) AS "Left Value";  -- Output: Pyt

-- 8. Get length of a string
SELECT LEN('Python Made Easy') AS "Length of String";  -- Output: 17

-- 9. Convert employee names to lowercase
SELECT empname, LOWER(empname) AS "LowerCase Name" FROM Employees;

-- 10. Remove left spaces
SELECT LTRIM('        PythonProgramming') AS "LEFT TRIM";  -- Output: PythonProgramming

-- 11. Unicode number of 65
SELECT NCHAR(65) AS "Unicode Number";  -- Output: A

-- 12. Find pattern in a string
SELECT PATINDEX('%programming%', 'Pythonprogramming') AS 'Pattern Index';  -- Output: 7

-- 13. Pattern matching using wildcards
SELECT PATINDEX('%s%com%', 'google.com');  -- Output: 0 (no match)
SELECT PATINDEX('%[og]%', 'google.com');   -- Output: 1 (o at position 1)
SELECT PATINDEX('%[z]%', 'Google.com');    -- Output: 0 (no match)

-- 14. Add quotes around a string
SELECT QUOTENAME('python') AS "QuoteName";  -- Output: [python]

-- 15. Replace 'P' with 'R' in a string
SELECT REPLACE('Python Programming', 'P', 'R') AS "Replace String";  
-- Output: Rython Rrogramming

-- 16. Repeat a string 5 times
SELECT REPLICATE('Python', 5) AS "Replicate";  
-- Output: PythonPythonPythonPythonPython

-- 17. Reverse a string
SELECT REVERSE('Python') AS "Reverse String";  -- Output: nohtyP

-- 18. Extract last 5 characters
SELECT RIGHT('Python Programming', 5) AS "Right";  -- Output: mming

-- 19. Remove right spaces
SELECT RTRIM('PYthon Programming          ') AS "Right Trim";  
-- Output: PYthon Programming

-- 20. Compare phonetic similarity using Soundex
SELECT SOUNDEX('JUICE') AS "Soundex1", SOUNDEX('Jucy') AS "Soundex2";  
-- Output: J200, J200 (same sound)

-- 21. Extract substring
SELECT SUBSTRING('Python', 2, 2) AS "SubString";  -- Output: yt

-- 22. Convert employee names to uppercase
SELECT empname, UPPER(empname) AS "UpperCase Name" FROM Employees;

-- 23. Trim both left and right spaces
SELECT TRIM('      Python       ') AS "Trim";  -- Output: Python
*/


/*

USE subqueries;

-- Create an Employees table
CREATE TABLE Employees (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    empsal DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO Employees VALUES 
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 45000),
(4, 'David', 70000);


-- 1. Get the absolute value of -123
SELECT ABS(-123) AS "Absolute Value";  -- Output: 123

-- 2. Get the average salary of employees
SELECT AVG(empsal) AS "Average Salary" FROM Employees;  
-- Output: (50000+60000+45000+70000)/4 = 56250.00

-- 3. Get the ceiling value of 25.75 (next highest integer)
SELECT CEILING(25.75) AS "Ceiling Value";  -- Output: 26

-- 4. Convert degrees to radians using ACOS
SELECT ACOS(0.25) AS "Acos Radians";  -- Output: 1.3181 (in radians)

-- 5. Count the number of employees
SELECT COUNT(empid) AS "Employee Count" FROM Employees;  -- Output: 4

-- 6. Get the cosine of 30 degrees (converted to radians)
SELECT COS(RADIANS(30)) AS "Cos Value";  -- Output: 0.8660

-- 7. Get the floor value of 25.75 (round down)
SELECT FLOOR(25.75) AS "Floor Value";  -- Output: 25

-- 8. Get the natural logarithm of 2
SELECT LOG(2) AS "Logarithm";  -- Output: 0.6931

-- 9. Get the maximum salary
SELECT MAX(empsal) AS "Max Salary" FROM Employees;  -- Output: 70000

-- 10. Get the minimum salary
SELECT MIN(empsal) AS "Min Salary" FROM Employees;  -- Output: 45000

-- 11. Get the value of Pi
SELECT PI() AS "PI Value";  -- Output: 3.1416

-- 12. Get 4 raised to the power of 2 (4²)
SELECT POWER(4,2) AS "Power Value";  -- Output: 16

-- 13. Convert 180 degrees to radians
SELECT RADIANS(180) AS "Radians Value";  -- Output: 3.1416 (Pi radians)

-- 14. Round 10.6678 to 3 decimal places
SELECT ROUND(10.6678,3) AS "Round Value";  -- Output: 10.668

-- 15. Round 235.415 to 2 decimal places
SELECT ROUND(235.415,2) AS "Rounded Value";  -- Output: 235.42

-- 16. Get the square root of 2
SELECT SQRT(2) AS "Square Root";  -- Output: 1.4142

-- 17. Get the square of 3 (3²)
SELECT SQUARE(3) AS "Square Value";  -- Output: 9

-- 18. Get the sum of all employee salaries
SELECT SUM(empsal) AS "Sum of Salary" FROM Employees;  -- Output: 225000
*/
