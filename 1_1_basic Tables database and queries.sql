--basic tables, database and queries
CREATE DATABASE testdb

create table table1( pk_name varchar(50) primary key , age int not null)

insert into table1(pk_name,age) values ('Akshat Tiwari', 22),('Aditya Mundas',21),('Atharva Mahalle',21), ('Bhargav Mundekar',20),
('Sahil Madhayan', 20)

select * from table1

alter table table1 drop column

drop table table1

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    JobTitle VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, JobTitle, Department, Salary, HireDate)
VALUES
    (1, 'John', 'Doe', 'Software Engineer', 'Engineering', 85000.00, '2022-01-15'),
    (2, 'Jane', 'Smith', 'Data Analyst', 'Analytics', 60000.00, '2021-08-10'),
    (3, 'Michael', 'Johnson', 'Product Manager', 'Product Management', 95000.00, '2020-05-20');

INSERT INTO Employees (EmployeeID, FirstName, LastName, JobTitle, Department, Salary, HireDate)
VALUES
    (4, 'Jay', 'Goel', 'Software Engineer Assistant', 'Engineering', 75000.00, '2022-01-15'),
    (5, 'Janu', 'Sharma', 'Data Engineer', 'Analytics', 90000.00, '2021-08-10'),
    (6, 'Mithun', 'Digvijay', 'Product Manager Assistant', 'Product Management', 55000.00, '2020-05-20');

select * from employees

alter table employees add age int

UPDATE Employees SET age = 21 where EmployeeID = 1


drop table Employees

select FirstName , LastName, Salary from Employees as fname
where salary > 70000.00