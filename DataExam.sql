-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF EXISTS (
            SELECT [name]
FROM sys.databases
WHERE [name] ='EmployeeDB'
        )
        DROP DATABASE EmployeeDB
        GO

CREATE DATABASE EmployeeDB
GO

USE EmployeeDB
GO

CREATE TABLE Department(
    DepartId INT PRIMARY KEY,
    DepartName Varchar(50) NOT NULL,
    Descriptions VARCHAR(100) NOT NULL
);

CREATE TABLE Employee(
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT(1),
    Address VARCHAR(100),
    DepartId INT,
    Salary Money,
    CONSTRAINT fk FOREIGN KEY (DepartId) REFERENCES Department(DepartId)
)

-- Insert 3 records into the Department table
INSERT INTO Department (DepartId, DepartName, Descriptions)
VALUES
    (1, 'HR', 'Human Resources Department'),
    (2, 'IT', 'Information Technology Department'),
    (3, 'Finance', 'Finance Department');
GO

-- Insert 3 records into the Employee table with addresses from Vietnam
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartId, Salary)
VALUES
    ('E00001', 'Nguyen', 'Van Thuyet', '1980-01-01', 1, '123 Nguyen Trai, Hanoi', 1, 50000.00),
    ('E00002', 'Tran', 'Kim Oanh', '1985-05-15', 0, '456 Le Loi, Hanoi', 2, 60000.00),
    ('E00003', 'Le', 'Van Cuuong', '1990-07-30', 1, '789 Tran Hung Dao, Hanoi', 3, 55000.00);
GO

-- Increase the salary for all employees by 10% 
UPDATE Employee
SET Salary = Salary * 1.10;
GO


-- Add a constraint to ensure that Salary is always greater than 0
ALTER TABLE Employee
ADD CONSTRAINT checkksalary
CHECK (Salary > 0);
GO


Select * from Employee
Go

