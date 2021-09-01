set serveroutput on;
CREATE OR REPLACE PROCEDURE empRecursive(i_ssn IN e.ssn%TYPE, i_empFname e.fname%TYPE) IS
    CURSOR empMgr_cur(c_ssn e.ssn%TYPE) IS
        WITH sup(x,y) AS(
        SELECT ssn x,superssn y from e where ssn = c_ssn
        UNION ALL
        SELECT y, (select superssn from e where ssn = y) from sup where x IS NOT NULL)
        Select * from sup;
    emgMgr_rec empMgr_cur%ROWTYPE;
BEGIN

    OPEN empMgr_cur(i_ssn);
        DBMS_OUTPUT.PUT_LINE(chr(10)); -- new line character, formatting purpose
	DBMS_OUTPUT.PUT_LINE('Supervision group for: '||i_empFname);
        DBMS_OUTPUT.PUT_LINE(chr(10));
        DBMS_OUTPUT.PUT_LINE('SSN      SUPERSSN');
        DBMS_OUTPUT.PUT_LINE('--------- ---------');
        FETCH empMgr_cur into emgMgr_rec;
        WHILE empMgr_cur%FOUND
           LOOP
           DBMS_OUTPUT.PUT_LINE(emgMgr_rec.x || ' ' || emgMgr_rec.y);
           FETCH empMgr_cur into emgMgr_rec;
        END LOOP;
    CLOSE empMgr_cur;
END empRecursive;
/
show errors


BEGIN
for x in (Select * from e)
    LOOP
       empRecursive(x.ssn, x.fname);
    END LOOP;
END;
/
show errors
