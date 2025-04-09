from abc import ABC, abstractmethod

class SISDaoInterface(ABC):

    # Student
    @abstractmethod
    def add_student(self, student): pass

    @abstractmethod
    def get_student_by_id(self, student_id): pass

    @abstractmethod
    def update_student(self, student): pass

    @abstractmethod
    def delete_student(self, student_id): pass

    # Course
    @abstractmethod
    def add_course(self, course): pass

    @abstractmethod
    def get_course_by_id(self, course_id): pass

    @abstractmethod
    def update_course(self, course): pass

    @abstractmethod
    def delete_course(self, course_id): pass

    # Teacher
    @abstractmethod
    def add_teacher(self, teacher): pass

    @abstractmethod
    def assign_teacher_to_course(self, course_id, teacher_id): pass

    # Enrollment
    @abstractmethod
    def enroll_student(self, enrollment): pass

    @abstractmethod
    def get_enrollments_by_student_id(self, student_id): pass

    # Payment
    @abstractmethod
    def make_payment(self, payment): pass

    @abstractmethod
    def get_payments_by_student_id(self, student_id): pass
