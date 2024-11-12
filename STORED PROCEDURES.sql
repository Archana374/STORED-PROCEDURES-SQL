##stored procedures
##create table worker

CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) NOT NULL,
    Salary INT(15) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department CHAR(25) NOT NULL
);
DESCRIBE Worker; 
##Procedure to Add a New Record

DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN Worker_Id INT,
    IN FirstName CHAR(25),
    IN LastName CHAR(25),
    IN Salary INT,
    IN JoiningDate DATETIME,
    IN Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department);
END $$

DELIMITER ;

-- Call the procedure
CALL AddWorker(1, 'Archana', 'Divya', 70000, '2024-01-12 09:00:00', 'Engineering');

##Procedure to Retrieve Salary by Worker ID
DELIMITER //

CREATE PROCEDURE GetSalaryByWorkerId(
    IN WorkerId INT,
    OUT Salary INT
)
BEGIN
    SELECT Salary INTO Salary
    FROM Worker
    WHERE Worker_Id = WorkerId;
END //

DELIMITER ;
##-- Call the procedure
SET @worker_salary = 0;
CALL GetSalaryByWorkerId(1, @worker_salary);
SELECT @worker_salary AS Salary;

##Procedure to Update Worker Department
DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN WorkerId INT,
    IN Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = in_Department
    WHERE Worker_Id = in_WorkerId;
END //

DELIMITER ;

##Procedure to Get Worker Count by Department

DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN Department CHAR(25),
    OUT WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO WorkerCount
    FROM Worker
    WHERE Department = Department;
END //

DELIMITER ;

-- Call the procedure
SET @worker_count = 0;
CALL GetWorkerCountByDepartment('Engineering', @worker_count);
SELECT @worker_count AS WorkerCount;

##Procedure to Get Average Salary by Department
DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN Department CHAR(25),
    OUT AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO AvgSalary
    FROM Worker
    WHERE Department = Department;
END $$

DELIMITER ;

