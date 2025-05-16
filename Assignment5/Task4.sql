USE AdventureWorks2022;

SELECT TOP 5
    pp.ProductID,
    pp.Name AS ProductName,
    SUM(ssod.OrderQty) AS TotalQuantitySold
FROM
    Production.Product AS pp
JOIN 
    Sales.SalesOrderDetail AS ssod ON pp.ProductID = ssod.ProductID
GROUP BY
    pp.ProductID, pp.Name
ORDER BY 
    TotalQuantitySold DESC;

-- list the top 5 most sold products by total quantity