-- Creation scripts for all tables required for sample schema

-- ADDRESSES - Used to store all address related information
CREATE TABLE Addresses (
    Id int IDENTITY(1,1) PRIMARY KEY,
	[AddressOne] nvarchar(255) NOT NULL,
	[AddressTwo] nvarchar(255)  NULL,
	[City] nvarchar(255)  NOT NULL,
	[State] nvarchar(2) NOT NULL,
	[Zip] nvarchar(5) NOT NULL
);

-- COMPANIES - Used to store Company related information
-- The Company table contains all companies in the system. Id is an identity column.
CREATE TABLE Companies (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(255) NOT NULL,
	[Description] nvarchar(1024) NULL
);

-- LOCATIONS - Used to store Company location information
CREATE TABLE Locations (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(255) NOT NULL,
	[Description] nvarchar(1024) NULL,
	CompanyID int NOT NULL, -- Refers back to the company that owns this location 
	AddressId int NOT NULL, -- Refers back to the address for this location 
    HeadQuarter bit NOT NULL,  -- Used to identify head quarters
    FOREIGN KEY (CompanyID) REFERENCES Companies(Id),
	FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- EMPLOYEES - Used to store employee related information
-- The Employee table contains all employees in the system. Id is an Identity column.
-- You can assume that a given employee will be listed in this table only once. AddressId is asumed to be the home address of the employee
CREATE TABLE Employees (
    Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(255) NOT NULL,
    LastName nvarchar(255) NOT NULL,
	MiddleName nvarchar(255)  NULL,
    BirthDate nvarchar(255),
    Gender nvarchar(1) NOT NULL,
	AddressId int NOT NULL
);

-- MEDICALPLANS - Used to store medical plan related information
CREATE TABLE MedicalPlans (
    Id int IDENTITY(1,1) PRIMARY KEY,
	[Type] nvarchar(255) NOT NULL,	-- Used to track type of plan Medical, Dental, Vision etc
    [Description] nvarchar(1024) NULL,
	DisabledOn datetime NULL   -- Used to track when the plan is disabled, if NULL means the plan is currently active
);

-- EMPLOYMENT - Used to store enrollment related information, meaning what employees are enrolled in what medical plans
-- The Employment table is a mapping between the Location table and the Employee table.
-- Id is an identity column. LocationId and EmployeeID are foreign keys to the Locations and Employee tables respectively. 
-- A record in this table signifies that a given employee works for or has in the past worked for a given company. 
CREATE TABLE Employment (
    Id int IDENTITY(1,1) PRIMARY KEY,
	LocationId int NOT NULL,
	EmployeeId int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NULL,
	FOREIGN KEY (LocationId) REFERENCES Locations(Id),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

-- ENROLLMENT - Used to store enrollment related information, meaning what employees are enrolled in what medical plans
-- The Enrollment table is a mapping between the Employee table and the Plan table.
-- Id is an identity column. EmployeeID and MedicalPlanId are foreign keys to the Employee and MedicalPlan tables respectively. 
-- A record in this table signifies that a given employee has enrolled in a given plan. 
CREATE TABLE Enrollment (
    Id int IDENTITY(1,1) PRIMARY KEY,
	EmployeeId int NOT NULL,
	MedicalPlanId int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime  NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	FOREIGN KEY (MedicalPlanId) REFERENCES MedicalPlans(Id)
);
