import tkinter as tk
from tkinter import messagebox, simpledialog
from dao.VirtualArtGalleryImpl import VirtualArtGalleryImpl
from entity.Artwork import Artwork
from exception.ArtWorkNotFoundException import ArtWorkNotFoundException
from exception.UserNotFoundException import UserNotFoundException

service = VirtualArtGalleryImpl()

def add_artwork():
    try:
        title = simpledialog.askstring("Title", "Enter Artwork Title:")
        desc = simpledialog.askstring("Description", "Enter Artwork Description:")
        cdate = simpledialog.askstring("Creation Date", "Enter Creation Date (YYYY-MM-DD):")
        medium = simpledialog.askstring("Medium", "Enter Medium:")
        imgurl = simpledialog.askstring("Image URL", "Enter Image URL:")
        artist_id = int(simpledialog.askstring("Artist ID", "Enter Artist ID:"))

        artwork = Artwork(None, title, desc, cdate, medium, imgurl, artist_id)
        if service.addArtwork(artwork):
            messagebox.showinfo("Success", "Artwork added successfully.")
    except Exception as e:
        messagebox.showerror("Error", str(e))

def update_artwork():
    try:
        artwork_id = int(simpledialog.askstring("Artwork ID", "Enter Artwork ID to update:"))
        title = simpledialog.askstring("New Title", "Enter New Title:")
        desc = simpledialog.askstring("New Description", "Enter New Description:")
        cdate = simpledialog.askstring("New Creation Date", "Enter New Creation Date (YYYY-MM-DD):")
        medium = simpledialog.askstring("New Medium", "Enter New Medium:")
        imgurl = simpledialog.askstring("New Image URL", "Enter New Image URL:")
        artist_id = int(simpledialog.askstring("New Artist ID", "Enter New Artist ID:"))

        artwork = Artwork(artwork_id, title, desc, cdate, medium, imgurl, artist_id)
        if service.updateArtwork(artwork):
            messagebox.showinfo("Success", "Artwork updated successfully.")
    except Exception as e:
        messagebox.showerror("Error", str(e))

def delete_artwork():
    try:
        aid = int(simpledialog.askstring("Artwork ID", "Enter Artwork ID to delete:"))
        if service.removeArtwork(aid):
            messagebox.showinfo("Success", "Artwork deleted successfully.")
    except Exception as e:
        messagebox.showerror("Error", str(e))

def view_artwork_by_id():
    try:
        aid = int(simpledialog.askstring("Artwork ID", "Enter Artwork ID to view:"))
        artwork = service.getArtworkById(aid)
        details = vars(artwork)
        messagebox.showinfo("Artwork Details", str(details))
    except (ArtWorkNotFoundException, Exception) as e:
        messagebox.showerror("Error", str(e))

def search_artworks():
    try:
        keyword = simpledialog.askstring("Search", "Enter keyword to search artworks:")
        results = service.searchArtworks(keyword)
        output = ""
        for art in results:
            output += str(vars(art)) + "\n"
        if not output:
            output = "No artworks found."
        messagebox.showinfo("Search Results", output)
    except Exception as e:
        messagebox.showerror("Error", str(e))

def add_to_favorite():
    try:
        uid = int(simpledialog.askstring("User ID", "Enter User ID:"))
        aid = int(simpledialog.askstring("Artwork ID", "Enter Artwork ID to add to favorites:"))
        if service.addArtworkToFavorite(uid, aid):
            messagebox.showinfo("Success", "Artwork added to favorites.")
    except (UserNotFoundException, Exception) as e:
        messagebox.showerror("Error", str(e))

def remove_from_favorite():
    try:
        uid = int(simpledialog.askstring("User ID", "Enter User ID:"))
        aid = int(simpledialog.askstring("Artwork ID", "Enter Artwork ID to remove from favorites:"))
        if service.removeArtworkFromFavorite(uid, aid):
            messagebox.showinfo("Success", "Artwork removed from favorites.")
    except (UserNotFoundException, Exception) as e:
        messagebox.showerror("Error", str(e))

def view_user_favorites():
    try:
        uid = int(simpledialog.askstring("User ID", "Enter User ID to view favorites:"))
        favorites = service.getUserFavoriteArtworks(uid)
        output = ""
        for art in favorites:
            output += str(vars(art)) + "\n"
        if not output:
            output = "No favorites found."
        messagebox.showinfo("Favorite Artworks", output)
    except (UserNotFoundException, Exception) as e:
        messagebox.showerror("Error", str(e))

def exit_app():
    root.destroy()

root = tk.Tk()
root.title("🎨 Virtual Art Gallery - GUI Version")
root.geometry("400x600")

tk.Label(root, text="Virtual Art Gallery", font=("Arial", 18)).pack(pady=20)

tk.Button(root, text="Add Artwork", width=30, command=add_artwork).pack(pady=5)
tk.Button(root, text="Update Artwork", width=30, command=update_artwork).pack(pady=5)
tk.Button(root, text="Delete Artwork", width=30, command=delete_artwork).pack(pady=5)
tk.Button(root, text="View Artwork by ID", width=30, command=view_artwork_by_id).pack(pady=5)
tk.Button(root, text="Search Artworks", width=30, command=search_artworks).pack(pady=5)
tk.Button(root, text="Add to Favorite", width=30, command=add_to_favorite).pack(pady=5)
tk.Button(root, text="Remove from Favorite", width=30, command=remove_from_favorite).pack(pady=5)
tk.Button(root, text="View User Favorites", width=30, command=view_user_favorites).pack(pady=5)
tk.Button(root, text="Exit", width=30, command=exit_app, fg="white", bg="red").pack(pady=20)

root.mainloop()
