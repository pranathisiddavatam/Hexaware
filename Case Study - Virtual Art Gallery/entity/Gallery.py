class Gallery:
    def __init__(self, gallery_id, name, description, location, curator, opening_hours):
        self.__gallery_id = gallery_id
        self.__name = name
        self.__description = description
        self.__location = location
        self.__curator = curator
        self.__opening_hours = opening_hours

    def getGalleryId(self):
        return self.__gallery_id

    def getName(self):
        return self.__name

    def getDescription(self):
        return self.__description

    def getLocation(self):
        return self.__location

    def getCurator(self):
        return self.__curator

    def getOpeningHours(self):
        return self.__opening_hours

    def setGalleryId(self, gallery_id):
        self.__gallery_id = gallery_id

    def setName(self, name):
        self.__name = name

    def setDescription(self, description):
        self.__description = description

    def setLocation(self, location):
        self.__location = location

    def setCurator(self, curator):
        self.__curator = curator

    def setOpeningHours(self, opening_hours):
        self.__opening_hours = opening_hours
