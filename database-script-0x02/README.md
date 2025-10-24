# Airbnb Clone – Database Seeding Script

## 📁 Files
- **seed.sql** – Inserts sample data into the Airbnb Clone database.

## 🧩 Overview
This script populates the `airbnb_clone` database with realistic sample data:
- 5 Users
- 5 Listings
- 6 Amenities
- 5 Bookings
- 3 Reviews
- Multiple Listing-Amenity relationships

## 🛠️ How to Run
1. Make sure you’ve already created the database using `schema.sql`.
2. Open MySQL or your SQL client and run:
   ```sql
   USE airbnb_clone;
   SOURCE path/to/seed.sql;

