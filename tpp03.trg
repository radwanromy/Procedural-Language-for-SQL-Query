/* Formatted on 03-Nov-21 11:55:31 AM (QP5 v5.287) */
CREATE OR REPLACE TRIGGER dml_emp_values
   AFTER DELETE OR INSERT OR UPDATE
   ON employee
   FOR EACH ROW
   ENABLE

BEGIN

   IF INSERTING
   THEN 
   e_tpp.insertEmployee ();
   
   ELSIF DELETING
   
   THEN
   e_tpp.deleteEmployee ();
   ELSIF UPDATING
   THEN
      e_tpp.updateEmployee ();
   END IF;
END;
/