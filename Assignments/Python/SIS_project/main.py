from dao.sis_dao_impl import SISDaoImpl
from exception.custom_exceptions import (
    InvalidStudentDataException,
    InvalidCourseDataException,
    InvalidTeacherDataException,
    InvalidEnrollmentDataException,
    PaymentValidationException,
    DuplicateEnrollmentException,
    CourseNotFoundException,
    StudentNotFoundException,
    TeacherNotFoundException,
    InsufficientFundsException
)

def main():
    sis_dao = SISDaoImpl()

    while True:
        print("\n===== Student Information System Menu =====")
        print("1. Add Student")
        print("2. Add Course")
        print("3. Add Teacher")
        print("4. Enroll Student in Course")
        print("5. Assign Teacher to Course")
        print("6. Record Payment")
        print("7. View Student Details")
        print("8. View Course Details")
        print("9. View Teacher Details")
        print("10. Exit")

        choice = input("Enter your choice (1-10): ")

        try:
            if choice == "1":
                first_name = input("Enter first name: ")
                last_name = input("Enter last name: ")
                dob = input("Enter date of birth (YYYY-MM-DD): ")
                email = input("Enter email: ")
                phone = input("Enter phone number: ")
                sis_dao.add_student(first_name, last_name, dob, email, phone)
                print("Student added successfully.")

            elif choice == "2":
                course_name = input("Enter course name: ")
                course_code = input("Enter course code: ")
                instructor_name = input("Enter instructor name: ")
                sis_dao.add_course(course_name, course_code, instructor_name)
                print("Course added successfully.")

            elif choice == "3":
                first_name = input("Enter teacher's first name: ")
                last_name = input("Enter teacher's last name: ")
                email = input("Enter email: ")
                sis_dao.add_teacher(first_name, last_name, email)
                print("Teacher added successfully.")

            elif choice == "4":
                student_id = int(input("Enter student ID: "))
                course_id = int(input("Enter course ID: "))
                enrollment_date = input("Enter enrollment date (YYYY-MM-DD): ")
                sis_dao.enroll_student_in_course(student_id, course_id, enrollment_date)
                print("Student enrolled successfully.")

            elif choice == "5":
                teacher_id = int(input("Enter teacher ID: "))
                course_id = int(input("Enter course ID: "))
                sis_dao.assign_teacher_to_course(teacher_id, course_id)
                print("Teacher assigned to course successfully.")

            elif choice == "6":
                student_id = int(input("Enter student ID: "))
                amount = float(input("Enter payment amount: "))
                payment_date = input("Enter payment date (YYYY-MM-DD): ")
                sis_dao.record_payment(student_id, amount, payment_date)
                print("Payment recorded successfully.")

            elif choice == "7":
                student_id = int(input("Enter student ID: "))
                student = sis_dao.get_student_by_id(student_id)
                print(student if student else "Student not found.")

            elif choice == "8":
                course_id = int(input("Enter course ID: "))
                course = sis_dao.get_course_by_id(course_id)
                print(course if course else "Course not found.")

            elif choice == "9":
                teacher_id = int(input("Enter teacher ID: "))
                teacher = sis_dao.get_teacher_by_id(teacher_id)
                print(teacher if teacher else "Teacher not found.")

            elif choice == "10":
                print("Exiting Student Information System. Goodbye!")
                break

            else:
                print("Invalid choice. Please enter a number from 1 to 10.")

        except (
            InvalidStudentDataException,
            InvalidCourseDataException,
            InvalidTeacherDataException,
            InvalidEnrollmentDataException,
            PaymentValidationException,
            DuplicateEnrollmentException,
            CourseNotFoundException,
            StudentNotFoundException,
            TeacherNotFoundException,
            InsufficientFundsException
        ) as e:
            print(f"Error: {e}")

        except ValueError:
            print("Invalid input. Please enter the correct data types.")

if __name__ == "__main__":
    main()
