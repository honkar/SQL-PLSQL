 set autotrace traceonly explain
 select /*+ NO_PARALLEL(sh_s) */ cust_id,count(distinct prod_id)from sh.sales sh_s group by cust_id;
 set autotrace off
 
 set autotrace traceonly explain
 select /*+ PARALLEL */ cust_id,count(distinct prod_id)from sh.sales sh_s group by cust_id;
 set autotrace off
