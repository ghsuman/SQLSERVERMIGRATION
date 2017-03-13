select 
    so.name, su.name, so.crdate,*
from 
    sysobjects so 
join 
    sysusers su on so.uid = su.uid  
order by 
    so.crdate desc


--SELECT OBJECT_NAME(OBJECT_ID) AS DatabaseName,
--last_user_update,*
--FROM sys.dm_db_index_usage_stats
--WHERE database_id = DB_ID( 'VBSAnalytics')


--AND OBJECT_ID=OBJECT_ID('dimplan1')



SELECT DB_NAME(ius.[database_id]) AS [Database],
OBJECT_NAME(ius.[object_id]) AS [TableName],
MAX(ius.[last_user_lookup]) AS [last_user_lookup],
MAX(ius.[last_user_scan]) AS [last_user_scan],
MAX(ius.[last_user_seek]) AS [last_user_seek] FROM sys.dm_db_index_usage_stats AS ius
WHERE ius.[database_id] = DB_ID()
 AND ius.[object_id] = OBJECT_ID('DimPlan1')
GROUP BY ius.[database_id], ius.[object_id];