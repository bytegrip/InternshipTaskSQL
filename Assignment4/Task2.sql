USE AdventureWorks2022;

SELECT 
    c.CustomerID, 
    COUNT(soh.SalesOrderID) AS OrderCount
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.Customer c 
    ON soh.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID
HAVING 
    COUNT(soh.SalesOrderID) > (
        SELECT 
            AVG(OrderCount) 
        FROM (
            SELECT 
                COUNT(*) AS OrderCount
            FROM 
                Sales.SalesOrderHeader
            GROUP BY 
                CustomerID
        ) AS CustomerOrders
    );

-- customers who placed more orders than the average number of orders per customer
