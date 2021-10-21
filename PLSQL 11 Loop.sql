/* Formatted on 21-Oct-21 4:19:51 AM (QP5 v5.287) */
SET SERVEROUTPUT ON;
DECLARE
   i   NUMBER := 1;
BEGIN
   LOOP
      EXIT WHEN i > 100;
      DBMS_OUTPUT.PUT_LINE (i);
      i := i + 1;
   END LOOP;
END;
/