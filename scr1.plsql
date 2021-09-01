set serveroutput on;

declare
  v_num_cursor_failures number := 0;  -- Initialize cursor executions failure count
begin
  for x in (Select c from T FOR UPDATE NOWAIT)
  LOOP
  UPDATE T SET c = c - 1;
  END LOOP;
 dbms_output.put_line('Cursor execution updated T');
exception
  when others then
    v_num_cursor_failures :=  v_num_cursor_failures + 1;
    dbms_output.put_line('Cursor execution failure count is '|| v_num_cursor_failures ||' at time '|| systimestamp);
    commit;
    dbms_lock.sleep(3);
end;
/
show errors
