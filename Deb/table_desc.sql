clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 1000;

DROP TABLE Seats_Deb_1 CASCADE CONSTRAINTS;
DROP TABLE Seats_Deb_2 CASCADE CONSTRAINTS;
DROP TABLE Customers_Deb CASCADE CONSTRAINTS;
DROP TABLE Events_Deb CASCADE CONSTRAINTS;
DROP TABLE Tickets_Deb CASCADE CONSTRAINTS;

-- Create tables in Seats_Deb database

CREATE TABLE Seats_Deb_2 (
seat_id NUMBER(10) PRIMARY KEY,
seat_section VARCHAR2(20),
seat_row VARCHAR2(10),
seat_number NUMBER(10)
);


CREATE TABLE Customers_Deb (
customer_id NUMBER(10) PRIMARY KEY,
customer_name VARCHAR2(50),
email VARCHAR2(50),
phone VARCHAR2(20) UNIQUE
);

CREATE TABLE Events_Deb (
event_id NUMBER(10) PRIMARY KEY,
event_date DATE,
event_time VARCHAR2(50),
venue VARCHAR2(50)
);

CREATE TABLE Seats_Deb_1 (
seat_id NUMBER(10) PRIMARY KEY,
seat_availability VARCHAR2(20),
event_id NUMBER(10),
CONSTRAINT fk_events_deb_inSeats FOREIGN KEY (event_id) REFERENCES Events_Deb(event_id)
);

CREATE TABLE Tickets_Deb (
ticket_id NUMBER(10) PRIMARY KEY,
seat_id NUMBER(10),
customer_id NUMBER(10),
event_id NUMBER(10),
purchase_date DATE,
price NUMBER(10, 2),
CONSTRAINT fk_seats_deb FOREIGN KEY (seat_id) REFERENCES Seats_Deb_1(seat_id),
CONSTRAINT fk_customers_deb FOREIGN KEY (customer_id) REFERENCES Customers_Deb(customer_id),
CONSTRAINT fk_events_deb FOREIGN KEY (event_id) REFERENCES Events_Deb(event_id)
);