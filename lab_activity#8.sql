create database lab_activity_8;
use lab_activity_8;

-- ==============================
-- Task 1: Scalar Function - Total Amount
-- ==============================
-- Objective: Calculate total amount (price * quantity) for products/orders

-- Create Sample Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Quantity INT
);

-- Insert Sample Data
INSERT INTO Products (ProductID, ProductName, Price, Quantity)
VALUES 
    (1, 'Laptop', 999.99, 2),
    (2, 'Mouse', 29.99, 5),
    (3, 'Keyboard', 59.99, 3);

-- Create Scalar Function: fn_GetTotalAmount
CREATE FUNCTION dbo.fn_GetTotalAmount
(
    @Price DECIMAL(10, 2),
    @Quantity INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    -- Validate inputs
    IF @Price < 0 OR @Quantity < 0
        RETURN 0.00;
    RETURN @Price * @Quantity;
END;

-- Use Function in SELECT Query
SELECT 
    ProductID,
    ProductName,
    Price,
    Quantity,
    dbo.fn_GetTotalAmount(Price, Quantity) AS TotalAmount
FROM Products;

-- ==============================
-- Task 2: Scalar Function - Grade from Marks
-- ==============================
-- Objective: Assign grades based on percentage

-- Create Sample Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Percentage INT
);

-- Insert Sample Data
INSERT INTO Students (StudentID, FirstName, LastName, Percentage)
VALUES 
    (1, 'John', 'Doe', 92),
    (2, 'Jane', 'Smith', 85),
    (3, 'Mike', 'Brown', 65);

-- Create Scalar Function: fn_GradeFromMarks
CREATE FUNCTION dbo.fn_GradeFromMarks
(
    @Percentage INT
)
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @Grade CHAR(1);
    SET @Grade = 
        CASE 
            WHEN @Percentage >= 90 THEN 'A'
            WHEN @Percentage >= 80 THEN 'B'
            WHEN @Percentage >= 70 THEN 'C'
            ELSE 'F'
        END;
    RETURN @Grade;
END;

-- Use Function in SELECT Query
SELECT 
    StudentID,
    FirstName + ' ' + LastName AS FullName,
    Percentage,
    dbo.fn_GradeFromMarks(Percentage) AS Grade
FROM Students;

-- ==============================
-- Task 3: Inline Table-Valued Function - Orders by Customer
-- ==============================
-- Objective: Retrieve all orders for a given customer

-- Create Sample Customers and Orders Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2)
);

-- Insert Sample Data
INSERT INTO Customers (CustomerID, CustomerName)
VALUES 
    (1, 'Alice Johnson'),
    (2, 'Bob Smith');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES 
    (1, 1, '2025-01-15', 150.00),
    (2, 1, '2025-02-10', 200.00),
    (3, 2, '2025-03-01', 300.00);

-- Create Inline TVF: fn_GetOrdersByCustomer
CREATE FUNCTION dbo.fn_GetOrdersByCustomer
(
    @CustomerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        OrderID,
        CustomerID,
        OrderDate,
        Amount
    FROM Orders
    WHERE CustomerID = @CustomerID
);

-- Use Function with JOIN
SELECT 
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.Amount
FROM Customers c
LEFT JOIN dbo.fn_GetOrdersByCustomer(1) o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = 1;

-- ==============================
-- Task 4: Multi-Statement Table-Valued Function - High-Value Customers
-- ==============================
-- Objective: Identify customers with total purchases above a threshold

-- Create Multi-Statement TVF: fn_HighValueCustomers
CREATE FUNCTION dbo.fn_HighValueCustomers
(
    @MinAmount DECIMAL(10, 2)
)
RETURNS @Result TABLE
(
    CustomerID INT,
    CustomerName VARCHAR(100),
    TotalSpent DECIMAL(10, 2)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT 
        c.CustomerID,
        c.CustomerName,
        SUM(o.Amount) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
    HAVING SUM(o.Amount) > @MinAmount;
    RETURN;
END;

-- Use Function in SELECT Query
SELECT * 
FROM dbo.fn_HighValueCustomers(200.00);

-- ==============================
-- Task 5: Scalar Function - Student Full Name
-- ==============================
-- Objective: Concatenate first and last names

-- Create Scalar Function: GetStudentFullName
CREATE FUNCTION dbo.GetStudentFullName
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
)
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN TRIM(@FirstName + ' ' + @LastName);
END;

-- Use Function in SELECT Query
SELECT 
    StudentID,
    dbo.GetStudentFullName(FirstName, LastName) AS FullName,
    Percentage
FROM Students;

-- ==============================
-- Task 6: Inline Table-Valued Function - Top Performers
-- ==============================
-- Objective: Retrieve students with marks above a threshold

-- Create Inline TVF: GetTopPerformers
CREATE FUNCTION dbo.GetTopPerformers
(
    @MinMarks INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        StudentID,
        dbo.GetStudentFullName(FirstName, LastName) AS FullName,
        Percentage AS Marks
    FROM Students
    WHERE Percentage >= @MinMarks
);

-- Use Function in SELECT Query
SELECT * 
FROM dbo.GetTopPerformers(85);

-- ==============================
-- Task 7: Scalar Function - Pass/Fail Status
-- ==============================
-- Objective: Determine pass/fail based on marks

-- Create Scalar Function: GetPassFailStatus
CREATE FUNCTION dbo.GetPassFailStatus
(
    @Marks INT
)
RETURNS VARCHAR(4)
AS
BEGIN
    RETURN CASE 
               WHEN @Marks >= 40 THEN 'Pass'
               ELSE 'Fail'
           END;
END;

-- Use Function in SELECT Query
SELECT 
    StudentID,
    dbo.GetStudentFullName(FirstName, LastName) AS FullName,
    Percentage AS Marks,
    dbo.GetPassFailStatus(Percentage) AS Status
FROM Students;

-- ==============================
-- Task 8: Multi-Statement Table-Valued Function - Student Grades
-- ==============================
-- Objective: Generate grade sheet with marks and grades

-- Create Multi-Statement TVF: GetStudentGrades
CREATE FUNCTION dbo.GetStudentGrades
(
    @MinMarks INT
)
RETURNS @Result TABLE
(
    StudentID INT,
    FullName VARCHAR(100),
    Marks INT,
    Grade CHAR(1)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT 
        StudentID,
        dbo.GetStudentFullName(FirstName, LastName) AS FullName,
        Percentage AS Marks,
        CASE 
            WHEN Percentage >= 90 THEN 'A'
            WHEN Percentage >= 80 THEN 'B'
            WHEN Percentage >= 70 THEN 'C'
            ELSE 'D'
        END AS Grade
    FROM Students
    WHERE Percentage >= @MinMarks;
    RETURN;
END;

-- Use Function in SELECT Query
SELECT * 
FROM dbo.GetStudentGrades(70);

-- ==============================
-- Task 9: Scalar Function - Employee Bonus Calculator
-- ==============================
-- Objective: Calculate bonus based on salary

-- Create Sample Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- Insert Sample Data
INSERT INTO Employees (EmployeeID, EmployeeName, Salary)
VALUES 
    (1, 'Alice Brown', 120000.00),
    (2, 'Bob Wilson', 75000.00),
    (3, 'Carol Davis', 40000.00);

-- Create Scalar Function: CalculateBonus
CREATE FUNCTION dbo.CalculateBonus
(
    @Salary DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Bonus DECIMAL(10, 2);
    SET @Bonus = 
        CASE 
            WHEN @Salary > 100000 THEN @Salary * 0.20
            WHEN @Salary >= 50000 THEN @Salary * 0.10
            ELSE @Salary * 0.05
        END;
    RETURN @Bonus;
END;

-- Use Function in SELECT Query
SELECT 
    EmployeeID,
    EmployeeName,
    Salary,
    dbo.CalculateBonus(Salary) AS Bonus
FROM Employees;