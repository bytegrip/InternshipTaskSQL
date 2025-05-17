USE AdventureWorks2022;

SELECT DISTINCT e.BusinessEntityID, p.FirstName, p.LastName
FROM HumanResources.EmployeeDepartmentHistory edh
JOIN HumanResources.Employee e ON edh.BusinessEntityID = e.BusinessEntityID
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
WHERE edh.DepartmentID = (
    SELECT TOP 1 edh2.DepartmentID
    FROM Person.Person p2
    JOIN HumanResources.Employee e2 ON p2.BusinessEntityID = e2.BusinessEntityID
    JOIN HumanResources.EmployeeDepartmentHistory edh2 ON e2.BusinessEntityID = edh2.BusinessEntityID
    WHERE p2.FirstName = 'David' AND p2.LastName = 'Bradley'
    ORDER BY edh2.StartDate DESC
);

-- employees in the same department as 'David Bradley'