/* Formatted on 09-Nov-21 3:13:14 PM (QP5 v5.287) */
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
            WHERE employee_id = e_id;
   END delEmployee;

   PROCEDURE upEmployee (e_id      employee.employee_id%TYPE,
                         e_name    employee.last_name%TYPE,
                         e_job     employee.job_id%TYPE,
                         e_sal     employee.salary%TYPE)
   IS
   BEGIN
      UPDATE employee
         SET last_name = e_name, job_id = e_job, salary = e_sal
       WHERE employee_id = e_id;
   END upEmployee;
/*  PROCEDURE listEmployee
  IS
     CURSOR e_employees
     IS
        SELECT last_name FROM employee;

     TYPE e_list IS TABLE OF employee.last_name%TYPE;

     name_list   e_list := e_list ();
     counter     INTEGER := 0;
  BEGIN
     FOR n IN e_employees
     LOOP
        counter := counter + 1;
        name_list.EXTEND;
        name_list (counter) := n.last_name;
        DBMS_OUTPUT.put_line (
           'Customer(' || counter || ')' || name_list (counter));
     END LOOP;
  END listEmployee; */



END e_tpp;
/