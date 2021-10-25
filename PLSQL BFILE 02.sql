/* Formatted on 25/Oct/21 10:45:43 PM (QP5 v5.287) */
CREATE OR REPLACE PROCEDURE load_emp_bfile (p_file_loc IN VARCHAR2)
IS
   v_file          BFILE;
   v_filename      VARCHAR2 (16);
   v_file_exists   BOOLEAN;

   CURSOR emp_cursor IS 
BEGIN
  FOR emp_record IN emp_cursor LOOP
   v_filename := emp_record.first_name || '.bmp';
   v_file := BFILENAME  (p_file_loc, v_filename);
   v_file_exists := (DBMS_LOB.FILEEXISTS(v_file) = 1);
    IF v_file_exists THEN
      DBMS_LOB.FILEOPEN (v_file);