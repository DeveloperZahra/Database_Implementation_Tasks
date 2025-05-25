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

| Property    | Meaning                                           | Real-life Example                                       |
| ----------- | ------------------------------------------------- | ------------------------------------------------------- |
| Atomicity   | All-or-nothing execution                          | ATM cash withdrawal (both deduct + dispense or neither) |
| Consistency | Maintain data validity and rules                  | Car must always have exactly one owner                  |
| Isolation   | No interference between simultaneous transactions | Two users trying to book the last flight seat           |
| Durability  | Committed changes stay even after a crash         | Online purchase remains saved even if system crashes    |
