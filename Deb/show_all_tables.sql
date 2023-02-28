SELECT * FROM events_noumi@site_link NATURAL JOIN events_deb;
SELECT * FROM customers_noumi@site_link UNION SELECT * FROM customers_deb;
SELECT * FROM tickets_noumi@site_link UNION SELECT * FROM tickets_deb;
(SELECT * FROM Seats_Noumi_1@site_link NATURAL JOIN Seats_Noumi_2@site_link) UNION (SELECT * FROM Seats_Deb_1 NATURAL JOIN Seats_Deb_2);