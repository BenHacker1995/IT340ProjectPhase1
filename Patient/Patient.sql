CREATE TABLE IF NOT EXISTS Patient (
	patientNo INT NOT NULL PRIMARY KEY,
    lastName VARCHAR(24),
    firstName VARCHAR(24),
    address VARCHAR(60),
    phone VARCHAR(20),
    dateOfBirth DATE,
    gender VARCHAR(10),
    maritalStatus VARCHAR(12),
    dateOfRegistration DATE
);

CREATE TABLE IF NOT EXISTS Appointment (
	apptNo INT NOT NULL PRIMARY KEY,
    patientNo INT NOT NULL,
    staffNo INT NOT NULL,
    apptDateTime DATETIME,
    examRoom INT,
    outIn VARCHAR(3),
    CONSTRAINT FOREIGN KEY (patientNo) REFERENCES Patient,
    CONSTRAINT FOREIGN KEY (staffNo) REFERENCES Staff
);

CREATE TABLE IF NOT EXISTS NextOfKin (
	patientNo INT NOT NULL PRIMARY KEY,
    lastName VARCHAR(24),
    firstName VARCHAR(24),
    relationship VARCHAR(16),
    address VARCHAR(60),
    phone VARCHAR(20),
    CONSTRAINT FOREIGN KEY (patientNo) REFERENCES Patient
);

CREATE TABLE IF NOT EXISTS LocalDoctor (
	ClinicID SMALLINT,
    ClinicName VARCHAR(128),
    DoctorID SMALLINT,
    DoctorLastName VARCHAR(64),
    DoctorFirstName VARCHAR(64),
    PRIMARY KEY (DoctorID)
);

CREATE TABLE IF NOT EXISTS Outpatient (
	patientNo INT NOT NULL PRIMARY KEY,
    dateTimeOut DATETIME NOT NULL PRIMARY KEY,
    CONSTRAINT FOREIGN KEY (patientNo) REFERENCES Patient
);

CREATE TABLE IF NOT EXISTS Inpatient (
	patientNo INT NOT NULL,
    datePlacedList DATE,
    wardNo INT NOT NULL,
    expectedDuration INT,
    datePlacedWard DATE PRIMARY KEY,
    expectedLeaveDate DATE,
    actualDateLeft DATE,
    bedNo INT PRIMARY KEY,
    CONSTRAINT FOREIGN KEY (patientNo) REFERENCES Patient
);
