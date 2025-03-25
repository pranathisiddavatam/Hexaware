use mydata;
--Task1
--CREATE TABLE VideoFiles (ID INT IDENTITY(1,1) PRIMARY KEY,VideoName VARCHAR(255),VideoData VARBINARY(MAX));
/*INSERT INTO VideoFiles (VideoName, VideoData)
SELECT 'SampleVideo.mp4', 
    BulkColumn FROM OPENROWSET(BULK 'C:\Users\prana\OneDrive\Desktop\Hexaware\SampleVideo.mp4', SINGLE_BLOB) AS VideoFile;

SELECT VideoName, VideoData
FROM VideoFiles;
*/