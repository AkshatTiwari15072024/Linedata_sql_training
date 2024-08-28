--Conditional Functions - CASE WHEN, COALESCE(),NULLIF() 

select nullif('aditya','akshat') as nullresult

select nullif('2','2') as [null]

select * from employees

select firstname, lastname,age,
case
when age < 22 then 'young'
when age < 26 then 'middle age'
else 'old'
end as age_category
from employees
order by age asc

select firstname, lastname,age,
case salary
when 95000.00 then 'highest paid'
when 55000.00 then 'lowest paid'
else 'regular salary'
end as salary_category
from employees
order by salary asc

create table coalesce_sample(firstname varchar(50), lastname varchar(50))

insert into coalesce_sample values('Akshat',null) , (null ,'aditya'),
(null,null)

select * from coalesce_sample

select coalesce(firstname,lastname) as name from coalesce_sample