-- =========================================
-- SMART BIKE RENTAL
-- 02_constraints_indexes.sql
-- =========================================

-- USERS
ALTER TABLE users
ADD CONSTRAINT uq_users_giu_id UNIQUE (giu_id);

ALTER TABLE users
ADD CONSTRAINT uq_users_email UNIQUE (email);

ALTER TABLE users
ADD CONSTRAINT chk_users_role
CHECK (role IN ('student', 'staff', 'admin'));


-- STATIONS
ALTER TABLE stations
ADD CONSTRAINT chk_stations_capacity
CHECK (capacity >= 0);

ALTER TABLE stations
ADD CONSTRAINT chk_stations_latitude
CHECK (latitude BETWEEN -90 AND 90);

ALTER TABLE stations
ADD CONSTRAINT chk_stations_longitude
CHECK (longitude BETWEEN -180 AND 180);


-- BIKES
ALTER TABLE bikes
ADD CONSTRAINT chk_bikes_status
CHECK (status <> '');


-- RENTALS
ALTER TABLE rentals
ADD CONSTRAINT chk_rentals_distance
CHECK (distance IS NULL OR distance >= 0);

ALTER TABLE rentals
ADD CONSTRAINT chk_rentals_total_cost
CHECK (total_cost IS NULL OR total_cost >= 0);

ALTER TABLE rentals
ADD CONSTRAINT chk_rentals_dates
CHECK (end_time IS NULL OR end_time >= start_time);


-- PAYMENTS
ALTER TABLE payments
ADD CONSTRAINT chk_payments_amount
CHECK (amount >= 0);


-- PAYMENT METHODS
ALTER TABLE payment_methods
ADD CONSTRAINT chk_payment_expiry_month
CHECK (expiry_month IS NULL OR expiry_month BETWEEN 1 AND 12);

ALTER TABLE payment_methods
ADD CONSTRAINT chk_payment_last_four_digits
CHECK (
    last_four_digits IS NULL
    OR last_four_digits ~ '^[0-9]{4}$'
);


-- BIKE LOCATIONS
ALTER TABLE bike_locations
ADD CONSTRAINT chk_location_latitude
CHECK (latitude BETWEEN -90 AND 90);

ALTER TABLE bike_locations
ADD CONSTRAINT chk_location_longitude
CHECK (longitude BETWEEN -180 AND 180);


-- INDEXES FOR FOREIGN KEYS
CREATE INDEX idx_bikes_station_id
ON bikes(station_id);

CREATE INDEX idx_rentals_user_id
ON rentals(user_id);

CREATE INDEX idx_rentals_bike_id
ON rentals(bike_id);

CREATE INDEX idx_payments_rental_id
ON payments(rental_id);

CREATE INDEX idx_payments_payment_method_id
ON payments(payment_method_id);

CREATE INDEX idx_bike_locations_bike_id
ON bike_locations(bike_id);

CREATE INDEX idx_bike_problems_bike_id
ON bike_problems(bike_id);

CREATE INDEX idx_support_tickets_user_id
ON support_tickets(user_id);