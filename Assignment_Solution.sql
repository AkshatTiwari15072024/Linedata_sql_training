--SQL ASSIGNMENT

create database test

use test

create table sales(
SaleID int Primary Key,
SalesRepID int,
Amount int,
SaleDate date
)

create table SalesReps(
SalesRepID int Primary Key,
[Name] varchar(50)
)


insert into sales values
    (1, 101, 500, '2024-07-01'),
    (2, 102, 750, '2024-07-02'),
    (3, 103, 1000, '2024-07-03'),
    (4, 104, 600, '2024-07-04'),
    (5, 101, 1200, '2024-08-05'),
    (6, 102, 800, '2024-08-06'),
    (7, 103, 950, '2024-08-07'),
    (8, 104, 700, '2024-08-08'),
    (9, 101, 1100, '2024-07-09'),
    (10, 102, 850, '2024-07-10'),
	(11, 103, 656, '2024-07-11'),
	(12, 104, 345, '2024-07-12'),
	(13, 101, 678, '2024-08-13'),
	(14, 102, 789, '2024-08-14'),
	(15, 103, 237, '2024-08-15'),
	(16, 104, 1134, '2024-08-16');


select * from sales

insert into SalesReps values
    ( 101,'Aditya'),
    (102,'Bhagat'),
    (103, 'Ram'),
    (104, 'Don');

select *  from SalesReps

alter table sales add constraint foreignkey_salesrepid_FR
foreign key (salesrepid) references salesreps(salesrepid)


    SELECT
        SalesReps.SalesRepID,
        SalesReps.Name AS SalesRepName,
		Dense_RANK() OVER (PARTITION BY DATEADD(MONTH, DATEDIFF(MONTH, 0, sales.saledate), 0) ORDER BY SUM(sales.amount) DESC) AS SalesRank,
        --DATEADD(MONTH, DATEDIFF(MONTH, 0, sales.SaleDate), 0) AS MonthYear,

        SUM(sales.Amount) AS TotalSales,
		AVG(sales.Amount) AS AverageSalesPerMonth
    FROM
        Sales 
    INNER JOIN
        SalesReps ON sales.SalesRepID = SalesReps.SalesRepID
    GROUP BY
        salesreps.SalesRepID,
        SalesReps.Name,
        --DATEADD(MONTH, DATEDIFF(MONTH, 0, sales.SaleDate), 0);


		select 
	month(SaleDate) from sales as monthss
	
