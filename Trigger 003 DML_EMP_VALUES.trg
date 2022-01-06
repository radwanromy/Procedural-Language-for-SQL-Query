/* Formatted on 03-Nov-21 11:55:31 AM (QP5 v5.287) */
CREATE OR REPLACE TRIGGER dml_emp_values
   AFTER DELETE OR INSERT OR UPDATE
   ON employee
   FOR EACH ROW
   ENABLE
DECLARE
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
END;
/