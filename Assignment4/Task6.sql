USE AdventureWorks2022;

SELECT DISTINCT soh.CustomerID
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE sod.ProductID IN (
    SELECT ProductID
    FROM Production.Product
    WHERE ListPrice > 1000
);

-- customers who purchased products costing more than $1000
