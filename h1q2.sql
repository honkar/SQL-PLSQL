column file_name format a15;
SELECT tablespace_name, file_name, status, bytes FROM dba_data_files WHERE file_name LIKE '%.dbf';
