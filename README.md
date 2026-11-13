# Smart Bike Rental App

**German International University (GIU) — Software Engineering Project**

## 1. Project Overview

The Smart Bike Rental App is a university-focused bike rental system designed for GIU students and staff.

The application allows eligible users to locate available bikes, unlock them using QR codes, track their rides, and make payments through the application.

The system is designed to support bike transportation between the university campus and the nearby monorail station.

## 2. Project Objectives

* Provide convenient bike transportation for GIU students and staff.
* Display available bikes and their locations.
* Enable QR-code-based bike unlocking.
* Track ride duration and distance.
* Calculate rental costs automatically.
* Enforce geographical restrictions for bike usage.
* Support secure online payments.
* Allow users to report bike problems and contact customer support.

## 3. Main Features

* **User Management:** Registration, login, and GIU eligibility verification.
* **Bike Availability:** View available bikes and their locations on a map.
* **Bike Rental:** Scan QR codes to unlock bikes and start rentals.
* **GPS Tracking:** Track bike locations and enforce permitted geographical boundaries.
* **Ride Management:** Monitor ride duration, distance, and rental costs.
* **Bike Returns:** Support returns within the campus and at the monorail station.
* **Payments:** Save payment methods and process rental payments.
* **Problem Reporting:** Report faulty bikes.
* **Customer Support:** Submit support requests and receive responses.

## 4. Database Design

The proposed database design contains 10 main entities:

1. USERS
2. BIKES
3. STATIONS
4. RENTALS
5. PAYMENTS
6. PAYMENT_METHODS
7. BIKE_LOCATIONS
8. BIKE_PROBLEMS
9. GEOFENCE
10. SUPPORT_TICKETS

The Entity Relationship Diagram (ERD) and its editable source file are available in the `schema` folder.

* [View ERD (PDF)](schema/Smart_Bike_Rental_ERD_final.drawio.pdf)
* [Editable ERD (draw.io)](schema/Smart_Bike_Rental_ERD%20%285%29.drawio)

## 5. Repository Structure

```text
smart-bike-rental-giu/
│
├── docs/
│
├── schema/
│   ├── README.md
│   ├── Smart_Bike_Rental_ERD (5).drawio
│   └── Smart_Bike_Rental_ERD_final.drawio.pdf
│
└── README.md
```

## 6. Project Information

**University:** German International University (GIU)

**Project:** Smart Bike Rental App

**Course:** Software Engineering

**Project Type:** Academic Team Project

---

*This repository contains the documentation and database design for the Smart Bike Rental App project.*
