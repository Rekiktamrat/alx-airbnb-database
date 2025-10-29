-- =========================
-- DATABASE INDEX CREATION
-- =========================
-- Author: Rekik Tamrat
-- Project: ALX Airbnb Database - Advanced Querying
-- Task 3: Implement Indexes for Optimization
-- =========================

-- 1️⃣ Index on Users table for quick lookup by email
CREATE INDEX idx_users_email
ON users (email);

-- 2️⃣ Index on Bookings table for faster joins with Users
CREATE INDEX idx_bookings_user_id
ON bookings (user_id);

-- 3️⃣ Index on Bookings table for faster joins with Properties
CREATE INDEX idx_bookings_property_id
ON bookings (property_id);

-- 4️⃣ Index on Bookings table for efficient date range queries
CREATE INDEX idx_bookings_start_date
ON bookings (start_date);

-- 5️⃣ Index on Properties table for filtering by location
CREATE INDEX idx_properties_location
ON properties (location);

-- 6️⃣ Index on Properties table for host lookups
CREATE INDEX idx_properties_host_id
ON properties (host_id);



-- Before adding indexes
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 3;

-- After adding indexes
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 3;
