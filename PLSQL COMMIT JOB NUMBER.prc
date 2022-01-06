VARIABLE jobno NUMBER
BEGIN
  DBMS_JOB.SUBMIT (
   job  => :jobno,
   what => 'OVER_PACK.ADD_DEPT(''EDUCATION'',2710);',
   next_date =>  TRUNC(SYSDATE + 1),
   interval  =>  'TRUNC(SYSDATE + 1)'
  ); 
  COMMIT;
END;
/
PRINT jobno
