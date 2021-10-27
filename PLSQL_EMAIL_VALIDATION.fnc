/* Formatted on 27/Oct/21 4:40:15 PM (QP5 v5.287) */
CREATE OR REPLACE FUNCTION email_validation (email_address IN VARCHAR2)
   RETURN VARCHAR2
IS
   at_the_rate    NUMBER;
   dot_symbol    NUMBER;
   l_str_length   NUMBER;
BEGIN
   --  domain := INSTR (email_address, 'com'or '.in'or'.bd'or '.gov'or '.org');
   at_the_rate := INSTR (email_address, '@');
   dot_symbol := INSTR (email_address, '.');
   l_str_length := LENGTH (email_address);

   IF ( (   (dot_symbol = 0)
         OR (at_the_rate = 0)
         OR (dot_symbol = at_the_rate + 1)
         OR (at_the_rate = 1)
         OR (at_the_rate = l_str_length)
         OR (dot_symbol = l_str_length)))
   THEN
      RETURN 'Invalid email addresses';
   END IF;

   IF INSTR (SUBSTR (email_address, at_the_rate), '.') = 0
   THEN
      RETURN 'Invalid email addresses';
   END IF;

   RETURN 'Valid email addresses';
END email_validation;