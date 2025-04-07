class Student:
    def __init__(self, name, marks):
        self.name = name
        self.marks = marks
    def display(self):
        total = sum(self.marks)
        average = total / len(self.marks)
        print(f"Name: {self.name}")
        print(f"Marks: {self.marks}")
        print(f"Total: {total}, Average: {average:.2f}")
students = []
n = int(input("Enter number of students: "))
for i in range(n):
    print(f"\nEnter details for Student {i+1}:")
    name = input("Name: ")
    marks = []
    for j in range(3):
        mark = float(input(f"Enter mark for Subject {j+1}: "))
        marks.append(mark)
    student = Student(name, marks)
    students.append(student)
print("\n Student Records \n")
for student in students:
    student.display()
