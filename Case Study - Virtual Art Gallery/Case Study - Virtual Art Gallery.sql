--CREATE DATABASE VirtualArtGallery;
--GO
USE VirtualArtGallery;
GO
CREATE SCHEMA Art
-- Create Artist Table
CREATE TABLE Art.Artist (
    ArtistID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Biography TEXT,
    BirthDate DATE,
    Nationality NVARCHAR(100),
    Website NVARCHAR(255),
    ContactInformation VARCHAR(255)
);

-- Create Artwork Table
CREATE TABLE Art.Artwork (
    ArtworkID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Description TEXT,
    CreationDate DATE,
    Medium NVARCHAR(100),
    ImageURL NVARCHAR(500),
    ArtistID INT NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE CASCADE
);

-- Create User Table
CREATE TABLE Art.Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    ProfilePicture NVARCHAR(500)
);

-- Create Gallery Table
CREATE TABLE Art.Gallery (
    GalleryID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Description TEXT,
    Location NVARCHAR(255),
    CuratorID INT NOT NULL,
    OpeningHours VARCHAR(100),
    FOREIGN KEY (CuratorID) REFERENCES Artist(ArtistID) ON DELETE CASCADE
);

-- Create Favorite Artwork Table
CREATE TABLE Art.User_Favorite_Artwork (
    UserID INT NOT NULL,
    ArtworkID INT NOT NULL,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID) ON DELETE NO ACTION,
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE NO ACTION
);

-- Create Artwork_Gallery Table
CREATE TABLE Art.Artwork_Gallery (
    ArtworkID INT NOT NULL,
    GalleryID INT NOT NULL,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE NO ACTION,
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID) ON DELETE NO ACTION
);
