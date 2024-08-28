--deadlock transaction -2 


-- Transaction 2
Begin Tran
Update TableB Set Name = 'Mark Transaction 2' where Id = 1

Update TableA Set Name = 'Mary Transaction 2' where Id = 1

Commit Transaction
