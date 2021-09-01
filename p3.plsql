set serveroutput on;
declare

v_result NUMBER;
begin

v_result := 1/0;

exception

when zero_divide then 
dbms_output.put_line(SQLERRM);

end;
/
show errors
