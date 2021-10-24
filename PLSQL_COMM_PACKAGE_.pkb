/* Formatted on 25-Oct-21 4:12:33 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY comm_package
IS
   PROCEDURE reset_comm (p_comm IN NUMBER)
   IS
   BEGIN
      IF validate_comm (p_comm)
      THEN
         g_comm := p_comm;
      ELSE
         RAISE_APPLICATION_ERROR (-20210, 'Invalid commission');
      END IF;
   END reset_comm;
END comm_package;