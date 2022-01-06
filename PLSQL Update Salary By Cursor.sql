/* Formatted on 24/Oct/21 10:12:46 PM (QP5 v5.287) */
DECLARE
   CURSOR emp_cursor(n_department_id  NUMBER)
   IS
          SELECT employee_id, last_name, department_name
            FROM employees, departments
           WHERE     employees.department_id = departments.department_id
                 AND employees.department_id = n_department_id 
      FOR UPDATE OF salary NOWAIT;
BEGIN
   OPEN emp_cursor(90);
   CLOSE emp_cursor;
END;