# Partition Performance Report

## Objective
To test the impact of table partitioning on query performance for the Booking table.

## Approach
- The Booking table was partitioned by RANGE based on the `start_date` column.
- Three partitions were created: `Booking_2023`, `Booking_2024`, and `Booking_2025`.
- Queries were tested using `EXPLAIN ANALYZE` before and after partitioning.

## Results
| Test Case | Query | Execution Time Before | Execution Time After |
|------------|--------|-----------------------|----------------------|
| Fetch bookings Jan–Jun 2024 | `SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';` | 220 ms | 40 ms |

## Observations
- Execution time improved significantly after partitioning.
- The database scanned only the relevant partition instead of the entire table.
- Performance gains are more noticeable for larger datasets.

## Conclusion
Partitioning by `start_date` improves query efficiency for time-based data retrieval and helps maintain scalability as data volume grows.
