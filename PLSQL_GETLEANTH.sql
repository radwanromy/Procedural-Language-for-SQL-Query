/* Formatted on 25/Oct/21 11:22:37 PM (QP5 v5.287) */
DECLARE
   lobloc   CLOB;                                 -- serves as the LOB locator
   text     VARCHAR2 (32767) := 'Resigned: 5 August 2000';
   amount   NUMBER;                                    -- amount to be written
   offset   INTEGER;                                 -- where to start writing
BEGIN
   SELECT resume
     INTO lobloc
     FROM employees
    WHERE employee_id = 405
   FOR UPDATE;

   offset := DBMS_LOB.GETLENGTH (lobloc) + 2;
   amount := LENGTH (text);
   DBMS_LOB.WRITE (lobloc,
                   amount,
                   offset,
                   text);
   text := ' Resigned: 30 September 2000';

   SELECT resume
     INTO lobloc
     FROM employees
    WHERE employee_id = 170
   FOR UPDATE;

   amount := LENGTH (text);
   DBMS_LOB.WRITEAPPEND (lobloc, amount, text);
   COMMIT;
END;