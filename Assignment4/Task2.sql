USE AdventureWorks2022;

SELECT 
	sc.CustomerID,
	AVG(ssoh.SubTotal),
	COUNT(ssoh.SalesOrderID)
FROM
	Sales.Customer AS sc
JOIN 
	Sales.SalesOrderHeader AS ssoh ON sc.CustomerID = ssoh.CustomerID
GROUP BY
	sc.CustomerID

-- for each customer, find the average SubTotal of their orders and how many orders they’ve made
