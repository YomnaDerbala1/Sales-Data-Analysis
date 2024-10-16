-- Replace non-ASCII characters with empty strings:

   --1) in CustomerName Column:
UPDATE SalesView
SET CustomerName = 
    REPLACE(CustomerName, 
        SUBSTRING(CustomerName, PATINDEX('%[^a-zA-Z0-9 ]%', CustomerName), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', CustomerName) > 0;

  --2)in ProductName Column:
UPDATE SalesView
SET ProductName = 
    REPLACE(ProductName, 
        SUBSTRING(ProductName, PATINDEX('%[^a-zA-Z0-9 ]%', ProductName), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', ProductName) > 0;

   --3)In City Column:
UPDATE SalesView
SET City = 
    REPLACE(City, 
        SUBSTRING(City, PATINDEX('%[^a-zA-Z0-9 ]%', City), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', City) > 0;

    --4)in Country Column:
UPDATE SalesView
SET Country = 
    REPLACE(Country, 
        SUBSTRING(Country, PATINDEX('%[^a-zA-Z0-9 ]%', Country), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', Country) > 0;

     --5)IN Shipper Name Column:
UPDATE SalesView
SET ShipperName = 
    REPLACE(ShipperName, 
        SUBSTRING(ShipperName, PATINDEX('%[^a-zA-Z0-9 ]%', ShipperName), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', ShipperName) > 0;

     --6)In Supplier Name Column:
UPDATE SalesView
SET SupplierName = 
    REPLACE(SupplierName, 
        SUBSTRING(SupplierName, PATINDEX('%[^a-zA-Z0-9 ]%', SupplierName), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', SupplierName) > 0;

      --7)In CategoryName Column:
UPDATE SalesView
SET CategoryName = 
    REPLACE(CategoryName, 
        SUBSTRING(CategoryName, PATINDEX('%[^a-zA-Z0-9 ]%', CategoryName), 1), '')
WHERE PATINDEX('%[^a-zA-Z0-9 ]%', CategoryName) > 0;


-- Check for Duplicated Values:
SELECT * 
FROM 
    SalesView ---- 518 ROWS
	
SELECT DISTINCT * 
FROM 
     SalesView  ---518 ROWS
      --(There are no duplicate values)

-- Check for Missing Values:
SELECT * 
FROM 
    SalesView
   WHERE CustomerID IS NULL 
   OR CustomerName IS NULL
   OR City IS NULL
   OR Country IS NULL
   OR OrderID IS NULL
   OR OrderDate IS NULL
   OR OrderDetailID IS NULL
   OR Quantity IS NULL
   OR ProductID IS NULL
   OR ProductName IS NULL
   OR Unit IS NULL
   OR Price IS NULL
   OR ShipperID IS NULL
   OR ShipperName IS NULL
   OR SupplierID IS NULL
   OR SupplierName IS NULL
   OR CategoryID IS NULL
   OR CategoryName IS NULL
 --  (There are no missing values)

--Checking for Whitespace in Text Columns:

SELECT *
FROM 
    SalesView
WHERE CustomerName != TRIM(CustomerName)

SELECT *
FROM 
    SalesView
WHERE City != TRIM(City)

SELECT *
FROM 
    SalesView
WHERE Country != TRIM(Country)

SELECT *
FROM 
    SalesVIEW
WHERE ProductName != TRIM(ProductName)

SELECT *
FROM 
    SalesVIEW
WHERE ShipperName != TRIM(ShipperName)

SELECT *
FROM 
    SalesView
WHERE SupplierName != TRIM(SupplierName)

SELECT *
FROM 
    SalesView
WHERE CategoryName != TRIM(CategoryName)


      --Remove time from OrderDate Column:
-- Step 1: Add a new column for date only
ALTER TABLE orders ADD OrderDateTemp DATE;

-- Step 2: Populate the new column with date values
UPDATE orders
SET OrderDateTemp = CAST(OrderDate AS DATE)
WHERE OrderDate IS NOT NULL;

-- Step 3: Drop the original column
ALTER TABLE  orders DROP COLUMN OrderDate;

-- Step 4: Rename the temporary column to the original name
EXEC sp_rename 'orders.OrderDateTemp', 'OrderDate', 'COLUMN';











