set serveroutput on;

DECLARE
CURSOR runstats_cur IS
	SELECT OBJECT_NAME, OBJECT_TYPE, CREATED, STATUS
	FROM all_objects
	WHERE  OWNER = 'CS176125' and OBJECT_NAME LIKE 'RUNSTATS%';	
runstatsRec    runstats_cur%ROWTYPE;
BEGIN
	OPEN runstats_cur;
	FETCH runstats_cur into runstatsRec;
		WHILE runstats_cur%FOUND LOOP
                DBMS_OUTPUT.PUT_LINE('The Result is :');
                DBMS_OUTPUT.PUT_LINE('---------------------------------'); 
		DBMS_OUTPUT.PUT_LINE
		(runstatsRec.OBJECT_NAME || ' , ' || runstatsRec.OBJECT_TYPE||' , ' || runstatsRec.CREATED || ' , ' || runstatsRec.STATUS);
		FETCH runstats_cur into runstatsRec;
		END LOOP;
	CLOSE runstats_cur;
END;
/
show errors
