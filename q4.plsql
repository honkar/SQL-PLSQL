WITH empMgr(ssn,superssn) AS (
SELECT ssn,superssn from e where ssn = '123456789' 
UNION ALL 
SELECT e.ssn, e.superssn from empMgr em join e on e.ssn = em.superssn) 
Select * from empMgr;
