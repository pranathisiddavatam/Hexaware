class Course:
    def __init__(self, course_id, course_name, course_code, instructor_name):
        self.course_id = course_id
        self.course_name = course_name
        self.course_code = course_code
        self.instructor_name = instructor_name

    def __str__(self):
        return f"Course[ID={self.course_id}, Name={self.course_name}, Code={self.course_code}, Instructor={self.instructor_name}]"
