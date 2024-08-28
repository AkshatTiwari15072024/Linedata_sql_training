
--Delete vs Truncate

use testdb

CREATE table employeeexample (
Emp_id int, 
name VARCHAR(20), 
country VARCHAR(20),
 Salary INT);


INSERT INTO employeeexample(Emp_id, name, country, Salary)
values (101, 'Mohit', 'India', 60000),
 (103, 'Anish', 'England', 70000),
 (104, 'Shubham', 'France', 100000),
 (102, 'Danish', 'Sweden', 40000),
 (105, 'Vivek', 'Wales', 50000),
 (106, 'Rohan', 'Scotland', 30000);


 Select * from employeeexample ; 

 Delete from employeeexample where Emp_id = 106;

 TRUNCATE TABLE Employeeexample;
