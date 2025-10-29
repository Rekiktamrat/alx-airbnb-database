CREATE TABLE booking_backup AS
SELECT * FROM Booking;
DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (property_id) REFERENCES Property(id)
)
PARTITION BY RANGE (start_date);


CREATE TABLE Booking_2023 PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
INSERT INTO Booking (id, user_id, property_id, start_date, end_date, total_price, status)
SELECT id, user_id, property_id, start_date, end_date, total_price, status
FROM booking_backup;


EXPLAIN ANALYZE
SELECT * FROM booking_backup
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';


EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
