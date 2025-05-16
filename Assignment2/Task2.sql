USE AdventureWorks2022;

SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName,
	pp.PhoneNumber
FROM
	Person.PersonPhone AS pp
JOIN
	Person.Person AS p ON pp.BusinessEntityID = p.BusinessEntityID
WHERE
	p.LastName LIKE 'L%'
ORDER BY
	p.LastName ASC,
	p.FirstName DESC