class User:
    def __init__(self, user_id=None, username=None, password=None, email=None,
                 first_name=None, last_name=None, dob=None, profile_picture=None):
        self.__user_id = user_id
        self.__username = username
        self.__password = password
        self.__email = email
        self.__first_name = first_name
        self.__last_name = last_name
        self.__dob = dob
        self.__profile_picture = profile_picture

    def getUserId(self): return self.__user_id
    def setUserId(self, user_id): self.__user_id = user_id

    def getUsername(self): return self.__username
    def setUsername(self, username): self.__username = username

    def getPassword(self): return self.__password
    def setPassword(self, password): self.__password = password

    def getEmail(self): return self.__email
    def setEmail(self, email): self.__email = email

    def getFirstName(self): return self.__first_name
    def setFirstName(self, first_name): self.__first_name = first_name

    def getLastName(self): return self.__last_name
    def setLastName(self, last_name): self.__last_name = last_name

    def getDOB(self): return self.__dob
    def setDOB(self, dob): self.__dob = dob

    def getProfilePicture(self): return self.__profile_picture
    def setProfilePicture(self, profile_picture): self.__profile_picture = profile_picture
