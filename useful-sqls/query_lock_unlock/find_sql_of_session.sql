/* --查某session 正在执行的sql语句，从而可以快速定位到哪些操作或者代码导致事务一直进行没有结束等. */
SELECT /*+ ORDERED */ 
 sql_text
  FROM v$sqltext a
 WHERE (a.hash_value, a.address) IN
       (SELECT DECODE(sql_hash_value, 0, prev_hash_value, sql_hash_value),
               DECODE(sql_hash_value, 0, prev_sql_addr, sql_address)
          FROM v$session b
         WHERE b.sid = '67')  /* 此处67 为SID*/
 ORDER BY piece ASC;