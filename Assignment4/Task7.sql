USE AdventureWorks2022;

SELECT 
    pc.Name AS Category,
    psc.Name AS Subcategory,
    AVG(p.ListPrice) AS AvgListPrice
FROM 
    Production.Product AS p
JOIN 
    Production.ProductSubcategory AS psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN 
    Production.ProductCategory AS pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY 
    pc.Name, psc.Name
ORDER BY 
    pc.Name, psc.Name;

-- find the average list price for each product category and subcategory