Select partition_name, partition_position, num_rows from all_tab_partitions where table_owner='SH' and table_name='SALES' and num_rows > 0 and partition_position < (SELECT partition_position from all_tab_partitions where partition_name='SALES_Q4_2000' and table_name='SALES' and table_owner='SH') ORDER BY partition_name ASC;


CREATE TABLE TAB_PARTITION ( Col1 NUMBER) partition by range (Col1)(PARTITION Part1 VALUES LESS THAN (3) TABLESPACE STUD_CS2041, PARTITION Part2 VALUES LESS THAN (12) TABLESPACE STUD_CS2041,PARTITION Part3 VALUES LESS THAN (MAXVALUE) TABLESPACE STUD_CS2041);

INSERT ALL INTO TAB_PARTITION VALUES(1) INTO TAB_PARTITION VALUES(2) INTO TAB_PARTITION VALUES(2) INTO TAB_PARTITION VALUES(10) INTO TAB_PARTITION VALUES(17) SELECT * FROM dual;  

SELECT * from TAB_PARTITION WHERE Col1 < 20;

set autotrace traceonly explain
SELECT * from TAB_PARTITION WHERE Col1 < 12;
set autotrace off

ROLLBACK;

DROP TABLE  TAB_PARTITION PURGE;
