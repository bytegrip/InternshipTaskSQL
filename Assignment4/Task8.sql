USE AdventureWorks2022;

SELECT 
    e.BusinessEntityID, 
    p.FirstName, 
    p.LastName, 
    e.HireDate
FROM 
    HumanResources.Employee e
JOIN 
    Person.Person p 
    ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.HireDate < (
    SELECT 
        MAX(HireDate)
    FROM 
        HumanResources.Employee
);

-- employees hired before the latest hire date
