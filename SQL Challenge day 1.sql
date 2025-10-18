-- Create Database ---
CREATE DATABASE CityHospital;
USE CityHospital;

-- Create Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    AdmissionDate DATE
);

-- ALTER – Add Column
ALTER TABLE Patients
ADD DoctorAssigned VARCHAR(50);

-- ALTER – Modify Column
ALTER TABLE Patients
MODIFY COLUMN PatientName VARCHAR(100);

-- RENAME Table
RENAME TABLE Patients TO Patient_Info;

-- TRUNCATE vs DROP
TRUNCATE TABLE Patient_Info;
DROP TABLE Patient_Info;
