DECLARE
   var number(3) := 50;
BEGIN
   IF (var = 10) THEN
      dbms_output.put_line('Value of var is 10');
   ELSIF (var = 20) THEN
      dbms_output.put_line('Value of var is 20');
   ELSIF (var = 30) THEN
      dbms_output.put_line('Value of var is 30');
   ELSE
       dbms_output.put_line('None of the above condition is true.');
   END IF;
   dbms_output.put_line('Exact value of var is: '|| var); 
END;
/