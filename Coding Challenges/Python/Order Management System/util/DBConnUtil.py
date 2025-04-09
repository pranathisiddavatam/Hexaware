import pyodbc
from util.DBPropertyUtil import DBPropertyUtil

class DBConnUtil:
    @staticmethod
    def get_connection(property_file):
        conn_str = DBPropertyUtil.get_connection_string(property_file)
        return pyodbc.connect(conn_str)
