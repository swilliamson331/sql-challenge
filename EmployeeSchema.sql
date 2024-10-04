/*
DROP TABLE Departments;
DROP TABLE Dept_Employees;
DROP TABLE Dept_Managers;
DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Titles;
*/

CREATE TABLE Departments (
    deptID varchar(5) NOT NULL,
    dept_name varchar(30),
    CONSTRAINT pk_Departments PRIMARY KEY (
        deptID
     )
);

CREATE TABLE Employees (
    employeeID int   NOT NULL,
    titleID varchar(7) NOT NULL,
    birthday Date,
    first_name varchar(20),
    last_name varchar(20),
    sex varchar(2),
    hire_date Date,
    CONSTRAINT pk_Employees PRIMARY KEY (
        employeeID
     )
);

CREATE TABLE Dept_Employees (
    employeeID INT NOT NULL,
    deptID varchar(5) NOT NULL,
    PRIMARY KEY (employeeID, deptID), -- Composite primary key
    FOREIGN KEY (employeeID) REFERENCES Employees(employeeID),
    FOREIGN KEY (deptID) REFERENCES Departments(deptID)
);

CREATE TABLE Dept_Managers (
    deptID varchar(5) NOT NULL,
	employeeID INT NOT NULL,
    PRIMARY KEY (employeeID, deptID), -- Composite primary key
    FOREIGN KEY (employeeID) REFERENCES Employees(employeeID),
    FOREIGN KEY (deptID) REFERENCES Departments(deptID)
);

CREATE TABLE Salaries (
    employeeID int   NOT NULL,
    Salary int
);

CREATE TABLE Titles (
    titleID varchar(7) NOT NULL,
    Title varchar(25),
    CONSTRAINT pk_Titles PRIMARY KEY (
        titleID
     )
);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_employeeID FOREIGN KEY(employeeID)
REFERENCES Employees (employeeID);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_deptID FOREIGN KEY(deptID)
REFERENCES Departments (deptID);

ALTER TABLE Dept_Managers ADD CONSTRAINT fk_Dept_Managers_employeeID FOREIGN KEY(employeeID)
REFERENCES Employees (employeeID);

ALTER TABLE Dept_Managers ADD CONSTRAINT fk_Dept_Managers_deptID FOREIGN KEY(deptID)
REFERENCES Departments (deptID);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_titleID FOREIGN KEY(titleID)
REFERENCES Titles (titleID);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_employeeID FOREIGN KEY(employeeID)
REFERENCES Employees (employeeID);

SELECT * FROM Departments;
SELECT * FROM Dept_Employees;
SELECT * FROM Dept_Managers;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Titles;

