 --CAST AND CONVERT

 Select employeeId, firstName, jobtitle, CAST(HireDate as nvarchar) as Convertedhiredate
from Employees

 Select employeeId, firstName, jobtitle, CAST(HireDate as nvarchar(5)) as Convertedhiredate
from Employees

 Select employeeId, firstName, jobtitle, Convert(nvarchar(8), HireDate) as Convertedhiredate
from Employees

Select employeeId, firstName, jobtitle, Convert(nvarchar, HireDate, 103) as Convertedhiredate
from Employees

Select employeeId, firstName, jobtitle, Convert(nvarchar, HireDate, 101) as Convertedhiredate
from Employees

Select employeeId, firstName, firstname + ' - ' + CAST(employeeid as nvarchar) as [Name - ID]from Employees