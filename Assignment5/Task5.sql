USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Production.Product
    SET SellEndDate = GETDATE(), DiscontinuedDate = GETDATE()
    WHERE ProductID = 707;

    DELETE FROM Production.ProductProductPhoto
    WHERE ProductID = 707;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error deactivating product: ' + ERROR_MESSAGE();
END CATCH;


-- deactivate product