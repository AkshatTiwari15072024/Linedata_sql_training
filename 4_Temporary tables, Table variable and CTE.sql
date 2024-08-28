--Temporary Table, Table variable and CTE

create proc temporarytable
as
begin
create table #person(ID int, Name nvarchar(20))

insert into #person values(1,'Akshat')
insert into #person values(2,'Aditya')
insert into #person values(3,'Atharva')

select * from #person
end
exec temporarytable

create proc permanenttable
as
begin
create table ##person(ID int, Name nvarchar(20))

insert into ##person values(1,'Akshat')
insert into ##person values(2,'Aditya')
insert into ##person values(3,'Atharva')

select * from ##person
end
exec permanenttable

create proc tablevariable
as
begin
declare @table_variable table(deptname nvarchar(20), DepartmentID int, totalemployees int)

insert @table_variable
select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
order by employeeid desc

Select * from @table_variable
SELECT deptname, DepartmentID from @table_variable where DepartmentID > 2
end
exec tablevariable

create proc cte
as
begin
with table_cte(Deptname, DepartmentID, totalemployees)
as
(
select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
)
SELECT deptname, DepartmentID from table_cte where DepartmentID > 2;

with table_cte
as
(
select Department, EmployeeID, count(*) as [total employees] from employees
group by department,EmployeeID
)
SELECT Department,EmployeeID from table_cte where EmployeeID > 2;
end
exec cte