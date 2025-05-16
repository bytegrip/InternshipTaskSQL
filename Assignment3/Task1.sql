USE AdventureWorks2022;

SELECT 
	st.TerritoryID,
	SUM(soh.TotalDue) AS Total
FROM
	Sales.SalesOrderHeader AS soh
JOIN 
	Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
GROUP BY
	st.TerritoryID
ORDER BY 
	Total DESC

-- total sales amount for each sales territory, sorted by the highest total