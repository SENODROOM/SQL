# SQL — Joins & Relationships

## Understanding Relationships

Relational databases connect data across multiple tables using **keys**.

```sql
-- Parent table
CREATE TABLE departments (
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Child table
CREATE TABLE employees (
    id            INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(100),
    salary        DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
```

---

## Types of Joins

### INNER JOIN
Returns only rows that have **matching values in both tables**.

```sql
SELECT e.name, e.salary, d.name AS department
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```

```
Result: Only employees who have a valid department_id
```

---

### LEFT JOIN (LEFT OUTER JOIN)
Returns **all rows from the left table**, and matching rows from the right. NULLs for non-matches.

```sql
SELECT e.name, d.name AS department
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;
```

```
Result: All employees, even those with no department (NULL)
```

---

### RIGHT JOIN (RIGHT OUTER JOIN)
Returns **all rows from the right table**, and matching rows from the left.

```sql
SELECT e.name, d.name AS department
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;
```

```
Result: All departments, even those with no employees
```

---

### FULL OUTER JOIN
Returns **all rows from both tables**, NULLs where no match.

```sql
SELECT e.name, d.name AS department
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id;
-- Note: MySQL doesn't support FULL OUTER JOIN natively
-- Emulate with: LEFT JOIN UNION RIGHT JOIN
```

---

### CROSS JOIN
Returns the **Cartesian product** — every row of table A paired with every row of table B.

```sql
SELECT e.name, d.name
FROM employees e
CROSS JOIN departments d;
-- Rarely used — can produce huge result sets
```

---

### SELF JOIN
A table joined with **itself** — useful for hierarchical data.

```sql
-- Employees with their managers
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;
```

---

## Multi-Table Joins

```sql
SELECT
    o.order_id,
    c.name AS customer,
    p.name AS product,
    oi.quantity,
    oi.price
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.id
WHERE o.status = 'delivered'
ORDER BY o.order_id;
```

---

## Subqueries

A query nested inside another query.

```sql
-- Employees earning above average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Employees in departments with more than 10 people
SELECT name FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 10
);
```

---

## UNION and UNION ALL

Combines results from multiple SELECT statements.

```sql
-- UNION: removes duplicates
SELECT name FROM employees
UNION
SELECT name FROM contractors;

-- UNION ALL: keeps all rows including duplicates
SELECT name FROM employees
UNION ALL
SELECT name FROM contractors;
```

---

## Common Table Expressions (CTEs)

Named temporary result sets for cleaner queries.

```sql
WITH high_earners AS (
    SELECT name, salary, department_id
    FROM employees
    WHERE salary > 70000
),
dept_counts AS (
    SELECT department_id, COUNT(*) AS count
    FROM employees
    GROUP BY department_id
)
SELECT h.name, h.salary, d.count
FROM high_earners h
JOIN dept_counts d ON h.department_id = d.department_id;
```

---

## Summary

Joins are the most powerful feature of relational databases. They allow you to model complex real-world relationships and query across multiple tables efficiently, making SQL far more expressive than simple single-table lookups.
