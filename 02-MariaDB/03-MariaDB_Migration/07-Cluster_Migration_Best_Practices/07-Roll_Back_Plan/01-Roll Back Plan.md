# 6. Rolling Back Plan
If there are major issues with the migration that cannot be resolved in a timely manner, we can roll back the migration. Following these steps
1. End all Target database dependencies and activities, such as running scripts and client connections.
2. List any remaining sessions, and kill them.
3. Shut down all listeners on the Target database.
4. Turn off automated jobs on the Target database. For your production database, check that this operation doesn’t influence the business logic.
5. Turn off time monitoring on queue messages on the Target database. For your production database, check that this operation doesn’t influence the business logic.
6. Execute a rollback.
By creating a task going in the opposite direction. Because all tables should be in sync between both databases, you only need to set up a CDC task (change data capture)
Now that the source and target databases are reversed.