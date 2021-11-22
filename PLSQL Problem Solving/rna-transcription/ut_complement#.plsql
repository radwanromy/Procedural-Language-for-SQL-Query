/*<TOAD_FILE_CHUNK>*/
create or replace package ut_complement#
is
 	FUNCTION of_rna(chars VARCHAR2) RETURN VARCHAR2;
    FUNCTION of_dna(chars VARCHAR2) RETURN VARCHAR2;
  procedure run;
end ut_complement#;
/

/*<TOAD_FILE_CHUNK>*/
/* Formatted on 22/Nov/21 12:21:44 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY ut_complement#
IS
   	FUNCTION of_rna(chars VARCHAR2) RETURN VARCHAR2
		AS
	BEGIN
		RETURN TRANSLATE(chars, 'CGAU', 'GCTA');
	END of_rna;
    FUNCTION of_dna(chars VARCHAR2) RETURN VARCHAR2
		AS
	BEGIN
		RETURN TRANSLATE(chars, 'GCTA', 'CGAU');
	END of_dna;

   PROCEDURE test (i_descn VARCHAR2, i_exp VARCHAR2, i_act VARCHAR2)
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
            || NVL (i_exp, 'null')
            || ', but received '
            || NVL (i_act, 'null'));
      END IF;
   END test;

   PROCEDURE run
   IS
   BEGIN
      test (i_descn   => 'test_rna_complement_of_cytosine_is_guanine',
            i_exp     => 'G',
            i_act     => ut_complement#.of_dna ('C'));
      test (i_descn   => 'test_rna_complement_of_guanine_is_cytosine',
            i_exp     => 'C',
            i_act     => ut_complement#.of_dna ('G'));
      test (i_descn   => 'test_rna_complement_of_thymine_is_adenine',
            i_exp     => 'A',
            i_act     => ut_complement#.of_dna ('T'));
      test (i_descn   => 'test_rna_complement_of_adenine_is_uracil',
            i_exp     => 'U',
            i_act     => ut_complement#.of_dna ('A'));
      test (i_descn   => 'test_rna_complement',
            i_exp     => 'UGCACCAGAAUU',
            i_act     => ut_complement#.of_dna ('ACGTGGTCTTAA'));
      test (i_descn   => 'test_dna_complement_of_cytosine_is_guanine',
            i_exp     => 'G',
            i_act     => ut_complement#.of_rna ('C'));
      test (i_descn   => 'test_dna_complement_of_guanine_is_cytosine',
            i_exp     => 'C',
            i_act     => ut_complement#.of_rna ('G'));
      test (i_descn   => 'test_dna_complement_of_uracil_is_adenine',
            i_exp     => 'A',
            i_act     => ut_complement#.of_rna ('U'));
      test (i_descn   => 'test_dna_complement_of_adenine_is_thymine',
            i_exp     => 'T',
            i_act     => ut_complement#.of_rna ('A'));
      test (i_descn   => 'test_dna_complement',
            i_exp     => 'ACTTGGGCTGTAC',
            i_act     => ut_complement#.of_rna ('UGAACCCGACAUG'));
   END run;
END ut_complement#;
/

/*<TOAD_FILE_CHUNK>*/
begin
  ut_complement#.run;
end;
/

