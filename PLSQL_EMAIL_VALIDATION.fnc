/* Formatted on 27/Oct/21 5:22:57 PM (QP5 v5.287) */
CREATE OR REPLACE FUNCTION email_validation (email_address IN VARCHAR2)
   RETURN VARCHAR2
IS
   at_the_rate     NUMBER;
   dot_symbol      NUMBER;
   c_at_the_rate     NUMBER;
   c_dot_symbol      NUMBER;
   string_length   NUMBER;
BEGIN
   --  domain := INSTR (email_address, 'com'or '.in'or'.bd'or '.gov'or '.org');
   at_the_rate := INSTR (email_address, '@');
   dot_symbol := INSTR (email_address, '.');
   string_length := LENGTH (email_address);
   c_at_the_rate := Count(email_address, '@');
   c_dot_symbol := Count(email_address, '@');


   IF ( (   (dot_symbol = 0)
         OR (at_the_rate = 0)
         OR (dot_symbol = at_the_rate + 1)
         OR (at_the_rate = 1)
         OR (at_the_rate = string_length)
         OR (dot_symbol = string_length)
         OR (COUNT(INSTR (email_address, '@')) > 1)))
   THEN
      RETURN 'Invalid email addresses';
   END IF;

   /*
  IF INSTR (SUBSTR (email_address, at_the_rate), '.') = 0
  THEN
     RETURN 'Invalid email addresses';
  END IF;

  IF TO_NUMBER (INSTR (email_address, at_the_rate)) >1
  THEN
     RETURN 'Invalid email addresses';
  END IF;
  IF TO_NUMBER (INSTR (email_address, dot_symbol)) >1
  THEN
     RETURN 'Invalid email addresses';
  END IF; */



   RETURN 'Valid email addresses';
END email_validation;