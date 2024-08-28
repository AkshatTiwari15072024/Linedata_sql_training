--deadlocks transaction 1
Begin Tran
Update TableA Set Name = 'Mark Transaction 1' where Id = 1


Update TableB Set Name = 'Mary Transaction 1' where Id = 1

Commit Transaction
