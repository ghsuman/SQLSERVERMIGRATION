SELECT [Database Name] = DB_NAME(database_id),
       [Type] = CASE WHEN Type_Desc = 'ROWS' THEN 'Data File(s)'
                     WHEN Type_Desc = 'LOG'  THEN 'Log File(s)'
                     ELSE Type_Desc END,
       [Size in MB] = CAST( ((SUM(Size)* 8) / 1024.0) AS DECIMAL(18,2) )
FROM   sys.master_files
--Uncomment if you need to query for a particular database
--WHERE      database_id = DB_ID('Database Name')
GROUP BY      GROUPING SETS
              (
                     (DB_NAME(database_id), Type_Desc),
                     (DB_NAME(database_id))
              )
ORDER BY      DB_NAME(database_id), Type_Desc DESC
GO
------------------------------------------------------------------------------------
SELECT      sys.databases.name,
            CONVERT(VARCHAR,SUM(size)*8/1024) AS [Total disk space in MB]
FROM        sys.databases 
JOIN        sys.master_files
ON          sys.databases.database_id=sys.master_files.database_id
GROUP BY    sys.databases.name
ORDER BY    sys.databases.name