# SQL — DML: Querying & Manipulating Data

## INSERT — Adding Data

```sql
-- Insert a single row
INSERT INTO employees (first_name, last_name, email, salary, hire_date)
VALUES ('Alice', 'Khan', 'alice@example.com', 75000.00, '2023-01-15');

-- Insert multiple rows
INSERT INTO employees (first_name, last_name, email, salary, hire_date)
VALUES
    ('Bob', 'Smith', 'bob@example.com', 65000.00, '2023-03-01'),
    ('Carol', 'Jones', 'carol@example.com', 80000.00, '2022-11-20');

-- Insert from another table
INSERT INTO archive_employees
SELECT * FROM employees WHERE is_active = FALSE;
```

---

## SELECT — Retrieving Data

```sql
-- All columns
SELECT * FROM employees;

-- Specific columns
SELECT first_name, last_name, salary FROM employees;

-- With alias
SELECT first_name AS "First Name", salary * 12 AS annual_salary
FROM employees;

-- Distinct values
SELECT DISTINCT department FROM employees;

-- Limit rows
SELECT * FROM employees LIMIT 10;
SELECT * FROM employees LIMIT 10 OFFSET 20; -- pagination
```

---

## WHERE — Filtering

```sql
-- Comparison operators
SELECT * FROM employees WHERE salary > 60000;
SELECT * FROM employees WHERE department = 'Engineering';
SELECT * FROM employees WHERE hire_date >= '2023-01-01';

-- Logical operators
SELECT * FROM employees
WHERE salary > 50000 AND department = 'Marketing';

SELECT * FROM employees
WHERE department = 'HR' OR department = 'Finance';

SELECT * FROM employees WHERE NOT is_active;

-- IN operator
SELECT * FROM employees
WHERE department IN ('Engineering', 'Marketing', 'Sales');

-- BETWEEN
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 80000;

-- LIKE (pattern matching)
SELECT * FROM employees WHERE first_name LIKE 'A%';   -- starts with A
SELECT * FROM employees WHERE email LIKE '%@gmail.com'; -- ends with
SELECT * FROM employees WHERE last_name LIKE '_mith';   -- one char wildcard

-- NULL checks
SELECT * FROM employees WHERE department IS NULL;
SELECT * FROM employees WHERE department IS NOT NULL;
```

---

## ORDER BY — Sorting

```sql
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY last_name ASC, first_name ASC;
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;
```

---

## UPDATE — Modifying Data

```sql
-- Update one column
UPDATE employees SET salary = 85000 WHERE id = 1;

-- Update multiple columns
UPDATE employees
SET salary = 90000, department = 'Leadership'
WHERE email = 'alice@example.com';

-- Update with calculation
UPDATE employees SET salary = salary * 1.10
WHERE department = 'Engineering';
```

> ⚠️ **Always use WHERE with UPDATE** — otherwise all rows are updated!

---

## DELETE — Removing Data

```sql
-- Delete specific rows
DELETE FROM employees WHERE id = 5;

-- Delete with condition
DELETE FROM employees WHERE is_active = FALSE;

-- Delete all rows (keeps table structure)
DELETE FROM employees;
```

---

## Aggregate Functions

```sql
SELECT COUNT(*) FROM employees;                       -- Total count
SELECT COUNT(DISTINCT department) FROM employees;     -- Unique depts

SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT SUM(salary) FROM employees;
```

---

## GROUP BY and HAVING

```sql
-- Count employees per department
SELECT department, COUNT(*) AS headcount
FROM employees
GROUP BY department;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- HAVING filters groups (like WHERE but for aggregates)
SELECT department, COUNT(*) AS headcount
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

---

## Summary

DML is the heart of SQL. `SELECT` with filtering, sorting, grouping, and aggregation covers the vast majority of real-world database interactions.
