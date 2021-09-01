set autotrace traceonly explain
Select Pnumber, Dnum, Lname, Address from p, e, d where p.Plocation='Stafford' and p.Dnum = d.Dnumber and e.Dno = d.Dnumber;
set autotrace off

set autotrace traceonly explain
Select Pnumber, Dnum, Lname, Address from p , e, d where p.Dnum = d.Dnumber and e.Dno = d.Dnumber and p.Plocation='Stafford';
set autotrace off
