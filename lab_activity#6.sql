create database lab_activity_6;
use lab_activity_6;

CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;
GO

-- Execute
EXEC GetAllStudents;


CREATE PROCEDURE GetStudentByID
    @student_id INT
AS
BEGIN
    SELECT * FROM Students WHERE ID = @student_id;
END;
GO

-- Execute
EXEC GetStudentByID @student_id = 101;


CREATE PROCEDURE GetStudentName
    @student_id INT,
    @student_name VARCHAR(255) OUTPUT
AS
BEGIN
    SELECT @student_name = Name FROM Students WHERE ID = @student_id;
END;
GO

-- Execute
DECLARE @name VARCHAR(255);
EXEC GetStudentName @student_id = 101, @student_name = @name OUTPUT;
SELECT @name AS StudentName;


CREATE PROCEDURE SafeInsertStudent
    @student_id INT,
    @student_name VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            INSERT INTO Students (ID, Name) VALUES (@student_id, @student_name);
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 'Error: Insert failed!' AS Message;
    END CATCH
END;
GO

-- Execute
EXEC SafeInsertStudent @student_id = 105, @student_name = 'Michael Brown';


CREATE PROCEDURE UpdateStudentDetails
    @student_id INT,
    @new_name VARCHAR(255),
    @new_age INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE Students
            SET Name = @new_name, Age = @new_age
            WHERE ID = @student_id;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 'Error: Update failed!' AS Message;
    END CATCH
END;
GO

-- Execute
EXEC UpdateStudentDetails @student_id = 101, @new_name = 'Alice Johnson', @new_age = 22;


DROP PROCEDURE IF EXISTS GetAllStudents;

