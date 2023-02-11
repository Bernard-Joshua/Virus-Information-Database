CREATE DATABASE Virus_Information;

-- NOTE: After creating the database you have to select it before executing the following statements.

CREATE TABLE Virus (
VirusID INT(5) NOT NULL,
VirusName VARCHAR(40) NOT NULL,
Year_Discovered INT(4) NOT NULL,
First_Origin VARCHAR(40) DEFAULT "Not Available",

PRIMARY KEY(VirusID)
);


CREATE TABLE Gene (
GeneID INT(7) NOT NULL,
GeneType VARCHAR(11) NOT NULL,
GeneLength_nt INT(11) NOT NULL,

PRIMARY KEY(GeneID)
);


CREATE TABLE Variant (
VariantID INT(7) NOT NULL,
VariantName VARCHAR(25) NOT NULL,
VirusID INT(5) NOT NULL,
GeneID INT(7) NOT NULL,
Status VARCHAR(10) NOT NULL,
Origin VARCHAR(40) NOT NULL,

PRIMARY KEY(VariantID),
CHECK(Status in ('Active', 'Not-Active')),
FOREIGN KEY (VirusID) REFERENCES virus(VirusID),
FOREIGN KEY (GeneID) REFERENCES gene(GeneID)
);

CREATE TABLE Host (
HostID INT(5) NOT NULL,
Host_Name VARCHAR(15) NOT NULL,
Host_Type VARCHAR(15) NOT NULL,

PRIMARY KEY(HostID)
);


CREATE TABLE Variant_Host (
VariantID INT(7) NOT NULL,
HostID INT(5) NOT NULL,


PRIMARY KEY(VariantID, HostID),
FOREIGN KEY(VariantID) REFERENCES Variant(VariantID),
FOREIGN KEY(HostID) REFERENCES Host(HostID)
);


CREATE TABLE Locations (
LocationID INT(3) NOT NULL,
CountryName VARCHAR(30) NOT NULL,
Population INT(11) NOT NULL,

PRIMARY KEY(LocationID)
);


CREATE TABLE Variant_Location (
VariantID INT(7) NOT NULL,
LocationID INT(3) NOT NULL,
Climate VARCHAR(15) NOT NULL,

PRIMARY KEY(VariantID, LocationID),
FOREIGN KEY(VariantID) REFERENCES Variant(VariantID),
FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);



CREATE TABLE Transmission (
TransmissionID INT(6) NOT NULL,
TransmissionType VARCHAR(20) NOT NULL,

PRIMARY KEY(TransmissionID)
);


CREATE TABLE Transmission_Mode (
VariantID INT(7) NOT NULL,
TransmissionID INT(6) NOT NULL,
Risk VARCHAR(9) NOT NULL,

PRIMARY KEY(VariantID, TransmissionID),
FOREIGN KEY(VariantID) REFERENCES Variant(VariantID),
FOREIGN KEY(TransmissionID) REFERENCES Transmission(TransmissionID)
);


CREATE TABLE Vaccine (
VaccineID INT(6) NOT NULL,
VaccineName VARCHAR(15) NOT NULL,

PRIMARY KEY(VaccineID)
);

CREATE TABLE Varriant_Vaccine (
VariantID INT(7) NOT NULL,
VaccineID INT(6) NOT NULL,
Vaccine_Status VARCHAR(3) NOT NULL,

PRIMARY KEY(VariantID, VaccineID),
CHECK(Vaccine_Status in ('A', 'N-A', 'P')),
FOREIGN KEY(VariantID) REFERENCES Variant(VariantID),
FOREIGN KEY(VaccineID) REFERENCES Vaccine(VaccineID)
);


CREATE TABLE Researcher (
ResearcherID INT(7) NOT NULL,
ResearcherName VARCHAR(40) NOT NULL,
Instituition VARCHAR(40) NOT NULL,

PRIMARY KEY(ResearcherID)
);


CREATE TABLE Researchers (
VariantID INT(7) NOT NULL,
ResearcherID INT(7) NOT NULL,
Status_Of_Research VARCHAR(15) NOT NULL,

PRIMARY KEY(VariantID, ResearcherID),
FOREIGN KEY(VariantID) REFERENCES Variant(VariantID),
FOREIGN KEY(ResearcherID) REFERENCES Researcher(ResearcherID)
);
