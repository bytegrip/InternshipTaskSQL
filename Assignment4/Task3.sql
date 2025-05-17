USE AdventureWorks2022;

SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > ALL (
    SELECT ListPrice
    FROM Production.Product p
    JOIN Production.ProductSubcategory sc ON p.ProductSubcategoryID = sc.ProductSubcategoryID
    JOIN Production.ProductCategory c ON sc.ProductCategoryID = c.ProductCategoryID
    WHERE c.Name = 'Components'
);

-- products more expensive than all components