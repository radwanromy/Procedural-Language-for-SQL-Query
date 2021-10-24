DECLARE
  CURSOR emp_cursor IS 
    SELECT employee_id, last_name, department_name 
    FROM   employees,departments
    WHERE  employees.department_id = 
           departments.department_id
    AND employees.department_id = 80 
    FOR UPDATE OF salary NOWAIT;   
BEGIN
  OPEN emp_cursor ;
  CLOSE emp_cursor;
END;
