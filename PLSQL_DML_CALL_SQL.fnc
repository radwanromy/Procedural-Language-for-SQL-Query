CREATE OR REPLACE FUNCTION dml_call_sql (p_sal NUMBER)
   RETURN NUMBER IS
BEGIN
   INSERT INTO employees(employee_id, last_name, email,
                         hire_date, job_id, salary)
   	VALUES(1, 'employee 1', 'emp1@company.com',
		 	SYSDATE, 'SA_MAN', 1000);
   RETURN (p_sal + 100);
   
UPDATE employees SET salary = dml_call_sql(2000)
 WHERE employee_id = 170;
END;
/

