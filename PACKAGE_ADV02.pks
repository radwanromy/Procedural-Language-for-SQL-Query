CREATE OR REPLACE
PACKAGE package_adv
    IS
    PROCEDURE  e_salary( e_id EMPLOYEE.EMPLOYEE_ID%TYPE);
           PROCEDURE  e_all( e_eeid EMPLOYEE.EMPLOYEE_ID%TYPE);
 --   [variable_declaration ...]
  --  [constant_declaration ...]
    --[exception_declaration ...] 
   -- [cursor_specification ...]
   /* [PROCEDURE [Schema..] procedure_name
        [ (parameter {IN,OUT,IN OUT} datatype [,parameter]) ]
    ]
    [FUNCTION [Schema..] function_name
        [ (parameter {IN,OUT,IN OUT} datatype [,parameter]) ]
        RETURN return_datatype
    ]
    */
    
END package_adv;