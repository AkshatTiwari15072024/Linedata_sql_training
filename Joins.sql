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
from Employees a
left join employees i
on a.employees = i.employees




select JobTitle, Department,avg(Salary) as [average salary]
from Employees
left outer join table1
on employees.age = table1.age
where salary > 60000
group by JobTitle, Department
having Department = 'Engineering'
order by JobTitle desc


select * from Employees
select * from table1


select sum(null) from Employees
 where age = 21;

 select * from Employees where 1 = 1

