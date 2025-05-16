USE AdventureWorks2022;

SELECT 
    ROW_NUMBER() OVER (
        PARTITION BY pa.PostalCode 
        ORDER BY ssp.SalesYTD DESC
    ) AS RowNum,
    pp.LastName,
    ssp.SalesYTD,
    pa.PostalCode
FROM
    Sales.SalesPerson AS ssp
JOIN 
    Person.Person AS pp ON ssp.BusinessEntityID = pp.BusinessEntityID
JOIN 
    Person.BusinessEntityAddress AS pbea ON ssp.BusinessEntityID = pbea.BusinessEntityID
JOIN 
    Person.Address AS pa ON pbea.AddressID = pa.AddressID
WHERE 
    ssp.TerritoryID IS NOT NULL
    AND ssp.SalesYTD <> 0
ORDER BY 
    pa.PostalCode ASC,
    RowNum;