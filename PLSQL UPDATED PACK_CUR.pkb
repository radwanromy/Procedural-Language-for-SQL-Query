/* Formatted on 25-Oct-21 5:01:11 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY pack_cur
IS
   v_empno   NUMBER;

   PROCEDURE proc1_3rows
   IS
   BEGIN
      OPEN c1;

      LOOP
         FETCH c1 INTO v_empno;

         DBMS_OUTPUT.PUT_LINE ('Id :' || (v_empno));
         EXIT WHEN c1%ROWCOUNT >= 3;
      END LOOP;
   END proc1_3rows;

   PROCEDURE proc4_6rows
   IS
   BEGIN
      LOOP
         FETCH c1 INTO v_empno;

         DBMS_OUTPUT.PUT_LINE ('Id :' || (v_empno));
         EXIT WHEN c1%ROWCOUNT >= 6;
      END LOOP;

      CLOSE c1;
   END proc4_6rows;
END pack_cur;
/