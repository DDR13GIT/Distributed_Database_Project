clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 1000;

DROP TABLE Seats_Noumi_1 CASCADE CONSTRAINTS;
DROP TABLE Seats_Noumi_2 CASCADE CONSTRAINTS;
DROP TABLE Customers_Noumi CASCADE CONSTRAINTS;
DROP TABLE Events_Noumi CASCADE CONSTRAINTS;
DROP TABLE Tickets_Noumi CASCADE CONSTRAINTS;

-- Create tables in Seats_Noumi database

CREATE TABLE Seats_Noumi_2 (
seat_id NUMBER(10) PRIMARY KEY,
seat_section VARCHAR2(20),
seat_row VARCHAR2(10),
seat_number NUMBER(10)
);


CREATE TABLE Customers_Noumi (
customer_id NUMBER(10) PRIMARY KEY,
customer_name VARCHAR2(50),
email VARCHAR2(50),
phone VARCHAR2(20) UNIQUE
);

CREATE TABLE Events_Noumi (
event_id NUMBER(10) PRIMARY KEY,
event_name VARCHAR2(50),
price NUMBER(10, 2)
);

CREATE TABLE Seats_Noumi_1 (
seat_id NUMBER(10) PRIMARY KEY,
seat_availability VARCHAR2(20),
event_id NUMBER(10),
CONSTRAINT fk_events_noumi_inSeats FOREIGN KEY (event_id) REFERENCES Events_Noumi(event_id)
);

CREATE TABLE Tickets_Noumi (
ticket_id NUMBER(10) PRIMARY KEY,
seat_id NUMBER(10),
customer_id NUMBER(10),
event_id NUMBER(10),
purchase_date DATE,
price NUMBER(10, 2),
CONSTRAINT fk_seats_noumi FOREIGN KEY (seat_id) REFERENCES Seats_Noumi_1(seat_id),
CONSTRAINT fk_customers_noumi FOREIGN KEY (customer_id) REFERENCES Customers_Noumi(customer_id),
CONSTRAINT fk_events_noumi FOREIGN KEY (event_id) REFERENCES Events_Noumi(event_id)
);