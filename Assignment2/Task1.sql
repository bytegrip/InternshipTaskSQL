USE AdventureWorks2022;

SELECT
	Person.FirstName,
	Person.LastName,
	Person.BusinessEntityID AS Employee_ID
FROM
	Person.Person
ORDER BY
	Person.LastName ASC