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

--views

create view vWfirst_view
as
select FirstName , LastName, Salary from Employees as fname
where salary > 70000.00

select * from vWfirst_view

Select sum(Salary) from vWfirst_view as [total salary]

update vWfirst_view set FirstName = 'Jay' where Salary = 85000.00

insert into vWfirst_view values ('Mithun', 'Jaydeep', 65000.00);

delete from vWfirst_view where FirstName = 'Jay'

drop view vWfirst_view

--Group by and where clause

select Department ,JobTitle, Sum(Salary) as total_salary from employees
group by Department, JobTitle
having JobTitle = 'Software Engineer'


select Department ,JobTitle, Sum(Salary) as total_salary from employees
where JobTitle = 'Software Engineer'
group by Department, JobTitle

--primary key and foreign key

create table primarykeytable(ID int NOT NULL Primary Key,
gender int not null)

create table foreignkeytable(GenderID  int not null primary key, number int)

drop table primarykeytable, foreignkeytable

alter table primarykeytable add constraint primarykey_gender_FR
foreign key (gender) references foreignkeytable(GenderID)

--Temporary Table, Table variable and CTE

create table #person(ID int, Name nvarchar(20))

insert into #person values(1,'Akshat')
insert into #person values(2,'Aditya')
insert into #person values(3,'Atharva')

select * from #person

create table ##person(ID int, Name nvarchar(20))

insert into ##person values(1,'Akshat')
insert into ##person values(2,'Aditya')
insert into ##person values(3,'Atharva')

select * from ##person

declare @table_variable table(deptname nvarchar(20), DepartmentID int, totalemployees int)

insert @table_variable
select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
order by employeeid desc

Select * from @table_variable
SELECT deptname, DepartmentID from @table_variable where DepartmentID > 2

with table_cte(Deptname, DepartmentID, totalemployees)
as
(
select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
)
SELECT deptname, DepartmentID from table_cte where DepartmentID > 2

with table_cte
as
(
select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
)
SELECT Department,EmployeeID from table_cte where EmployeeID > 2

--different Join Operations

select JobTitle, Department, Salary
from Employees
inner join table1
on employees.age = table1.age

select JobTitle, Department, Salary
from Employees
left outer join table1
on employees.age = table1.age

select JobTitle, Department, Salary
from Employees
right outer join table1
on employees.age = table1.age

select JobTitle, Department, Salary
from Employees
full outer join table1
on employees.age = table1.age

select JobTitle, Department, Salary
from Employees
cross join table1

select JobTitle, Department, Salary
from Employees
left outer join table1
on employees.age = table1.age
where employees.age = null

select JobTitle, Department, Salary
from Employees
right outer join table1
on employees.age = table1.age
where employees.age = null

select JobTitle, Department, Salary
from Employees
full outer join table1
on employees.age = table1.age
where employees.age = null or table1.age = null

select a.age as age, i.employeeid as id
from Employees as a
left join employees as i
on a.employees = i.employees

--CRUD Operations
create database CRUD

USE CRUD


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

DELETE FROM Employees WHERE AGE = 20

UPDATE Employees SET age = 21 where EmployeeID = 1

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

 --clustered vs non clustered index

 CREATE table employee2 (
Emp_id int, 
name VARCHAR(20), 
country VARCHAR(20),
 Salary INT);


INSERT INTO employee2(Emp_id, name, country, Salary)
values (101, 'Mohit', 'India', 60000),
 (103, 'Anish', 'England', 70000),
 (104, 'Shubham', 'France', 100000),
 (102, 'Danish', 'Sweden', 40000),
 (105, 'Vivek', 'Wales', 50000),
 (106, 'Rohan', 'Scotland', 30000);

 select * from employee2

 create clustered index ix_employee2_salary_country on employee2(salary ASC, country DESC)

 create nonclustered index ix_unclustered_employee on employee2(name)

 --CAST AND CONVERT

 Select employeeId, firstName, jobtitle, CAST(HireDate as nvarchar) as Convertedhiredate
from Employees

 Select employeeId, firstName, jobtitle, CAST(HireDate as nvarchar(5)) as Convertedhiredate
from Employees

 Select employeeId, firstName, jobtitle, Convert(nvarchar(8), HireDate) as Convertedhiredate
from Employees

Select employeeId, firstName, jobtitle, Convert(nvarchar, HireDate, 103) as Convertedhiredate
from Employees

Select employeeId, firstName, jobtitle, Convert(nvarchar, HireDate, 101) as Convertedhiredate
from Employees

Select employeeId, firstName, firstname + ' - ' + CAST(employeeid as nvarchar) as [Name - ID]from Employees

--stored procedures

 create procedure spSample
 as
 begin
  select Department, EmployeeID, count(*) as [total employees] from employees
  group by department,EmployeeID
  order by employeeid desc
end

spSample

execute spSample

create proc spSample2
@EmployeeID int,
@department varchar(20)
as
begin
 select Department, EmployeeID, count(*) as [total employees] from employees
  where employeeid = @EmployeeID and department = @department
  group by department,EmployeeID
  order by employeeid desc
end

drop procedure spsample2

spsample2 6,'Product Management'

sp_helptext spsample2

alter proc spSample2
@EmployeeID int,
@department varchar(20)
with encryption
as
begin
 select Department, EmployeeID, count(*) as [total employees] from employees
  where employeeid = @EmployeeID and department = @department
  group by department,EmployeeID
end

create proc spSample3
@EmployeeID int,
@department varchar(20) output
as
begin
 select department, count(*)  from employees
  where employeeid = @EmployeeID and department = @department
  group by EmployeeID, department
  order by employeeid desc
end

declare @variable varchar(20)
exec spSample3 @department = @variable, @EmployeeID = 1
print @variable

create proc spSample4
as
begin
 return(select count(*)  from employees)
end

declare @totalemployees int
execute @totalemployees = spSample4
select @totalemployees

--Functions

select square(3)

select GETDATE()

CREATE FUNCTION calculate_multiplication(@a int, @b int)
RETURNS int
AS
BEGIN
    declare @answer int
	set @answer = @a*@b
    RETURN @answer
END;

select dbo.calculate_multiplication(3,4) as answer

create function fn_table(@jobtitle nvarchar(10))
returns table
as
return (select Department ,JobTitle, Sum(Salary) as total_salary from employees
where JobTitle = @jobtitle
group by Department, JobTitle)

select * from fn_table('analyst')

create function fn_employeecopy()
returns @table table(id int, name varchar(20), salary int)
as
begin
insert into @table 
select employeeid , firstname, salary from employees
return
end

select * from fn_employeecopy()

--how to debug stored procdedure

 alter procedure spSample6
 as
 begin
  select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
  order by employeeid desc
  print 'step 1'
  select * from employee2
  print 'step 2'

end

spSample6

--XML and Xquery

declare @doc int, @xmldoc varchar(max)

set @xmldoc = '
      <root>
	  <employee id="111" Name="Sandeep" address="mumbai"/>
	  <employee id="123" Name="Madan" address="matunga"/>
	  <employee id="134" Name="Aditya" address="thane"/>
	  </root>
'

exec sp_xml_preparedocument @doc output, @xmldoc

select id,name,address
from
openxml(@doc, 'root/employee',1)
with(id int,name varchar(10),address varchar(10))

create proc xqueries
as
begin
DECLARE @books xml
SET @books = '

<bookstore>

<book category="COOKING">
  <title lang="en">Everyday Italian</title>
  <author>Giada De Laurentiis</author>
  <year>2005</year>
  <price>30.00</price>
</book>

<book category="CHILDREN">
  <title lang="en">Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

<book category="WEB">
  <title lang="en">XQuery Kick Start</title>
  <author>James McGovern,Per Bothner,Kurt Cagle,James Linn,Vaidyanathan Nagarajan</author>
  <year>2003</year>
  <price>49.99</price>
</book>

<book category="WEB">
  <title lang="en">Learning XML</title>
  <author>Erik T. Ray</author>
  <year>2003</year>
  <price>39.95</price>
</book>

</bookstore>
'
--SELECT @books.query('/bookstore/book/price')

--SELECT @books.query('/bookstore')

--select @books.value('(/bookstore/book)[1]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/@category)[1]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/@category)[3]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/title)[1]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/title[@lang = "en"])[1]', 'nvarchar(30)')

select
@books.value('(/bookstore/book/@category)[1]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[1]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[1]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[1]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[1]', 'nvarchar(30)') as price
union all
select
@books.value('(/bookstore/book/@category)[2]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[2]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[2]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[2]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[2]', 'nvarchar(30)') as price
union all
select
@books.value('(/bookstore/book/@category)[3]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[3]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[3]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[3]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[3]', 'nvarchar(30)') as price
union all
select
@books.value('(/bookstore/book/@category)[4]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[4]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[4]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[4]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[4]', 'nvarchar(30)') as price

end
exec xqueries

drop procedure xqueries




select * from employees