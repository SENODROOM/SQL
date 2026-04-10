# SQL — DDL & Data Types

## Data Definition Language (DDL)

DDL commands define and manage the **structure** of database objects (databases, tables, indexes).

---

## CREATE DATABASE

```sql
CREATE DATABASE company_db;
USE company_db; -- MySQL/SQL Server
-- PostgreSQL: \c company_db
```

---

## Data Types

Different databases have slightly different type names. Here are the most common:

### Numeric Types
| Type | Description | Example |
|---|---|---|
| `INT` / `INTEGER` | Whole number | `42` |
| `SMALLINT` | Smaller integer | `100` |
| `BIGINT` | Large integer | `9000000000` |
| `DECIMAL(p,s)` | Exact decimal | `9.99` |
| `NUMERIC(p,s)` | Same as DECIMAL | `3.14` |
| `FLOAT` | Approximate float | `3.14159` |
| `REAL` | Smaller float | `1.5` |

### String Types
| Type | Description |
|---|---|
| `CHAR(n)` | Fixed-length string |
| `VARCHAR(n)` | Variable-length string |
| `TEXT` | Unlimited length text |
| `NVARCHAR(n)` | Unicode variable-length |

### Date & Time Types
| Type | Description |
|---|---|
| `DATE` | Date only (YYYY-MM-DD) |
| `TIME` | Time only (HH:MM:SS) |
| `DATETIME` | Date and time |
| `TIMESTAMP` | Date/time with timezone |
| `YEAR` | Year only |

### Other Types
| Type | Description |
|---|---|
| `BOOLEAN` / `BOOL` | True/false |
| `BLOB` | Binary large object |
| `JSON` | JSON data (PostgreSQL, MySQL 5.7+) |
| `UUID` | Universally unique identifier |
| `ENUM` | Predefined set of values |

---

## CREATE TABLE

```sql
CREATE TABLE employees (
    id          INT           PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50)   NOT NULL,
    last_name   VARCHAR(50)   NOT NULL,
    email       VARCHAR(100)  UNIQUE NOT NULL,
    salary      DECIMAL(10,2) DEFAULT 0.00,
    hire_date   DATE          NOT NULL,
    department  VARCHAR(50),
    is_active   BOOLEAN       DEFAULT TRUE,
    created_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);
```

---

## Constraints

| Constraint | Description |
|---|---|
| `PRIMARY KEY` | Uniquely identifies each row |
| `FOREIGN KEY` | References another table's primary key |
| `NOT NULL` | Column cannot be empty |
| `UNIQUE` | All values must be distinct |
| `DEFAULT` | Sets a default value |
| `CHECK` | Validates values against a condition |
| `AUTO_INCREMENT` | Auto-generates sequential numbers |

```sql
CREATE TABLE orders (
    order_id    INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    amount      DECIMAL(10,2) CHECK (amount > 0),
    status      ENUM('pending','shipped','delivered') DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
```

---

## ALTER TABLE

```sql
-- Add a column
ALTER TABLE employees ADD COLUMN phone VARCHAR(20);

-- Modify a column
ALTER TABLE employees MODIFY COLUMN phone VARCHAR(30);

-- Rename a column (MySQL 8+)
ALTER TABLE employees RENAME COLUMN phone TO mobile;

-- Drop a column
ALTER TABLE employees DROP COLUMN mobile;

-- Add constraint
ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary >= 0);
```

---

## DROP and TRUNCATE

```sql
-- Remove entire table (structure + data)
DROP TABLE employees;

-- Remove all data but keep structure
TRUNCATE TABLE employees;

-- Drop database
DROP DATABASE company_db;
```

---

## CREATE INDEX

```sql
-- Speeds up searches on email column
CREATE INDEX idx_email ON employees(email);

-- Unique index
CREATE UNIQUE INDEX idx_unique_email ON employees(email);

-- Composite index
CREATE INDEX idx_name ON employees(last_name, first_name);
```

---

## Summary

DDL is the foundation of any database. Choosing the right data types and constraints upfront ensures data integrity, storage efficiency, and query performance throughout your application's lifetime.
