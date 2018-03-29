-- WARNING:  This script drops all the tables, prior to schema creation

-- Step 1 - Dropping tables if they already exist, prior to creation
DROP TABLE IF EXISTS Enrollment
DROP TABLE IF EXISTS Employment
DROP TABLE IF EXISTS Employees
DROP TABLE IF EXISTS InsurancePlans
DROP TABLE IF EXISTS Locations
DROP TABLE IF EXISTS Companies
DROP TABLE IF EXISTS Addresses

-- Step 2 - Creation script for all tables required for sample schema
-- ADDRESSES - The Addresses table contains all addresses in the system. Id is an identity column.
-- Any address used across the system is saved here and referred back to Parent or Main Resource. 
-- Example: Location addressess, Employee addressess etc)
CREATE TABLE Addresses (
    Id int IDENTITY(1,1) PRIMARY KEY,
	[AddressOne] nvarchar(1024) NOT NULL,
	[AddressTwo] nvarchar(1024)  NULL,
	[City] nvarchar(255)  NOT NULL,
	[State] nvarchar(2) NOT NULL,
	[Zip] nvarchar(5) NOT NULL
);

-- COMPANIES - The Companies table contains all companies in the system. Id is an identity column.
CREATE TABLE Companies (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(255) NOT NULL,
	[Description] nvarchar(1024) NULL
);

-- LOCATIONS -The Locations table contains locations for any company in the system. Id is an identity column.
CREATE TABLE Locations (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(255) NOT NULL,
	[Description] nvarchar(1024) NULL,
	CompanyID int NOT NULL,				-- Refers back to the company that owns this location 
	AddressId int NOT NULL,				-- Refers back to the address for this location 
    HeadQuarter bit NOT NULL,			-- Used to identify if the location is head quarters
    FOREIGN KEY (CompanyID) REFERENCES Companies(Id),
	FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- EMPLOYEES - The Employee table contains all employees in the system. Id is an identity column
CREATE TABLE Employees (
    Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(255) NOT NULL,
    LastName nvarchar(255) NOT NULL,
	MiddleName nvarchar(255)  NULL,
    BirthDate nvarchar(255),
    Gender nvarchar(1) NOT NULL,
	AddressId int NOT NULL,				-- Refers back to the home address record for the employee
	FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- InsurancePlans - The InsurancePlans table contains all insurance plan details. Id is an identity column
CREATE TABLE InsurancePlans (
    Id int IDENTITY(1,1) PRIMARY KEY,
	[Type] nvarchar(255) NOT NULL,		-- Used to track type of plan Medical, Dental, Vision etc
    [Description] nvarchar(1024) NULL,
	DisabledOn datetime NULL			-- When the plan is disabled, NULL or EMPTY means the plan is active
);

-- EMPLOYMENT - Used to store employment information,i.e, where a particular employee works at. Id is an identity column
-- The Employment table is a mapping between the Location table and the Employee table
-- LocationId and EmployeeID are foreign keys that refer back to the Locations and Employee tables
-- A record in this table signifies that a given employee works for or has in the past worked for a given company
CREATE TABLE Employment (
    Id int IDENTITY(1,1) PRIMARY KEY,
	LocationId int NOT NULL,
	EmployeeId int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NULL,				-- Date When employment ended, NULL or EMPTY means currently working
	FOREIGN KEY (LocationId) REFERENCES Locations(Id),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

-- ENROLLMENT - Used to store enrollment information, i.e, what employees are enrolled in which insurance plans. Id is an identity column
-- The Enrollment table is a mapping between the Employee table and the Plan table.
-- EmployeeID and MedicalPlanId are foreign keys that refer back to the Employee and MedicalPlan tables respectively
-- A record in this table signifies that a given employee has enrolled in a given plan
CREATE TABLE Enrollment (
    Id int IDENTITY(1,1) PRIMARY KEY,
	EmployeeId int NOT NULL,
	InsurancePlanId int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime  NULL,				-- Date When insurance plan ended, NULL or EMPTY means currently enrolled in the plan
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	FOREIGN KEY (InsurancePlanId) REFERENCES InsurancePlans(Id)
);




