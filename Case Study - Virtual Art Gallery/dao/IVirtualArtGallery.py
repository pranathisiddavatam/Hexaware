from abc import ABC, abstractmethod


class IVirtualArtGallery(ABC):

    @abstractmethod
    def addArtwork(self, artwork): pass

    @abstractmethod
    def updateArtwork(self, artwork): pass

    @abstractmethod
    def removeArtwork(self, artwork_id): pass

    @abstractmethod
    def getArtworkById(self, artwork_id): pass

    @abstractmethod
    def searchArtworks(self, keyword): pass

    @abstractmethod
    def addArtworkToFavorite(self, user_id, artwork_id): pass

    @abstractmethod
    def removeArtworkFromFavorite(self, user_id, artwork_id): pass

    @abstractmethod
    def getUserFavoriteArtworks(self, user_id): pass
