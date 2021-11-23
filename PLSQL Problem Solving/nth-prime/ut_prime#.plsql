/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:54:20 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE ut_prime#
IS
   FUNCTION f_prime (i_num PLS_INTEGER)
      RETURN BOOLEAN;

   FUNCTION nth (i_num_prime PLS_INTEGER)
      RETURN PLS_INTEGER;

   PROCEDURE run;
END ut_prime#;
/

/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:54:36 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY ut_prime#
IS
   FUNCTION f_prime (i_num PLS_INTEGER)
      RETURN BOOLEAN
   IS
      l_prime   BOOLEAN := TRUE;
   BEGIN
      FOR i IN 2 .. ROUND (SQRT (i_num))
      LOOP
         IF MOD (i_num, i) = 0
         THEN
            l_prime := FALSE;
            EXIT;
         END IF;
      END LOOP;

      RETURN l_prime;
   END f_prime;

   FUNCTION nth (i_num_prime PLS_INTEGER)
      RETURN PLS_INTEGER
   IS
      i_count   PLS_INTEGER := 1;
      i_cur     PLS_INTEGER := 2;
   BEGIN
      WHILE i_count < i_num_prime
      LOOP
         i_cur := i_cur + 1;

         IF f_prime (i_cur)
         THEN
            i_count := i_count + 1;
         END IF;
      END LOOP;

      RETURN i_cur;
   END nth;

   PROCEDURE test (i_descn VARCHAR2, i_exp NUMBER, i_act NUMBER)
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
      l_act   NUMBER;
   BEGIN
      test (i_descn => 'test_first', i_exp => 2, i_act => ut_prime#.nth (1));
      test (i_descn => 'test_second', i_exp => 3, i_act => ut_prime#.nth (2));
      test (i_descn => 'test_sixth', i_exp => 13, i_act => ut_prime#.nth (6));
      test (i_descn   => 'test_big_prime',
            i_exp     => 104743,
            i_act     => ut_prime#.nth (10001));

      BEGIN
         l_act := ut_prime#.nth (0);
         DBMS_OUTPUT.put_line (
               'FAILURE: test_weird_case - expected invalid_argument_error to be raised, but received '
            || NVL ('' || l_act, 'null'));
      EXCEPTION
         WHEN ut_prime#.invalid_argument_error
         THEN
            DBMS_OUTPUT.put_line ('SUCCESS: test_weird_case');
      END;
   END run;
END ut_prime#;
/

/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:54:37 PM (QP5 v5.287) */
BEGIN
   ut_prime#.run;
END;
/

