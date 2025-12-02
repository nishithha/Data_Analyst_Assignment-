-- Users
CREATE TABLE users (
  user_id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(100),
  phone_number VARCHAR(30),
  mail_id VARCHAR(255),
  billing_address TEXT
);

-- Bookings
CREATE TABLE bookings (
  booking_id VARCHAR(50) PRIMARY KEY,
  booking_date DATETIME,
  room_no VARCHAR(50),
  user_id VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Items (menu)
CREATE TABLE items (
  item_id VARCHAR(50) PRIMARY KEY,
  item_name VARCHAR(255),
  item_rate DECIMAL(10,2)
);

-- Booking commercials (line items tied to a bill)
CREATE TABLE booking_commercials (
  id VARCHAR(80) PRIMARY KEY,
  booking_id VARCHAR(50),
  bill_id VARCHAR(50),
  bill_date DATETIME,
  item_id VARCHAR(50),
  item_quantity INT,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
  FOREIGN KEY (item_id) REFERENCES items(item_id)
);
-- users (sample)
INSERT INTO users(user_id, name, phone_number, mail_id, billing_address) VALUES
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@example.com', 'XX, Street Y, ABC City');

-- bookings (sample)
INSERT INTO bookings(booking_id, booking_date, room_no, user_id) VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-q034-q4o',   '2021-09-23 12:00:00', 'rm-xxxx-xxxx', '21wrcxuy-67erfn');  -- example second booking row seen

-- items (sample)
INSERT INTO items(item_id, item_name, item_rate) VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18.00),
('itm-a07vh-aer8','Mix Veg',      89.00),
('itm-w978-23u4', 'Some Other Item', 25.00); -- added because screenshot showed a third item id on one bill

-- booking_commercials (sample lines)
-- quantities inferred from the screenshot (first two lines quantity = 1, third line shows 37 in image)
INSERT INTO booking_commercials(id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 1),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('134lr-ovfo8-3qk4', 'bk-q034-q4o',   'bl-34ghd-r7h8', '2021-09-23 12:05:37', 'itm-w978-23u4', 37);
