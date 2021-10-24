/* Formatted on 25-Oct-21 4:38:12 AM (QP5 v5.287) */
CREATE OR REPLACE PROCEDURE meter_to_yard (p_meter   IN     NUMBER,
                                           p_yard       OUT NUMBER)
IS
BEGIN
   p_yard := p_meter * global_consts.meter_2_yard;
END meter_to_yard;
/

VARIABLE yard NUMBER
EXECUTE  meter_to_yard (1, :yard)
PRINT yard