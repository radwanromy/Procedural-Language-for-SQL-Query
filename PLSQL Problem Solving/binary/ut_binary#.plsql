/*<TOAD_FILE_CHUNK>*/
create or replace package ut_binary#
is
  procedure run;
end ut_binary#;
/

/*<TOAD_FILE_CHUNK>*/
/* Formatted on 22/Nov/21 11:08:55 AM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY ut_binary#
IS
   FUNCTION to_decimal (binary_string VARCHAR2)
      RETURN INTEGER
   AS
      num_string     VARCHAR2 (32000 CHAR) := binary_string;
      decimal_num    INTEGER := 0;
      current_char   CHAR (1);
   BEGIN
      FOR counter IN 1 .. LENGTH (num_string)
      LOOP
         current_char := SUBSTR (num_string, LENGTH (num_string), 1);

         IF (current_char != '0' AND current_char != '1')
         THEN
            decimal_num := 0;
            EXIT;
         END IF;

         decimal_num :=
            decimal_num + TO_NUMBER (current_char) * POWER (10, counter - 1);
         num_string := SUBSTR (num_string, 0, LENGTH (num_string) - 1);
      END LOOP;

      RETURN decimal_num;
   END to_decimal;

   PROCEDURE test (i_descn VARCHAR2, i_exp PLS_INTEGER, i_act PLS_INTEGER)
   IS
   BEGIN
      IF i_exp = i_act
      THEN
         DBMS_OUTPUT.put_line ('SUCCESS: ' || i_descn);
      ELSE
         DBMS_OUTPUT.put_line (
               'FAILURE: '
            || i_descn
            || ' - expected '
            || NVL ('' || i_exp, 'null')
            || ', but received '
            || NVL ('' || i_act, 'null'));
      END IF;
   END test;

   PROCEDURE run
   IS
   BEGIN
      test (i_descn   => 'test_binary_1_is_decimal_1',
            i_exp     => 1,
            i_act     => ut_binary#.to_decimal ('1'));
      test (i_descn   => 'test_binary_10_is_decimal_2',
            i_exp     => 2,
            i_act     => ut_binary#.to_decimal ('10'));
      test (i_descn   => 'test_binary_11_is_decimal_3',
            i_exp     => 3,
            i_act     => ut_binary#.to_decimal ('11'));
      test (i_descn   => 'test_binary_100_is_decimal_4',
            i_exp     => 4,
            i_act     => ut_binary#.to_decimal ('100'));
      test (i_descn   => 'test_binary_1001_is_decimal_9',
            i_exp     => 9,
            i_act     => ut_binary#.to_decimal ('1001'));
      test (i_descn   => 'test_binary_11010_is_decimal_26',
            i_exp     => 26,
            i_act     => ut_binary#.to_decimal ('11010'));
      test (i_descn   => 'test_binary_10001101000_is_decimal_1128',
            i_exp     => 1128,
            i_act     => ut_binary#.to_decimal ('10001101000'));
      test (i_descn   => 'test_invalid_binary_postfix_is_decimal_0',
            i_exp     => 0,
            i_act     => ut_binary#.to_decimal ('10110a'));
      test (i_descn   => 'test_invalid_binary_prefix_is_decimal_0',
            i_exp     => 0,
            i_act     => ut_binary#.to_decimal ('a10110'));
      test (i_descn   => 'test_invalid_binary_infix_is_decimal_0',
            i_exp     => 0,
            i_act     => ut_binary#.to_decimal ('101a10'));
      test (i_descn   => 'test_invalid_binary_is_decimal_0',
            i_exp     => 0,
            i_act     => ut_binary#.to_decimal ('101210'));
   END run;
END ut_binary#;
/

/*<TOAD_FILE_CHUNK>*/
begin
  ut_binary#.run;
end;
/

