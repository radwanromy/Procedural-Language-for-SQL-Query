/* Formatted on 24/Oct/21 10:32:49 PM (QP5 v5.287) */
DECLARE
   CURSOR sal_cursor
   IS
          SELECT e.department_id,
                 employee_id,
                 last_name,
                 salary
            FROM employees e, departments d
           WHERE d.department_id = e.department_id AND d.department_id = 60
      FOR UPDATE OF salary NOWAIT;
BEGIN
   FOR emp_record IN sal_cursor
   LOOP
      IF emp_record.salary < 5000
      THEN
         UPDATE employees
            SET salary = emp_record.salary * 1.10
          WHERE CURRENT OF sal_cursor;
      END IF;
   END LOOP;
END;
/