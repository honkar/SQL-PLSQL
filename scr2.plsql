set serveroutput on;

DROP TABLE T purge;

CREATE TABLE T (c number);
INSERT INTO T (c) values(2);
COMMIT;

UPDATE T set c = c + 1;
begin
  dbms_lock.sleep(5);
dbms_output.put_line('Lock side finished at time ' || systimestamp);
end;
/
show errors
select * from T;
