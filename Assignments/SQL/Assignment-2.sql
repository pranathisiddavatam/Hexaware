--CREATE DATABASE SISDB;
USE SISDB;
GO
CREATE SCHEMA SIS;
GO
CREATE TABLE SIS.Students (
      student_id INT IDENTITY(1,1) PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      date_of_birth DATE NOT NULL,
      email VARCHAR(100) UNIQUE NOT NULL,
      phone_number VARCHAR(15) UNIQUE NOT NULL);
CREATE TABLE SIS.Courses (
      course_id INT IDENTITY(1,1) PRIMARY KEY,
      course_name VARCHAR(100) NOT NULL,
      credits INT NOT NULL CHECK (credits > 0),
      teacher_id INT,
      FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE SET NULL);
CREATE TABLE SIS.Enrollments (
      enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
      student_id INT,
      course_id INT,
      enrollment_date DATE NOT NULL,
      FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
      FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE);
CREATE TABLE SIS.Teacher (
      teacher_id INT IDENTITY(1,1) PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      email VARCHAR(100) UNIQUE NOT NULL);
CREATE TABLE SIS.Payments (
      payment_id INT IDENTITY(1,1) PRIMARY KEY,
      student_id INT,
      amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
      payment_date DATE NOT NULL,
      FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE);
INSERT INTO SIS.Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('John', 'Doe', '2002-05-15', 'john.doe@example.com', '9876543210'),
('Alice', 'Smith', '2001-09-22', 'alice.smith@example.com', '9876543211'),
('Bob', 'Brown', '2000-07-18', 'bob.brown@example.com', '9876543212'),
('Eve', 'Johnson', '1999-03-10', 'eve.johnson@example.com', '9876543213'),
('Charlie', 'White', '2003-11-25', 'charlie.white@example.com', '9876543214'),
('David', 'Miller', '2000-01-30', 'david.miller@example.com', '9876543215'),
('Grace', 'Taylor', '2001-06-12', 'grace.taylor@example.com', '9876543216'),
('Sophia', 'Anderson', '2002-12-05', 'sophia.anderson@example.com', '9876543217'),
('James', 'Thomas', '1998-08-19', 'james.thomas@example.com', '9876543218'),
('Olivia', 'Harris', '2004-04-28', 'olivia.harris@example.com', '9876543219');
INSERT INTO SIS.Teacher (first_name, last_name, email) VALUES
('Michael', 'Williams', 'michael.williams@example.com'),
('Emma', 'Davis', 'emma.davis@example.com'),
('Daniel', 'Clark', 'daniel.clark@example.com'),
('Sophia', 'Martinez', 'sophia.martinez@example.com'),
('Liam', 'Rodriguez', 'liam.rodriguez@example.com'),
('Emily', 'Garcia', 'emily.garcia@example.com'),
('Benjamin', 'Lopez', 'benjamin.lopez@example.com'),
('Charlotte', 'Gonzalez', 'charlotte.gonzalez@example.com'),
('Alexander', 'Wilson', 'alexander.wilson@example.com'),
('Mia', 'Moore', 'mia.moore@example.com');
INSERT INTO SIS.Courses (course_name, credits, teacher_id) VALUES
('Database Systems', 3, 1),
('Machine Learning', 4, 2),
('Artificial Intelligence', 4, 3),
('Software Engineering', 3, 4),
('Computer Networks', 3, 5),
('Data Structures', 4, 6),
('Operating Systems', 3, 7),
('Cyber Security', 4, 8),
('Cloud Computing', 3, 9),
('Big Data Analytics', 4, 10);
INSERT INTO SIS.Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-02-10'),
(3, 3, '2024-03-05'),
(4, 4, '2024-01-20'),
(5, 5, '2024-02-15'),
(6, 6, '2024-03-10'),
(7, 7, '2024-01-25'),
(8, 8, '2024-02-20'),
(9, 9, '2024-03-15'),
(10, 10, '2024-01-30');
INSERT INTO SIS.Payments (student_id, amount, payment_date) VALUES
(1, 500.00, '2024-01-18'),
(2, 750.00, '2024-02-12'),
(3, 650.00, '2024-03-08'),
(4, 800.00, '2024-01-22'),
(5, 900.00, '2024-02-17'),
(6, 700.00, '2024-03-12'),
(7, 850.00, '2024-01-27'),
(8, 950.00, '2024-02-22'),
(9, 1000.00, '2024-03-18'),
(10, 1100.00, '2024-01-31');

-- Task 2.1: Insert a new student into the "Students" table
INSERT INTO SIS.Students (first_name, last_name, date_of_birth, email, phone_number)  
VALUES ('John', 'Doe', '1995-08-15', 'john.doe2@example.com', '1234567890');

-- Task 2.2: Enroll a student in a course 
INSERT INTO SIS.Enrollments (student_id, course_id, enrollment_date)  
VALUES (1, 2, GETDATE());

-- Task 2.3: Update the email address of a specific teacher
UPDATE SIS.Teacher  
SET email = 'teach1.email@example.com'  
WHERE teacher_id = 1;

-- Task 2.4: Delete a specific enrollment record
DELETE FROM SIS.Enrollments  
WHERE student_id = 1 AND course_id = 2;

-- Task 2.5: Assign a teacher to a course 
UPDATE SIS.Courses  
SET teacher_id = 3  
WHERE course_id = 5;

-- Task 2.6: Delete a specific student and their enrollments
DELETE FROM SIS.Enrollments  
WHERE student_id = 4;
DELETE FROM SIS.Students  
WHERE student_id = 4;

-- Task 2.7: Update the payment amount 
UPDATE SIS.Payments  
SET amount = 2000  
WHERE payment_id = 2;

-- Task 3.1: Calculate the total payments made by a specific student
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments  
FROM SIS.Students s  
JOIN SIS.Payments p ON s.student_id = p.student_id  
WHERE s.student_id = 1  
GROUP BY s.first_name, s.last_name;

-- Task 3.2: Retrieve courses along with the count of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS total_students  
FROM SIS.Courses c  
LEFT JOIN SIS.Enrollments e ON c.course_id = e.course_id  
GROUP BY c.course_name;

-- Task 3.3: Find students who have not enrolled in any course
SELECT s.first_name, s.last_name  
FROM SIS.Students s  
LEFT JOIN SIS.Enrollments e ON s.student_id = e.student_id  
WHERE e.course_id IS NULL;

-- Task 3.4: Retrieve students and the courses they are enrolled in
SELECT s.first_name, s.last_name, c.course_name  
FROM SIS.Students s  
JOIN Enrollments e ON s.student_id = e.student_id  
JOIN Courses c ON e.course_id = c.course_id;

-- Task 3.5: List teachers and the courses they are assigned to
SELECT t.first_name, t.last_name, c.course_name  
FROM SIS.Teacher t  
LEFT JOIN SIS.Courses c ON t.teacher_id = c.teacher_id;

-- Task 3.6: List students and their enrollment dates for a specific course
SELECT s.first_name, s.last_name, e.enrollment_date  
FROM SIS.Students s  
JOIN SIS.Enrollments e ON s.student_id = e.student_id  
WHERE e.course_id = 3;

-- Task 3.7: Find students who have not made any payments
SELECT s.first_name, s.last_name  
FROM SIS.Students s  
LEFT JOIN SIS.Payments p ON s.student_id = p.student_id  
WHERE p.payment_id IS NULL;

-- Task 3.8: Identify courses that have no enrollments
SELECT c.course_name  
FROM SIS.Courses c  
LEFT JOIN SIS.Enrollments e ON c.course_id = e.course_id  
WHERE e.enrollment_id IS NULL;

-- Task 3.9: Identify students enrolled in more than one course
SELECT s.first_name, s.last_name, COUNT(e.course_id) AS total_courses  
FROM SIS.Students s  
JOIN SIS.Enrollments e ON s.student_id = e.student_id  
GROUP BY s.student_id, s.first_name, s.last_name  
HAVING COUNT(e.course_id) > 1;

-- Task 3.10: Find teachers not assigned to any courses
SELECT t.first_name, t.last_name  
FROM SIS.Teacher t  
LEFT JOIN SIS.Courses c ON t.teacher_id = c.teacher_id  
WHERE c.course_id IS NULL;

-- Task 4.1: Calculate the average number of students enrolled in each course
SELECT AVG(student_count) AS avg_students_per_course  
FROM (SELECT COUNT(e.student_id) AS student_count  
      FROM SIS.Enrollments e  
      GROUP BY e.course_id) AS subquery;

-- Task 4.2: Identify student(s) who made the highest payment
SELECT s.first_name, s.last_name, p.amount  
FROM SIS.Students s  
JOIN SIS.Payments p ON s.student_id = p.student_id  
WHERE p.amount = (SELECT MAX(amount) FROM SIS.Payments);

-- Task 4.3: Retrieve courses with the highest number of enrollments
SELECT c.course_name, COUNT(e.student_id) AS total_students  
FROM SIS.Courses c  
JOIN SIS.Enrollments e ON c.course_id = e.course_id  
GROUP BY c.course_name  
HAVING COUNT(e.student_id) =  
    (SELECT MAX(student_count)  
     FROM (SELECT COUNT(student_id) AS student_count  
           FROM SIS.Enrollments  
           GROUP BY course_id) AS subquery);

-- Task 4.4: Calculate total payments made to courses taught by each teacher
SELECT t.first_name, t.last_name, SUM(p.amount) AS total_payments  
FROM SIS.Teacher t  
JOIN SIS.Courses c ON t.teacher_id = c.teacher_id  
JOIN SIS.Enrollments e ON c.course_id = e.course_id  
JOIN SIS.Payments p ON e.student_id = p.student_id  
GROUP BY t.teacher_id, t.first_name, t.last_name;

-- Task 4.5: Identify students enrolled in all available courses
SELECT s.first_name, s.last_name  
FROM SIS.Students s  
WHERE (SELECT COUNT(course_id) FROM Courses) =  
      (SELECT COUNT(e.course_id) FROM SIS.Enrollments e WHERE e.student_id = s.student_id);

-- Task 4.6: Retrieve names of teachers not assigned to any courses
SELECT first_name, last_name  
FROM SIS.Teacher  
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM SIS.Courses WHERE teacher_id IS NOT NULL);

-- Task 4.7: Calculate average age of all students
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age  
FROM SIS.Students;

-- Task 4.8: Identify courses with no enrollments
SELECT course_name  
FROM SIS.Courses  
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM SIS.Enrollments);

-- Task 4.9: Calculate total payments made by each student for each course
SELECT s.first_name, s.last_name, c.course_name, SUM(p.amount) AS total_payments  
FROM SIS.Students s  
JOIN SIS.Enrollments e ON s.student_id = e.student_id  
JOIN SIS.Courses c ON e.course_id = c.course_id  
JOIN SIS.Payments p ON s.student_id = p.student_id  
GROUP BY s.student_id, s.first_name, s.last_name, c.course_name;

-- Task 4.10: Identify students who made more than one payment
SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS payment_count  
FROM SIS.Students s  
JOIN SIS.Payments p ON s.student_id = p.student_id  
GROUP BY s.student_id, s.first_name, s.last_name  
HAVING COUNT(p.payment_id) > 1;

-- Task 4.11: Calculate total payments made by each student
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments  
FROM SIS.Students s  
JOIN SIS.Payments p ON s.student_id = p.student_id  
GROUP BY s.student_id, s.first_name, s.last_name;

-- Task 4.12: Retrieve courses and count of students enrolled in each
SELECT c.course_name, COUNT(e.student_id) AS total_students  
FROM SIS.Courses c  
LEFT JOIN SIS.Enrollments e ON c.course_id = e.course_id  
GROUP BY c.course_name;

-- Task 4.13: Calculate average payment amount made by students
SELECT AVG(p.amount) AS avg_payment  
FROM SIS.Payments p;

