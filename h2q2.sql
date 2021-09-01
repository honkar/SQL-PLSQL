CREATE OR REPLACE VIEW VR AS Select distinct cust_id, prod_id from sh.sales;
Select count(*) from VR;

CREATE OR REPLACE VIEW VS as Select distinct s.prod_id from sh.sales s, sh.customers cu, sh.countries co  where s.cust_id = cu.cust_id and cu.country_id = co.country_id and co.country_name='New Zealand';
Select * from VS;

CREATE OR REPLACE VIEW T1 as Select distinct cust_id from VR;
Select count(*) from T1;

CREATE OR REPLACE VIEW T1XS as Select * from (Select * from T1), VS;

CREATE OR REPLACE VIEW T2 AS SELECT DISTINCT CUST_ID FROM ((Select * from T1XS) MINUS (Select * from VR));
Select count(*) from T2;

CREATE OR REPLACE VIEW T1_T2 AS SELECT  CUST_ID FROM ((SELECT * FROM T1) MINUS (SELECT * FROM T2));
Select count(*) from T1_T2;

SELECT * FROM (SELECT CUST_ID FROM T1_T2 ORDER BY CUST_ID) WHERE ROWNUM < 21;

