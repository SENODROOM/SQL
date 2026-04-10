# SQL — Introduction

## What is SQL?

**SQL** (Structured Query Language) is the standard language for managing and manipulating **relational databases**. Pronounced "sequel" or "S-Q-L", it was developed in the early 1970s at IBM by Donald Chamberlin and Raymond Boyce, inspired by Edgar Codd's relational model.

SQL became an ANSI standard in 1986 and an ISO standard in 1987, and has remained the dominant database query language ever since.

---

## What is a Relational Database?

A relational database organizes data into **tables** (relations), which consist of:
- **Rows** (records/tuples) — individual data entries
- **Columns** (fields/attributes) — properties of the data

```
┌────┬──────────┬─────┬──────────┐
│ id │ name     │ age │ city     │
├────┼──────────┼─────┼──────────┤
│  1 │ Alice    │  30 │ Karachi  │
│  2 │ Bob      │  25 │ Lahore   │
│  3 │ Charlie  │  35 │ Islamabad│
└────┴──────────┴─────┴──────────┘
```

---

## SQL Sublanguages

SQL is divided into several sublanguages:

| Sublanguage | Purpose | Key Commands |
|---|---|---|
| **DDL** | Data Definition Language | `CREATE`, `ALTER`, `DROP`, `TRUNCATE` |
| **DML** | Data Manipulation Language | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |
| **DCL** | Data Control Language | `GRANT`, `REVOKE` |
| **TCL** | Transaction Control Language | `COMMIT`, `ROLLBACK`, `SAVEPOINT` |

---

## Popular SQL Databases

| Database | Description |
|---|---|
| **MySQL** | Most popular open-source RDBMS |
| **PostgreSQL** | Advanced open-source, feature-rich |
| **SQLite** | Lightweight, file-based |
| **Microsoft SQL Server** | Enterprise-grade from Microsoft |
| **Oracle Database** | Enterprise-grade, feature-heavy |
| **MariaDB** | MySQL fork, fully open-source |

---

## Your First SQL Query

```sql
SELECT * FROM employees;
```

This retrieves **all rows and columns** from the `employees` table.

```sql
SELECT name, age FROM employees WHERE city = 'Karachi';
```

This retrieves only `name` and `age` for employees in Karachi.

---

## Key Concepts

- **Primary Key** — Uniquely identifies each row in a table
- **Foreign Key** — Links rows in one table to rows in another
- **Index** — Speeds up data retrieval
- **Schema** — The structure/blueprint of a database
- **NULL** — Represents missing or unknown data
- **Constraint** — Rules enforced on data (e.g., NOT NULL, UNIQUE)

---

## SQL vs NoSQL

| Feature | SQL | NoSQL |
|---|---|---|
| Structure | Tables with fixed schema | Documents, key-value, graphs |
| Query Language | SQL | Varies (MQL, CQL, etc.) |
| ACID compliance | Strong | Often eventual consistency |
| Best for | Structured data, relationships | Flexible, high-volume data |

---

## Summary

SQL is the universal language of data. Whether you're building a small app or a large enterprise system, understanding SQL gives you the power to store, retrieve, and manage data efficiently in relational databases.
