USE AdventureWorks2022;

SELECT 
    p.FirstName + ' ' + p.LastName AS EmployeeName,
    e.BusinessEntityID,
    SUM(soh.TotalDue) AS TotalSales
FROM 
    Sales.SalesPerson AS sp
JOIN 
    HumanResources.Employee AS e ON sp.BusinessEntityID = e.BusinessEntityID
JOIN 
    Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
JOIN 
    Sales.SalesOrderHeader AS soh ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY 
    e.BusinessEntityID, p.FirstName, p.LastName
ORDER BY 
    TotalSales DESC;

-- show each sales employee’s name and the total sales they handled
