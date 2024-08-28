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