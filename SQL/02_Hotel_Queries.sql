--You need to find the latest date. Think about MAX(date) or sorting by date and limiting the result.
SELECT u.user_id, u.name, b.room_no, b.booking_date
FROM (
  SELECT booking_id, room_no, user_id, booking_date,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) AS rn
  FROM bookings
) b
JOIN users u ON u.user_id = b.user_id
WHERE b.rn = 1;
