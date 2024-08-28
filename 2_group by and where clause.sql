--Group by and where clause

select Department ,JobTitle, Sum(Salary) as total_salary from employees
group by Department, JobTitle
having JobTitle = 'Software Engineer'


select Department ,JobTitle, Sum(Salary) as total_salary from employees
where JobTitle = 'Software Engineer'
group by Department, JobTitle