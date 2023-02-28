SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE mypack 
AS 
PROCEDURE showCustomer(p_event_id IN NUMBER);
END mypack;
/

CREATE OR REPLACE PACKAGE BODY mypack AS 
  PROCEDURE showCustomer(p_event_id IN NUMBER)
   IS

   BEGIN
     DBMS_OUTPUT.PUT_LINE('Customer Name'|| '             ' || 'Email' || '                   ' || 'Phone');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------');
   FOR c IN (
    (SELECT customer_name, email, phone
     FROM Customers_Noumi@site_link
     WHERE customer_id IN (SELECT customer_id FROM Tickets_Noumi@site_link WHERE event_id = p_event_id))
     UNION
     (SELECT customer_name, email, phone
     FROM Customers_Deb
     WHERE customer_id IN (SELECT customer_id FROM Tickets_Deb WHERE event_id = p_event_id))
     ORDER BY customer_name
  )
    LOOP
       DBMS_OUTPUT.PUT_LINE(c.customer_name || '       ' || c.email || '      ' || c.phone);
  END LOOP;
END showCustomer;
END mypack;
/

EXEC mypack.showCustomer(1);
