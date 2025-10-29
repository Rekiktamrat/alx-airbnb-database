-- Non-Correlated Subquery: Properties with average rating > 4.0
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location
FROM 
    properties AS p
WHERE 
    p.id IN (
        SELECT 
            r.property_id
        FROM 
            reviews AS r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );


-- Correlated Subquery: Users with more than 3 bookings
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    users AS u
WHERE 
    (
        SELECT 
            COUNT(*) 
        FROM 
            bookings AS b
        WHERE 
            b.user_id = u.id
    ) > 3;
