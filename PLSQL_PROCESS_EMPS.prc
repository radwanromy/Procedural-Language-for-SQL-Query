/* Formatted on 25/Oct/21 3:12:25 AM (QP5 v5.287) */
CREATE OR REPLACE PROCEDURE process_emps
IS
   CURSOR emp_cursor
   IS
      SELECT employee_id FROM employees;
BEGIN
   FOR emp_rec IN emp_cursor
   LOOP
      raise_salary (emp_rec.employee_id);
   END LOOP;

   COMMIT;
END process_emps;
/