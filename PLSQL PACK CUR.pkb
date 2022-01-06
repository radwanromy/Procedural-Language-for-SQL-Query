	CREATE OR REPLACE PACKAGE pack_cur
IS
	 CURSOR c1 IS  SELECT employee_id 
               FROM   employees
               ORDER BY employee_id DESC;
	 PROCEDURE proc1_3rows;
 	PROCEDURE proc4_6rows;
	END pack_cur;
/
