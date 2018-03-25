-- 1 - List of company names along with their location name and addresses  (Do Not display ones with out any locations)
Select C.Name CompanyName,L.Name LocationName, A.AddressOne + A.AddressTwo + ',' + A.City + ', ' + A.State + ', ' + A.Zip LocationAddress
From Companies C
inner Join Locations L on C.Id=L.CompanyId
inner Join Addresses A on L.AddressId=A.Id
Order By C.Name,L.Name

-- 2 - List of Company Names along with their location name and employee count   (Irrespective of whether a company has any employees yet or not)
Select C.Name CompanyName,L.Name LocationName,COUNT(E.Id) NumberOfEmployees
From Companies C
Left Join Locations L on C.Id=L.CompanyId
Left Join Employment E on L.Id=E.LocationId
Group By  C.Name,L.Name
Order By C.Name,L.Name

-- 3 - List Company Names along with their location name and ACTIVE employee count 
Select C.Name CompanyName,L.Name LocationName,COUNT(E.Id) NumberOfEmployees
From Companies C
Left Join Locations L on C.Id=L.CompanyId
Left Join Employment E on L.Id=E.LocationId
WHERE getdate() BETWEEN E.StartDate AND COALESCE(E.EndDate, getDate()+1)
Group By  C.Name,L.Name
Order By C.Name,L.Name

-- 4 - Lists all employees that are enrolled in a ACTIVE Medical plan and are 21 years or older
select E.FirstName + ' ' + E.LastName FullName,datediff(year,E.BirthDate,getdate()) Age
From Enrollment ER
inner join MedicalPlans MP on ER.MedicalPlanId=MP.Id
inner join Employees E on ER.EmployeeId=E.Id
WHERE MP.[Type]='Medical' 
and MP.DisabledOn IS NULL 
and DATEADD(YEAR, 21, E.Birthdate) <= getdate()

-- 5 - Lists all employees and their medical plans
select E.FirstName + ' ' + E.LastName FullName,MP.[Type]
From Enrollment ER
inner join MedicalPlans MP on ER.MedicalPlanId=MP.Id
inner join Employees E on ER.EmployeeId=E.Id
Order by E.FirstName + ' ' + E.LastName

-- 6 - List employees that have all 3 insurance (Medical, Dental and Vision)
WITH EmployeesWithMedical As
(Select EmployeeId from Enrollment Where MedicalPlanId in (select Id from MedicalPlans Where [Type]='Medical' and DisabledOn IS NULL))
, EmployeesWithDental As
(Select EmployeeId from Enrollment Where MedicalPlanId in (select Id from MedicalPlans Where [Type]='Dental' and DisabledOn IS NULL))
, EmployeesWithVision As
(Select EmployeeId from Enrollment Where MedicalPlanId in (select Id from MedicalPlans Where [Type]='Vision' and DisabledOn IS NULL))

Select * from 
Employees E
Inner join EmployeesWithMedical EM on E.Id=EM.EmployeeId
Inner join EmployeesWithDental ED on E.Id=ED.EmployeeId
Inner join EmployeesWithVision EV on E.Id=EV.EmployeeId

-- 7 - List  age of oldest employee in each company across all campuses/locations
Select
C.Name CompanyName,datediff(year,Min(BirthDate),getdate()) Age
From Companies C
left join Locations L on C.Id=L.CompanyId
left join Employment EM on L.Id=EM.LocationId
left join Employees E on EM.EmployeeId=E.Id
Group By C.Name
Order By C.Name
