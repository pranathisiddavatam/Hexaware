from dao.IOrderManagementRepository import IOrderManagementRepository
from exception.UserNotFoundException import UserNotFoundException
from exception.OrderNotFoundException import OrderNotFoundException
from util.DBConnUtil import DBConnUtil


class OrderProcessor(IOrderManagementRepository):
    def __init__(self):
        self.conn = DBConnUtil.get_connection("db.properties")

    def createUser(self, user):
        cursor = self.conn.cursor()
        cursor.execute("INSERT INTO OMS.Users VALUES (?, ?, ?, ?)",
                       user.userId, user.username, user.password, user.role)
        self.conn.commit()

    def createProduct(self, user, product):
        cursor = self.conn.cursor()
        cursor.execute("SELECT role FROM OMS.Users WHERE userId = ?", user.userId)
        row = cursor.fetchone()
        if not row or row[0].lower() != "admin":
            raise UserNotFoundException("Only admins can create products")

        if product.type == "Electronics":
            cursor.execute("""INSERT INTO OMS.Products VALUES (?, ?, ?, ?, ?, ?, ?, NULL, NULL)""",
                           product.productId, product.productName, product.description, product.price,
                           product.quantityInStock, product.type, product.brand, product.warrantyPeriod)
        elif product.type == "Clothing":
            cursor.execute("""INSERT INTO OMS.Products VALUES (?, ?, ?, ?, ?, ?, NULL, NULL, ?, ?)""",
                           product.productId, product.productName, product.description, product.price,
                           product.quantityInStock, product.type, product.size, product.color)
        self.conn.commit()

    def createOrder(self, user, productList):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM OMS.Users WHERE userId = ?", user.userId)
        if not cursor.fetchone():
            self.createUser(user)

        cursor.execute("INSERT INTO OMS.Orders(userId) VALUES (?)", user.userId)
        orderId = cursor.execute("SELECT @@IDENTITY").fetchval()

        for product in productList:
            cursor.execute("INSERT INTO OMS.OrderDetails(orderId, productId, quantity) VALUES (?, ?, ?)",
                           orderId, product.productId, product.quantityInStock)
        self.conn.commit()

    def cancelOrder(self, userId, orderId):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM OMS.Users WHERE userId = ?", userId)
        if not cursor.fetchone():
            raise UserNotFoundException()

        cursor.execute("SELECT * FROM OMS.Orders WHERE orderId = ?", orderId)
        if not cursor.fetchone():
            raise OrderNotFoundException()

        cursor.execute("DELETE FROM OMS.OrderDetails WHERE orderId = ?", orderId)
        cursor.execute("DELETE FROM OMS.Orders WHERE orderId = ?", orderId)
        self.conn.commit()

    def getAllProducts(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM OMS.Products")
        return cursor.fetchall()

    def getOrderByUser(self, user):
        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT od.orderId, p.productName, od.quantity 
            FROM OMS.Orders o
            JOIN OMS.OrderDetails od ON o.orderId = od.orderId
            JOIN OMS.Products p ON od.productId = p.productId
            WHERE o.userId = ?
        """, user.userId)
        return cursor.fetchall()
