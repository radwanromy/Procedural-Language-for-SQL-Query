/* Formatted on 21-Oct-21 2:56:56 AM (QP5 v5.287) */
SET SERVEROUTPUT ON;
DECLARE
   a     INTEGER := 30;
   b     INTEGER := 40;
   c     INTEGER := 30;
   f     REAL := 30;
   sal   REAL := 30;
   bon   REAL := 30;
BEGIN
   SELECT max (salary)
     INTO sal
     FROM HR.EMPLOYEES
    WHERE   FIRST_NAME like 'Ste%';
         --- AND SALARY BETWEEN 4000 AND 10000;
   DBMS_OUTPUT.put_line ('Value Total Salary: ' || sal);
   c := a + b;
   DBMS_OUTPUT.put_line ('Value of c: ' || c);
   f := 100.0 / 3.0;
   DBMS_OUTPUT.put_line ('Value of f: ' || f);
END;