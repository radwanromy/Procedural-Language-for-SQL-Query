/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:38:54 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE ut_series#
IS
   FUNCTION square_of_sums (i_n PLS_INTEGER)
      RETURN PLS_INTEGER;

   FUNCTION sum_of_squares (i_n PLS_INTEGER)
      RETURN PLS_INTEGER;

   FUNCTION diff_of_squares (i_n PLS_INTEGER)
      RETURN PLS_INTEGER;

   PROCEDURE run;
END ut_series#;
/

/*<TOAD_FILE_CHUNK>*/
create or replace package body ut_series#
is
     function square_of_sums (
    i_n                                           pls_integer
  ) return pls_integer
  is
  begin
    return power(i_n * (i_n + 1) / 2, 2);
  end square_of_sums;
  function sum_of_squares (
    i_n                                           pls_integer
  ) return pls_integer
  is
  begin
    return (i_n * (i_n + 1) * (2 * i_n + 1)) / 6;
  end sum_of_squares;
  function diff_of_squares (
    i_n                                           pls_integer
  ) return pls_integer
  is
  begin
    return square_of_sums(i_n) - sum_of_squares(i_n);
  end diff_of_squares;
  procedure test (
    i_descn                                       varchar2
   ,i_exp                                         number
   ,i_act                                         number
  )
  is
  begin
    if i_exp = i_act then
      dbms_output.put_line('SUCCESS: ' || i_descn);
    else
      dbms_output.put_line('FAILURE: ' || i_descn || ' - expected ' || nvl('' || i_exp, 'null') || ', but received ' || nvl('' || i_act, 'null'));
    end if;
  end test;
 
  procedure run
  is
  begin
    test(i_descn => 'test_square_of_sums_to_5'      , i_exp => 225     , i_act => ut_series#.square_of_sums(5)   );
    test(i_descn => 'test_sum_of_squares_to_5'      , i_exp => 55      , i_act => ut_series#.sum_of_squares(5)   );
    test(i_descn => 'test_difference_of_sums_to_5'  , i_exp => 170     , i_act => ut_series#.diff_of_squares(5)  );
    test(i_descn => 'test_square_of_sums_to_10'     , i_exp => 3025    , i_act => ut_series#.square_of_sums(10)  );
    test(i_descn => 'test_sum_of_squares_to_10'     , i_exp => 385     , i_act => ut_series#.sum_of_squares(10)  );
    test(i_descn => 'test_difference_of_sums_to_10' , i_exp => 2640    , i_act => ut_series#.diff_of_squares(10) );
    test(i_descn => 'test_square_of_sums_to_100'    , i_exp => 25502500, i_act => ut_series#.square_of_sums(100) );
    test(i_descn => 'test_sum_of_squares_to_100'    , i_exp => 338350  , i_act => ut_series#.sum_of_squares(100) );
    test(i_descn => 'test_difference_of_sums_to_100', i_exp => 25164150, i_act => ut_series#.diff_of_squares(100));
  end run;
end ut_series#;
/

/*<TOAD_FILE_CHUNK>*/
begin
  ut_series#.run;
end;
/

