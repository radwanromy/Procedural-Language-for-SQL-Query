/* Formatted on 25/Oct/21 10:42:18 PM (QP5 v5.287) */
CREATE OR REPLACE PROCEDURE load_emp_bfile (p_file_loc IN VARCHAR2)
IS
   v_file       BFILE;
   v_filename   VARCHAR2 (16);

   CURSOR emp_cursor
   IS
      SELECT first_name
        FROM employees
       WHERE department_id = 60
      FOR UPDATE;
BEGIN
   FOR emp_record IN emp_cursor
   LOOP
      v_filename := emp_record.first_name || '.bmp';
      v_file := BFILENAME (p_file_loc, v_filename);
      DBMS_LOB.FILEOPEN (v_file);

      UPDATE employees
         SET emp_video = v_file
       WHERE CURRENT OF emp_cursor;

      DBMS_OUTPUT.PUT_LINE (
            'LOADED FILE: '
         || v_filename
         || ' SIZE: '
         || DBMS_LOB.GETLENGTH (v_file));
      DBMS_LOB.FILECLOSE (v_file);
   END LOOP;
END load_emp_bfile;
/