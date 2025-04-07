# Task - 1:Pattern
n = int(input("Enter the number of rows: "))
for i in range(n, 0, -1):
    for j in range(i):
        print('*', end=' ')
    print()

# Task - 2:Pattern
n = int(input("Enter the number of rows: "))
for i in range(n, 0, -1):
    for j in range(1, i + 1):
        print(j, end=' ')
    print()

# Task - 3:Pattern
n = int(input("Enter the number of rows: "))
for i in range(1, n + 1):
    for j in range(1, i + 1):
        if j == 1 or j == i:
            print(1, end=' ')
        else:
            print(2, end=' ')
    print()

# Task - 4:Pattern
n = int(input("Enter the number of rows: "))
for i in range(n, 0, -1):
    for j in range(i):
        print(i, end=' ')
    print()

# Task - 5:Pattern
n = int(input("Enter the number of rows: "))
num = 1
for i in range(1, n + 1):
    for j in range(i):
        print(num, end=' ')
        num += 1
    print()

# Task - 6:Program to accept 10 numbers and find the sum of all the even numbers and odd numbers.
even_sum = 0
odd_sum = 0
for i in range(10):
    num = int(input(f"Enter number {i+1}: "))
    if num % 2 == 0:
        even_sum += num
    else:
        odd_sum += num
    pass
print("Sum of even numbers:", even_sum)
print("Sum of odd numbers:", odd_sum)

# Task - 7:Fibonacci Series
n = int(input("Enter the number of terms in the Fibonacci series: "))
a, b = 0, 1
print(a, end=' ')
for i in range(1, n):
    print(b, end=' ')
    a, b = b, a + b

# Task - 8:Simple Calculator
while True:
    print("\nSimple Calculator Menu")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exit")
    choice = input("Enter choice (1/2/3/4/5): ")
    if choice == '5':
        print("Exiting the calculator. Goodbye!")
        break
    if choice in ['1', '2', '3', '4']:
        num1 = float(input("Enter the first number: "))
        num2 = float(input("Enter the second number: "))
        match choice:
            case '1':
                result = num1 + num2
                print(f"The result is: {result}")
            case '2':
                result = num1 - num2
                print(f"The result is: {result}")
            case '3':
                result = num1 * num2
                print(f"The result is: {result}")
            case '4':
                if num2 != 0:
                    result = num1 / num2
                    print(f"The result is: {result}")
                else:
                    print("Cannot divide by zero!")
    else:
        print("Invalid choice! Please select a valid option from the menu.")

# Task - 9:String palindrome
str = input("Enter a string: ")
str = str.lower()
if str == str[::-1]:
    print(f"{str} is a palindrome.")
else:
    print(f"{str} is not a palindrome.")
