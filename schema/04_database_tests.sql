SELECT 'users' AS table_name, COUNT(*) AS records FROM users
UNION ALL
SELECT 'bikes', COUNT(*) FROM bikes
UNION ALL
SELECT 'stations', COUNT(*) FROM stations
UNION ALL
SELECT 'rentals', COUNT(*) FROM rentals
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'payment_methods', COUNT(*) FROM payment_methods
UNION ALL
SELECT 'bike_locations', COUNT(*) FROM bike_locations
UNION ALL
SELECT 'geofences', COUNT(*) FROM geofences
UNION ALL
SELECT 'bike_problems', COUNT(*) FROM bike_problems
UNION ALL
SELECT 'support_tickets', COUNT(*) FROM support_tickets;
INSERT INTO users
(giu_id, full_name, email, password_hash, role)
VALUES
('GIU9999', 'Test User', 'ahmed.test@example.com',
 'test_hash', 'student'); 
 INSERT INTO users
(giu_id, full_name, email, password_hash, role)
VALUES
('GIU9998', 'Test User', 'invalidrole@example.com',
 'test_hash', 'manager');
 INSERT INTO rentals
(user_id, bike_id, start_station_id, start_time, status)
VALUES
(9999, 1, 1, CURRENT_TIMESTAMP, 'active');