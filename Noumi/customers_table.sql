CREATE OR REPLACE PROCEDURE insert_customer(
    p_customer_id IN Customers_Noumi.customer_id%TYPE,
    p_name IN Customers_Noumi.customer_name%TYPE,
    p_email IN Customers_Noumi.email%TYPE,
    p_phone IN Customers_Noumi.phone%TYPE
  ) IS
  BEGIN
    IF p_customer_id BETWEEN 1 AND 1000 THEN
      INSERT INTO Customers_Noumi (customer_id, customer_name, email, phone)
      VALUES (p_customer_id, p_name, p_email, p_phone);
    ELSE
      INSERT INTO Customers_Deb@site_link (customer_id, customer_name, email, phone)
      VALUES (p_customer_id, p_name, p_email, p_phone);
    END IF;
  END insert_customer;
/

EXEC insert_customer(1, 'Shakib Hasan', 'shakib.hasan@example.com', '+8801712345678');
EXEC insert_customer(2, 'Mashrafe Mortaza', 'mashrafe.mortaza@example.com', '+8801712345679');
EXEC insert_customer(3, 'Tamim Iqbal', 'tamim.iqbal@example.com', '+8801712345680');
EXEC insert_customer(4, 'Mushfiqur Rahim', 'mushfiqur.rahim@example.com', '+8801712345681');
EXEC insert_customer(5, 'Mahmudullah Riyad', 'mahmudullah.riyad@example.com', '+8801712345682');
EXEC insert_customer(6, 'Mustafizur Rahman', 'mustafizur.rahman@example.com', '+8801712345683');
EXEC insert_customer(7, 'Rubel Hossain', 'rubel.hossain@example.com', '+8801712345684');
EXEC insert_customer(8, 'Mehidy Hasan', 'mehidy.hasan@example.com', '+8801712345685');
EXEC insert_customer(9, 'Liton Das', 'liton.das@example.com', '+8801712345686');
EXEC insert_customer(10, 'Soumya Sarkar', 'soumya.sarkar@example.com', '+8801712345687');

-- EXEC insert_customer(1001, 'Rahim Mia', 'rahimmia@example.com', '+8801712345111');
-- EXEC insert_customer(1002, 'Fahima Ahmed', 'fahimaahmed@example.com', '+8801712345222');
-- EXEC insert_customer(1003, 'Mahbubur Rahman', 'mahbuburrahman@example.com', '+8801712345333');
-- EXEC insert_customer(1004, 'Shahinur Rahman', 'shahinurrahman@example.com', '+8801712345444');
-- EXEC insert_customer(1005, 'Tahmina Akter', 'tahminaakter@example.com', '+8801712345555');
-- EXEC insert_customer(1006, 'Asif Iqbal', 'asifiqbal@example.com', '+8801712345666');
-- EXEC insert_customer(1007, 'Anamul Haque', 'anamulhaque@example.com', '+8801712345777');
-- EXEC insert_customer(1008, 'Farzana Akhter', 'farzanaakhter@example.com', '+8801712345888');
-- EXEC insert_customer(1009, 'Sohel Rana', 'sohelrana@example.com', '+8801712345999');
-- EXEC insert_customer(1010, 'Sadia Islam', 'sadiaislam@example.com', '+8801712340000');
/

CREATE OR REPLACE PROCEDURE update_customer(
    p_customer_id IN Customers_Noumi.customer_id%TYPE,
    p_name IN Customers_Noumi.customer_name%TYPE,
    p_email IN Customers_Noumi.email%TYPE,
    p_phone IN Customers_Noumi.phone%TYPE
  ) IS
  BEGIN
    IF p_customer_id BETWEEN 1 AND 1000 THEN
      UPDATE Customers_Noumi SET phone = p_phone where customer_id = p_customer_id;
      
    ELSE
      UPDATE Customers_Deb@site_link SET phone = p_phone where customer_id = p_customer_id;
    END IF;
  END update_customer;
/
--exec update_customer(1, 'John Smith', 'john.smith@example.com', '555-1111');

-- CREATE OR REPLACE PROCEDURE delete_customer(
--     p_customer_id IN Customers_Deb.customer_id%TYPE,
--     p_phone IN Customers_Deb.phone%TYPE
--   ) IS
--   BEGIN
--     IF p_customer_id BETWEEN 1 AND 1000 THEN
--       DELETE FROM Customers_Noumi where phone = p_phone;
--       DELETE FROM Tickets_Noumi WHERE customer_id = p_customer_id;
--     ELSE
--        DELETE FROM Customers_Deb where phone = p_phone;
--        DELETE FROM Tickets_Deb WHERE customer_id = p_customer_id;
--     END IF;
--   END delete_customer;
-- /
--exec delete_customer(1,'555-1111');