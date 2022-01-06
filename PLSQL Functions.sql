DECLARE 
   a number; 
   b number; 
   c number; 
FUNCTION findMax(x IN number, y IN number)  
RETURN number 
IS 
    z number; 
BEGIN 
   IF x > y THEN 
      z:= x; 
   ELSE 
      Z:= y; 
   END IF;  
   RETURN z; 
END; 
BEGIN 
   a:= 23; 
   b:= 45;  
   c := findMax(a, b); 
   dbms_output.put_line(' Maximum of (23,45): ' || c); 
END; 
/ 