set serveroutput on;

variable tblSpace varchar2(40);
execute :tblSpace := 'STUD_CS2041';

variable avgRowSize number;
execute :avgRowSize := 100;

variable rowCount number;
execute :rowCount := 1000000000;

variable pctFree number;
execute :pctFree := 25;

variable dbBlockSize number;
execute :dbBlockSize := 8192;

variable headerSize number;
execute :headerSize := 200;

variable fanout number;
execute :fanout := 256;

DECLARE
v_used_bytes NUMBER;
v_allocated_bytes NUMBER;
v_bucketBfr NUMBER;
v_numOfBuckets NUMBER;
v_iLevels NUMBER;
BEGIN
   DBMS_SPACE.CREATE_TABLE_COST(
    tablespace_name =>:tblSpace,
    avg_row_size => :avgRowSize,
    row_count => :rowCount,
    pct_free => :pctFree,
    used_bytes=>v_used_bytes,
    alloc_bytes=>v_allocated_bytes);
    DBMS_OUTPUT.PUT_LINE('used = ' || v_used_bytes || ' bytes  ' ||
    'allocated = ' || v_allocated_bytes || ' bytes');
	v_bucketBfr :=  (:dbBlockSize * (1 - :pctFree/100) - :headerSize)/ :avgRowSize;
    v_bucketBfr := FLOOR(v_bucketBfr);
    DBMS_OUTPUT.PUT_LINE('v_bucketBfr is ' || v_bucketBfr);
	
	v_numOfBuckets := CEIL(:rowCount/ v_bucketBfr);
	v_iLevels := CEIL(LOG( :fanout, v_numOfBuckets));
	
	DBMS_OUTPUT.PUT_LINE('No. of index levels is ' || v_iLevels);
		
END;
/
show errors
set serveroutput off;
