-- Initial (unoptimized) complex query for bookings, users, properties, and payments

SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.start_date,
    b.end_date
FROM Booking b
JOIN Users u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;


EXPLAIN ANALYZE
SELECT ... (same query above);
-- The above query may show performance issues due to multiple joins and lack of indexing.

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);


SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM Booking b
INNER JOIN Users u USING (user_id)
INNER JOIN Property p USING (property_id)
LEFT JOIN Payment pay USING (booking_id);


EXPLAIN ANALYZE
SELECT ... (optimized query);
