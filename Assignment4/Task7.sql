USE AdventureWorks2022;

SELECT p.ProductSubcategoryID, p.Name, p.ListPrice
FROM Production.Product p
WHERE ListPrice = (
    SELECT MAX(ListPrice)
    FROM Production.Product
    WHERE ProductSubcategoryID = p.ProductSubcategoryID
)
AND p.ProductSubcategoryID IS NOT NULL;

-- most expensive product in each subcategory