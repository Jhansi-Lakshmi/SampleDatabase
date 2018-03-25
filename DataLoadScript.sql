-- Data loading script
-- Companies
insert into Companies(Name,[Description]) values('Facebook','Social media and social networking service company')
insert into Companies(Name,[Description]) values('Google','Technology company that specializes in Internet-related services and products')
insert into Companies(Name,[Description]) values('J-Company','My own sweet start up')

-- Addresses 
-- Facebook
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('1 Hacker Way',NULL,'Menlopark', 'CA', '94025')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('335 Madison Ave',NULL,'New York', 'NY', '10017')
-- Google
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('1600 Amphitheatre Pkwy',NULL,'Mountain View', 'CA', '94043')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('355 Main St',NULL,'Cambridge', 'MA', '02142')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('111 8th Ave',NULL,'New York', 'NY', '10011')

-- Employee Addresses
-- Facebook employees at Location-1
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('1237 John F Kennedy Dr',NULL,'San Francisco', 'CA', '94121')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('2442 Castro St',NULL,'San Francisco', 'CA', '94131') 
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('5000 Pacific Coast Hwy',NULL,'Pacifica', 'CA', '94044') 

-- Facebook employees at Location-2
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('234 W 42nd St',NULL,'New York', 'NY', '10036')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('60 Furman St',NULL,'Brooklyn', 'NY', '11201') 

-- Google employees at Location-1
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('840 E El Camino Real',NULL,'Mountain View', 'CA', '94040')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('75 Headquarters Dr',NULL,'San Jose', 'CA', '95110') 

-- Google employees at Location-2
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('419 Boston Ave',NULL,'Medford', 'MA', '02155')
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('29 Everett St',NULL,'Cambridge', 'MA', '02138') 

-- Google employees at Location-3
insert into Addresses(AddressOne,AddressTwo,City,[State],Zip) values('60-30 Maurice Ave',NULL,'Maspeth', 'NY', '11378')

-- Locations
insert into Locations(Name,[Description],CompanyId,AddressId,HeadQuarter) values('Main Campus','Main Campus and Headquarters',1,1,1)
insert into Locations(Name,[Description],CompanyId,AddressId,HeadQuarter) values('NYC Campus','Techology and Development Centre',1,2,0)
insert into Locations(Name,[Description],CompanyId,AddressId,HeadQuarter) values('Main Campus','Main Campus and Headquarters',2,3,1)
insert into Locations(Name,[Description],CompanyId,AddressId,HeadQuarter) values('Boston Campus','Techology and Development Centre',2,4,0)
insert into Locations(Name,[Description],CompanyId,AddressId,HeadQuarter) values('NYC Campus','Techology and Development Centre',2,5,0)

-- Employees
-- Facebook Employees
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Cleo','Montague',NULL,'01-01-1965','M',6)
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Deshawn','Helbert',NULL,'01-01-1975','M',7)
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Jodee','Tsuji','K','01-01-1985','F',8)

insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Norbert','Sweeting','G','01-01-1995','M',9)
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Mindi','Trundy',NULL,'01-01-997','F',10)

-- Google Employees
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Micheline','Motton',NULL,'01-01-1960','F',11)
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Kyoko','Blankinship',NULL,'01-01-1970','F',12)

insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Fredrick','Broadfoot','A','01-01-1980','M',13)
insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Alec','Goodnight',NULL,'01-01-1990','M',14)

insert into Employees(FirstName,LastName,MiddleName,BirthDate,Gender,AddressId) values('Samuel','Sheahan',NULL,'01-01-1999','M',15)

-- Medical Plans
insert into MedicalPlans([Type],[Description],DisabledOn) values('Medical','Sample Medical Plan',NULL)
insert into MedicalPlans([Type],[Description],DisabledOn) values('Dental','Sample Dental Plan',NULL)
insert into MedicalPlans([Type],[Description],DisabledOn) values('Vision','Sample Vision Plan',NULL)
insert into MedicalPlans([Type],[Description],DisabledOn) values('Medical','Old Medical Plan',getdate())

-- Employment
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(1,1,'01-01-2000',NULL)
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(1,2,'01-01-2002',NULL)
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(1,3,'01-01-2004',NULL)

insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(2,4,'01-01-2010',NULL)
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(2,5,'01-01-2018',NULL)

insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(3,6,'01-01-2003',NULL)
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(3,7,'01-01-2005',NULL)
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(4,8,'01-01-2007','01-01-2017')
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(4,9,'01-01-2015',NULL)
insert into Employment(LocationId,EmployeeId,StartDate,EndDate) Values(5,10,'01-01-2017',NULL)

-- Enrollment
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(1,1,'01-01-2000',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(1,2,'01-01-2000',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(1,3,'01-01-2000',NULL)

insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(2,1,'01-01-2002',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(2,2,'01-01-2002',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(2,3,'01-01-2002',NULL)

insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(3,1,'01-01-2004',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(3,2,'01-01-2004',NULL)

insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(4,1,'04-01-2010',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(4,3,'04-01-2010',NULL)

insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(5,1,'01-01-2018',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(5,2,'01-01-2018',NULL)
insert into Enrollment(EmployeeId,MedicalPlanId,StartDate,EndDate) Values(5,3,'01-01-2018',NULL)






