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



# Aggregations and Window Functions – ALX Airbnb Database

## Objective
This task demonstrates the use of SQL aggregation and window functions to analyze and rank Airbnb data efficiently.

### Files
- **aggregations_and_window_functions.sql** – SQL queries implementing aggregations and window functions.
- **README.md** – Documentation explaining the logic behind each query.

---

## Queries Overview

### 1. Aggregation Query
**Goal:** Find the total number of bookings made by each user.

**SQL Logic:**
- Uses the `COUNT()` function with `GROUP BY` to aggregate total bookings.
- Includes users with no bookings using `LEFT JOIN`.
- Orders the results from the most to the least active users.

```sql
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    COUNT(b.id) AS total_bookings
FROM 
    users AS u
LEFT JOIN 
    bookings AS b
ON 
    u.id = b.user_id
GROUP BY 
    u.id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;


