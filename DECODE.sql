/* Formatted on 21-Oct-21 5:11:34 AM (QP5 v5.287) */
SELECT *
  FROM HR.EMPLOYEES
 WHERE department_id =
          DECODE ( :PDEPT,
                  'ALL', department_id,
                  'TEN', 10,
                  'NINTY', 90,
                  20);