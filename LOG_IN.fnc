/* Formatted on 04/Jan/22 12:36:03 PM (QP5 v5.287) */
CREATE OR REPLACE FUNCTION log_in (x IN VARCHAR2, y IN VARCHAR2)
   RETURN VARCHAR2
AS
   check_count   NUMBER;
BEGIN
   SELECT COUNT (*)
     INTO check_count
     FROM employees
    WHERE first_name = x AND last_name = y;

   IF check_count = 0
   THEN
      RETURN 'Wrong username or password!';
   ELSIF check_count = 1
   THEN
      RETURN 'Login successful!';
   ELSE
      RETURN 'Too many matches, this should never happen!';
   END IF;
END;
/