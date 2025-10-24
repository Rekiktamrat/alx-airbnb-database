-- ==========================================================
-- Airbnb Clone Database Schema
-- Author: Rekik Tamrat
-- Project: ALX Airbnb Database (database-script-0x01)
-- Description: Defines the database structure for the Airbnb clone.
-- ==========================================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS airbnb_clone CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE airbnb_clone;

-- ==========================================================
-- 2. USERS TABLE
-- ==========================================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);

-- ==========================================================
-- 3. LISTINGS TABLE
-- ==========================================================
CREATE TABLE listings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    location VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_listings_location ON listings(location);

-- ==========================================================
-- 4. BOOKINGS TABLE
-- ==========================================================
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    listing_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) CHECK (total_price >= 0),
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (listing_id) REFERENCES listings(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT chk_date_range CHECK (end_date > start_date)
);

CREATE INDEX idx_bookings_status ON bookings(status);

-- ==========================================================
-- 5. REVIEWS TABLE
-- ==========================================================
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE
);

-- ==========================================================
-- 6. AMENITIES TABLE
-- ==========================================================
CREATE TABLE amenities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================================
-- 7. LISTING_AMENITIES (Join Table for Many-to-Many)
-- ==========================================================
CREATE TABLE listing_amenities (
    listing_id INT NOT NULL,
    amenity_id INT NOT NULL,
    PRIMARY KEY (listing_id, amenity_id),
    FOREIGN KEY (listing_id) REFERENCES listings(id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenities(id) ON DELETE CASCADE
);

-- ==========================================================
-- End of Schema
-- ==========================================================

