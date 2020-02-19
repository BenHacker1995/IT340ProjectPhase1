/*
* @Author: Kai Gray
* 
* Initialize Staff tables 
*/


USE HOSPITAL;
	
CREATE TABLE IF NOT EXISTS Ward (
	WardID SMALLINT NOT NULL,
	WardName VARCHAR(64),
    TotalBeds SMALLINT,
    BedsInUse SMALLINT,
    PRIMARY KEY (WardID)
);

CREATE TABLE IF NOT EXISTS Staff (
	StaffID SMALLINT NOT NULL,
    StaffLastName VARCHAR(64) NOT NULL,
    StaffFirstName VARCHAR(64) NOT NULL,
    JobTitle VARCHAR(128),
    PRIMARY KEY (StaffID),
    FOREIGN KEY (WardID) REFERENCES Ward(WardID)
);

CREATE TABLE IF NOT EXISTS Jobs (
	JobID SMALLINT NOT NULL,
    JobName VARCHAR(128),
    Opennings SMALLINT,
    PRIMARY KEY (JobID)
);
CREATE TABLE IF NOT EXISTS Certifications (
	StaffID SMALLINT
    Cert VARCHAR(64),
    Completed DATE,
    PRIMARY KEY (StaffID, Completed),
    FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE IF NOT EXISTS EmploymentExperience (
	StaffID SMALLINT,	
    Job VARCHAR(64),
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY(StaffID, EndDate),
    FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
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
