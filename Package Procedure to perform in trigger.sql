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

   PROCEDURE listCustomer
   IS
      CURSOR c_customers
      IS
         SELECT name FROM customers;

      TYPE c_list IS TABLE OF customers.Name%TYPE;

      name_list   c_list := c_list ();
      counter     INTEGER := 0;
   BEGIN
      FOR n IN c_customers
      LOOP
         counter := counter + 1;
         name_list.EXTEND;
         name_list (counter) := n.name;
         DBMS_OUTPUT.put_line (
            'Customer(' || counter || ')' || name_list (counter));
      END LOOP;
   END listCustomer;
END e_tpp;
/