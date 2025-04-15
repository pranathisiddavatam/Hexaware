from dao.VirtualArtGalleryImpl import VirtualArtGalleryImpl
from entity.Artwork import Artwork
from exception.ArtWorkNotFoundException import ArtWorkNotFoundException
from exception.UserNotFoundException import UserNotFoundException
from datetime import date

def menu():
    service = VirtualArtGalleryImpl()
    while True:
        print("\n--- Virtual Art Gallery ---")
        print("1. Add Artwork")
        print("2. Update Artwork")
        print("3. Delete Artwork")
        print("4. View Artwork by ID")
        print("5. Search Artworks")
        print("6. Add to Favorite")
        print("7. Remove from Favorite")
        print("8. View User Favorites")
        print("9. Exit")
        choice = input("Enter your choice: ")

        try:
            if choice == "1":
                title = input("Title: ")
                desc = input("Description: ")
                cdate = input("Creation Date (YYYY-MM-DD): ")
                medium = input("Medium: ")
                imgurl = input("Image URL: ")
                artist_id = int(input("Artist ID: "))
                artwork = Artwork(None, title, desc, cdate, medium, imgurl, artist_id)
                if service.addArtwork(artwork): print("Artwork added successfully.")
            elif choice == "2":
                artwork_id = int(input("Artwork ID to update: "))
                title = input("New Title: ")
                desc = input("New Description: ")
                cdate = input("New Creation Date (YYYY-MM-DD): ")
                medium = input("New Medium: ")
                imgurl = input("New Image URL: ")
                artist_id = int(input("New Artist ID: "))
                artwork = Artwork(artwork_id, title, desc, cdate, medium, imgurl, artist_id)
                if service.updateArtwork(artwork): print("Artwork updated successfully.")
            elif choice == "3":
                aid = int(input("Artwork ID to delete: "))
                if service.removeArtwork(aid): print("Artwork deleted successfully.")
            elif choice == "4":
                aid = int(input("Artwork ID to view: "))
                artwork = service.getArtworkById(aid)
                print(vars(artwork))
            elif choice == "5":
                keyword = input("Keyword to search: ")
                results = service.searchArtworks(keyword)
                for art in results:
                    print(vars(art))
            elif choice == "6":
                uid = int(input("User ID: "))
                aid = int(input("Artwork ID to add to favorites: "))
                if service.addArtworkToFavorite(uid, aid): print("Added to favorites.")
            elif choice == "7":
                uid = int(input("User ID: "))
                aid = int(input("Artwork ID to remove from favorites: "))
                if service.removeArtworkFromFavorite(uid, aid): print("Removed from favorites.")
            elif choice == "8":
                uid = int(input("User ID: "))
                favs = service.getUserFavoriteArtworks(uid)
                for art in favs:
                    print(vars(art))
            elif choice == "9":
                print("Exiting Virtual Art Gallery.")
                break
            else:
                print("Invalid choice.")
        except (ArtWorkNotFoundException, UserNotFoundException) as e:
            print(e)
        except Exception as ex:
            print("An error occurred:", ex)

if __name__ == "__main__":
    menu()
