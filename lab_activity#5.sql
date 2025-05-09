create database lab_activity_5;
use lab_activity_5;


CREATE TABLE BankAccount (
    AccountID INT PRIMARY KEY,
    HolderName VARCHAR(50),
    Balance DECIMAL(10, 2)
);


select * from BankAccount;

INSERT INTO BankAccount VALUES (101, 'Ahmad', 5000.00);
INSERT INTO BankAccount VALUES (102, 'Noman', 3000.00);

-- Transaction: Transfer $1000 from Ahmad to Noman
BEGIN TRANSACTION;

BEGIN TRY
    -- Deducting amount from Ahmad
    UPDATE BankAccount
    SET Balance = Balance - 1000
    WHERE HolderName = 'Ahmad';

    -- Adding amount to Noman
    UPDATE BankAccount
    SET Balance = Balance + 1000
    WHERE HolderName = 'Noman';

    -- Commit the transaction if successful
    COMMIT;
    PRINT 'Transaction completed successfully.';
END TRY
BEGIN CATCH
    -- Rollback if any error occurs
    ROLLBACK;
    PRINT 'Transaction failed. Changes have been rolled back.';
END CATCH;
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- 2. Insert Sample Data
INSERT INTO Employee (EmpID, EmpName, Salary)
VALUES 
    (1, 'John', 50000.00),
    (2, 'Sarah', 60000.00);

-- Display Initial Salaries
SELECT * FROM Employee;

BEGIN TRANSACTION;

-- Update John's salary
UPDATE Employee
SET Salary = 55000
WHERE EmpName = 'John';

-- Create SAVEPOINT
SAVE TRANSACTION SavePoint_JohnUpdated;

-- Update Sarah's salary
UPDATE Employee
SET Salary = 65000
WHERE EmpName = 'Sarah';

-- Check condition
IF (SELECT Salary FROM Employee WHERE EmpName = 'Sarah') > 70000
BEGIN
    ROLLBACK TRANSACTION SavePoint_JohnUpdated;
    PRINT 'Rolled back to SAVEPOINT because Sarah''s salary exceeded limit.';
END
ELSE
BEGIN
    COMMIT;
    PRINT 'Transaction committed successfully.';
END

CREATE TABLE EmployeeSalary (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary VARCHAR(20),
    JoiningDate VARCHAR(20)
);

-- Inserting sample data
INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, JoiningDate)
VALUES
(1, 'John Doe', '456.78', '2024-03-14'),
(2, 'Jane Smith', '12345.67', '14/03/2024'),
(3, 'Michael Brown', ' 7890 ', 'March 14, 2024'),
(4, 'Emily Davis', NULL, NULL);


-- Creating EmployeeSalary table
CREATE TABLE EmployeeSalary (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary VARCHAR(20),
    JoiningDate VARCHAR(20)
);

-- Inserting sample data
INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, JoiningDate)
VALUES
(1, 'John Doe', '456.78', '2024-03-14'),
(2, 'Jane Smith', '12345.67', '14/03/2024'),
(3, 'Michael Brown', ' 7890 ', 'March 14, 2024'),
(4, 'Emily Davis', NULL, NULL);

-- 1. Using CAST for Data Type Conversion
SELECT CAST(456.78 AS INT) AS ConvertedInteger;

-- 2. Using CONVERT for Date Formatting (DD/MM/YYYY)
SELECT CONVERT(VARCHAR, GETDATE(), 103) AS FormattedDate;

-- 3. Using FORMAT for Custom Date Representation
SELECT FORMAT(GETDATE(), 'MMMM dd, yyyy') AS FormattedDate;

-- 4. Converting String to Numeric Type
SELECT CAST('12345.67' AS DECIMAL(10,2)) AS ConvertedDecimal;

-- 5. Combining CAST and CONVERT
SELECT CAST(CONVERT(VARCHAR, GETDATE(), 120) AS DATETIME) AS ConvertedBack;

-- 6. Handling NULL Values During Conversion
SELECT CAST(NULL AS INT) AS ConvertedNull;

-- 7. Converting Numeric Values to String
SELECT FORMAT(12345.678, 'N2') AS FormattedNumber;


-- Assuming there is a Product table with ProductPrice stored as VARCHAR
SELECT 
    ProductID,
    ProductName,
    
    -- Step 1: Remove leading/trailing spaces
    LTRIM(RTRIM(ProductPrice)) AS CleanedPrice,

    -- Step 2: Convert cleaned value to DECIMAL(8,2)
    CAST(LTRIM(RTRIM(ProductPrice)) AS DECIMAL(8,2)) AS ConvertedPrice,

    -- Step 3: Format final output with currency symbol
    CONCAT('Rs.', FORMAT(CAST(LTRIM(RTRIM(ProductPrice)) AS DECIMAL(8,2)), 'N2')) AS FinalFormattedPrice

FROM 
    Product;



	-- Assuming you have an Orders table with OrderDate stored as VARCHAR
SELECT 
    OrderID,
    CustomerName,

    -- Step 1: Convert to a proper DATE format
    TRY_CONVERT(DATE, OrderDate, 111) AS StandardDateFormat,

    -- Step 2: Display in 'YYYY-MM-DD' (already achieved by DATE type)
    FORMAT(TRY_CONVERT(DATE, OrderDate, 111), 'yyyy-MM-dd') AS ConsistentFormat,

    -- Step 3: Display in a more readable format like 'March 1, 2024'
    FORMAT(TRY_CONVERT(DATE, OrderDate, 111), 'MMMM d, yyyy') AS ReadableDateFormat

FROM 
    Orders;
