/* Formatted on 21-Oct-21 3:47:50 AM (QP5 v5.287) */
SET SERVEROUTPUT ON;
DECLARE  
   grade char(1) := 'A';  
BEGIN  
   CASE grade  
      when 'A' then dbms_output.put_line('Excellent');  
      when 'B' then dbms_output.put_line('Very good');  
      when 'C' then dbms_output.put_line('Good');  
      when 'D' then dbms_output.put_line('Average');  
      when 'F' then dbms_output.put_line('Passed with Grace');  
      else dbms_output.put_line('Failed');  
   END CASE;  
END; 
/