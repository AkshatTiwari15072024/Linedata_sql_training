--getting 4th highest salary

WITH RankedSalaries AS (
    SELECT 
        Salary,
        ROW_NUMBER() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM 
        Employees
)
SELECT 
    Salary
FROM 
    RankedSalaries
WHERE 
    SalaryRank = 4; 


SELECT 
    Salary
FROM 
    Employees
ORDER BY 
    Salary DESC
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY; 

select * from (select firstname, lastname, salary,hiredate, DENSE_RANK() over (order by salary desc) as [rank] from employees) as subquery where [rank] = 4