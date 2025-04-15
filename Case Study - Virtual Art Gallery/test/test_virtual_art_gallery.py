import pytest
from unittest.mock import patch, MagicMock
from dao.VirtualArtGalleryImpl import VirtualArtGalleryImpl
from entity.Artwork import Artwork
from exception.ArtWorkNotFoundException import ArtWorkNotFoundException
from exception.UserNotFoundException import UserNotFoundException

# 1.a - Test the ability to upload a new artwork to the gallery.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_add_artwork(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    artwork = Artwork(None, "Test Art", "Test Desc", "2023-01-01", "Oil", "http://img.jpg", 1)

    result = gallery.addArtwork(artwork)

    assert result is True
    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

# 1.b - Verify that updating artwork details works correctly.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_update_artwork(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.rowcount = 1
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    artwork = Artwork(1, "Updated Art", "Updated Desc", "2023-01-01", "Oil", "http://updated.jpg", 1)

    result = gallery.updateArtwork(artwork)

    assert result is True
    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

# 1.c - Test removing an artwork from the gallery.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_remove_artwork(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.rowcount = 1
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    result = gallery.removeArtwork(1)

    assert result is True
    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

# 1.d - Check if searching for artworks returns the expected results.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_search_artworks(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.fetchall.return_value = [MagicMock(
        ArtworkID=1, Title="Test Art", Description="Test Desc",
        CreationDate="2023-01-01", Medium="Oil", ImageURL="http://img.jpg", ArtistID=1)]
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    results = gallery.searchArtworks("Test")

    assert len(results) == 1
    assert results[0].getTitle() == "Test Art"

# 2.a - Test creating a new gallery.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_create_gallery(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    result = gallery.addGallery("Modern Gallery", "Gallery for modern art")

    assert result is True
    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

# 2.b - Verify that updating gallery information works correctly.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_update_gallery(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.rowcount = 1
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    result = gallery.updateGallery(1, "Updated Gallery", "New Description")

    assert result is True
    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

# 2.c - Test removing a gallery from the system.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_remove_gallery(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.rowcount = 1
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    result = gallery.removeGallery(1)

    assert result is True
    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

# 2.d - Check if searching for galleries returns the expected results.
@patch('dao.VirtualArtGalleryImpl.DBConnection.getConnection')
def test_search_gallery(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()

    mock_row = MagicMock()
    mock_row.GalleryID = 1
    mock_row.Name = "Modern Gallery"
    mock_row.Description = "Gallery for modern art"
    mock_row.Location = "New York"
    mock_row.Curator = 2
    mock_row.OpeningHours = "9 AM - 6 PM"

    mock_cursor.fetchall.return_value = [mock_row]
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    gallery = VirtualArtGalleryImpl()
    results = gallery.searchGalleries("Modern")

    assert len(results) == 1
    assert results[0].getName() == "Modern Gallery"
    assert results[0].getDescription() == "Gallery for modern art"
    assert results[0].getLocation() == "New York"
    assert results[0].getCurator() == 2
    assert results[0].getOpeningHours() == "9 AM - 6 PM"