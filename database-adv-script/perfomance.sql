-- ===========================================
-- UNOPTIMIZED QUERY: Retrieve all bookings with user, property, and payment details
-- ===========================================

SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    pay.payment_date
FROM 
    bookings AS b
JOIN 
    users AS u ON b.user_id = u.id
JOIN 
    properties AS p ON b.property_id = p.id
JOIN 
    payments AS pay ON b.id = pay.booking_id
ORDER BY 
    b.start_date DESC;


-- ===========================================
-- OPTIMIZED QUERY: Improved version using indexing and selective joins
-- ===========================================

SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM 
    bookings AS b
INNER JOIN 
    users AS u ON b.user_id = u.id
INNER JOIN 
    properties AS p ON b.property_id = p.id
LEFT JOIN 
    payments AS pay ON b.id = pay.booking_id
WHERE 
    b.start_date >= '2024-01-01'
ORDER BY 
    b.start_date DESC;
