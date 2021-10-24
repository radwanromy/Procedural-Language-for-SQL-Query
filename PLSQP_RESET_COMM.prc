   PROCEDURE  reset_comm (p_comm   IN  NUMBER)
   IS
   BEGIN
    IF  validate_comm(p_comm)
     THEN   g_comm:=p_comm;  --reset global variable
    ELSE
     RAISE_APPLICATION_ERROR(-20210,'Invalid commission');
    END IF;
   END reset_comm;
 /
