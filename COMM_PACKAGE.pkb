CREATE OR REPLACE PACKAGE BODY comm_package IS
   FUNCTION  validate_comm (p_comm  IN  NUMBER) 					   RETURN BOOLEAN
   IS v_max_comm    NUMBER;
   BEGIN  -- validates commission to be less than maximum    
     			    --	commission in the table
   END validate_comm;
   PROCEDURE  reset_comm (p_comm   IN  NUMBER)
   IS BEGIN  -- calls validate_comm with specified value
   END reset_comm;
END comm_package;
/
