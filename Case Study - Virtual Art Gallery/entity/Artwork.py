class Artwork:
    def __init__(self, artwork_id=None, title="", description="", creation_date=None, medium="", image_url="", artist_id=None):
        self.__artwork_id = artwork_id
        self.__title = title
        self.__description = description
        self.__creation_date = creation_date
        self.__medium = medium
        self.__image_url = image_url
        self.__artist_id = artist_id

    # Getters
    def getArtworkId(self):
        return self.__artwork_id

    def getTitle(self):
        return self.__title

    def getDescription(self):
        return self.__description

    def getCreationDate(self):
        return self.__creation_date

    def getMedium(self):
        return self.__medium

    def getImageUrl(self):
        return self.__image_url

    def getArtistId(self):
        return self.__artist_id

    # Setters (if needed)
    def setArtworkId(self, artwork_id):
        self.__artwork_id = artwork_id

    def setTitle(self, title):
        self.__title = title

    def setDescription(self, description):
        self.__description = description

    def setCreationDate(self, creation_date):
        self.__creation_date = creation_date

    def setMedium(self, medium):
        self.__medium = medium

    def setImageUrl(self, image_url):
        self.__image_url = image_url

    def setArtistId(self, artist_id):
        self.__artist_id = artist_id
