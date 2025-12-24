-- ===============================================
-- Database: HospitalesDB
-- Complete Tables Setup with PatientProblem
-- ===============================================
use HospitalesDB;
-- 1) Admins Table
CREATE TABLE Admins (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL
);

-- 2) Doctors Table
CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100)
);

-- 3) Patients Table (with Problem column)
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Age INT,
    Gender VARCHAR(20),
    Phone VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    Problem VARCHAR(500) NULL  -- Patient ki problem / complaint
);

-- 4) Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status VARCHAR(50)
);

-- 5) Prescriptions Table
CREATE TABLE Prescriptions (
    PrescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    AppointmentID INT FOREIGN KEY REFERENCES Appointments(AppointmentID),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    Medicine VARCHAR(500),
    Notes VARCHAR(1000)
);

-- 6) Feedbacks Table
CREATE TABLE Feedbacks (
    FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    Message VARCHAR(1000),
    FeedbackDate DATETIME DEFAULT GETDATE()
);

-- 7) Files Table
CREATE TABLE Files (
    FileID INT IDENTITY(1,1) PRIMARY KEY,
    FileName VARCHAR(200),
    OwnerRole VARCHAR(50),
    OwnerUsername VARCHAR(100)
);

-- 8) Reports Table
CREATE TABLE Reports (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorName VARCHAR(150),
    ReportDate DATE,
    FilePath VARCHAR(300)
);

-- ===============================================
-- ✅ All tables created successfully
-- Including Patient Problem column
-- ===============================================
Use HospitalesDB;

SELECT PatientID, Name, DoctorID FROM Patients;
UPDATE Patients
SET DoctorID = 1
WHERE DoctorID = 0;

ALTER TABLE Patients
ADD Password VARCHAR(100);



