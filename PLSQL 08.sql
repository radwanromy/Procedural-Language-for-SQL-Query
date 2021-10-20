/* Formatted on 21-Oct-21 3:32:52 AM (QP5 v5.287) */
SET SERVEROUTPUT ON;

DECLARE
   -- Global variables
   num1   NUMBER := 95;
   num2   NUMBER := 85;
BEGIN
   DBMS_OUTPUT.put_line ('Outer Variable num1: ' || num1);
   DBMS_OUTPUT.put_line ('Outer Variable num2: ' || num2);

   DECLARE
      -- constant declaration
      pi     CONSTANT NUMBER := 3.141592654;
      -- other declarations
      radius          NUMBER (5, 2);
      dia             NUMBER (5, 2);
      circumference   NUMBER (7, 2);
      area            NUMBER (10, 2);
   BEGIN
      -- processing
      radius := 9.5;
      dia := radius * 2;
      circumference := 2.0 * pi * radius;
      area := pi * radius * radius;
      -- output
      DBMS_OUTPUT.put_line ('Radius: ' || radius);
      DBMS_OUTPUT.put_line ('Diameter: ' || dia);
      DBMS_OUTPUT.put_line ('Circumference: ' || circumference);
      DBMS_OUTPUT.put_line ('Area: ' || area);
   END;
END;
/