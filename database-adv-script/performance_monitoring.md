# Database Performance Monitoring and Refinement Report

## Objective
To monitor and improve database performance by analyzing query execution plans and making schema-level optimizations.

## Approach
We analyzed frequently used queries from the Airbnb database, using `EXPLAIN ANALYZE` to identify bottlenecks and suggest improvements.

---

## Query 1: Fetch user booking counts
```sql
SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM Users u
JOIN Booking b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;











SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM Users u
JOIN Booking b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;


SET profiling = 1;

SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM Users u
JOIN Booking b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

SHOW PROFILES;
SHOW PROFILE FOR QUERY 1;


EXPLAIN ANALYZE
SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM Users u
JOIN Booking b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;


-- Add index on frequently used JOIN and filter columns
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- If sorting by total bookings frequently
CREATE INDEX idx_booking_start_date ON Booking(start_date);
