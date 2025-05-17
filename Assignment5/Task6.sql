USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Person.Person
    SET LastName = 'Smith'
    WHERE BusinessEntityID = 1;

    UPDATE Person.EmailAddress
    SET EmailAddress = 'john.smith@adventure-works.com'
    WHERE BusinessEntityID = 1;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error updating person info: ' + ERROR_MESSAGE();
END CATCH;

-- change person's last name and email
