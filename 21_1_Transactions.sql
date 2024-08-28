--transactions

create proc transactions
as
begin
 begin try
   begin transaction
     select JobTitle, Department, Salary
     from Employees
     full outer join table1
     on employees.age = table1.age
   commit transaction
   print 'transaction commited'
 end try
 begin catch
   rollback transaction
   print 'transaction rollback'
 end catch
end

exec transactions

create proc transactions2
as
begin
 begin try
   begin transaction
     update employees set lastname = 'edededededededededededededededrftgyhtgrfvfbgnhjhygddddddddddddd'
	 where jobtitle = 'product manager'
   commit transaction
   print 'transaction commited'
 end try
 begin catch
   rollback transaction
   print 'transaction rollback'
 end catch
end

exec transactions2

select * from employees