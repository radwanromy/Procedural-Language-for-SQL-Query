DECLARE
  v_sal      NUMBER(7,2) := 60000;
  v_comm     NUMBER(7,2) := v_sal * 0.20;
  v_message  VARCHAR2(255) := ' eligible for commission';
BEGIN 
  DECLARE
    	v_sal		NUMBER(7,2) := 50000;
    	v_comm  	NUMBER(7,2) := 0;
    	v_total_comp	NUMBER(7,2) := v_sal + v_comm;
  BEGIN 
    	v_message := 'CLERK not'||v_message;
    	v_comm := v_sal * 0.30; 

  END;
    v_message := 'SALESMAN'||v_message;

END;
