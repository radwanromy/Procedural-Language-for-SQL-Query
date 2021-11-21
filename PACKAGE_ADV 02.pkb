/* Formatted on 21-Nov-21 11:11:35 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY package_adv
IS
   e_sal   EMPLOYEE.salary%TYPE;
   e_eid   EMPLOYEE.employee_id%TYPE;
   e_ln    EMPLOYEE.last_Name%TYPE;
   e_jid   EMPLOYEE.job_id%TYPE;

   PROCEDURE e_salary (e_id EMPLOYEE.EMPLOYEE_ID%TYPE)
   IS
   BEGIN
      SELECT salary
        INTO e_sal
        FROM employee
       WHERE employee_id = e_id;

      DBMS_OUTPUT.put_line (e_Sal);
   END e_salary;

   PROCEDURE e_all (e_eeid EMPLOYEE.EMPLOYEE_ID%TYPE)
   IS
   BEGIN
      SELECT *
        INTO e_eid,
             e_ln,
             e_jid,
             e_sal
        FROM employee
       WHERE employee_id = e_eeid;

      DBMS_OUTPUT.put_line (e_eid      ||
                            e_ln ||
                            e_jid ||
                            e_sal);
   END e_all;
  /*             IS | AS
                variable declarations;
                constant declarations;
            BEGIN
                statement(s);
            EXCEPTION
                WHEN ...
            END
        ]
[PROCEDURE [Schema..] procedure_name
            [ (parameter [,parameter]) ]
            IS | AS
                variable declarations;
                constant declarations;
            BEGIN
                statement(s);
            EXCEPTION
                WHEN ...
            END
        ]
        [FUNCTION  [Schema..] function_name
                [ (parameter [,parameter]) ]
                RETURN return_datatype
            IS | AS
                variable declarations;
                constant declarations;
            BEGIN
                statement(s);
            EXCEPTION
                WHEN ...
            END
        ]
    [EXCEPTION
        WHEN built-in_exception_name_1 THEN
            User defined statement (action) will be taken;
    ]
    */
END;
/