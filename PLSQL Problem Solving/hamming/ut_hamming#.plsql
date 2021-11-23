/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:50:14 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE ut_hamming#
IS
   FUNCTION distance (i_first VARCHAR2, i_second VARCHAR2)
      RETURN PLS_INTEGER;

   PROCEDURE run;
END ut_hamming#;
/

/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:50:12 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY ut_hamming#
IS
   FUNCTION distance (i_first VARCHAR2, i_second VARCHAR2)
      RETURN PLS_INTEGER
   AS
      first_dna    VARCHAR2 (3200 CHAR) := i_first;
      second_dna   VARCHAR2 (3200 CHAR) := i_second;
      hamming_d    PLS_INTEGER := 0;
   BEGIN
      FOR counter IN 1 .. LENGTH (first_dna)
      LOOP
         IF SUBSTR (first_dna, counter, 1) != SUBSTR (second_dna, counter, 1)
         THEN
            hamming_d := hamming_d + 1;
         END IF;
      END LOOP;

      RETURN hamming_d;
   END distance;

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
            || ': expected '
            || NVL ('' || i_exp, 'null')
            || ', but got '
            || NVL ('' || i_act, 'null')
            || '!');
      END IF;
   END test;

   PROCEDURE run
   IS
   BEGIN
      test ('test_no_difference_between_identical_strands',
            0,
            ut_hamming#.distance (i_first => 'A', i_second => 'A'));
   --test('test_complete_hamming_distance_of_for_single_nucleotide_strand', 1, hamming#.distance(i_first => 'A'           , i_second => 'G'           ));
   --test('test_complete_hamming_distance_of_for_small_strand'            , 2, hamming#.distance(i_first => 'AG'          , i_second => 'CT'          ));
   --test('test_small_hamming_distance'                                   , 1, hamming#.distance(i_first => 'AG'          , i_second => 'AT'          ));
   --test('test_small_hamming_distance_in_longer_strand'                  , 1, hamming#.distance(i_first => 'GGACG'       , i_second => 'GGTCG'       ));
   --test('test_nonunique_characters_within_first_strand'                 , 1, hamming#.distance(i_first => 'AGA'         , i_second => 'AGG'         ));
   --test('test_nonunique_characters_within_second_strand'                , 1, hamming#.distance(i_first => 'AGG'         , i_second => 'AGA'         ));
   --test('test_large_hamming_distance'                                   , 4, hamming#.distance(i_first => 'GATACA'      , i_second => 'GCATAA'      ));
   --test('test_hamming_distance_in_very_long_strand'                     , 9, hamming#.distance(i_first => 'GGACGGATTCTG', i_second => 'AGGACGGATTCT'));
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.put_line ('Test execution failed.');
         DBMS_OUTPUT.put_line (SQLERRM);
   END run;
END ut_hamming#;
/

/*<TOAD_FILE_CHUNK>*/
/* Formatted on 23/Nov/21 12:50:16 PM (QP5 v5.287) */
BEGIN
   ut_hamming#.run;
END;
/

