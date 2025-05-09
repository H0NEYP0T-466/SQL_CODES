create database lab_activity3;
use lab_activity3;


CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10, 2),
StockQuantity INT
);


ALTER TABLE Products
ADD SupplierID INT;

ALTER TABLE Products
ALTER COLUMN Price FLOAT;

EXEC sp_rename 'Products.StockQuantity', 'AvailableStock', 'COLUMN';


drop table Products;


INSERT INTO Products (ProductID, ProductName, Category, Price, AvailableStock,SupplierID )
VALUES
(1, 'Laptop', 'Electronics', 999.99, 101, 50),
(2, 'Smartphone', 'Electronics', 499.99, 102, 100),
(3, 'Coffee Maker', 'Home Appliances', 49.99, 103, 200),
(4, 'Running Shoes', 'Sports', 79.99, 104, 150),
(5, 'Office Chair', 'Furniture', 149.99, 105, 75);

update Products
SET Price = Price * 1.10
WHERE ProductID = 3;

DELETE FROM Products
WHERE AvailableStock = 0;

INSERT INTO Products (ProductID, ProductName, Category, Price, AvailableStock,SupplierID )
VALUES (6, 'Wireless Mouse', 'Electronic', 29.99, 106, 300);

UPDATE Products
SET Category = 'Electronics'
WHERE ProductID = 6;

TRUNCATE TABLE Products;


select * from Products;

SELECT ProductName, Price
FROM Products
WHERE Category = 'Electronics';

SELECT *
FROM Products
WHERE Price > 500 AND Price < 1000;

SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

SELECT *
FROM Products
ORDER BY Price DESC;

GRANT SELECT ON Products TO David;

GRANT INSERT, UPDATE ON Products TO Sarah;

revoke delete on Products from Sarah;

GRANT DELETE ON Products TO Admin;

REVOKE ALL ON DATABASE::YourDatabaseName FROM David;


-- Start a transaction
BEGIN TRANSACTION;

-- Insert a new product
INSERT INTO Products (ProductID, ProductName, Price, AvailableStock)
VALUES (101, 'Sample Product', 19.99, 50);

-- Rollback the transaction
ROLLBACK;

-- Check if the record exists
SELECT * FROM Products WHERE ProductID = 101;


-- Start a transaction
BEGIN TRANSACTION;

-- Update the price of a product (replace ProductID as needed)
UPDATE Products
SET Price = 24.99
WHERE ProductID = 1;

-- Commit the transaction
COMMIT;

-- Verify the change
SELECT * FROM Products WHERE ProductID = 1;


-- Start a transaction
BEGIN TRANSACTION;

-- Insert a new product
INSERT INTO Products (ProductID, ProductName, Price, Quantity)
VALUES (102, 'Test Product', 29.99, 30);

-- Create a SAVEPOINT
SAVE TRANSACTION Savepoint1;

-- Perform another change (e.g., update price)
UPDATE Products
SET Price = 39.99
WHERE ProductID = 2;

-- Rollback to the SAVEPOINT (undo the UPDATE but keep the INSERT)
ROLLBACK TRANSACTION Savepoint1;

-- Commit the transaction (keeping the inserted product)
COMMIT;

-- Verify the result
SELECT * FROM Products WHERE ProductID = 2;



-- Start a transaction
BEGIN TRANSACTION;

-- Delete a product (replace ProductID as needed)
DELETE FROM Products WHERE ProductID = 102;

-- Rollback the transaction (undo the DELETE)
ROLLBACK;

-- Verify if the product still exists
SELECT * FROM Products WHERE ProductID = 103;


-- Start a transaction
BEGIN TRANSACTION;

-- Update prices for multiple products
UPDATE Products SET Price = Price * 1.10 WHERE Category = 'Electronics';  -- Increase by 10%
UPDATE Products SET Price = Price * 0.90 WHERE Category = 'Clothing';     -- Decrease by 10%

-- Commit the transaction (make changes permanent)
COMMIT;

-- Verify the updates
SELECT * FROM Products WHERE Category IN ('Electronics', 'Clothing');



