CREATE OR REPLACE PACKAGE BODY package_adv
    IS 

     PROCEDURE  e_salary( e_id EMPLOYEE.EMPLOYEE_ID%TYPE)
           IS
   BEGIN
      DELETE FROM employee
            WHERE employee_id = e_id;
   END e_salary;
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