# SQL Basics

## What is SQL?
SQL (Structured Query Language) is used to manage and manipulate databases. It helps you create, read, update, and delete data.

## Key Features
- Easy to read and write
- Works with relational databases
- Supports queries, filtering, and sorting

## Example
```sql
-- Create a table
CREATE TABLE Students (
    ID INT,
    Name VARCHAR(50)
);

-- Insert data
INSERT INTO Students (ID, Name) VALUES (1, 'Ali');

-- Select data
SELECT * FROM Students;
##Practice

Write a SQL query to select all students with ID less than 5.
