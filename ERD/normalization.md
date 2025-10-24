# Airbnb Database Normalization

## Objective
To ensure the Airbnb database design follows the **Third Normal Form (3NF)** by eliminating redundancies, ensuring data integrity, and improving scalability.

---

## Step 1: First Normal Form (1NF)
**Rule:**  
Each column must contain atomic (indivisible) values, and each record must be unique.

**Application:**
- All tables (User, Property, Booking, Payment, Review, Message) have unique primary keys.
- Each attribute holds atomic data (no repeating groups or arrays).
- ✅ **Result:** Database is in 1NF.

---

## Step 2: Second Normal Form (2NF)
**Rule:**  
All non-key attributes must depend on the **entire primary key** (not part of it).

**Application:**
- Each table’s primary key is a single column (e.g., `user_id`, `property_id`, etc.).
- No partial dependency exists since there are no composite keys.
- ✅ **Result:** Database is in 2NF.

---

## Step 3: Third Normal Form (3NF)
**Rule:**  
No transitive dependencies — non-key attributes must depend only on the primary key.

**Application:**
- In `User`, all attributes depend only on `user_id`.
- In `Property`, attributes (name, description, pricepernight, etc.) depend only on `property_id`.
- In `Booking`, attributes (start_date, end_date, total_price, status) depend on `booking_id` — not indirectly through `property_id` or `user_id`.
- In `Payment`, attributes depend on `payment_id` only.
- In `Review` and `Message`, all fields depend solely on their primary keys.
- ✅ **Result:** Database is in 3NF — no transitive dependencies found.

---

## Summary
| Table | Normalization Level | Notes |
|--------|---------------------|-------|
| User | 3NF | Atomic fields, unique email |
| Property | 3NF | Linked via host_id (FK) |
| Booking | 3NF | Fully dependent on booking_id |
| Payment | 3NF | Each payment linked to one booking |
| Review | 3NF | Each review linked to user and property |
| Message | 3NF | Sender and recipient handled via FK |

---

## Conclusion
The database design satisfies all conditions of **Third Normal Form (3NF)**.  
No further decomposition is necessary. The schema is optimized for data integrity and minimal redundancy.

