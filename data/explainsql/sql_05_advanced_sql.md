# SQL — Advanced SQL: Transactions, Views, Functions & Optimization

## Transactions

A transaction is a sequence of SQL statements executed as a **single unit**. Either all succeed or all fail (ACID properties).

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE id = 1;
UPDATE accounts SET balance = balance + 500 WHERE id = 2;

-- If everything is fine:
COMMIT;

-- If something goes wrong:
ROLLBACK;
```

### Savepoints
```sql
START TRANSACTION;

INSERT INTO orders (customer_id, amount) VALUES (1, 200);
SAVEPOINT after_order;

INSERT INTO payments (order_id, amount) VALUES (LAST_INSERT_ID(), 200);
-- Something went wrong with payment:
ROLLBACK TO after_order;

COMMIT;
```

### ACID Properties
| Property | Meaning |
|---|---|
| **Atomicity** | All or nothing |
| **Consistency** | Data remains valid |
| **Isolation** | Transactions don't interfere |
| **Durability** | Committed changes survive crashes |

---

## Views

A **view** is a saved SELECT query treated as a virtual table.

```sql
-- Create a view
CREATE VIEW employee_summary AS
SELECT
    e.id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    d.name AS department,
    e.salary
FROM employees e
JOIN departments d ON e.department_id = d.id;

-- Query the view like a table
SELECT * FROM employee_summary WHERE department = 'Engineering';

-- Update the view
CREATE OR REPLACE VIEW employee_summary AS ...;

-- Delete the view
DROP VIEW employee_summary;
```

---

## Window Functions

Window functions perform calculations across related rows **without collapsing them** into groups.

```sql
-- Running total of salary
SELECT
    name,
    salary,
    SUM(salary) OVER (ORDER BY hire_date) AS running_total
FROM employees;

-- Rank employees by salary within department
SELECT
    name,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_in_dept
FROM employees;

-- Compare each employee to dept average
SELECT
    name,
    salary,
    AVG(salary) OVER (PARTITION BY department_id) AS dept_avg,
    salary - AVG(salary) OVER (PARTITION BY department_id) AS diff_from_avg
FROM employees;
```

### Common Window Functions
| Function | Description |
|---|---|
| `ROW_NUMBER()` | Unique row number |
| `RANK()` | Rank with gaps |
| `DENSE_RANK()` | Rank without gaps |
| `LAG(col, n)` | Value from n rows before |
| `LEAD(col, n)` | Value from n rows ahead |
| `FIRST_VALUE()` | First value in window |
| `LAST_VALUE()` | Last value in window |
| `NTILE(n)` | Divide into n buckets |

---

## Stored Procedures

```sql
DELIMITER //
CREATE PROCEDURE give_raise(
    IN dept_name VARCHAR(50),
    IN raise_pct DECIMAL(5,2)
)
BEGIN
    UPDATE employees
    SET salary = salary * (1 + raise_pct / 100)
    WHERE department_id = (
        SELECT id FROM departments WHERE name = dept_name
    );
    
    SELECT ROW_COUNT() AS affected_rows;
END //
DELIMITER ;

-- Call it
CALL give_raise('Engineering', 10);
```

---

## Triggers

Automatically execute SQL when a table event occurs.

```sql
CREATE TRIGGER log_salary_change
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO salary_audit (employee_id, old_salary, new_salary, changed_at)
        VALUES (NEW.id, OLD.salary, NEW.salary, NOW());
    END IF;
END;
```

---

## Query Optimization

### Use EXPLAIN
```sql
EXPLAIN SELECT * FROM employees WHERE salary > 50000;
-- Shows how MySQL executes the query
```

### Indexing Tips
```sql
-- Index columns used in WHERE, JOIN, ORDER BY
CREATE INDEX idx_dept_salary ON employees(department_id, salary);

-- Composite index order matters: most selective column first
CREATE INDEX idx_search ON products(category_id, price, name);
```

### Performance Tips
1. **Avoid `SELECT *`** — only fetch needed columns
2. **Use indexes** on frequently searched columns
3. **Avoid functions on indexed columns** in WHERE clauses
4. **Use JOINs instead of subqueries** where possible
5. **Paginate large results** with LIMIT/OFFSET
6. **Normalize** to reduce redundancy; **denormalize** for read-heavy workloads
7. **Use query caching** where supported
8. **Partition large tables** for better performance

---

## Summary

Advanced SQL — transactions, views, window functions, stored procedures, and optimization — elevates you from writing basic queries to architecting robust, high-performance database systems. These tools are essential for production applications at scale.
