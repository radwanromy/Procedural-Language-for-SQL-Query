/* Formatted on 25-Oct-21 4:47:21 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE over_pack
IS
   PROCEDURE add_dept (
      p_deptno   IN departments.department_id%TYPE,
      p_name     IN departments.department_name%TYPE DEFAULT 'unknown',
      p_loc      IN departments.location_id%TYPE DEFAULT 0);

   PROCEDURE add_dept (
      p_name   IN departments.department_name%TYPE DEFAULT 'unknown',
      p_loc    IN departments.location_id%TYPE DEFAULT 0);
END over_pack;
/