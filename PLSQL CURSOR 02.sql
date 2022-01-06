	DECLARE
      v_empno  employees.employee_id%TYPE;
      v_ename  employees.last_name%TYPE;
      CURSOR   emp_cursor IS
        SELECT employee_id, last_name
        FROM   employees;
    BEGIN
      OPEN emp_cursor;
      FOR i IN 1..10 LOOP
        FETCH emp_cursor INTO v_empno, v_ename;        
        DBMS_OUTPUT.PUT_LINE (TO_CHAR(v_empno)||'	'|| v_ename);
      END LOOP;
    END ; 