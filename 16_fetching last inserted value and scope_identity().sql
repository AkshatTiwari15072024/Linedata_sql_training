--fetching last inserted value and scope_identity()
create table sample1(id int identity(1,1), [name] varchar(50))

insert into sample1 values('akshat'),('bhargav'), ('aditya')

SELECT SCOPE_IDENTITY() AS LastInsertedID; -- same session same scope

select @@IDENTITY as lastinsertedid --same session any scope

select IDENT_CURRENT('sample1') as last --specific table across any session any scope