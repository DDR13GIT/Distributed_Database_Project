CREATE OR REPLACE PROCEDURE show_customers_for_event(p_event_id IN NUMBER)
IS
BEGIN
     DBMS_OUTPUT.PUT_LINE('Customer Name'|| '             ' || 'Email' || '                   ' || 'Phone');
          DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------');
  FOR c IN (
    (SELECT customer_name, email, phone
     FROM Customers_Noumi
     WHERE customer_id IN (SELECT customer_id FROM Tickets_Noumi WHERE event_id = p_event_id))
     UNION
     (SELECT customer_name, email, phone
     FROM Customers_Deb@site_link
     WHERE customer_id IN (SELECT customer_id FROM Tickets_Deb@site_link WHERE event_id = p_event_id))
     ORDER BY customer_name
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(c.customer_name || '       ' || c.email || '      ' || c.phone);
  END LOOP;
END;
/
EXEC show_customers_for_event(1);
/



-- exec show_customers(1);
-- /
--   (SELECT customer_name, email, phone
--     FROM Customers_Noumi
--     WHERE customer_id IN (SELECT customer_id FROM Tickets_Noumi WHERE event_id = 1))
--     UNION
--     (SELECT customer_name, email, phone
--     FROM Customers_Deb
--     WHERE customer_id IN (SELECT customer_id FROM Tickets_Deb WHERE event_id = 1))
--     ORDER BY customer_name;