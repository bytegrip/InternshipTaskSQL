USE AdventureWorks2022;

SELECT 
    pp.ProductID,
    pp.Name
FROM 
    Production.Product AS pp
LEFT JOIN 
    Sales.SalesOrderDetail AS ssod ON pp.ProductID = ssod.ProductID
GROUP BY 
    pp.ProductID, pp.Name
HAVING 
    COUNT(ssod.SalesOrderID) = 0;

-- list all products that have never been sold

