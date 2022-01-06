CREATE OR REPLACE PROCEDURE add_dept
  (p_name  IN departments.department_name%TYPE
   				DEFAULT 'unknown',
   p_loc   IN departments.location_id%TYPE
   				DEFAULT 1700)
IS
BEGIN
  INSERT INTO departments(department_id,
            department_name, location_id)
  VALUES (departments_seq.NEXTVAL, p_name, p_loc);
END add_dept;
/
