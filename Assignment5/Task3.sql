USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Production.Product
    SET ListPrice = 120.00
    WHERE ProductID = 707;

    INSERT INTO Production.ProductListPriceHistory (ProductID, StartDate, ListPrice)
    VALUES (707, GETDATE(), 120.00);

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error updating product price: ' + ERROR_MESSAGE();
END CATCH;

-- update product price and log it