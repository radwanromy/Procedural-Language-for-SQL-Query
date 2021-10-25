/* Formatted on 26-Oct-21 3:15:06 AM (QP5 v5.287) */
CREATE OR REPLACE PROCEDURE IsTempLOBOpen (p_lob_loc   IN OUT BLOB,
                                           p_retval       OUT INTEGER)
IS
BEGIN
   -- create a temporary LOB
   DBMS_LOB.CREATETEMPORARY (p_lob_loc, TRUE);
   -- see if the LOB is open: returns 1 if open
   p_retval := DBMS_LOB.ISOPEN (p_lob_loc);
   DBMS_OUTPUT.PUT_LINE (
      'The file returned a value 									  ....' || p_retval);
   -- free the temporary LOB
   DBMS_LOB.FREETEMPORARY (p_lob_loc);
END;
/