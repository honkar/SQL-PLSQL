DECLARE
v_name varchar2(100);
BEGIN
select lname INTO v_name  from e where e.ssn = '88866555';
DBMS_OUTPUT.PUT_LINE('Lname ' ||v_name);
EXCEPTION
WHEN  NO_DATA_FOUND
THEN
DBMS_OUTPUT.PUT_LINE('No rows selected by query');
END;
/


show errors;
