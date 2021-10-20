/* Formatted on 21-Oct-21 3:47:50 AM (QP5 v5.287) */
SET SERVEROUTPUT ON;
DECLARE
   a   NUMBER (3) := &v;
BEGIN
   -- check the boolean condition using if statement
   IF (a >= 90)
   THEN
      -- if condition is true then print the following
      DBMS_OUTPUT.put_line ('Grade A+ ');
   ELSIF (a <80 AND a >=70)
   THEN
      -- if condition is true then print the following
      DBMS_OUTPUT.put_line ('Grade B+ ');
      ELSIF (a <70 AND a >=60)
   THEN
      -- if condition is true then print the following
      DBMS_OUTPUT.put_line ('Grade C+ ');
      ELSIF (a <60 AND a >=50)
   THEN
      -- if condition is true then print the following
      DBMS_OUTPUT.put_line ('Grade D+ ');
      ELSIF (a <50 )
   THEN
      -- if condition is true then print the following
      DBMS_OUTPUT.put_line ('Grade F ');
   END IF;
   DBMS_OUTPUT.put_line ('value of a is : ' || a);
END;
/