import pyodbc
from util.PropertyUtil import PropertyUtil

class DBConnection:
    connection = None

    @staticmethod
    def getConnection():
        if DBConnection.connection is None:
            conn_str = PropertyUtil.getPropertyString()
            DBConnection.connection = pyodbc.connect(conn_str)
        return DBConnection.connection
