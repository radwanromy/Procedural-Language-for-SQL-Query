CREATE OR REPLACE procedure log_inn (x IN VARCHAR2, y IN VARCHAR2)
 
AS
   check_count   NUMBER;
BEGIN
   SELECT COUNT (*)
     INTO check_count
     FROM employees
    WHERE first_name = x AND last_name = y;

   IF check_count = 0
   THEN
      dbms_output.put_line( 'Wrong username or password!');
   ELSIF check_count = 1
   THEN
dbms_output.put_line(  'Login successful!');
   ELSE
     dbms_output.put_line( 'Too many matches, this should never happen!');
   END IF;
END;
/