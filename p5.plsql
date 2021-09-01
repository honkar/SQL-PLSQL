CREATE OR REPLACE PROCEDURE emp_hierarchy(i_ssn IN e.ssn%TYPE) IS
 BEGIN
  WITH empMgr(ssn , superssn) AS
  (SELECT ssn,superssn from e where ssn = i_ssn 
  UNION ALL 
  SELECT e.ssn, e.superssn from empMgr em join e on e.ssn = em.superssn)
  SELECT * FROM empMgr;
 END emp_hierarchy;
 /
 show errors


DECLARE
BEGIN
for x in (Select * from e)
	LOOP
	  DBMS_OUTPUT.PUT_LINE(x.ssn);
           emp_hierarchy(x.ssn);
	END LOOP;
END;
/
show errors
