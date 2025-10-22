# ER Diagram – Airbnb Database

## Description
This ERD represents the database design for an Airbnb-like platform, including entities such as User, Property, Booking, Payment, Review, and Message.

## Files
- airbnb_erd.drawio – Editable ER diagram


## Relationships
- User → Property (1:M)
- User → Booking (1:M)
- Property → Booking (1:M)
- Booking → Payment (1:1)
- Property → Review (1:M)
- User → Review (1:M)
- User ↔ Message (1:M both ways)

