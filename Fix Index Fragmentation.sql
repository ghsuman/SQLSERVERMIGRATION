SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
CREATE TABLE #FragmentedIndexes
(
 DatabaseName SYSNAME
 , SchemaName SYSNAME
 , TableName SYSNAME
 , IndexName SYSNAME
 , [Fragmentation%] FLOAT
)

INSERT INTO #FragmentedIndexes
SELECT
 DB_NAME(DB_ID()) AS DatabaseName
 , ss.name AS SchemaName
 , OBJECT_NAME (s.object_id) AS TableName
 , i.name AS IndexName
 , s.avg_fragmentation_in_percent AS [Fragmentation%]
FROM sys.dm_db_index_physical_stats(db_id(),NULL, NULL, NULL, 'SAMPLED') s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id]
AND s.index_id = i.index_id
INNER JOIN sys.objects o ON s.object_id = o.object_id
INNER JOIN sys.schemas ss ON ss.[schema_id] = o.[schema_id]
WHERE s.database_id = DB_ID()
AND i.index_id != 0
AND s.record_count > 0
AND o.is_ms_shipped = 0
DECLARE @RebuildIndexesSQL NVARCHAR(MAX)
SET @RebuildIndexesSQL = ''
SELECT
 @RebuildIndexesSQL = @RebuildIndexesSQL +
CASE
 WHEN [Fragmentation%] > 30
   THEN CHAR(10) + 'ALTER INDEX ' + QUOTENAME(IndexName) + ' ON '
      + QUOTENAME(SchemaName) + '.'
      + QUOTENAME(TableName) + ' REBUILD;'
 WHEN [Fragmentation%] > 10
    THEN CHAR(10) + 'ALTER INDEX ' + QUOTENAME(IndexName) + ' ON '
    + QUOTENAME(SchemaName) + '.'
    + QUOTENAME(TableName) + ' REORGANIZE;'
END
FROM #FragmentedIndexes
WHERE [Fragmentation%] > 10
DECLARE @StartOffset INT
DECLARE @Length INT
SET @StartOffset = 0
SET @Length = 4000
WHILE (@StartOffset < LEN(@RebuildIndexesSQL))
BEGIN
 PRINT SUBSTRING(@RebuildIndexesSQL, @StartOffset, @Length)
 SET @StartOffset = @StartOffset + @Length
END
PRINT SUBSTRING(@RebuildIndexesSQL, @StartOffset, @Length)
EXECUTE sp_executesql @RebuildIndexesSQL
DROP TABLE #FragmentedIndexes