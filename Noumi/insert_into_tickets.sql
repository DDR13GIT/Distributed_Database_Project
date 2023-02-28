-- CREATE OR REPLACE PROCEDURE Insert_Ticket (
--     p_ticket_id IN NUMBER,
--     p_seat_id IN NUMBER,
--     p_customer_id IN NUMBER,
--     p_event_id IN NUMBER,
--     p_purchase_date IN DATE,
--     p_price IN NUMBER
-- )
-- IS
-- BEGIN
--     IF MOD(p_ticket_id, 2) = 1 THEN
--         INSERT INTO Tickets_Noumi (ticket_id, seat_id, customer_id, event_id, purchase_date, price)
--         VALUES (p_ticket_id, p_seat_id, p_customer_id, p_event_id, p_purchase_date, p_price);
--     ELSE
--         INSERT INTO Tickets_Deb (ticket_id, seat_id, customer_id, event_id, purchase_date, price)
--         VALUES (p_ticket_id, p_seat_id, p_customer_id, p_event_id, p_purchase_date, p_price);
--     END IF;
-- END Insert_Ticket;
-- /

-- exec INSERT_Ticket(2, 1, 1001, 1,'13-Feb-2023', 50.00);
CREATE OR REPLACE PROCEDURE Insert_Ticket (
    p_ticket_id IN NUMBER,
    p_seat_id IN NUMBER,
    p_customer_id IN NUMBER,
    p_event_id IN NUMBER,
    p_purchase_date IN DATE,
    p_price IN NUMBER
)
IS
    v_seat_availability VARCHAR2(20);
BEGIN
    -- Check seat availability
    SELECT seat_availability
    INTO v_seat_availability
    FROM Seats_Noumi_1
    WHERE seat_id = p_seat_id
    UNION
    SELECT seat_availability
    FROM Seats_Deb_1@site_link
    WHERE seat_id = p_seat_id;

    IF v_seat_availability = 'AVAILABLE' THEN
        -- Insert the ticket
        IF MOD(p_ticket_id, 2) = 1 THEN
        INSERT INTO Tickets_Noumi (ticket_id, seat_id, customer_id, event_id, purchase_date, price)
        VALUES (p_ticket_id, p_seat_id, p_customer_id, p_event_id, p_purchase_date, p_price);
        ELSE
        INSERT INTO Tickets_Deb@site_link (ticket_id, seat_id, customer_id, event_id, purchase_date, price)
        VALUES (p_ticket_id, p_seat_id, p_customer_id, p_event_id, p_purchase_date, p_price);
        END IF;

        -- Update seat availability
        UPDATE Seats_Noumi_1
        SET seat_availability = 'SOLD'
        WHERE seat_id = p_seat_id;
        UPDATE Seats_Deb_1@site_link
        SET seat_availability = 'SOLD'
        WHERE seat_id = p_seat_id;
    ELSE
        -- Raise an exception if seat is not available
        DBMS_OUTPUT.PUT_LINE('Seat is not available.');
    END IF;

    COMMIT;
END Insert_Ticket;
/

-- CREATE OR REPLACE PROCEDURE delete_ticket(
--     p_ticket_id IN NUMBER
-- )
-- IS
--     v_seat Seats_Noumi.seat_id%TYPE;
-- BEGIN

    -- Get the seat ID associated with the ticket
   -- SELECT seat_id INTO v_seat FROM Tickets_Noumi WHERE ticket_id = p_ticket_id;

    -- Delete the ticket
   -- DELETE FROM Tickets_Noumi WHERE ticket_id = p_ticket_id;

    -- Update the seat availability to "AVAILABLE"
    --UPDATE Seats_Noumi_1 SET availability = 'AVAILABLE' WHERE seat_id = v_seat;
    

    -- Commit the transaction
  --  DBMS_OUTPUT.PUT_LINE('Ticket with ID ' || p_ticket_id || ' deleted, and seat availability updated to AVAILABLE');
   -- COMMIT;
    
-- EXCEPTION
--     WHEN NO_DATA_FOUND THEN
--         DBMS_OUTPUT.PUT_LINE('Ticket with ID ' || p_ticket_id || ' not found');
--     WHEN OTHERS THEN
--         DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
--         ROLLBACK;
--END delete_ticket;



--/
-- BEGIN
--     delete_ticket_and_update_seat(1234);
-- END;
-- /

