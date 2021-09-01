set serveroutput on;
CREATE OR REPLACE PROCEDURE emp_hierarcy(i_ssn IN e.ssn%TYPE, i_superssn IN e.superssn%TYPE) IS
BEGIN
WITH EmpSuper (ssn , superssn) AS
(SELECT ssn ,superssn from e WHERE  ssn = i_ssn and superssn = i_superssn
UNION ALL 
SELECT ssn, superssn FROM e WHERE ssn = i_superssn and superssn IS NULL) 
SELECT * FROM EmpSuper;
END emp_hierarcy;
/
show errors

DECLARE
BEGIN
for x in (Select * from e)
	LOOP
		emp_hierarcy(x.ssn, x.superssn);
	END LOOP;
END;
/
show errors
