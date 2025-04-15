/*CREATE DATABASE VirtualArtGallery;
GO

CREATE SCHEMA Art;
GO

CREATE TABLE Art.Artist (
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Biography NVARCHAR(MAX),
    BirthDate DATE,
    Nationality NVARCHAR(50),
    Website NVARCHAR(255),
    ContactInformation NVARCHAR(255)
);
GO

CREATE TABLE Art.Artwork (
    ArtworkID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    CreationDate DATE,
    Medium NVARCHAR(100),
    ImageURL NVARCHAR(255),
    ArtistID INT NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Art.Artist(ArtistID)
);
GO

CREATE TABLE Art.[User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture NVARCHAR(255)
);
GO

CREATE TABLE Art.Gallery (
    GalleryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Location NVARCHAR(255),
    Curator INT NOT NULL,
    OpeningHours NVARCHAR(255),
    FOREIGN KEY (Curator) REFERENCES Art.Artist(ArtistID)
);
GO

CREATE TABLE Art.User_Favorite_Artwork (
    UserID INT NOT NULL,
    ArtworkID INT NOT NULL,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES Art.[User](UserID),
    FOREIGN KEY (ArtworkID) REFERENCES Art.Artwork(ArtworkID)
);
GO

CREATE TABLE Art.Artwork_Gallery (
    ArtworkID INT NOT NULL,
    GalleryID INT NOT NULL,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Art.Artwork(ArtworkID),
    FOREIGN KEY (GalleryID) REFERENCES Art.Gallery(GalleryID)
);
GO
*/
USE VirtualArtGallery;
GO




