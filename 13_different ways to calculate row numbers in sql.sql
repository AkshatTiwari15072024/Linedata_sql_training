--different ways to calculate row numbers in sql server

SELECT 
    ROW_NUMBER() OVER (ORDER BY salary) AS RowNumber,
    firstname, lastname
FROM 
    employees


SELECT 
    ROW_NUMBER() OVER (PARTITION BY hiredate ORDER BY salary) AS RowNumber,
    firstname, lastname
FROM 
    employees


SELECT 
    RANK() OVER (ORDER BY salary) AS RankNumber,
    firstname,lastname
FROM 
    employees

SELECT 
    DENSE_RANK() OVER (ORDER BY hiredate) AS DenseRankNumber,
    lastname, firstname, salary
FROM 
    employees

SELECT 
    NTILE(3) OVER (ORDER BY Salary) AS BucketNumber,
    firstname,lastname
FROM 
    employees

