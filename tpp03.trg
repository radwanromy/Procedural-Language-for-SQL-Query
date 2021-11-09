/* Formatted on 03-Nov-21 11:55:31 AM (QP5 v5.287) */
CREATE OR REPLACE TRIGGER dml_emp_values
   AFTER DELETE OR INSERT OR UPDATE
   ON employee
   FOR EACH ROW
   ENABLE

BEGIN
   SELECT USER, TO_CHAR (SYSDATE, 'DD/MON/YYYY HH24:MI:SS')
     INTO user_name, timestampn
     FROM DUAL;

   IF INSERTING
   THEN 
  Execute PAckage E_tpp PROCEDURE delEmployee ();
   
   ELSIF DELETING
   THEN
   ELSIF UPDATING
   THEN
      
   END IF;
END;
/