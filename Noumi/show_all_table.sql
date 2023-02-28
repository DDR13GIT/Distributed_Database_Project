SELECT * FROM events_noumi NATURAL JOIN events_deb@site_link;
SELECT * FROM customers_noumi UNION SELECT * FROM customers_deb@site_link;
SELECT * FROM tickets_noumi UNION SELECT * FROM tickets_deb@site_link;
(SELECT * FROM Seats_Noumi_1 NATURAL JOIN Seats_Noumi_2) UNION (SELECT * FROM Seats_Deb_1@site_link NATURAL JOIN Seats_Deb_2@site_link);