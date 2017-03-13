SELECT r.session_id, r.status, r.start_time, r.command, s.text, r.wait_time, r.cpu_time, r.total_elapsed_time, r.reads, 
r.writes, r.logical_reads, r.transaction_isolation_level ,r.blocking_session_id ,r.* 
FROM sys.dm_exec_requests r 
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) s


select * 
from sys.dm_exec_requests r
join sys.dm_os_tasks t on r.session_id = t.session_id
where r.session_id = 68

SELECT  wt.session_id, 
    ot.task_state, 
    wt.wait_type, 
    wt.wait_duration_ms, 
    wt.blocking_session_id, 
    wt.resource_description, 
    es.[host_name], 
    es.[program_name] 
FROM  sys.dm_os_waiting_tasks  wt  
INNER  JOIN sys.dm_os_tasks ot ON ot.task_address = wt.waiting_task_address 
INNER JOIN sys.dm_exec_sessions es ON es.session_id = wt.session_id 
WHERE es.is_user_process =  1 