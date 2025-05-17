USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    DELETE FROM Sales.SalesOrderDetail
    WHERE SalesOrderID IN (
        SELECT SalesOrderID FROM Sales.SalesOrderHeader WHERE CustomerID = 180
    );

    DELETE FROM Sales.SalesOrderHeader
    WHERE CustomerID = 180;

    DELETE FROM Sales.Customer
    WHERE CustomerID = 180;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error deleting customer: ' + ERROR_MESSAGE();
END CATCH;


-- delete a customer and their orders