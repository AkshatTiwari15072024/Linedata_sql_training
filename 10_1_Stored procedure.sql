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