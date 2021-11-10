/* Formatted on 09/Nov/21 5:51:53 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY e_tpp

AS
  /* idn             NUMBER (6, 0);
   user_name       VARCHAR2 (25);
   timestampn      VARCHAR2 (25);
   old_last_name   VARCHAR2 (25);
   new_last_name   VARCHAR2 (25);
   old_title       VARCHAR2 (10);
   new_title       VARCHAR2 (10);
   old_salary      VARCHAR2 (10);
   new_salary      VARCHAR2 (10);
*/
   PROCEDURE addEmployee (e_id      employee.employee_id%TYPE,
                          e_name    employee.last_name%TYPE,
                          e_job     employee.job_id%TYPE,
                          e_sal     employee.salary%TYPE)
   IS
   BEGIN
      INSERT INTO employee (employee_id,
                            last_name,
                            job_id,
                            salary)
           VALUES (e_id,
                   e_name,
                   e_job,
                   e_sal);
   END addEmployee;

   PROCEDURE delEmployee (e_id employee.employee_id%TYPE)
   IS
   BEGIN
      DELETE FROM employee
            WHERE employee_id = c_id;
   END delEmployee;


 /*
   PROCEDURE insertEmployee
   IS
   BEGIN
      SELECT USER, TO_CHAR (SYSDATE, 'DD/MON/YYYY HH24:MI:SS')
        INTO user_name, timestampn
        FROM DUAL;

      INSERT INTO t_emp_table (user_name,
                               timestampn,
                               idn,
                               old_last_name,
                               new_last_name,
                               old_title,
                               new_title,
                               old_salary,
                               new_salary,
                               operation)
           VALUES (USER,
                   SYSDATE,
                   :NEW.employee_id,
                   :NEW.last_name,
                   :NEW.last_name,
                   :NEW.job_id,
                   :NEW.last_name,
                   :NEW.salary,
                   :NEW.salary,
                   'Insert');
   END insertEmployee;

   PROCEDURE deleteEmployee
IS
   BEGIN

   SELECT USER, TO_CHAR (SYSDATE, 'DD/MON/YYYY HH24:MI:SS')
     INTO user_name, timestampn
     FROM DUAL;
      INSERT INTO t_emp_table (user_name,
                             timestampn,
                             idn,
                             old_last_name,
                             new_last_name,
                             old_title,
                             new_title,
                             old_salary,
                             new_salary,
                             operation)
           VALUES (USER,
                   SYSDATE,
                   :OLD.employee_id,
                   :OLD.last_name,
                   :OLD.last_name,
                   :OLD.job_id,
                   :OLD.last_name,
                   :OLD.salary,
                   :OLD.salary,
                   'Delete');
   END DELETEEMPLOYEE;
   PROCEDURE updateEmployee
   IS
   BEGIN
   SELECT USER, TO_CHAR (SYSDATE, 'DD/MON/YYYY HH24:MI:SS')
     INTO user_name, timestampn
     FROM DUAL;
      INSERT INTO t_emp_table (user_name,
                             timestampn,
                             idn,
                             old_last_name,
                             new_last_name,
                             old_title,
                             new_title,
                             old_salary,
                             new_salary,
                             operation)
           VALUES (USER,
                   SYSDATE,
                   :OLD.employee_id,
                   :OLD.last_name,
                   :NEW.last_name,
                   :OLD.job_id,
                   :NEW.last_name,
                   :OLD.salary,
                   :NEW.salary,
                   'Insert');
   END UPDATEEMPLOYEE;
*/
END e_tpp;
/