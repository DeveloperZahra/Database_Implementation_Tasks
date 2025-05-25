# Self-Discovery & Applied Exploration

  * What is a Subquery?
	
 A subquery (also called a nested query or inner query) is a SQL query that is embedded inside another query. It allows you to perform intermediate calculations or filtering, and then use the result in the main (outer) query.

A subquery is usually placed inside parentheses ( ).

It can return:

* A single value (scalar)

* A single row

* A table (multiple rows and columns)


* Where Can We Use Subqueries?

Subqueries can be used in several SQL clauses:

| Clause          | Purpose                           |
| --------------- | --------------------------------- |
| `SELECT`        | Add calculated or constant values |
| `WHERE`         | Filter rows using other queries   |
| `FROM`          | Create temporary result sets      |
| `HAVING`        | Filter groups                     |
| `UPDATE/DELETE` | Modify data based on conditions   |

-------------------------------------
* What is a SQL Transaction?

A SQL transaction is a sequence of one or more SQL statements that are executed as a single unit.
Transactions ensure that either all operations succeed or none of them do — this is critical for maintaining data integrity.

* How to Write Transaction Blocks?

 use the following SQL keywords:

🔹 BEGIN TRANSACTION

Starts the transaction block.

🔹 COMMIT

Saves all the changes made in the transaction permanently.

🔹 ROLLBACK

Cancels all changes made in the transaction if something goes wrong

-----------------------
* ACID Properties Exploration:

1. __**Atomicity**__  – All operations in the transaction are treated as a single unit. If one fails, all are rolled back.

2. __**Consistency**__  – The database moves from one valid state to another.

3. __**Isolation**__  – Transactions do not interfere with each other.

4. __**Durability**__  – Once committed, changes are saved even if the system crashes.