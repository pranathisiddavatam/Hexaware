import pyodbc
from dao.IVirtualArtGallery import IVirtualArtGallery
from entity.Artwork import Artwork
from entity.Gallery import Gallery
from util.DBConnection import DBConnection
from exception.ArtWorkNotFoundException import ArtWorkNotFoundException
from exception.UserNotFoundException import UserNotFoundException


class VirtualArtGalleryImpl(IVirtualArtGallery):

    def __init__(self):
        self.connection = DBConnection.getConnection()

    def addArtwork(self, artwork):
        try:
            cursor = self.connection.cursor()
            cursor.execute("""
                INSERT INTO Art.Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
                VALUES (?, ?, ?, ?, ?, ?)
            """, artwork.getTitle(), artwork.getDescription(), artwork.getCreationDate(),
                 artwork.getMedium(), artwork.getImageUrl(), artwork.getArtistId())
            self.connection.commit()
            return True
        except Exception as e:
            print("Error adding artwork:", e)
            return False

    def updateArtwork(self, artwork):
        try:
            cursor = self.connection.cursor()
            cursor.execute("""
                UPDATE Art.Artwork
                SET Title=?, Description=?, CreationDate=?, Medium=?, ImageURL=?, ArtistID=?
                WHERE ArtworkID=?
            """, artwork.getTitle(), artwork.getDescription(), artwork.getCreationDate(),
                 artwork.getMedium(), artwork.getImageUrl(), artwork.getArtistId(), artwork.getArtworkId())
            self.connection.commit()
            if cursor.rowcount == 0:
                raise ArtWorkNotFoundException("Artwork ID not found for update.")
            return True
        except Exception as e:
            print("Error updating artwork:", e)
            return False

    def removeArtwork(self, artwork_id):
        try:
            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM Art.Artwork WHERE ArtworkID = ?", artwork_id)
            self.connection.commit()
            if cursor.rowcount == 0:
                raise ArtWorkNotFoundException("Artwork ID not found for deletion.")
            return True
        except Exception as e:
            print("Error removing artwork:", e)
            return False

    def getArtworkById(self, artwork_id):
        cursor = self.connection.cursor()
        cursor.execute("SELECT * FROM Art.Artwork WHERE ArtworkID = ?", artwork_id)
        row = cursor.fetchone()
        if row:
            return Artwork(row.ArtworkID, row.Title, row.Description, row.CreationDate, row.Medium, row.ImageURL, row.ArtistID)
        else:
            raise ArtWorkNotFoundException("Artwork not found with ID: " + str(artwork_id))

    def searchArtworks(self, keyword):
        cursor = self.connection.cursor()
        cursor.execute("""
            SELECT * FROM Art.Artwork 
            WHERE Title LIKE ? OR Description LIKE ?
        """, f'%{keyword}%', f'%{keyword}%')
        rows = cursor.fetchall()
        return [Artwork(row.ArtworkID, row.Title, row.Description, row.CreationDate, row.Medium, row.ImageURL, row.ArtistID) for row in rows]

    def addArtworkToFavorite(self, user_id, artwork_id):
        cursor = self.connection.cursor()
        cursor.execute("SELECT * FROM Art.[User] WHERE UserID = ?", user_id)
        if not cursor.fetchone():
            raise UserNotFoundException("User ID does not exist.")
        cursor.execute("SELECT * FROM Art.Artwork WHERE ArtworkID = ?", artwork_id)
        if not cursor.fetchone():
            raise ArtWorkNotFoundException("Artwork ID does not exist.")
        cursor.execute("INSERT INTO Art.User_Favorite_Artwork (UserID, ArtworkID) VALUES (?, ?)", user_id, artwork_id)
        self.connection.commit()
        return True

    def removeArtworkFromFavorite(self, user_id, artwork_id):
        cursor = self.connection.cursor()
        cursor.execute("DELETE FROM Art.User_Favorite_Artwork WHERE UserID=? AND ArtworkID=?", user_id, artwork_id)
        self.connection.commit()
        return cursor.rowcount > 0

    def getUserFavoriteArtworks(self, user_id):
        cursor = self.connection.cursor()
        cursor.execute("""
            SELECT A.* FROM Art.Artwork A
            JOIN Art.User_Favorite_Artwork UFA ON A.ArtworkID = UFA.ArtworkID
            WHERE UFA.UserID = ?
        """, user_id)
        rows = cursor.fetchall()
        return [Artwork(row.ArtworkID, row.Title, row.Description, row.CreationDate, row.Medium, row.ImageURL, row.ArtistID) for row in rows]

    def addGallery(self, name, description):
        try:
            cursor = self.connection.cursor()
            cursor.execute("""
                INSERT INTO Art.Gallery (Name, Description) VALUES (?, ?)
            """, name, description)
            self.connection.commit()
            return True
        except Exception as e:
            print("Error adding gallery:", e)
            return False

    def updateGallery(self, gallery_id, name, description):
        try:
            cursor = self.connection.cursor()
            cursor.execute("""
                UPDATE Art.Gallery SET Name = ?, Description = ? WHERE GalleryID = ?
            """, name, description, gallery_id)
            self.connection.commit()
            return cursor.rowcount > 0
        except Exception as e:
            print("Error updating gallery:", e)
            return False

    def removeGallery(self, gallery_id):
        try:
            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM Art.Gallery WHERE GalleryID = ?", gallery_id)
            self.connection.commit()
            return cursor.rowcount > 0
        except Exception as e:
            print("Error removing gallery:", e)
            return False

    def searchGalleries(self, keyword):
        try:
            cursor = self.connection.cursor()
            cursor.execute("""
                SELECT * FROM Art.Gallery
                WHERE Name LIKE ? OR Description LIKE ?
            """, f'%{keyword}%', f'%{keyword}%')
            rows = cursor.fetchall()
            return [
                Gallery(
                    row.GalleryID,
                    row.Name,
                    row.Description,
                    row.Location,
                    row.Curator,
                    row.OpeningHours
                )
                for row in rows
            ]
        except Exception as e:
            print("Error searching galleries:", e)
            return []

