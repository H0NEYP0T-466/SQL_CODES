-- Create a new database named lab_activity4
create database lab_activity4;

-- Switch the current database context to lab_activity4
use lab_activity4;

-- Define a new table named Students with columns for ID, name, DOB, and email
CREATE TABLE Students (
    StudentID INT PRIMARY KEY, -- Unique identifier for each student (Primary Key)
    FirstName VARCHAR(50),     -- Student's first name, up to 50 characters
    LastName VARCHAR(50),      -- Student's last name, up to 50 characters
    DOB DATE,                  -- Student's Date of Birth
    Email VARCHAR(100)         -- Student's email address, up to 100 characters
);

-- Display detailed information about the Students table structure (SQL Server specific)
exec sp_help Students;

-- Delete the Students table entirely (structure and data)
drop table Students;

-- Retrieve all columns (*) and all rows from the Students table (will fail if table was just dropped)
select * from Students;

-- Add a new column named PhoneNumber (string, max 15 chars) to the Students table
alter table Students
add PhoneNumber varchar(15);

-- Remove all data rows from the Students table quickly, but keep the table structure
truncate table Students;

-- Count the total number of rows in the Students table and alias the result column as 'Students'
select count(*)  Students;

-- Add a new integer column named age to the Students table
alter table Students Add age int;

-- Rename the 'dob' column in the 'employees' table to 'date_of_birth' (SQL Server specific)
EXEC sp_rename 'employees.dob', 'date_of_birth', 'COLUMN';

-- Change the data type of the 'order_date' column in the 'orders' table to DATETIME
ALTER TABLE orders
ALTER COLUMN order_date DATETIME;

-- Modify the 'email' column in 'users' table: set type to VARCHAR(255) and disallow NULL values
ALTER TABLE users
ALTER COLUMN email VARCHAR(255) NOT NULL;

-- Remove the 'phone' column entirely from the 'customers' table
ALTER TABLE customers
DROP COLUMN phone;

-- Remove all data rows from the 'logs' table quickly, keeping the structure
truncate table logs;

-- Remove all data rows from the 'transactions' table quickly, keeping the structure
TRUNCATE TABLE transactions;

-- Step 1: Check row count before truncating (User comment)
-- Count rows in 'products' table before truncation, naming the result 'Rows_Before_Truncate'
SELECT COUNT(*) AS Rows_Before_Truncate FROM products;

-- Step 2: Truncate the table (User comment)
-- Remove all data rows from the 'products' table quickly, keeping the structure
TRUNCATE TABLE products;

-- Step 3: Confirm truncation (should return 0) (User comment)
-- Count rows in 'products' table after truncation (should be 0), naming the result 'Rows_After_Truncate'
SELECT COUNT(*) AS Rows_After_Truncate FROM products;