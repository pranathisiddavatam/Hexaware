class Rectangle:
    def __init__(self, length, breadth):
        self.__length = length
        self.__breadth = breadth
    def area(self):
        return self.__length * self.__breadth
rect = Rectangle(11, 6)
print("Area of the rectangle:", rect.area())