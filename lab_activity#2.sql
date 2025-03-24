create database lab_activity_2;
use lab_activity_2;


-- Creating Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT,
    GPA DECIMAL(3,2)
);

-- Creating Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Creating Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    InstructorID INT
);

-- Creating Enrollments Table
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Creating Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- Creating TopStudents Table
CREATE TABLE TopStudents (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    GPA DECIMAL(3,2)
);


-- Insert data into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

-- Insert data into Students Table
INSERT INTO Students (StudentID, StudentName, DepartmentID, GPA) VALUES 
(101, 'Ali', 1, 3.8),
(102, 'Sara', 2, 3.2),
(103, 'Bob', 1, 3.6),
(104, 'John', 3, 3.9),
(105, 'Mike', 2, 3.1);

-- Insert data into Instructors Table
INSERT INTO Instructors (InstructorID, InstructorName, Salary) VALUES 
(201, 'Dr. A', 60000),
(202, 'Dr. B', 65000),
(203, 'Dr. C', 70000);

-- Insert data into Courses Table
INSERT INTO Courses (CourseID, CourseName, InstructorID) VALUES 
(301, 'Database Systems', 201),
(302, 'Algorithms', 202),
(303, 'Physics I', 203);

-- Insert data into Enrollments Table
INSERT INTO Enrollments (StudentID, CourseID) VALUES 
(101, 301), 
(101, 302),
(102, 303),
(103, 301),
(104, 302),
(105, 303);


SELECT DISTINCT Students.StudentID, Students.StudentName 
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
WHERE Enrollments.CourseID IN (
    SELECT CourseID 
    FROM Enrollments 
    WHERE StudentID = (SELECT StudentID FROM Students WHERE StudentName = 'Ali')
);


SELECT StudentID, StudentName, DepartmentID, GPA
FROM Students S1
WHERE GPA = (
    SELECT MAX(GPA) 
    FROM Students S2 
    WHERE S1.DepartmentID = S2.DepartmentID
);

INSERT INTO TopStudents (StudentID, StudentName, GPA)
SELECT StudentID, StudentName, GPA 
FROM Students 
WHERE GPA > 3.5;


select * from Instructors;

ALTER TABLE Courses 
ADD CourseDuration INT;



UPDATE Instructors 
SET Salary = Salary * 1.10 
WHERE InstructorID IN (
    SELECT InstructorID 
    FROM Courses 
    GROUP BY InstructorID 
    HAVING COUNT(CourseID) > 3
);


DELETE FROM Students 
WHERE StudentID NOT IN (
    SELECT DISTINCT StudentID 
    FROM Enrollments
);
begin transaction;

-- Insert new students
INSERT INTO Students (StudentID, StudentName, DepartmentID, GPA) VALUES 
(107, 'Grace', 1, 3.4),
(108, 'Henry', 2, 3.2),
(109, 'Ivy', 3, 3.6);

-- Rollback if any department has fewer than 5 students
IF EXISTS (
    SELECT 1 
    FROM Students 
    GROUP BY DepartmentID 
    HAVING COUNT(StudentID) < 5
) begin
    ROLLBACK transaction;
END ;



BEGIN TRANSACTION;

-- Increase salaries by 5%
UPDATE Instructors 
SET Salary = Salary * 1.05;

-- Check if total salary budget exceeds 500,000
IF (SELECT SUM(Salary) FROM Instructors) >= 500000
BEGIN
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    COMMIT TRANSACTION;
END



GRANT select ON Students TO student_role;


REVOKE DELETE ON Students FROM PUBLIC;
GRANT DELETE ON Students TO admin_role;


