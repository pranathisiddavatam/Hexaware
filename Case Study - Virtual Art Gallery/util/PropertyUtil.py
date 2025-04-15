import configparser
import os

class PropertyUtil:

    @staticmethod
    def getPropertyString():
        config = configparser.ConfigParser()
        properties_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'db.properties')
        config.read(properties_path)

        try:
            server = config['DEFAULT']['server']
            database = config['DEFAULT']['database']
            driver = config['DEFAULT']['driver']

            conn_str = f'DRIVER={{{driver}}};SERVER={server};DATABASE={database};Trusted_Connection=yes;'
            return conn_str
        except KeyError as e:
            raise Exception(f"Missing key in db.properties: {e}")
