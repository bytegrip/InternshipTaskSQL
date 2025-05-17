-- CREATE DATABASE PrintbasePureSQL;

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL
);

CREATE TABLE SubCategories (
    SubCategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryID INT NOT NULL FOREIGN KEY REFERENCES Categories(CategoryID),
    SubCategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    SubCategoryID INT NOT NULL FOREIGN KEY REFERENCES SubCategories(SubCategoryID),
    ProductName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    BasePrice DECIMAL(10, 2) NOT NULL,
    IsCustomizable BIT NOT NULL DEFAULT 0,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE ProductVariants (
    VariantID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    Size NVARCHAR(50) NULL,
    Color NVARCHAR(50) NULL,
    ColorHex NVARCHAR(7) NULL,
    SKU NVARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL DEFAULT 0,
    CONSTRAINT UQ_ProductVariant UNIQUE (ProductID, Size, Color)
);

CREATE TABLE ProductImages (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    VariantID INT NULL FOREIGN KEY REFERENCES ProductVariants(VariantID),
    ImagePath NVARCHAR(500) NOT NULL,
    IsPrimary BIT NOT NULL DEFAULT 0,
    DisplayOrder INT NOT NULL DEFAULT 0
);

CREATE TABLE CustomizableAreas (
    AreaID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    AreaName NVARCHAR(100) NOT NULL,
    XCoordinate INT NOT NULL,
    YCoordinate INT NOT NULL,
    Width INT NOT NULL,
    Height INT NOT NULL,
    MaxResolution INT NULL,
    AllowedFileTypes NVARCHAR(100) NULL
);

CREATE TABLE Addresses (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    AddressLine1 NVARCHAR(100) NOT NULL,
    AddressLine2 NVARCHAR(100) NULL,
    City NVARCHAR(50) NOT NULL,
    StateProvince NVARCHAR(50) NOT NULL,
    PostalCode NVARCHAR(20) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(20) NULL,
    Email NVARCHAR(100) NULL
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    CustomerEmail NVARCHAR(100) NOT NULL,
    ShippingAddressID INT NOT NULL FOREIGN KEY REFERENCES Addresses(AddressID),
    BillingAddressID INT NOT NULL FOREIGN KEY REFERENCES Addresses(AddressID),
    OrderStatus NVARCHAR(50) NOT NULL DEFAULT 'Pending', -- Pending, Processing, Shipped, Delivered, Cancelled
    PaymentStatus NVARCHAR(50) NOT NULL DEFAULT 'Pending', -- Pending, Paid, Failed, Refunded
    SubTotal DECIMAL(10, 2) NOT NULL,
    TaxAmount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    ShippingCost DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    DiscountAmount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    ShippingMethod NVARCHAR(100) NULL,
    TrackingNumber NVARCHAR(100) NULL,
    Notes NVARCHAR(MAX) NULL,
    IPAddress NVARCHAR(45) NULL
);

CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
    VariantID INT NOT NULL FOREIGN KEY REFERENCES ProductVariants(VariantID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    HasCustomization BIT NOT NULL DEFAULT 0
);

CREATE TABLE CustomImages (
    CustomImageID INT IDENTITY(1,1) PRIMARY KEY,
    OrderItemID INT NOT NULL FOREIGN KEY REFERENCES OrderItems(OrderItemID),
    AreaID INT NOT NULL FOREIGN KEY REFERENCES CustomizableAreas(AreaID),
    ImagePath NVARCHAR(500) NOT NULL,
    XPosition INT NOT NULL,
    YPosition INT NOT NULL,
    Width INT NOT NULL,
    Height INT NOT NULL,
    Rotation INT NOT NULL DEFAULT 0,
    ZIndex INT NOT NULL DEFAULT 0,
    UploadDate DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE INDEX IX_Products_SubCategoryID ON Products(SubCategoryID);
CREATE INDEX IX_ProductVariants_ProductID ON ProductVariants(ProductID);
CREATE INDEX IX_OrderItems_OrderID ON OrderItems(OrderID);
CREATE INDEX IX_OrderItems_VariantID ON OrderItems(VariantID);
CREATE INDEX IX_CustomImages_OrderItemID ON CustomImages(OrderItemID);
CREATE INDEX IX_CustomizableAreas_ProductID ON CustomizableAreas(ProductID);
CREATE INDEX IX_Orders_ShippingAddressID ON Orders(ShippingAddressID);
CREATE INDEX IX_Orders_BillingAddressID ON Orders(BillingAddressID);