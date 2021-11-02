CREATE OR REPLACE PACKAGE BODY dpk_radwan
AS
          PROCEDURE p_email_validation (email_address IN VARCHAR2) IS
          at_the_rate       NUMBER;
           dot_symbol        NUMBER;
           c_at_the_rate     NUMBER;
           c_dot_symbol      NUMBER;
           string_length     NUMBER;
           before_dot        NUMBER;
           temp              NUMBER;
           after_dot         NUMBER;
           undefine_symbol   NUMBER;
        BEGIN --  domain := INSTR (email_address, 'com'or '.in'or'.bd'or '.gov'or '.org');
             
           at_the_rate := INSTR (email_address, '@');
           dot_symbol := INSTR (email_address, '.');
           string_length := LENGTH (email_address);
           c_at_the_rate :=
              ROUND (LENGTH (email_address) - LENGTH (REPLACE (email_address, '@')));
           c_dot_symbol :=
              ROUND (LENGTH (email_address) - LENGTH (REPLACE (email_address, '.')));
           --  after_at_the_rate := at_the_rate+1;
           before_dot := INSTR (email_address, '.');
           after_dot := INSTR (email_address, '.');
           temp := dot_symbol;
           --DBMS_OUTPUT.put_line ('TEMP' || ' : ' || temp);
           undefine_symbol :=
                 INSTR (email_address, '!')
              || INSTR (email_address, '/')
              || INSTR (email_address, '#')
              || INSTR (email_address, '%')
              || INSTR (email_address, '$')
              || INSTR (email_address, '^')
              || INSTR (email_address, '&')
              || INSTR (email_address, '*')
              || INSTR (email_address, '(')
              || INSTR (email_address, '(')
              || INSTR (email_address, '-')
              || INSTR (email_address, '+')
              || INSTR (email_address, '=')
              || INSTR (email_address, '`')
              || INSTR (email_address, '~')
              || INSTR (email_address, '?')
              || INSTR (email_address, '{')
              || INSTR (email_address, '}')
              || INSTR (email_address, '[')
              || INSTR (email_address, ']')
              || INSTR (email_address, '\')
              || INSTR (email_address, '|')
              || INSTR (email_address, '"')
              || INSTR (email_address, ':')
              || INSTR (email_address, ';')
              || INSTR (email_address, ']')
              || INSTR (email_address, '[')
              || INSTR (email_address, '?')
              || INSTR (email_address, '>')
              || INSTR (email_address, '<')
              || INSTR (email_address, ',')
              || INSTR (email_address, '..')
              || INSTR (email_address, '.@')
              || INSTR (email_address, '@.');
          -- DBMS_OUTPUT.put_line (before_dot || ' AND ' || after_dot);
           IF ( (   (dot_symbol = 0)
                 OR (at_the_rate = 0)
                 OR (undefine_symbol >= 1)
                 OR (at_the_rate = 1)
                 OR (c_at_the_rate > 1)
                 OR (at_the_rate = string_length)
                 OR (dot_symbol = string_length)))
           THEN
              DBMS_OUTPUT.put_line ('Invalid email addresses');
           END IF;
           DBMS_OUTPUT.put_line ('Valid email addresses');
        EXCEPTION
           WHEN OTHERS
           THEN
              DBMS_OUTPUT.put_line ('Can not able to say valid or invalid');
        END p_email_validation;
END dpk_radwan;