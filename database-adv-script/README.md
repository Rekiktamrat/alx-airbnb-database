# Advanced SQL Joins – ALX Airbnb Database

## Objective
This task demonstrates advanced SQL querying with different JOIN types using the Airbnb database schema.

### Files
- **joins_queries.sql** – Contains SQL queries for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- **README.md** – Provides explanations and objectives for each query.

### Queries Included
1. **INNER JOIN** – Fetch all bookings with the users who made them.
2. **LEFT JOIN** – Fetch all properties with their reviews (including properties without reviews).
3. **FULL OUTER JOIN (via UNION)** – Fetch all users and all bookings, including unmatched records.


# Practice Subqueries – ALX Airbnb Database

## Objective
This task demonstrates the use of correlated and non-correlated subqueries to extract meaningful insights from the Airbnb database.

### Files
- **subqueries.sql** – Contains SQL queries implementing both correlated and non-correlated subqueries.
- **README.md** – Describes the purpose and logic behind each query.

---

## Queries Overview

### 1. Non-Correlated Subquery
**Goal:** Find all properties with an average rating greater than 4.0.

**SQL Logic:**
- A subquery in the `WHERE` clause calculates the average rating per property.
- The main query retrieves only those properties whose average rating exceeds 4.0.

```sql
SELECT p.id, p.name, p.location
FROM properties AS p
WHERE p.id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
