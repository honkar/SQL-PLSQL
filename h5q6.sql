

CREATE TYPE addr_type AS OBJECT(street varchar2(30), city varchar2(30));
/
CREATE TYPE addr_table AS TABLE OF addr_type;
/
CREATE TABLE tab(person_id  number, cust_addresses addr_table, PRIMARY KEY(person_id))
nested table cust_addresses store as addressTable;

insert into tab values(1,addr_table(addr_type('1234 Main St.','Folsom'),addr_type('4321 Elm Drive','Sacramento')));
insert into tab values(2,addr_table(addr_type('Gold Canal Drive','Rancho Cordova'),addr_type('Cedar Bog Way','Rancho Cordova')));

Select * from tab;

Select cust_addresses from tab where person_id = 1;

DROP TABLE tab PURGE;
DROP TYPE addr_table;
DROP TYPE addr_type;
