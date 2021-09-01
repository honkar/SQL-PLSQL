set serveroutput on;
CREATE TABLE h5q3 (
c number primary key);
 
INSERT ALL INTO h5q3 values (1) INTO h5q3 values (2) INTO h5q3 values (3) SELECT * FROM DUAL;

COMMIT;


CREATE OR REPLACE TRIGGER tr_h5q3 
AFTER UPDATE ON h5q3 
FOR EACH ROW
DECLARE
c_too_large exception;
BEGIN
  if(:new.c > 110) then
    raise c_too_large;
  end if;
  dbms_output.put_line('Row value ' || :old.c || ' changed to ' || :new.c);
  EXCEPTION
    when c_too_large then
         dbms_output.put_line('PL/SQL c_too_large exception ' || :old.c || ' is c value');
    when others then
          dbms_output.put_line('Trigger tr_h5q3 exception block entered');
END;
/ 
show errors
update h5q3 set c = c*10; 
update h5q3 set c = c/(c-30);
update h5q3 set c = c+100;
commit;

select * from h5q3;
DROP table h5q3 purge;
