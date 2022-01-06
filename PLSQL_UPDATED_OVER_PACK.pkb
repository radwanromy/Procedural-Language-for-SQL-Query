/* Formatted on 25-Oct-21 4:49:06 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY over_pack
IS
   PROCEDURE add_dept (
      p_deptno   IN departments.department_id%TYPE,
      p_name     IN departments.department_name%TYPE DEFAULT 'unknown',
      p_loc      IN departments.location_id%TYPE DEFAULT 0)
   IS
   BEGIN
      INSERT INTO departments (department_id, department_name, location_id)
           VALUES (p_deptno, p_name, p_loc);
   END add_dept;

   PROCEDURE add_dept (
      p_name   IN departments.department_name%TYPE DEFAULT 'unknown',
      p_loc    IN departments.location_id%TYPE DEFAULT 0)
   IS
   BEGIN
      INSERT INTO departments (department_id, department_name, location_id)
           VALUES (departments_seq.NEXTVAL, p_name, p_loc);
   END add_dept;
END over_pack;
/