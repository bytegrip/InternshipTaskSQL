USE AdventureWorks2022;

SELECT
    SalesOrderID,
    SUM(UnitPrice * OrderQty) AS TotalCost
FROM
    Sales.SalesOrderDetail
GROUP BY
    SalesOrderID
HAVING
    SUM(UnitPrice * OrderQty) > 100000;
