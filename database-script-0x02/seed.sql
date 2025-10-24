-- ==========================================================
-- Airbnb Clone Database Seed Data
-- Author: Rekik Tamrat
-- Project: ALX Airbnb Database (database-script-0x02)
-- Description: Populates the airbnb_clone database with sample data.
-- ==========================================================

USE airbnb_clone;

-- ==========================================================
-- 1. USERS
-- ==========================================================
INSERT INTO users (full_name, email, password, phone_number)
VALUES
('Rekik Tamrat', 'rekik@example.com', 'hashed_password_1', '+251912345678'),
('Blessing Olagbegi', 'blessing@example.com', 'hashed_password_2', '+2348012345678'),
('Kaabo Yvette', 'yvette@example.com', 'hashed_password_3', '+22961234567'),
('Halimat Olakitan', 'halimat@example.com', 'hashed_password_4', '+2348098765432'),
('Manzouri Ahmed', 'manzouri@example.com', 'hashed_password_5', '+212612345678');

-- ==========================================================
-- 2. LISTINGS
-- ==========================================================
INSERT INTO listings (user_id, title, description, price, location)
VALUES
(1, 'Cozy Apartment in Addis Ababa', 'Modern apartment near Bole airport.', 45.00, 'Addis Ababa'),
(2, 'Beachside Villa in Lagos', 'Luxury villa with ocean view.', 120.00, 'Lagos, Nigeria'),
(3, 'City Loft in Cotonou', 'Minimalist loft in city center.', 70.00, 'Cotonou, Benin'),
(4, 'Historic Home in Marrakech', 'Traditional riad with garden.', 90.00, 'Marrakech, Morocco'),
(5, 'Luxury Condo in Casablanca', 'Stylish condo with pool access.', 150.00, 'Casablanca, Morocco');

-- ==========================================================
-- 3. AMENITIES
-- ==========================================================
INSERT INTO amenities (name)
VALUES
('Wi-Fi'),
('Air Conditioning'),
('Swimming Pool'),
('Kitchen'),
('Washer'),
('TV');

-- ==========================================================
-- 4. LISTING_AMENITIES
-- ==========================================================
INSERT INTO listing_amenities (listing_id, amenity_id)
VALUES
(1, 1), (1, 4), (1, 6),
(2, 1), (2, 2), (2, 3), (2, 5),
(3, 1), (3, 4),
(4, 1), (4, 3), (4, 5),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 6);

-- ==========================================================
-- 5. BOOKINGS
-- ==========================================================
INSERT INTO bookings (listing_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 2, '2025-11-01', '2025-11-05', 180.00, 'confirmed'),
(2, 3, '2025-11-10', '2025-11-14', 480.00, 'pending'),
(3, 1, '2025-11-02', '2025-11-06', 280.00, 'confirmed'),
(4, 5, '2025-12-01', '2025-12-03', 180.00, 'cancelled'),
(5, 4, '2025-12-10', '2025-12-15', 750.00, 'confirmed');

-- ==========================================================
-- 6. REVIEWS
-- ==========================================================
INSERT INTO reviews (booking_id, rating, comment)
VALUES
(1, 5, 'Excellent stay! Very clean and cozy.'),
(3, 4, 'Good location and friendly host.'),
(5, 5, 'Fantastic experience — highly recommend.');

-- ==========================================================
-- End of Seed Script
-- ==========================================================
