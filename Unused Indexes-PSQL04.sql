SELECT object_name(i.object_id) AS TableName, i.name AS [Unused Index]
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats s ON s.object_id = i.object_id
      AND i.index_id = s.index_id
      AND s.database_id = db_id()
WHERE objectproperty(i.object_id, 'IsIndexable') = 1
AND objectproperty(i.object_id, 'IsIndexed') = 1
AND s.index_id is null
OR (s.user_updates > 0 and s.user_seeks = 0 and s.user_scans = 0 and s.user_lookups = 0)
ORDER BY object_name(i.object_id) ASC