set autotrace traceonly explain;
Select * from e , d where e.dno=d.dnumber and e.ssn in (Select mgrssn from d) and e.bdate > TO_DATE ('20-JUL-56','DD-MON-YY');
set autotrace off;

set autotrace traceonly explain;
Select od.customer_id, oi.unit_price, oi.quantity from oe.orders od, oe.order_items oi where od.order_id = oi.order_id ;
set autotrace off;
