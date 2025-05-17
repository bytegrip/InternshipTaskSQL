USE AdventureWorks2022;

SELECT ProductID, Name
FROM Production.Product
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM Sales.SalesOrderDetail
);

-- products that were never sold