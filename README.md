# Stadium Seat Management Distributed Database Project

## Introduction

The stadium seat management distributed database project aims to provide a centralized and efficient system for managing the allocation and reservation of stadium seats. By using a distributed database, the system can ensure data consistency, reliability, and scalability. The project will offer real-time seat availability updates, secure payment options, and user-friendly interfaces for both venue administrators and ticket holders. This project aims to streamline the seat management process, enhance the overall experience for fans, and provide valuable insights for venue administrators.

## Objectives

* To design and implement a distributed database system using SQL Plus for a stadium seat management system.
* To improve the scalability and performance of the seat management system by distributing the data across multiple locations.
* To improve data security by implementing appropriate data encryption and access controls.
* To optimize the fragmentation schema based on the specific requirements of the seat management system and the data distribution needs.

## Global Schema

The global schema will define how the fragments are related and how the data is distributed across the different locations. The global schema will include the following tables:

* Seats (seat_id, event_id, section, row, number, availability)
* Tickets (ticket_id, seat_id, customer_id, event_id, purchase_date, price)
* Customers (customer_id, customer_name, email, phone)
* Event (event_id, date, time, venue, event_name)

## Fragmentation Schema

* For the Seat table:
    * Seats_Noumi_1: SLnumber=Odd(PJseat_id, availability, event_id Seats)
    * Seats_Noumi_2: SLnumber=Odd(PJseat_id, section, row, number Seats)
    * Seats_Deb_1: SLnumber=even(PJseat_id, availability, event_id Seats)
    * Seats_Deb_2: SLnumber=even(PJseat_id, section, row, number Seats)
* For the Tickets table:
    * Tickets_Noumi: SLticket_id=Odd Tickets
    * Tickets_Deb: SLticket_id=even Tickets
* For the Customers table:
    * Customers_Noumi: SL1<=customer_id<=1000 Customers
    * Customers_Deb: SL1001<=customer_id<=2000 Customers
* For the Events table:
    * Events_Noumi: PJevent_id, event_name, price Events
    * Events_Deb: PJevent_id, event_date, event_time, venue Events

## Allocation Schema

* At site_noumi:
    * Customers_Noumi
    * Events_Noumi
    * Tickets_Noumi
    * Seats_Noumi_1
    * Seats_Noumi_2
* At site_deb:
    * Customers_Deb
    * Events_Deb
    * Tickets_Deb
    * Seats_Deb_1
    * Seats_Deb_2

## Functionalities

* Conditional Insert, Update on the fragmentation tables
* While selling a ticket, it will first check the availability of the seat and then insert it into the tickets table. If not available, then print seat not available.
* Retrieve the total number of available seats for a specific event
* Retrieve the total tickets sale price for a specific event
* Show the total number of tickets sold for all events
* Show customers information who bought tickets for a specific event

## Software

* Oracle Database 10g express edition
* Oracle PLSQL procedure language
