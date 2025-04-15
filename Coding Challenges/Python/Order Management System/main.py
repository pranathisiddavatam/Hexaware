from dao.OrderProcessor import OrderProcessor
from entity.User import User
from entity.Electronics import Electronics
from entity.Clothing import Clothing
from entity.Product import Product  

def main():
    processor = OrderProcessor()

    while True:
        print("\n--- Order Management Menu ---")
        print("1. Create User")
        print("2. Create Product")
        print("3. Create Order")
        print("4. Cancel Order")
        print("5. Get All Products")
        print("6. Get Orders by User")
        print("7. Exit")

        choice = input("Enter choice: ")

        if choice == "1":
            user = User(int(input("User ID: ")), input("Username: "), input("Password: "), input("Role: "))
            processor.createUser(user)
            print("User added successfully.")

        elif choice == "2":
            uid = int(input("Admin User ID: "))
            type = input("Product Type (Electronics/Clothing): ")

            if type == "Electronics":
                product = Electronics(
                    int(input("Product ID: ")),
                    input("Name: "),
                    input("Desc: "),
                    float(input("Price: ")),
                    int(input("Stock: ")),
                    input("Brand: "),
                    int(input("Warranty: "))
                )
            else:
                product = Clothing(
                    int(input("Product ID: ")),
                    input("Name: "),
                    input("Desc: "),
                    float(input("Price: ")),
                    int(input("Stock: ")),
                    input("Size: "),
                    input("Color: ")
                )
            user = User(uid, "", "", "Admin")
            processor.createProduct(user, product)
            print("Product added successfully.")

        elif choice == "3":
            uid = int(input("User ID: "))
            uname = input("Username: ")
            pwd = input("Password: ")
            role = input("Role: ")
            user = User(uid, uname, pwd, role)
            n = int(input("Number of Products: "))
            products = []
            for _ in range(n):
                pid = int(input("Product ID: "))
                qty = int(input("Quantity: "))
                p = Product(pid, "", "", 0, qty, "")
                products.append(p)
            processor.createOrder(user, products)
            print("Order created successfully.")

        elif choice == "4":
            processor.cancelOrder(int(input("User ID: ")), int(input("Order ID: ")))
            print("Order cancelled successfully.")

        elif choice == "5":
            products = processor.getAllProducts()
            for p in products:
                print(p)

        elif choice == "6":
            user = User(int(input("User ID: ")), "", "", "")
            orders = processor.getOrderByUser(user)
            if not orders:
                print("There are no orders yet from this user.")
            else:
                for order in orders:
                    print(order)

        elif choice == "7":
            print("Exiting...")
            break

if __name__ == "__main__":
    main()
