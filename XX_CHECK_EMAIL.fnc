Create or replace

FUNCTION xx_check_email(l_user_name IN VARCHAR2)

RETURN VARCHAR2 IS

l_dot_pos    NUMBER;

l_at_pos     NUMBER;

l_str_length NUMBER;

BEGIN


l_dot_pos    := instr(l_user_name

,’.’);

l_at_pos     := instr(l_user_name

,’@’);

l_str_length := length(l_user_name);

IF ((l_dot_pos = 0) OR (l_at_pos = 0) OR (l_dot_pos = l_at_pos + 1) OR

(l_at_pos = 1) OR (l_at_pos = l_str_length) OR

(l_dot_pos = l_str_length))

THEN

RETURN ‘FAILURE’;

END IF;

IF instr(substr(l_user_name

,l_at_pos)

,’.’) = 0

THEN

RETURN ‘FAILURE’;

END IF;

RETURN ‘SUCCESS’;

end xx_check_email;