USE AdventureWorks2022;

SELECT 
    e.BusinessEntityID, 
    p.FirstName, 
    p.LastName
FROM 
    HumanResources.EmployeePayHistory eph
JOIN 
    HumanResources.Employee e 
    ON eph.BusinessEntityID = e.BusinessEntityID
JOIN 
    Person.Person p 
    ON e.BusinessEntityID = p.BusinessEntityID
WHERE eph.Rate > (
    SELECT AVG(Rate) 
    FROM HumanResources.EmployeePayHistory
);

-- employees who earn more than the average salary
