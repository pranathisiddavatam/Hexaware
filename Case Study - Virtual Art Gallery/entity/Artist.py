class Artist:
    def __init__(self, artist_id=None, name=None, biography=None, birth_date=None,
                 nationality=None, website=None, contact_info=None):
        self.__artist_id = artist_id
        self.__name = name
        self.__biography = biography
        self.__birth_date = birth_date
        self.__nationality = nationality
        self.__website = website
        self.__contact_info = contact_info

    def getArtistId(self): return self.__artist_id
    def setArtistId(self, artist_id): self.__artist_id = artist_id

    def getName(self): return self.__name
    def setName(self, name): self.__name = name

    def getBiography(self): return self.__biography
    def setBiography(self, biography): self.__biography = biography

    def getBirthDate(self): return self.__birth_date
    def setBirthDate(self, birth_date): self.__birth_date = birth_date

    def getNationality(self): return self.__nationality
    def setNationality(self, nationality): self.__nationality = nationality

    def getWebsite(self): return self.__website
    def setWebsite(self, website): self.__website = website

    def getContactInfo(self): return self.__contact_info
    def setContactInfo(self, contact_info): self.__contact_info = contact_info
