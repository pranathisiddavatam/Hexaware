class Store:
    def __init__(self, name, price):
        self.name = name
        self.price = price
products = [
    Store("Apples", 50),
    Store("Bananas", 30),
    Store("Milk", 25)
]
total = 0
print("Available Products:")
count = 1
for item in products:
    print(f"{count}. {item.name} - ₹{item.price}")
    count += 1
print("\nEnter quantity for each product:")
for item in products:
    qty = int(input(f"{item.name}: "))
    total += qty * item.price
print("\nBill ")
print(f"Total Amount: ₹{total}")
