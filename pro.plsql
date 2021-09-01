set serveroutput on;
CREATE OR REPLACE PROCEDURE emp_hierarcy(i_ssn IN e.ssn%TYPE, i_superssn IN e.superssn%TYPE) IS
BEGIN
WITH EmpSuper(SSN, MGRSSN) AS
(SELECT i_ssn SSN, i_superssn MGRSSN FROM dual 
UNION ALL 
SELECT SSN , MGRSSN  FROM EmpSuper WHERE ssn = i_superssn and mgrssn IS NULL) 
SELECT * FROM EmpSuper;
END emp_hierarcy;
/
show errors
