# Task - 1 :program to calculate the mean of a given list of numbers
numbers = [10, 20, 30, 40, 50]
total = count = 0
for num in numbers:
    total += num
    count += 1
mean = total / count
print("The mean is:", mean)

# Task - 2 :program to search for an element in a given list of numbers
numbers = [10, 20, 30, 40, 50]
element = int(input("Enter the number to search: "))
flag = False
for index in range(len(numbers)):
    if numbers[index] == element:
        flag = True
        print(f"{element} is present in the list at position {index + 1}.")
        break
if not flag:
    print(f"{element} is not present in the list.")

# Task - 3 :program to input two lists and display the maximum element from the elements of both the lists combined, along with its index in its list.
list1 = list(map(int, input("Enter elements of first list : ").split()))
list2 = list(map(int, input("Enter elements of second list : ").split()))
max1 = max(list1)
max2 = max(list2)
if max1 >= max2:
    max_element = max1
    index = list1.index(max1)
    list_number = 1
else:
    max_element = max2
    index = list2.index(max2)
    list_number = 2
print(f"The maximum element is {max_element} from list {list_number} at index {index}.")

# Task - 4 : program to find the second largest number of a list of numbers.
numbers = list(map(int, input("Enter numbers separated by spaces: ").split()))
Sorted_list = sorted(numbers, reverse=True)
if len(Sorted_list) < 2:
    print("There is no second largest number.")
else:
    print(f"The second largest number is: {Sorted_list[1]}")

# Task - 5 :program that interactively creates a nested tuple to store marks in three subjects for five students.
marks = ()
for i in range(5):
    print(f"Enter marks for Student {i + 1}:")
    sub1 = int(input("Subject 1: "))
    sub2 = int(input("Subject 2: "))
    sub3 = int(input("Subject 3: "))
    student_marks = (sub1, sub2, sub3)
    marks += (student_marks,)
print("\nMarks Tuple:")
print(marks)

# Task - 6 :program to create a dictionary and extract all the even values and odd values and also find the sum of all the even and odd values.
numbers = {
    "a": 10, "b": 25, "c": 14, "d": 33, "e": 42, "f": 19, "g": 79
}
even = []
odd = []
for value in numbers.values():
    if value % 2 == 0:
        even.append(value)
    else:
        odd.append(value)
sum_even = sum(even)
sum_odd = sum(odd)
print(f"Even values: {even}")
print(f"Sum of even values: {sum_even}")
print(f"Odd values: {odd}")
print(f"Sum of odd values: {sum_odd}")

# Task - 7 :program to find the highest 2 values from the dictionary
numbers = {
    "a": 10, "b": 25, "c": 14, "d": 33, "e": 42, "f": 19, "g": 79
}
sorted_values = sorted(numbers.values(), reverse=True)
highest_1 = sorted_values[0]
highest_2 = sorted_values[1]
print(f"The highest value is: {highest_1}")
print(f"The second highest value is: {highest_2}")

# Task - 8 :program to display product information from the dictionary
products = {
    "Laptop": 50000,
    "Smartphone": 20000,
    "Headphones": 1500,
    "Keyboard": 1200
}
print("Product Information:")
for product, price in products.items():
    print(f"Product: {product}, Price: ₹{price}")


