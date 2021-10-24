/* Formatted on 25-Oct-21 3:27:30 AM (QP5 v5.287) */
CREATE OR REPLACE FUNCTION tax (p_value IN NUMBER)
   RETURN NUMBER
IS
BEGIN
   RETURN (p_value * 0.08);
END tax;
/

SELECT employee_id,
       last_name,
       salary,
       tax (salary)
  FROM employees
 WHERE department_id = 100;