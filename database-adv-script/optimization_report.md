# Query Optimization Report – ALX Airbnb Database

## Objective
To analyze and optimize a complex SQL query that retrieves booking, user, property, and payment information. The goal is to reduce query execution time and improve performance through indexing and query refactoring.

---

## 1️⃣ Initial Query Overview
The initial query retrieved all bookings with detailed user, property, and payment information using multiple joins.

### SQL:
```sql
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status,
    pay.payment_date
FROM bookings AS b
JOIN users AS u ON b.user_id = u.id
JOIN properties AS p ON b.property_id = p.id
JOIN payments AS pay ON b.id = pay.booking_id
ORDER BY b.start_date DESC;


SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM bookings AS b
INNER JOIN users AS u ON b.user_id = u.id
INNER JOIN properties AS p ON b.property_id = p.id
LEFT JOIN payments AS pay ON b.id = pay.booking_id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date DESC;
