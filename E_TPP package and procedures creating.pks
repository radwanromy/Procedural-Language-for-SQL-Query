CREATE OR REPLACE PACKAGE e_tpp
AS
  
   PROCEDURE delEmployee (e_id employee.employee_id%TYPE);
    PROCEDURE listEmployee;
     PROCEDURE addEmployee (e_id      employee.employee_id%TYPE,
                          e_name    employee.last_name%TYPE,
                          e_job     employee.job_id%TYPE,
                          e_sal     employee.salary%TYPE);
END e_tpp;
