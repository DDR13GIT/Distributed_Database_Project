CREATE OR REPLACE PROCEDURE add_seat(
    p_seat_id NUMBER,
    p_seat_availability VARCHAR2,
    p_seat_section VARCHAR2 DEFAULT NULL,
    p_seat_row VARCHAR2 DEFAULT NULL,
    p_seat_number NUMBER DEFAULT NULL,
    p_event_id NUMBER
)
AS
BEGIN
    IF (MOD(p_seat_number, 2) = 1) THEN
        -- Insert into Seats_Noumi table
        INSERT INTO Seats_Noumi_1@site_link (seat_id, seat_availability, event_id)
        VALUES (p_seat_id, p_seat_availability, p_event_id);
        INSERT INTO Seats_Noumi_2@site_link (seat_id, seat_section, seat_row, seat_number)
        VALUES (p_seat_id, p_seat_section, p_seat_row, p_seat_number);
        -- Insert into Seats_Deb table
    ELSE
        INSERT INTO Seats_Deb_1 (seat_id, seat_availability, event_id)
        VALUES (p_seat_id, p_seat_availability, p_event_id);
        INSERT INTO Seats_Deb_2 (seat_id, seat_section, seat_row, seat_number)
        VALUES (p_seat_id, p_seat_section, p_seat_row, p_seat_number);
    END IF;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Seat added successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding seat: ' || SQLERRM);
END add_seat;
/

-- EXEC add_seat(1, 'AVAILABLE', 'Front', 'A', 1, 1);
-- EXEC add_seat(2, 'AVAILABLE', 'Front', 'A', 2, 1);
-- EXEC add_seat(3, 'AVAILABLE', 'Front', 'B', 1, 1);
-- EXEC add_seat(4, 'AVAILABLE', 'Front', 'B', 2, 1);
-- EXEC add_seat(5, 'AVAILABLE', 'Middle', 'C', 1, 1);
-- EXEC add_seat(6, 'AVAILABLE', 'Middle', 'C', 2, 1);
-- EXEC add_seat(7, 'AVAILABLE', 'Middle', 'D', 1, 1);
-- EXEC add_seat(8, 'AVAILABLE', 'Middle', 'D', 2, 1);
-- EXEC add_seat(9, 'AVAILABLE', 'Back', 'E', 1, 1);
-- EXEC add_seat(10, 'AVAILABLE', 'Back', 'E', 2, 1);

EXEC add_seat(11, 'AVAILABLE', 'Back', 'F', 1, 1);
EXEC add_seat(12, 'AVAILABLE', 'Back', 'F', 2, 1);
EXEC add_seat(13, 'AVAILABLE', 'Front', 'A', 1, 2);
EXEC add_seat(14, 'AVAILABLE', 'Front', 'A', 2, 2);
EXEC add_seat(15, 'AVAILABLE', 'Front', 'B', 1, 2);
EXEC add_seat(16, 'AVAILABLE', 'Front', 'B', 2, 2);
EXEC add_seat(17, 'AVAILABLE', 'Middle', 'C', 1, 2);
EXEC add_seat(18, 'AVAILABLE', 'Middle', 'C', 2, 2);
EXEC add_seat(19, 'AVAILABLE', 'Middle', 'D', 1, 2);
EXEC add_seat(20, 'AVAILABLE', 'Middle', 'D', 2, 2);
/

CREATE OR REPLACE PROCEDURE update_seat(
    p_seat_id NUMBER,
    p_seat_availability VARCHAR2,
    p_seat_section VARCHAR2 DEFAULT NULL,
    p_seat_row VARCHAR2 DEFAULT NULL,
    p_seat_number NUMBER DEFAULT NULL
)
AS
BEGIN
    IF (MOD(p_seat_number, 2) = 1) THEN
        -- Update Seats_Noumi_1 table
        UPDATE Seats_Noumi_1@site_link 
        SET seat_availability = p_seat_availability 
        WHERE seat_id = p_seat_id;
        
        -- Update Seats_Noumi_2 table
        UPDATE Seats_Noumi_2@site_link 
        SET seat_section = p_seat_section, seat_row = p_seat_row, seat_number = p_seat_number 
        WHERE seat_id = p_seat_id;
    ELSE
        -- Update Seats_Deb_1 table
        UPDATE Seats_Deb_1 
        SET seat_availability = p_seat_availability 
        WHERE seat_id = p_seat_id;
        
        -- Update Seats_Deb_2 table
        UPDATE Seats_Deb_2 
        SET seat_section = p_seat_section, seat_row = p_seat_row, seat_number = p_seat_number 
        WHERE seat_id = p_seat_id;
    END IF;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Seat updated successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating seat: ' || SQLERRM);
END update_seat;
/
--exec add_seat(1, 'unavailable', 'Front', 'A', 1);

