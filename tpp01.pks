/* Formatted on 09/Nov/21 5:07:24 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE e_tpp
AS
   PROCEDURE delEmployee (e_id employee.employee_id%TYPE);

   PROCEDURE insertEmployee;

   PROCEDURE deleteEmployee;

   PROCEDURE updateEmployee;

   PROCEDURE addEmployee (e_id      employee.employee_id%TYPE,
                          e_name    employee.last_name%TYPE,
                          e_job     employee.job_id%TYPE,
                          e_sal     employee.salary%TYPE);

   PROCEDURE upEmployee (e_id      employee.employee_id%TYPE,
                         e_name    employee.last_name%TYPE,
                         e_job     employee.job_id%TYPE,
                         e_sal     employee.salary%TYPE);
END e_tpp;