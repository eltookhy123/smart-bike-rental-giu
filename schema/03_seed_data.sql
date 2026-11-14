-- =========================================
-- SMART BIKE RENTAL
-- 03_seed_data.sql
-- =========================================

-- 1. STATIONS
INSERT INTO stations (station_id, name, latitude, longitude, capacity)
VALUES
(1, 'GIU Campus', 30.1130000, 31.6110000, 50),
(2, 'Monorail Station', 30.1050000, 31.6200000, 30);


-- 2. USERS
INSERT INTO users
(user_id, giu_id, full_name, email, password_hash, role)
VALUES
(1, 'GIU1001', 'Ahmed Hassan', 'ahmed.test@example.com', 'hashed_password_1', 'student'),
(2, 'GIU1002', 'Mariam Ali', 'mariam.test@example.com', 'hashed_password_2', 'student'),
(3, 'GIU1003', 'Omar Khaled', 'omar.test@example.com', 'hashed_password_3', 'staff');


-- 3. GEOFENCES
INSERT INTO geofences
(geofence_id, name, boundary_coordinates, is_active)
VALUES
(1, 'GIU Permitted Area', 'POLYGON coordinates for GIU campus and monorail area', TRUE);


-- 4. BIKES
INSERT INTO bikes (bike_id, model, type, status, station_id)
VALUES
(1, 'City Bike A1', 'Standard', 'available', 1),
(2, 'City Bike A2', 'Standard', 'available', 1),
(3, 'Electric Bike B1', 'Electric', 'rented', 2);


-- 5. PAYMENT METHODS
INSERT INTO payment_methods
(payment_method_id, user_id, provider_token, card_brand,
 last_four_digits, expiry_month, expiry_year, is_default)
VALUES
(1, 1, 'test_token_001', 'Visa', '1234', 12, 2028, TRUE),
(2, 2, 'test_token_002', 'Mastercard', '5678', 6, 2029, TRUE);


-- 6. RENTALS
INSERT INTO rentals
(rental_id, user_id, bike_id, start_station_id, end_station_id,
 start_time, end_time, distance, total_cost, status)
VALUES
(1, 1, 1, 1, 2, CURRENT_TIMESTAMP - INTERVAL '2 hours',
 CURRENT_TIMESTAMP - INTERVAL '1 hour', 3.50, 25.00, 'completed'),

(2, 2, 3, 2, NULL, CURRENT_TIMESTAMP - INTERVAL '30 minutes',
 NULL, 1.20, NULL, 'active');


-- 7. PAYMENTS
INSERT INTO payments
(payment_id, rental_id, payment_method_id, amount,
 payment_status, transaction_reference)
VALUES
(1, 1, 1, 25.00, 'successful', 'TXN-TEST-001');


-- 8. BIKE LOCATIONS
INSERT INTO bike_locations
(location_id, bike_id, rental_id, latitude, longitude)
VALUES
(1, 1, 1, 30.1131000, 31.6120000),
(2, 3, 2, 30.1051000, 31.6201000);


-- 9. BIKE PROBLEMS
INSERT INTO bike_problems
(problem_id, bike_id, user_id, description, status)
VALUES
(1, 1, 1, 'Brake needs inspection', 'reported');


-- 10. SUPPORT TICKETS
INSERT INTO support_tickets
(ticket_id, user_id, subject, description, status)
VALUES
(1, 2, 'Bike rental issue',
 'The bike did not unlock immediately after scanning the QR code.',
 'open');


-- Update identity sequences after inserting explicit IDs
SELECT setval(pg_get_serial_sequence('stations', 'station_id'), 
              COALESCE(MAX(station_id), 1)) FROM stations;

SELECT setval(pg_get_serial_sequence('users', 'user_id'), 
              COALESCE(MAX(user_id), 1)) FROM users;

SELECT setval(pg_get_serial_sequence('geofences', 'geofence_id'), 
              COALESCE(MAX(geofence_id), 1)) FROM geofences;

SELECT setval(pg_get_serial_sequence('bikes', 'bike_id'), 
              COALESCE(MAX(bike_id), 1)) FROM bikes;

SELECT setval(pg_get_serial_sequence('payment_methods', 'payment_method_id'), 
              COALESCE(MAX(payment_method_id), 1)) FROM payment_methods;

SELECT setval(pg_get_serial_sequence('rentals', 'rental_id'), 
              COALESCE(MAX(rental_id), 1)) FROM rentals;

SELECT setval(pg_get_serial_sequence('payments', 'payment_id'), 
              COALESCE(MAX(payment_id), 1)) FROM payments;

SELECT setval(pg_get_serial_sequence('bike_locations', 'location_id'), 
              COALESCE(MAX(location_id), 1)) FROM bike_locations;

SELECT setval(pg_get_serial_sequence('bike_problems', 'problem_id'), 
              COALESCE(MAX(problem_id), 1)) FROM bike_problems;

SELECT setval(pg_get_serial_sequence('support_tickets', 'ticket_id'), 
              COALESCE(MAX(ticket_id), 1)) FROM support_tickets;