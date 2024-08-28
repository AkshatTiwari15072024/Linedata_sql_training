 --clustered vs non clustered index

 CREATE table employee2 (
Emp_id int, 
name VARCHAR(20), 
country VARCHAR(20),
 Salary INT);


INSERT INTO employee2(Emp_id, name, country, Salary)
values (101, 'Mohit', 'India', 60000),
 (103, 'Anish', 'England', 70000),
 (104, 'Shubham', 'France', 100000),
 (102, 'Danish', 'Sweden', 40000),
 (105, 'Vivek', 'Wales', 50000),
 (106, 'Rohan', 'Scotland', 30000);

 select * from employee2

 create clustered index ix_employee2_salary_country on employee2(salary ASC, country DESC)

 create nonclustered index ix_unclustered_employee on employee2(name)