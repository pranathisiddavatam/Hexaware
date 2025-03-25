use crime;
/*
-- Create Crime Table
CREATE TABLE Crime ( 
    CrimeID INT PRIMARY KEY, 
    IncidentType VARCHAR(255), 
    IncidentDate DATE, 
    Location VARCHAR(255), 
    Description TEXT, 
    Status VARCHAR(20) 
); 
 
-- Create Victim Table
CREATE TABLE Victim ( 
    VictimID INT PRIMARY KEY, 
    CrimeID INT FOREIGN KEY REFERENCES Crime(CrimeID), 
    Name VARCHAR(255), 
    ContactInfo VARCHAR(255), 
    Injuries VARCHAR(255) 
); 
 
-- Create Suspect Table
CREATE TABLE Suspect ( 
    SuspectID INT PRIMARY KEY, 
    CrimeID INT FOREIGN KEY REFERENCES Crime(CrimeID), 
    Name VARCHAR(255), 
    Description TEXT, 
    CriminalHistory TEXT
); 

-- Insert Data into Crime Table
INSERT INTO Crime (CrimeID, IncidentType, IncidentDate, Location, Description, Status) 
VALUES 
    (1, 'Robbery', '2023-09-15', '123 Main St, Cityville', 'Armed robbery at a convenience store', 'Open'), 
    (2, 'Homicide', '2023-09-20', '456 Elm St, Townsville', 'Investigation into a murder case', 'Under Investigation'), 
    (3, 'Theft', '2023-09-10', '789 Oak St, Villagetown', 'Shoplifting incident at a mall', 'Closed'); 
 
-- Insert Data into Victim Table
INSERT INTO Victim (VictimID, CrimeID, Name, ContactInfo, Injuries) 
VALUES 
    (1, 1, 'John Doe', 'johndoe@example.com', 'Minor injuries'), 
    (2, 2, 'Jane Smith', 'janesmith@example.com', 'Deceased'), 
    (3, 3, 'Alice Johnson', 'alicejohnson@example.com', 'None'); 

-- Insert Data into Suspect Table
INSERT INTO Suspect (SuspectID, CrimeID, Name, Description, CriminalHistory) 
VALUES 
    (1, 1, 'Robber 1', 'Armed and masked robber', 'Previous robbery convictions'), 
    (2, 2, 'Unknown', 'Investigation ongoing', NULL), 
    (3, 3, 'Suspect 1', 'Shoplifting suspect', 'Prior shoplifting arrests'); 

-- Task 1: Select all open incidents
SELECT * FROM Crime WHERE Status = 'Open';

-- Task 2: Find the total number of incidents
SELECT COUNT(*) AS TotalIncidents FROM Crime;

-- Task 3: List all unique incident types
SELECT DISTINCT IncidentType FROM Crime;

-- Task 4: Retrieve incidents that occurred between specific dates
SELECT * FROM Crime WHERE IncidentDate BETWEEN '2023-09-01' AND '2023-09-10';

-- Task 5: List persons involved in incidents in descending order of age
ALTER TABLE Victim ADD Age INT;
ALTER TABLE Suspect ADD Age INT;

UPDATE Victim SET Age = 32 WHERE Name = 'John Doe';
UPDATE Victim SET Age = 29 WHERE Name = 'Jane Smith';
UPDATE Victim SET Age = 40 WHERE Name = 'Alice Johnson';

UPDATE Suspect SET Age = 35 WHERE Name = 'Robber 1';
UPDATE Suspect SET Age = 28 WHERE Name = 'Suspect 1';

SELECT Name, Age FROM (
    SELECT Name, Age FROM Victim WHERE Age IS NOT NULL
    UNION ALL
    SELECT Name, Age FROM Suspect WHERE Age IS NOT NULL
) AS People 
ORDER BY Age DESC;

-- Task 6: Find the average age of persons involved in incidents
SELECT AVG(Age) AS AverageAge FROM (
    SELECT Age FROM Victim
    UNION ALL
    SELECT Age FROM Suspect
) AS People;

-- Task 7: List incident types and their counts, only for open cases
SELECT IncidentType, COUNT(*) AS Count FROM Crime WHERE Status = 'Open' GROUP BY IncidentType;

-- Task 8: Find persons with names containing 'Doe'
SELECT Name FROM Victim WHERE Name LIKE '%Doe%'
UNION
SELECT Name FROM Suspect WHERE Name LIKE '%Doe%';

-- Task 9: Retrieve the names of persons involved in open and closed cases
SELECT V.Name, C.Status FROM Victim V JOIN Crime C ON V.CrimeID = C.CrimeID
UNION
SELECT S.Name, C.Status FROM Suspect S JOIN Crime C ON S.CrimeID = C.CrimeID;

-- Task 10: List incident types where there are persons aged 30 or 35 involved
SELECT DISTINCT C.IncidentType FROM Crime C
JOIN Victim V ON C.CrimeID = V.CrimeID WHERE V.Age IN (30, 35)
UNION
SELECT DISTINCT C.IncidentType FROM Crime C
JOIN Suspect S ON C.CrimeID = S.CrimeID WHERE S.Age IN (30, 35);

-- Task 11: Find persons involved in incidents of the same type as 'Robbery'
SELECT Name FROM Victim WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE IncidentType = 'Robbery')
UNION
SELECT Name FROM Suspect WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE IncidentType = 'Robbery');

-- Task 12: List incident types with more than one open case
SELECT IncidentType FROM Crime WHERE Status = 'Open' GROUP BY IncidentType HAVING COUNT(*) > 0;

-- Task 13: List all incidents with suspects whose names also appear as victims in other incidents
SELECT DISTINCT 
    C.CrimeID, 
    C.IncidentType, 
    C.IncidentDate, 
    C.Location, 
    CAST(C.Description AS VARCHAR(MAX)) AS Description, 
    C.Status
FROM Crime C
JOIN Suspect S ON C.CrimeID = S.CrimeID
WHERE S.Name IN (SELECT Name FROM Victim);

-- Task 14: Retrieve all incidents along with victim and suspect details
SELECT C.*, V.Name AS VictimName, S.Name AS SuspectName
FROM Crime C
LEFT JOIN Victim V ON C.CrimeID = V.CrimeID
LEFT JOIN Suspect S ON C.CrimeID = S.CrimeID;

-- Task 15: Find incidents where the suspect is older than any victim
SELECT C.* FROM Crime C
JOIN Suspect S ON C.CrimeID = S.CrimeID
WHERE S.Age > (SELECT MIN(Age) FROM Victim);

-- Task 16: Find suspects involved in multiple incidents
SELECT Name, COUNT(*) AS IncidentCount FROM Suspect GROUP BY Name HAVING COUNT(*) > 0;

-- Task 17: List incidents with no suspects involved
SELECT * FROM Crime WHERE CrimeID NOT IN (SELECT CrimeID FROM Suspect);

-- Task 18: List cases where at least one incident is 'Homicide' and all others are 'Robbery'
SELECT * FROM Crime WHERE IncidentType = 'Homicide'
AND NOT EXISTS (SELECT 1 FROM Crime WHERE IncidentType NOT IN ('Homicide', 'Robbery'));

-- Task 19: Retrieve all incidents and associated suspects, showing 'No Suspect' if none
SELECT C.*, COALESCE(S.Name, 'No Suspect') AS SuspectName FROM Crime C
LEFT JOIN Suspect S ON C.CrimeID = S.CrimeID;

-- Task 20: List all suspects involved in 'Robbery' or 'Assault'
SELECT * FROM Suspect WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE IncidentType IN ('Robbery', 'Assault'));
*/