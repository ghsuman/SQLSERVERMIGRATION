--SELECT TOP 5
--	st.text,
--	qp.query_plan,
--	qs.*
--FROM sys.dm_exec_query_stats qs
--CROSS APPLY sys.dm_exec_sql_text(qs.plan_handle) st
--CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
--ORDER BY total_worker_time DESC
--GO


--SELECT TOP 5
--	st.text,
--	qp.query_plan,
--	qs.*
--FROM sys.dm_exec_query_stats qs
--CROSS APPLY sys.dm_exec_sql_text(qs.plan_handle) st
--CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
--ORDER BY total_logical_reads DESC
--GO


SELECT TOP 10 SUBSTRING(qt.TEXT, (qs.statement_start_offset/2)+1,
 ((CASE qs.statement_end_offset
WHEN -1 THEN DATALENGTH(qt.TEXT)
ELSE qs.statement_end_offset
END - qs.statement_start_offset)/2)+1),
qs.execution_count,
qs.total_logical_reads, qs.last_logical_reads,
qs.total_logical_writes, qs.last_logical_writes,
qs.total_worker_time,
qs.last_worker_time,
qs.total_elapsed_time/1000000 total_elapsed_time_in_S,
qs.last_elapsed_time/1000000 last_elapsed_time_in_S,
qs.last_execution_time,
qp.query_plan
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
--ORDER BY qs.total_logical_reads DESC -- logical reads
-- ORDER BY qs.total_logical_writes DESC -- logical writes
 ORDER BY qs.total_worker_time DESC -- CPU time

 -- Get Top 100 executed SP's ordered by execution count

 SELECT TOP 100 qt.text AS 'SP Name', qs.execution_count AS 'Execution Count',  
    qs.execution_count/DATEDIFF(Second, qs.creation_time, GetDate()) AS 'Calls/Second',
    qs.total_worker_time/qs.execution_count AS 'AvgWorkerTime',
    qs.total_worker_time AS 'TotalWorkerTime',
    qs.total_elapsed_time/qs.execution_count AS 'AvgElapsedTime',
    qs.max_logical_reads, qs.max_logical_writes, qs.total_physical_reads, 
    DATEDIFF(Minute, qs.creation_time, GetDate()) AS 'Age in Cache'
    FROM sys.dm_exec_query_stats AS qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
    WHERE qt.dbid = db_id() -- Filter by current database
    ORDER BY qs.execution_count DESC


	 -- Get Top 20 executed SP's ordered by total worker time (CPU pressure)
    SELECT TOP 20 qt.text AS 'SP Name', qs.total_worker_time AS 'TotalWorkerTime', 
    qs.total_worker_time/qs.execution_count AS 'AvgWorkerTime',
    qs.execution_count AS 'Execution Count', 
    ISNULL(qs.execution_count/DATEDIFF(Second, qs.creation_time, GetDate()), 0) AS 'Calls/Second',
    ISNULL(qs.total_elapsed_time/qs.execution_count, 0) AS 'AvgElapsedTime', 
    qs.max_logical_reads, qs.max_logical_writes, 
    DATEDIFF(Minute, qs.creation_time, GetDate()) AS 'Age in Cache'
    FROM sys.dm_exec_query_stats AS qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
    WHERE qt.dbid = db_id() -- Filter by current database
    ORDER BY qs.total_worker_time DESC


	  -- Get Top 20 executed SP's ordered by logical reads (memory pressure)
    SELECT TOP 20 qt.text AS 'SP Name', total_logical_reads, 
    qs.execution_count AS 'Execution Count', total_logical_reads/qs.execution_count AS 'AvgLogicalReads',
    qs.execution_count/DATEDIFF(Second, qs.creation_time, GetDate()) AS 'Calls/Second', 
    qs.total_worker_time/qs.execution_count AS 'AvgWorkerTime',
    qs.total_worker_time AS 'TotalWorkerTime',
    qs.total_elapsed_time/qs.execution_count AS 'AvgElapsedTime',
    qs.total_logical_writes,
    qs.max_logical_reads, qs.max_logical_writes, qs.total_physical_reads, 
    DATEDIFF(Minute, qs.creation_time, GetDate()) AS 'Age in Cache', qt.dbid 
    FROM sys.dm_exec_query_stats AS qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
    WHERE qt.dbid = db_id() -- Filter by current database
    ORDER BY total_logical_reads DESC

	 -- Get Top 20 executed SP's ordered by physical reads (read I/O pressure)
    SELECT TOP 20 qt.text AS 'SP Name', qs.total_physical_reads, qs.total_physical_reads/qs.execution_count AS 'Avg Physical Reads',
    qs.execution_count AS 'Execution Count',
    qs.execution_count/DATEDIFF(Second, qs.creation_time, GetDate()) AS 'Calls/Second',  
    qs.total_worker_time/qs.execution_count AS 'AvgWorkerTime',
    qs.total_worker_time AS 'TotalWorkerTime',
    qs.total_elapsed_time/qs.execution_count AS 'AvgElapsedTime',
    qs.max_logical_reads, qs.max_logical_writes,  
    DATEDIFF(Minute, qs.creation_time, GetDate()) AS 'Age in Cache', qt.dbid 
    FROM sys.dm_exec_query_stats AS qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
    WHERE qt.dbid = db_id() -- Filter by current database
    ORDER BY qs.total_physical_reads DESC


	 -- Get Top 20 executed SP's ordered by logical writes/minute
    SELECT TOP 20 qt.text AS 'SP Name', qs.total_logical_writes, qs.total_logical_writes/qs.execution_count AS 'AvgLogicalWrites',
    qs.total_logical_writes/DATEDIFF(Minute, qs.creation_time, GetDate()) AS 'Logical Writes/Min',  
    qs.execution_count AS 'Execution Count', 
    qs.execution_count/DATEDIFF(Second, qs.creation_time, GetDate()) AS 'Calls/Second', 
    qs.total_worker_time/qs.execution_count AS 'AvgWorkerTime',
    qs.total_worker_time AS 'TotalWorkerTime',
    qs.total_elapsed_time/qs.execution_count AS 'AvgElapsedTime',
    qs.max_logical_reads, qs.max_logical_writes, qs.total_physical_reads, 
    DATEDIFF(Minute, qs.creation_time, GetDate()) AS 'Age in Cache',
    qs.total_physical_reads/qs.execution_count AS 'Avg Physical Reads', qt.dbid
    FROM sys.dm_exec_query_stats AS qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
    WHERE qt.dbid = db_id() -- Filter by current database
    ORDER BY qs.total_logical_writes DESC

-----------------------------------------------------------------------------------

	SELECT   TOP 100 [OBJECT_NAME] = OBJECT_NAME((SELECT [OBJECTID]
                                              FROM   SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE ))),
                 CREATION_TIME,
                 LAST_EXECUTION_TIME,
                 
                 AVG_CPU_TIME = (TOTAL_WORKER_TIME / EXECUTION_COUNT) / 1000,
                 MIN_CPU_TIME = MIN_WORKER_TIME / 1000,
                 MAX_CPU_TIME = MAX_WORKER_TIME / 1000,
                 LAST_CPU_TIME = LAST_WORKER_TIME / 1000,
                 TOTAL_TIME_ELAPSED = TOTAL_ELAPSED_TIME / 1000,
                 AVG_TIME_ELAPSED = (TOTAL_ELAPSED_TIME / EXECUTION_COUNT) / 1000,
                 MIN_TIME_ELAPSED = MIN_ELAPSED_TIME / 1000,
                 MAX_TIME_ELAPSED = MAX_ELAPSED_TIME / 1000,
                 AVG_PHYSICAL_READS = TOTAL_PHYSICAL_READS / EXECUTION_COUNT,
                 AVG_LOGICAL_READS = TOTAL_LOGICAL_READS / EXECUTION_COUNT,
                 EXECUTION_COUNT,
                 
                 SUBSTRING((SELECT [TEXT]
                            FROM   SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE )),
                           (QS.STATEMENT_START_OFFSET / 2) + 1,((CASE STATEMENT_END_OFFSET 
                                                                   WHEN -1 THEN DATALENGTH((SELECT [TEXT]
                                                                                            FROM   SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE )))
                                                                   ELSE QS.STATEMENT_END_OFFSET
                                                                 END - QS.STATEMENT_START_OFFSET) / 2) + 1) AS STATEMENT_TEXT
                 
FROM     SYS.DM_EXEC_QUERY_STATS QS
WHERE    OBJECT_NAME((SELECT OBJECTID
                      FROM   SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE ))) IS NOT NULL 
         AND DB_NAME((SELECT DBID
                      FROM   SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE ))) = 'ReportCaster77Dev'
                                                                       
ORDER BY DB_NAME((SELECT DBID
                  FROM   SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE ))),
         TOTAL_WORKER_TIME / EXECUTION_COUNT DESC
--------------------------------------------------------------------------------------------------------------------------------


USE master
GO

SELECT   TOP 100 [OBJECT_NAME] = OBJECT_NAME(H.OBJECTID, H.DBID),
                 CREATION_TIME,
                 LAST_EXECUTION_TIME,
                 AVG_CPU_TIME = (TOTAL_WORKER_TIME / EXECUTION_COUNT) / 1000,
                 MIN_CPU_TIME = MIN_WORKER_TIME / 1000,
                 MAX_CPU_TIME = MAX_WORKER_TIME / 1000,
                 LAST_CPU_TIME = LAST_WORKER_TIME / 1000,
                 TOTAL_TIME_ELAPSED = TOTAL_ELAPSED_TIME / 1000,
                 AVG_TIME_ELAPSED = (TOTAL_ELAPSED_TIME / EXECUTION_COUNT) / 1000,
                 MIN_TIME_ELAPSED = MIN_ELAPSED_TIME / 1000,
                 MAX_TIME_ELAPSED = MAX_ELAPSED_TIME / 1000,
                 AVG_PHYSICAL_READS = TOTAL_PHYSICAL_READS / EXECUTION_COUNT,
                 AVG_LOGICAL_READS = TOTAL_LOGICAL_READS / EXECUTION_COUNT,
                 EXECUTION_COUNT,
                 
                 SUBSTRING(H.[TEXT], (QS.STATEMENT_START_OFFSET / 2) + 1,
                         ((CASE QS.STATEMENT_END_OFFSET 
                           WHEN -1 THEN DATALENGTH(H.[TEXT])
                           ELSE QS.STATEMENT_END_OFFSET
                           END - QS.STATEMENT_START_OFFSET) / 2) + 1) AS STATEMENT_TEXT
                 
FROM     SYS.DM_EXEC_QUERY_STATS QS
            CROSS APPLY  
            SYS.DM_EXEC_SQL_TEXT (QS.SQL_HANDLE ) H
WHERE    OBJECT_NAME(H.OBJECTID, H.DBID) IS NOT NULL 
             AND DB_NAME(H.DBID) = 'ReportCaster77Dev'
                                                                       
ORDER BY DB_NAME(H.DBID),  TOTAL_WORKER_TIME / EXECUTION_COUNT DESC
