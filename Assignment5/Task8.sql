USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Person.PersonPhone
    SET PhoneNumber = '555-123-4567'
    WHERE BusinessEntityID = 301 AND PhoneNumberTypeID = 3;

    UPDATE HumanResources.Employee
    SET JobTitle = 'Senior Sales Representative'
    WHERE BusinessEntityID = 290;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error updating employee info: ' + ERROR_MESSAGE();
END CATCH;


-- update employee phone number and job title