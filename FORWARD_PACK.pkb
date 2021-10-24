/* Formatted on 25-Oct-21 4:53:03 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY forward_pack 
IS
  PROCEDURE award_bonus(1000) 
  IS
  BEGIN
   calc_rating(5);       --illegal reference

  END;
  
  PROCEDURE calc_rating(5) 
  IS
  BEGIN
    ...
  END;

END forward_pack;
/