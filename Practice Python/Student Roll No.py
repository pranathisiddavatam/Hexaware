class Student:
    def __init__(self, rollno, name, marks):
        self.rollno = rollno
        self.name = name
        self.marks = marks
    def total_marks(self):
        return sum(self.marks)
    def display(self):
        print(f"Roll No: {self.rollno}")
        print(f"Name   : {self.name}")
        print(f"Marks  : {self.marks}")
        print(f"Total  : {self.total_marks()}")
rollno = input("Enter Roll Number: ")
name = input("Enter Name: ")
n = int(input("Enter number of subjects: "))
marks = []
for i in range(n):
    mark = float(input(f"Enter mark for Subject {i+1}: "))
    marks.append(mark)
student = Student(rollno, name, marks)
print("\n Student Details \n")
student.display()
