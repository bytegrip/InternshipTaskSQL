USE AdventureWorks2022;

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE HumanResources.Employee
    SET JobTitle = 'Sales Manager'
    WHERE BusinessEntityID = 300;

    INSERT INTO HumanResources.EmployeePayHistory (BusinessEntityID, RateChangeDate, Rate, PayFrequency)
    VALUES (300, GETDATE(), 40.00, 1);

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error promoting employee: ' + ERROR_MESSAGE();
END CATCH;

-- promote employee and update salary (it fails)
