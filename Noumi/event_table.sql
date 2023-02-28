CREATE OR REPLACE PROCEDURE add_event(
    p_event_id NUMBER,
    p_event_name VARCHAR2,
    p_price NUMBER,
    p_event_date DATE,
    p_event_time VARCHAR2,
    p_venue VARCHAR2
)
AS
BEGIN
    INSERT INTO Events_Noumi (event_id, event_name, price)
    VALUES (p_event_id, p_event_name, p_price);
    
    INSERT INTO Events_Deb@site_link (event_id, event_date, event_time, venue)
    VALUES (p_event_id, p_event_date, p_event_time, p_venue);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Event added successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding event: ' || SQLERRM);

END add_event;
/

-- EXEC add_event(1, 'Bangladesh National Day Concert', 1000, '23-Mar-2023', '6:00 PM', 'Bangabandhu National Stadium');
-- EXEC add_event(2, 'Pohela Boishakh Music Festival', 500, '14-Apr-2023', '5:00 PM', 'Suhrawardy Udyan');
-- EXEC add_event(3, 'Eid-ul-Fitr Extravaganza', 1200, '6-May-2023', '7:00 PM', 'Sher-e-Bangla National Cricket Stadium');
-- EXEC add_event(4, 'Bengali New Year Celebration', 800, '15-Apr-2023', '6:00 PM', 'Dhaka University Gymnasium');
-- EXEC add_event(5, 'Bangla Rock Fest', 700, '21-Jun-2023', '6:30 PM', 'Chittagong MA Aziz Stadium');
-- EXEC add_event(6, 'International Folk Music Festival', 900, '19-Jul-2023', '7:00 PM', 'Sylhet International Cricket Stadium');
-- EXEC add_event(7, 'World Music Day', 600, '21-Jun-2023', '5:00 PM', 'National Parade Ground');
-- EXEC add_event(8, 'Durga Puja Utsav', 1100, '6-Oct-2023', '7:30 PM', 'Kali Puja Maidan');
-- EXEC add_event(9, 'Winter Music Carnival', 750, '10-Dec-2023', '6:30 PM', 'Rajshahi Divisional Stadium');
-- EXEC add_event(10, 'Baul Mela', 400, '3-Feb-2024', '4:00 PM', 'Comilla Victoria College Ground');
EXEC add_event(11, 'Folk Dance Extravaganza', 850, '23-Feb-2024', '6:30 PM', 'Barisal Divisional Stadium');
EXEC add_event(12, 'Rocking Dhamaka', 950, '12-Apr-2024', '7:00 PM', 'Khulna Divisional Stadium');
EXEC add_event(13, 'Bangla Sangeet Mela', 500, '20-Apr-2024', '6:00 PM', 'Chittagong University Ground');
EXEC add_event(14, 'Summer Music Fest', 650, '2-Jun-2024', '6:30 PM', 'National Sports Council Ground');
EXEC add_event(15, 'Poush Mela', 900, '15-Jan-2025', '7:00 PM', 'Santiniketan Poush Mela Ground');
EXEC add_event(16, 'International Bangla Music Festival', 1200, '8-Mar-2025', '7:30 PM', 'Bangabandhu National Stadium');
EXEC add_event(17, 'Boishakhi Bhandar', 550, '15-Apr-2025', '6:00 PM', 'Dhaka Residential Model College Ground');
EXEC add_event(18, 'Bijoya Doshomi Concert', 1000, '9-Oct-2025', '7:30 PM', 'Mirpur Indoor Stadium');
EXEC add_event(19, 'Folk and Traditional Music Festival', 750, '28-Nov-2025', '6:30 PM', 'Jessore Divisional Stadium');

/

CREATE OR REPLACE PROCEDURE update_event(
    p_event_id NUMBER,
    p_event_name VARCHAR2,
    p_price NUMBER,
    p_event_date DATE,
    p_event_time VARCHAR2,
    p_venue VARCHAR2
)
AS
BEGIN
    UPDATE Events_Noumi
    SET event_name = p_event_name, price = p_price
    WHERE event_id = p_event_id;
    
    UPDATE Events_Deb@site_link
    SET event_date = p_event_date, event_time = p_event_time, venue = p_venue
    WHERE event_id = p_event_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Event updated successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating event: ' || SQLERRM);

END update_event;
/

--exec update_event(1, 'Concert', 100.00, '12-Mar-2023', '12:31 pm', 'Stadium B');