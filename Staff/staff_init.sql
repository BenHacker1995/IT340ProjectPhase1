/*
* @Author: Kai Gray
* 
* Initialize Staff tables 
*/

USE HOSPITAL;
	
CREATE TABLE IF NOT EXISTS Ward (
	WardID SMALLINT PRIMARY KEY,
	WardName VARCHAR(64),
    Location VARCHAR(64),
    Phone VARCHAR(20),
    TotalBeds SMALLINT
);

CREATE TABLE IF NOT EXISTS Staff (
	StaffID SMALLINT NOT NULL,
    StaffLastName VARCHAR(64) NOT NULL,
    StaffFirstName VARCHAR(64) NOT NULL,
    Phone VARCHAR(20),
    DOB DATE,
    Gender CHAR,
    WardID SMALLINT,
    JobTitle VARCHAR(128),
    PRIMARY KEY (StaffID),
    FOREIGN KEY (WardID) REFERENCES Ward(WardID)
);

CREATE TABLE IF NOT EXISTS StaffCert (
	StaffID SMALLINT,
    Cert VARCHAR(64),
    Completed DATE,
    PRIMARY KEY (StaffID, Completed),
    FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE IF NOT EXISTS StaffExperience (
	StaffID SMALLINT,
    Company VARCHAR(64),
    JobTitle VARCHAR(64),
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY(StaffID, EndDate),
    FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE IF NOT EXISTS StaffPay (
	StaffID SMALLINT,
    JobTitle VARCHAR(128),
    ContractType VARCHAR(64),
    SalaryType VARCHAR(64),
    SalaryScale DECIMAL(8,2),
    CurrentSalary DECIMAL(8,2),
    PRIMARY KEY (StaffID,JobTitle),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)    
);
/*
* Not sure if this goes here. *Figure out later*
CREATE TABLE IF NOT EXISTS LocalDoctors (
	ClinicID SMALLINT,
    ClinicName VARCAR(128),
    DoctorID SMALLINT,
    DoctorLastName VARCHAR(64),
    DoctorFirstName VARCHAR(64),
    PRIMARY KEY (DoctorID)
);
*/
