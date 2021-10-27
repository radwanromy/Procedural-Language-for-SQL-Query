/* Formatted on 27/Oct/21 12:21:41 PM (QP5 v5.287) */
DECLARE
   v_variable   VARCHAR2 (100);
   v_eid        employees.employee_id%TYPE;
   v_dptid      departments.department_id%TYPE := 90;
BEGIN
   SELECT e.last_name, e.department_id, e.employee_id
     INTO v_variable, v_dptid, v_eid
     FROM employees e, departments d
    WHERE     d.department_id = e.department_id
          AND e.department_id = v_dptid
          AND e.employee_id = v_eid;

   DBMS_OUTPUT.put_line (
         'Empolyee ID: '
      || v_eid
      || ' And The Name Of The Employee Is: '
      || v_variable
      || ' Department ID Is: '
      || v_dptid);
EXCEPTION
   WHEN TOO_MANY_ROWS
   THEN
      v_eid := 101;
      DBMS_OUTPUT.put_line (
         'Too many rows found that why we take on specific employee id');
      DBMS_OUTPUT.put_line (
            'Empolyee ID: '
         || v_eid
         || ' And The Name Of The Employee Is: '
         || v_variable
         || ' Department ID Is: '
         || v_dptid);
   WHEN NO_DATA_FOUND
   THEN
      v_eid := 101;
      v_dptid := 90;

      SELECT e.last_name, e.department_id, e.employee_id
        INTO v_variable, v_dptid, v_eid
        FROM employees e, departments d
       WHERE     d.department_id = e.department_id
             AND e.department_id = v_dptid
             AND e.employee_id = v_eid;

      DBMS_OUTPUT.put_line ('No citizen detail found');
      DBMS_OUTPUT.put_line (
            'Empolyee ID: '
         || v_eid
         || ' And The Name Of The Employee Is: '
         || v_variable
         || ' Department ID Is: '
         || v_dptid);
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line ('Empolyee ID: ' || v_eid || ' ' || v_variable);
END;
/