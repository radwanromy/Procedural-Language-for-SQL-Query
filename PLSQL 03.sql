DECLARE
   num1 number := 10; 
   num2 number := 20; 
BEGIN 
   dbms_output.put_line('Outer Variable num1: ' || num1);
   dbms_output.put_line('Outer Variable num2: ' || num2);
   DECLARE 
      num3 number := 30; 
      num4 number := 40; 
   BEGIN 
      dbms_output.put_line('Outer variable in inner block num1: ' || num1);
      dbms_output.put_line('Outer variable in inner block num2: ' || num2);
      dbms_output.put_line('Inner Variable num3: ' || num3);
      dbms_output.put_line('Inner Variable num4: ' || num4);
   END; 
END;
/