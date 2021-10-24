/* Formatted on 25-Oct-21 4:06:12 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE comm_package
IS
   g_comm   NUMBER := 0.10;                              --initialized to 0.10

   PROCEDURE reset_comm (p_comm IN NUMBER);
END comm_package;
/