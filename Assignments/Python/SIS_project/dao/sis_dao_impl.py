import pyodbc
from util.connection import get_connection
from entity.student import Student
from entity.course import Course
from entity.teacher import Teacher
from entity.enrollment import Enrollment
from entity.payment import Payment
from exception.custom_exceptions import (
    StudentNotFoundException,
    CourseNotFoundException,
    TeacherNotFoundException,
    DuplicateEnrollmentException,
    InvalidStudentDataException,
    InvalidCourseDataException,
    InvalidEnrollmentDataException,
    InvalidTeacherDataException,
    PaymentValidationException,
)

class SISDaoImpl:

    def add_student(self, first_name, last_name, dob, email, phone):
        if not all([first_name, last_name, dob, email, phone]):
            raise InvalidStudentDataException("All student fields must be provided.")

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO SIS.Students (FirstName, LastName, DateOfBirth, Email, Phone)
            VALUES (?, ?, ?, ?, ?)
        """, (first_name, last_name, dob, email, phone))
        conn.commit()
        conn.close()

    def add_course(self, name, code, instructor):
        if not all([name, code, instructor]):
            raise InvalidCourseDataException("All course fields must be provided.")

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO SIS.Courses (CourseName, CourseCode, InstructorName)
            VALUES (?, ?, ?)
        """, (name, code, instructor))
        conn.commit()
        conn.close()

    def add_teacher(self, first_name, last_name, email):
        if not all([first_name, last_name, email]):
            raise InvalidTeacherDataException("All teacher fields must be provided.")

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO SIS.Teachers (FirstName, LastName, Email)
            VALUES (?, ?, ?)
        """, (first_name, last_name, email))
        conn.commit()
        conn.close()

    def enroll_student(self, student_id, course_id, enrollment_date):
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM SIS.Students WHERE StudentID = ?", (student_id,))
        if not cursor.fetchone():
            raise StudentNotFoundException(f"Student ID {student_id} not found.")

        cursor.execute("SELECT * FROM SIS.Courses WHERE CourseID = ?", (course_id,))
        if not cursor.fetchone():
            raise CourseNotFoundException(f"Course ID {course_id} not found.")

        cursor.execute("""
            SELECT * FROM SIS.Enrollments
            WHERE StudentID = ? AND CourseID = ?
        """, (student_id, course_id))
        if cursor.fetchone():
            raise DuplicateEnrollmentException("Student is already enrolled in this course.")

        cursor.execute("""
            INSERT INTO SIS.Enrollments (StudentID, CourseID, EnrollmentDate)
            VALUES (?, ?, ?)
        """, (student_id, course_id, enrollment_date))
        conn.commit()
        conn.close()

    def assign_teacher(self, teacher_id, course_id):
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM SIS.Teachers WHERE TeacherID = ?", (teacher_id,))
        if not cursor.fetchone():
            raise TeacherNotFoundException(f"Teacher ID {teacher_id} not found.")

        cursor.execute("SELECT * FROM SIS.Courses WHERE CourseID = ?", (course_id,))
        if not cursor.fetchone():
            raise CourseNotFoundException(f"Course ID {course_id} not found.")

        cursor.execute("""
            UPDATE SIS.Courses
            SET InstructorName = (
                SELECT FirstName + ' ' + LastName FROM SIS.Teachers WHERE TeacherID = ?
            )
            WHERE CourseID = ?
        """, (teacher_id, course_id))
        conn.commit()
        conn.close()

    def record_payment(self, student_id, amount, payment_date):
        if amount <= 0:
            raise PaymentValidationException("Payment amount must be greater than zero.")

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM SIS.Students WHERE StudentID = ?", (student_id,))
        if not cursor.fetchone():
            raise StudentNotFoundException(f"Student ID {student_id} not found.")

        cursor.execute("""
            INSERT INTO SIS.Payments (StudentID, Amount, PaymentDate)
            VALUES (?, ?, ?)
        """, (student_id, amount, payment_date))
        conn.commit()
        conn.close()

    def get_student_by_id(self, student_id):
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT StudentID, FirstName, LastName, DateOfBirth, Email, Phone
            FROM SIS.Students WHERE StudentID = ?
        """, (student_id,))
        row = cursor.fetchone()
        conn.close()

        if row:
            return Student(*row)
        else:
            raise StudentNotFoundException(f"Student with ID {student_id} not found.")

    def get_course_by_id(self, course_id):
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT CourseID, CourseName, CourseCode, InstructorName
            FROM SIS.Courses WHERE CourseID = ?
        """, (course_id,))
        row = cursor.fetchone()
        conn.close()

        if row:
            return Course(*row)
        else:
            raise CourseNotFoundException(f"Course with ID {course_id} not found.")

    def get_teacher_by_id(self, teacher_id):
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT TeacherID, FirstName, LastName, Email
            FROM SIS.Teachers WHERE TeacherID = ?
        """, (teacher_id,))
        row = cursor.fetchone()
        conn.close()

        if row:
            return Teacher(*row)
        else:
            raise TeacherNotFoundException(f"Teacher with ID {teacher_id} not found.")
