USE AdventureWorks2022;

SELECT 
	pp.ProductID,
	pp.Name
FROM
	Production.Product AS pp
LEFT JOIN 
	Sales.SalesOrderDetail AS ssod ON pp.ProductID = ssod.ProductID
WHERE 
	ssod.ProductID IS NULL

-- list all products that have never been sold

