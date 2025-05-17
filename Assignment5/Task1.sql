USE AdventureWorks2022;

BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @NewBusinessEntityID INT;

    INSERT INTO Person.BusinessEntity DEFAULT VALUES;
    SET @NewBusinessEntityID = SCOPE_IDENTITY();

    INSERT INTO Person.Person (
        BusinessEntityID, PersonType, NameStyle, FirstName, LastName
    )
    VALUES (
        @NewBusinessEntityID, 'EM', 0, 'John', 'Morrison'
    );

    INSERT INTO HumanResources.Employee (
        BusinessEntityID, NationalIDNumber, LoginID, JobTitle,
        BirthDate, MaritalStatus, Gender, HireDate
    )
    VALUES (
        @NewBusinessEntityID, '999999999', 'adventure-works\jmorrison',
        'Technician', '1990-01-01', 'S', 'M', GETDATE()
    );

    INSERT INTO HumanResources.EmployeeDepartmentHistory (
        BusinessEntityID, DepartmentID, ShiftID, StartDate
    )
    VALUES (
        @NewBusinessEntityID, 1, 1, GETDATE()
    );

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- add new employee