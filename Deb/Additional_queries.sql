

CREATE OR REPLACE FUNCTION dis_available_seats(p_event_id NUMBER)
RETURN NUMBER
IS
  availn_seat NUMBER ;
  availd_seat NUMBER ;

BEGIN
  -- Get total number of seats
  SELECT COUNT(*) INTO availn_seat
  FROM Seats_Noumi_1@site_link
  WHERE event_id = p_event_id AND seat_availability = 'AVAILABLE';
 
   -- Get total number of seats
  SELECT COUNT(*) INTO availd_seat
  FROM Seats_Deb_1
  WHERE event_id = p_event_id AND seat_availability = 'AVAILABLE';

  
  RETURN availn_seat+availd_seat;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No seats found for event ' || p_event_id);
    RETURN 0;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error retrieving available seats: ' || SQLERRM);
   RETURN 0;
END dis_available_seats;
/

DECLARE
  v_available_seats NUMBER;
BEGIN
  v_available_seats := dis_available_seats(1);
  DBMS_OUTPUT.PUT_LINE('There are ' || v_available_seats || ' seats available for event 1');
  
END;
/

CREATE OR REPLACE PROCEDURE show_event_revenue(p_event_id IN NUMBER)
IS
    v_total_revenue NUMBER(10, 2);
BEGIN
    SELECT SUM(price) INTO v_total_revenue
    FROM (
        (SELECT price FROM Tickets_Noumi@site_link WHERE event_id = p_event_id) UNION ALL (SELECT price FROM Tickets_Deb WHERE event_id = p_event_id)
    );

    DBMS_OUTPUT.PUT_LINE('Total revenue for event id: ' || p_event_id || ' is: ' || v_total_revenue);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No data found for event id: ' || p_event_id);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error showing event revenue: ' || SQLERRM);
END show_event_revenue;
/
 exec show_event_revenue(1);

DECLARE
    v_event_id Events_Deb.event_id%TYPE;
    v_event_name VARCHAR2(50);
    v_num_tickets NUMBER(10);
    v_total_revenue NUMBER(10, 2);
    CURSOR c_events IS SELECT event_id, event_name FROM Events_Noumi@site_link;
BEGIN
    FOR c IN c_events LOOP
        v_event_id := c.event_id;
        v_event_name := c.event_name;
        SELECT COUNT(*) INTO v_num_tickets
        FROM (SELECT * FROM tickets_noumi@site_link UNION SELECT * FROM tickets_deb)
        WHERE event_id = v_event_id;
        DBMS_OUTPUT.PUT_LINE('Event ' || v_event_name || ' sold ' || v_num_tickets || ' tickets');
    END LOOP;
END ;
/