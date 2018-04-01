select t2.username,
       t2.sid,
       t2.serial#,
       t3.object_name,
       t2.OSUSER,
       t2.MACHINE,
       t2.PROGRAM,
       t2.LOGON_TIME,
       t2.COMMAND,
       t2.LOCKWAIT,
       t2.SADDR,
       t2.PADDR,
       t2.TADDR,
       t2.SQL_ADDRESS,
       t1.LOCKED_MODE
  from v$locked_object t1, v$session t2, dba_objects t3
 where t1.session_id = t2.sid
   and t1.object_id = t3.object_id
 order by t2.logon_time;
