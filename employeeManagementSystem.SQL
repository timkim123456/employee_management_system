
CREATE TABLE employee_management_system;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Positions (
    PositionID INT PRIMARY KEY,
    PositionTitle VARCHAR(100)
);

CREATE TABLE Positions (
    PositionID INT PRIMARY KEY,
    PositionTitle VARCHAR(100)
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    Amount DECIMAL(10, 2)
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    SalaryID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID),
    FOREIGN KEY (SalaryID) REFERENCES Salaries(SalaryID)
);


-- Crud operations

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, PositionID, SalaryID, HireDate)
VALUES (1, 'John', 'Doe', 1, 1, 1, '2022-01-01');


SELECT * FROM Employees WHERE EmployeeID = 1;


UPDATE Employees SET SalaryID = 2 WHERE EmployeeID = 1;



DELETE FROM Employees WHERE EmployeeID = 1;


-- queries

SELECT
    Departments.DepartmentName,
    COUNT(Employees.EmployeeID) AS EmployeeCount,
    AVG(Salaries.Amount) AS AverageSalary
FROM
    Departments
LEFT JOIN
    Employees ON Departments.DepartmentID = Employees.DepartmentID
LEFT JOIN
    Salaries ON Employees.SalaryID = Salaries.SalaryID
GROUP BY
    Departments.DepartmentName;


