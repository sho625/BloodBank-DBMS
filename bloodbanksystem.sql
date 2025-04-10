CREATE DATABASE BloodBankDB;
USE BloodBankDB;
CREATE TABLE Donor (
    DonorID INT PRIMARY KEY,
    Name VARCHAR(50),
    DateOfBirth DATE,
    BloodGroup VARCHAR(5),
    Diseases TEXT
);

CREATE TABLE DonationCamp (
    CampID INT PRIMARY KEY,
    Area VARCHAR(100),
    City VARCHAR(100),
    Date DATE
);

CREATE TABLE BloodBank (
    BloodBankName VARCHAR(100) PRIMARY KEY,
    NoOfBloodBags INT,
    Location VARCHAR(100)
);

CREATE TABLE BloodBag (
    BloodBagID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    Expiry DATE,
    Quantity INT,
    BloodBankName VARCHAR(100),
    FOREIGN KEY (BloodBankName) REFERENCES BloodBank(BloodBankName)
);

CREATE TABLE Patient (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Disease VARCHAR(100),
    BloodType VARCHAR(5)
);

CREATE TABLE BloodUsage (
    OperationID INT PRIMARY KEY,
    BloodBagID INT,
    PatientID INT,
    BloodType VARCHAR(5),
    FOREIGN KEY (BloodBagID) REFERENCES BloodBag(BloodBagID),
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);
CREATE TABLE Request (
    RequestID INT PRIMARY KEY,
    BloodBankName VARCHAR(100),
    BloodType VARCHAR(5),
    Quantity INT,
    FOREIGN KEY (BloodBankName) REFERENCES BloodBank(BloodBankName)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Email VARCHAR(100),
    Username VARCHAR(50),
    Password VARCHAR(100),
    Role VARCHAR(20)
);

CREATE TABLE Donation (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(50),
    BloodType VARCHAR(5),
    Quantity INT,
    DonationDate DATE,
    CampID INT,
    FOREIGN KEY (CampID) REFERENCES DonationCamp(CampID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    BloodBankName VARCHAR(100),
    BloodType VARCHAR(5),
    Quantity INT,
    FOREIGN KEY (BloodBankName) REFERENCES BloodBank(BloodBankName)
);

-- Donors
INSERT INTO Donor VALUES (1, 'Ayesha', '2003-05-15', 'A+', 'None');
INSERT INTO Donor VALUES (2, 'Ravi', '1990-09-12', 'O-', 'Diabetes');
INSERT INTO Donor VALUES
(3, 'Neha', '1988-04-22', 'B+', 'None'),
(4, 'Arjun', '1995-07-08', 'AB+', 'Asthma'),
(5, 'Zara', '2000-11-03', 'O+', 'Thalassemia'),
(6, 'Kabir', '1992-02-14', 'A-', 'None'),
(7, 'Rina', '1996-08-30', 'B-', 'Hypertension'),
(8, 'Samar', '1994-10-10', 'O+', 'None'),
(9, 'Megha', '2001-01-01', 'A+', 'None'),
(10, 'Ishan', '1987-06-06', 'AB-', 'Diabetes');

-- Donation Camps
INSERT INTO DonationCamp VALUES (101, 'Andheri', 'Mumbai', '2025-04-01');
INSERT INTO DonationCamp VALUES (102, 'Connaught Place', 'Delhi', '2025-04-05');
INSERT INTO DonationCamp VALUES
(103, 'Salt Lake', 'Kolkata', '2025-04-10'),
(104, 'Banjara Hills', 'Hyderabad', '2025-04-12'),
(105, 'Koramangala', 'Bangalore', '2025-04-15'),
(106, 'Nungambakkam', 'Chennai', '2025-04-18'),
(107, 'Civil Lines', 'Nagpur', '2025-04-21'),
(108, 'Camp Area', 'Pune', '2025-04-25'),
(109, 'Sector 17', 'Chandigarh', '2025-04-28'),
(110, 'Marine Drive', 'Mumbai', '2025-04-30');

-- Blood Banks
INSERT INTO BloodBank VALUES ('Red Cross Mumbai', 50, 'Mumbai');
INSERT INTO BloodBank VALUES ('Apollo Delhi', 35, 'Delhi');
INSERT INTO BloodBank VALUES
('Fortis Kolkata', 40, 'Kolkata'),
('Yashoda Hyderabad', 25, 'Hyderabad'),
('Manipal Bangalore', 30, 'Bangalore'),
('Apollo Chennai', 60, 'Chennai'),
('Wockhardt Nagpur', 20, 'Nagpur'),
('Jehangir Pune', 15, 'Pune'),
('PGI Chandigarh', 28, 'Chandigarh'),
('Nanavati Mumbai', 45, 'Mumbai');


-- Blood Bags
INSERT INTO BloodBag VALUES (201, 'A+', '2025-05-30', 1, 'Red Cross Mumbai');
INSERT INTO BloodBag VALUES (202, 'O-', '2025-06-15', 2, 'Apollo Delhi');
INSERT INTO BloodBag VALUES
(203, 'B+', '2025-05-25', 1, 'Fortis Kolkata'),
(204, 'AB+', '2025-06-30', 1, 'Yashoda Hyderabad'),
(205, 'O+', '2025-05-20', 2, 'Manipal Bangalore'),
(206, 'A-', '2025-07-05', 1, 'Apollo Chennai'),
(207, 'B-', '2025-06-10', 1, 'Wockhardt Nagpur'),
(208, 'O+', '2025-05-15', 1, 'Jehangir Pune'),
(209, 'A+', '2025-07-01', 1, 'PGI Chandigarh'),
(210, 'AB-', '2025-06-25', 1, 'Nanavati Mumbai');


-- Patients
INSERT INTO Patient VALUES (301, 'Meera', 'Anaemia', 'A+');
INSERT INTO Patient VALUES (302, 'John', 'Thalassemia', 'O-');
INSERT INTO Patient VALUES
(303, 'Rekha', 'Cancer', 'B+'),
(304, 'Rohan', 'Sickle Cell', 'AB+'),
(305, 'Sara', 'Anaemia', 'O+'),
(306, 'David', 'Leukemia', 'A-'),
(307, 'Fatima', 'Infection', 'B-'),
(308, 'Ajay', 'Surgery', 'O+'),
(309, 'Diya', 'Anaemia', 'A+'),
(310, 'Zayed', 'Bleeding disorder', 'AB-');

-- Blood Usage
INSERT INTO BloodUsage VALUES (401, 201, 301, 'A+');
INSERT INTO BloodUsage VALUES (402, 202, 302, 'O-');
INSERT INTO BloodUsage VALUES
(403, 203, 303, 'B+'),
(404, 204, 304, 'AB+'),
(405, 205, 305, 'O+'),
(406, 206, 306, 'A-'),
(407, 207, 307, 'B-'),
(408, 208, 308, 'O+'),
(409, 209, 309, 'A+'),
(410, 210, 310, 'AB-');


-- Request
INSERT INTO Request VALUES (501, 'Apollo Delhi', 'A+', 3);
INSERT INTO Request VALUES
(502, 'Red Cross Mumbai', 'O-', 2),
(503, 'Fortis Kolkata', 'B+', 1),
(504, 'Yashoda Hyderabad', 'AB+', 2),
(505, 'Manipal Bangalore', 'O+', 3),
(506, 'Apollo Chennai', 'A-', 1),
(507, 'Wockhardt Nagpur', 'B-', 2),
(508, 'Jehangir Pune', 'O+', 2),
(509, 'PGI Chandigarh', 'A+', 1),
(510, 'Nanavati Mumbai', 'AB-', 1);

INSERT INTO User (UserID, Email, Username, Password, Role) VALUES
(1, 'ayesha@mail.com', 'ayesha01', 'pass123', 'Donor'),
(2, 'admin@bloodbank.com', 'admin', 'adminpass', 'Admin'),
(3, 'hospital1@care.com', 'hospital_care', 'care123', 'HospitalStaff'),
(4, 'john@mail.com', 'john123', 'securepass', 'Donor'),
(5, 'meera@clinic.com', 'meeraC', 'meerapass', 'HospitalStaff'),
(6, 'neha@mail.com', 'neha88', 'nehapass', 'Donor'),
(7, 'zara@mail.com', 'zara11', 'zpass', 'Donor'),
(8, 'rohan@med.com', 'rohanmed', 'rpass', 'HospitalStaff'),
(9, 'diya@mail.com', 'diyaA', 'diya123', 'Donor'),
(10, 'admin2@bloodbank.com', 'admin2', 'admin456', 'Admin');

INSERT INTO Donation (DonationID, DonorName, BloodType, Quantity, DonationDate, CampID) VALUES
(1, 'Ayesha', 'A+', 1, '2025-04-01', 101),
(2, 'Ravi', 'O-', 2, '2025-04-05', 102),
(3, 'Neha', 'B+', 1, '2025-04-10', 103),
(4, 'Arjun', 'AB+', 1, '2025-04-12', 104),
(5, 'Zara', 'O+', 2, '2025-04-15', 105),
(6, 'Kabir', 'A-', 1, '2025-04-18', 106),
(7, 'Rina', 'B-', 1, '2025-04-21', 107),
(8, 'Samar', 'O+', 1, '2025-04-25', 108),
(9, 'Megha', 'A+', 1, '2025-04-28', 109),
(10, 'Ishan', 'AB-', 1, '2025-04-30', 110);

INSERT INTO Inventory (InventoryID, BloodBankName, BloodType, Quantity) VALUES
(1, 'Red Cross Mumbai', 'A+', 10),
(2, 'Apollo Delhi', 'O-', 5),
(3, 'Fortis Kolkata', 'B+', 7),
(4, 'Yashoda Hyderabad', 'AB+', 3),
(5, 'Manipal Bangalore', 'O+', 12),
(6, 'Apollo Chennai', 'A-', 4),
(7, 'Wockhardt Nagpur', 'B-', 2),
(8, 'Jehangir Pune', 'O+', 6),
(9, 'PGI Chandigarh', 'A+', 8),
(10, 'Nanavati Mumbai', 'AB-', 3);



SELECT * FROM Donor;
SELECT * FROM BloodBag WHERE Expiry > '2025-05-01';
SELECT * FROM Patient WHERE BloodType = 'A+';
SELECT P.Name, B.BloodBagID, B.BloodType
FROM Patient P
JOIN BloodUsage U ON P.ID = U.PatientID
JOIN BloodBag B ON U.BloodBagID = B.BloodBagID;

SELECT BloodBankName, COUNT(BloodBagID) AS TotalBags
FROM BloodBag
GROUP BY BloodBankName;

SELECT * FROM DonationCamp WHERE City = 'Mumbai';

SELECT BloodBankName FROM Request WHERE BloodType = 'A+';

SELECT COUNT(*) FROM Donor;

SELECT AVG(Quantity) FROM BloodBag;

SELECT MAX(Expiry) FROM BloodBag;


SELECT * FROM Donor
WHERE BloodGroup IN (SELECT BloodType FROM Patient);


SELECT P.Name
FROM Patient P
JOIN BloodUsage U ON P.ID = U.PatientID
JOIN BloodBag B ON U.BloodBagID = B.BloodBagID
WHERE B.BloodBankName = 'Apollo Delhi';



SELECT BloodBankName, COUNT(*) AS RequestCount
FROM Request
GROUP BY BloodBankName;


SELECT DISTINCT BloodBagID FROM BloodUsage;


UPDATE BloodBank
SET NoOfBloodBags = NoOfBloodBags + 5
WHERE BloodBankName = 'Red Cross Mumbai';


DELETE FROM BloodBag WHERE Expiry < CURDATE();


SELECT * FROM BloodBag WHERE Expiry IS NULL;



SELECT * FROM Donor WHERE YEAR(CURDATE()) - YEAR(DateOfBirth) > 30;



SELECT BloodType, COUNT(*) AS Count
FROM Request
GROUP BY BloodType
ORDER BY Count DESC
LIMIT 1;


SELECT * FROM BloodBank WHERE NoOfBloodBags > 40;


SELECT Email, Role FROM User WHERE Role = 'HospitalStaff';

SELECT * FROM Inventory
WHERE BloodType = 'AB+' AND Quantity < 5;


