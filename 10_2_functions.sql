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


alter FUNCTION get_name(@position varchar(50))
RETURNS varchar(50)
AS
BEGIN
    declare @name varchar(50)
	select @name = Concat(Firstname ,' ',Lastname) from Employees
	where jobtitle = @position
    RETURN @name
END;

select dbo.get_name('software engineer') as answer


Create Procedure dbo.CallUserFunction(@a int, @b int)  
    As  
    Begin
        select dbo.calculate_multiplication(@a, @b) as answer
    End

Exec dbo.CallUserFunction @a = 2, @b = 3

