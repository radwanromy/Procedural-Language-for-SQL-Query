DECLARE
   var1 integer := 20;
   var2 integer := 40;
   var3 integer;
   var4 real;
BEGIN
   var3 := var1 + var2;
   dbms_output.put_line('Value of var3: ' || var3);
   var4 := 50.0/3.0;
   dbms_output.put_line('Value of var4: ' || var4);
END;
/