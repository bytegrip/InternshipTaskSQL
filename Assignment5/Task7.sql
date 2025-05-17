USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Sales.Customer
    SET TerritoryID = 2
    WHERE CustomerID = 11000;

    UPDATE Sales.Store
    SET Name = 'Downtown Store'
    WHERE BusinessEntityID = 550;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error updating customer info: ' + ERROR_MESSAGE();
END CATCH;


-- update a customer's territory and store info