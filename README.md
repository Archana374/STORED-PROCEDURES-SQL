Overview
This project implements a simple Worker Management System using SQL. It includes the creation of a Worker table and several stored procedures to manage worker records, including adding workers, retrieving salaries, updating departments, counting workers in a department, and calculating average salaries.

Table Structure
Worker Table
The Worker table stores the following information about each worker:

Column Name	Data Type	Description
Worker_Id	INT	Unique identifier for each worker (Primary Key)
FirstName	CHAR(25)	Worker’s first name
LastName	CHAR(25)	Worker’s last name
Salary	INT	Worker’s salary
JoiningDate	DATETIME	Date and time when the worker joined
Department	CHAR(25)	Department where the worker is assigned
