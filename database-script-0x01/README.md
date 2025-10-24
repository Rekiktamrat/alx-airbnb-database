# Airbnb Clone – Database Schema

## 📁 Files
- **schema.sql** – Defines all tables, keys, and constraints.
- **airbnb_erd.drawio** – Editable ER diagram (for future updates).
- **airbnb_erd.png** – Exported visual of the ERD.

## 🧩 Overview
This database schema supports the core features of an Airbnb-like platform:
- User management
- Property listings
- Bookings
- Reviews
- Amenities (many-to-many relationship)

## 🛠️ How to Run
1. Open MySQL or any SQL client.
2. Copy and paste the content of `schema.sql`.
3. Run it to create the database `airbnb_clone`.
4. Verify with:
   ```sql
   SHOW TABLES;
   DESCRIBE users;

