USE AdventureWorks2022;

SELECT TOP 10
    soh.CustomerID,
    COUNT(soh.SalesOrderID) AS OrderCount,
    SUM(soh.SubTotal) AS TotalSpent
FROM 
    Sales.SalesOrderHeader AS soh
GROUP BY 
    soh.CustomerID
ORDER BY 
    TotalSpent DESC

-- list the top 10 customers by total order subtotal, along with the number of orders