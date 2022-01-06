CREATE OR REPLACE PROCEDURE query_emp
  (p_id      IN   employees.employee_id%TYPE,
   p_name    OUT  employees.last_name%TYPE,
   p_salary  OUT  employees.salary%TYPE,
   p_comm    OUT  employees.commission_pct%TYPE)
IS
BEGIN
  SELECT   last_name, salary, commission_pct
   INTO    p_name, p_salary, p_comm
   FROM    employees 
   WHERE   employee_id = p_id;
END query_emp;
/
