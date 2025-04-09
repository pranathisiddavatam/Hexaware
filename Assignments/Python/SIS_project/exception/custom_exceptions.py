class DuplicateEnrollmentException(Exception):
    def __init__(self, message="Student is already enrolled in this course."):
        super().__init__(message)


class CourseNotFoundException(Exception):
    def __init__(self, message="The requested course was not found in the system."):
        super().__init__(message)


class StudentNotFoundException(Exception):
    def __init__(self, message="The requested student was not found in the system."):
        super().__init__(message)


class TeacherNotFoundException(Exception):
    def __init__(self, message="The requested teacher was not found in the system."):
        super().__init__(message)


class PaymentValidationException(Exception):
    def __init__(self, message="Invalid payment data provided."):
        super().__init__(message)


class InvalidStudentDataException(Exception):
    def __init__(self, message="Invalid data for student. Check date of birth, email, etc."):
        super().__init__(message)


class InvalidCourseDataException(Exception):
    def __init__(self, message="Invalid data for course. Check course code or instructor name."):
        super().__init__(message)


class InvalidEnrollmentDataException(Exception):
    def __init__(self, message="Invalid enrollment data. Check student or course references."):
        super().__init__(message)


class InvalidTeacherDataException(Exception):
    def __init__(self, message="Invalid teacher data. Name or email might be missing or incorrect."):
        super().__init__(message)


class InsufficientFundsException(Exception):
    def __init__(self, message="Insufficient funds for payment."):
        super().__init__(message)
