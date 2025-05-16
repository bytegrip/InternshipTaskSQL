USE AdventureWorks2022;

SELECT 
    FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth,
    COUNT(SalesOrderID) AS OrderCount,
    SUM(SubTotal) AS TotalSales
FROM 
    Sales.SalesOrderHeader
WHERE 
    YEAR(OrderDate) = 2013
GROUP BY 
    FORMAT(OrderDate, 'yyyy-MM')
ORDER BY 
    OrderMonth;

-- show total sales and number of orders per month in 2013