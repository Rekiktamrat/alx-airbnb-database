# Indexing for Optimization – ALX Airbnb Database

## Objective
This task focuses on improving query performance by identifying and creating indexes for high-usage columns in the Users, Bookings, and Properties tables.

---

## 1️⃣ Identified High-Usage Columns

| Table | Column | Usage Context |
|--------|---------|----------------|
| `users` | `email` | Used in login and search queries |
| `bookings` | `user_id` | Used in JOINs with `users` |
| `bookings` | `property_id` | Used in JOINs with `properties` |
| `bookings` | `start_date` | Used in date range filters |
| `properties` | `location` | Used in property search filters |
| `properties` | `host_id` | Used in JOINs with `users` (hosts) |

---

## 2️⃣ Index Creation Commands

Indexes created in the **database_index.sql** file:

```sql
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_properties_location ON properties (location);
CREATE INDEX idx_properties_host_id ON properties (host_id);
