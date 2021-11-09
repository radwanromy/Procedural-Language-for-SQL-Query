/* Formatted on 09-Nov-21 1:15:34 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY e_tpp

AS

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
   
   idn             NUMBER (6, 0);
   user_name       VARCHAR2 (25);
   timestampn      VARCHAR2 (25);
   old_last_name   VARCHAR2 (25);
   new_last_name   VARCHAR2 (25);
   old_title       VARCHAR2 (10);
   new_title       VARCHAR2 (10);
   old_salary      VARCHAR2 (10);
   new_salary      VARCHAR2 (10);
BEGIN
   SELECT USER, TO_CHAR (SYSDATE, 'DD/MON/YYYY HH24:MI:SS')
     INTO user_name, timestampn
     FROM DUAL;

   IF INSERTING
   THEN
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
   ELSIF DELETING
   THEN
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
   ELSIF UPDATING
   THEN
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
   END IF;
   
END e_tpp;
/