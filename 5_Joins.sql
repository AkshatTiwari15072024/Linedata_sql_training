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
