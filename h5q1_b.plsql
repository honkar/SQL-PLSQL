set serveroutput on;
execute CS176125.runstats_pkg.rs_start;

declare
    type rc is ref cursor; 
    l_cursor rc;
  begin
  for i in 1 .. 1000  -- Do 1000 cursor create and execute, literal form
  loop
  	     open l_cursor for   -- An implicit cursor
  	     'select object_id*2 from dba_objects  where object_id = ' || to_char(i);  -- Literal
  	     close l_cursor;
  end loop;
  end;
  /

show errors

execute CS176125.runstats_pkg.rs_middle;
 
declare
    type rc is ref cursor; -- Identical cursor environment usage as run1
    l_cursor rc;
  begin
  for i in 1 .. 1000
  loop
  	     open l_cursor for
  	     'select object_id*2  from dba_objects where object_id = :object_id' using i; 
  	     close l_cursor;
  end loop;
  end;
  /
show errors
execute CS176125.runstats_pkg.rs_stop(1000);
