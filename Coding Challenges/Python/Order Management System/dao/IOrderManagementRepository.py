from abc import ABC, abstractmethod

class IOrderManagementRepository(ABC):
    @abstractmethod
    def createUser(self, user): pass

    @abstractmethod
    def createProduct(self, user, product): pass

    @abstractmethod
    def createOrder(self, user, productList): pass

    @abstractmethod
    def cancelOrder(self, userId, orderId): pass

    @abstractmethod
    def getAllProducts(self): pass

    @abstractmethod
    def getOrderByUser(self, user): pass
