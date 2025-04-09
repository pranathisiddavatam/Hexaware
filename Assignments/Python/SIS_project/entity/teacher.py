class Teacher:
    def __init__(self, teacher_id, first_name, last_name, email):
        self.teacher_id = teacher_id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def __str__(self):
        return f"Teacher[ID={self.teacher_id}, Name={self.first_name} {self.last_name}, Email={self.email}]"
