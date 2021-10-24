DECLARE 
   name varchar2(20); 
   company varchar2(30); 
   introduction clob; 
   choice char(1); 
   hiredate varchar2(20); 
   details clob; 
BEGIN 
   name := 'A. S. M. Radwan'; 
   company := 'ERA Infotech Limited'; 
   introduction := ' Hello! I''m A. S. M. Radwan from Infotech.'; 
   hiredate := '10th June 1998'; 
   details := 'You have not put your details yet.';
   choice := 'y'; 
   IF choice = 'y' THEN 
      dbms_output.put_line(name); 
      dbms_output.put_line(company); 
      dbms_output.put_line(introduction); 
      dbms_output.put_line(hiredate);
      dbms_output.put_line(details); 
   END IF; 
END; 
/