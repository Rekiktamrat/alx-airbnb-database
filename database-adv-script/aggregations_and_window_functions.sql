-- Aggregation Query: Total number of bookings made by each user
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


-- Window Function Query: Rank properties by total number of bookings
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM 
    properties AS p
LEFT JOIN 
    bookings AS b
ON 
    p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    booking_rank;


SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM 
    properties AS p
LEFT JOIN 
    bookings AS b
ON 
    p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    booking_rank;
