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
