--check update stats last run
SELECT OBJECT_NAME(object_id) AS [ObjectName]
      ,[name] AS [StatisticName]
      ,STATS_DATE([object_id], [stats_id]) AS [StatisticUpdateDate]
FROM sys.stats;


--update stats
GO 
SET NOCOUNT  ON 

DECLARE  @SQLcommand NVARCHAR(512), 
         @Table      SYSNAME 

DECLARE curAllTables CURSOR  FOR 

SELECT table_schema + '.' + table_name 

FROM   information_schema.tables 

WHERE  TABLE_TYPE = 'BASE TABLE' 

OPEN curAllTables 

FETCH NEXT FROM curAllTables 

INTO @Table 


WHILE (@@FETCH_STATUS = 0) 
  BEGIN 

    PRINT N'UPDATING STATISTICS FOR TABLE: ' + @Table 

    SET @SQLcommand = 'UPDATE STATISTICS ' + @Table + ' WITH FULLSCAN' 

    EXEC sp_executesql 

      @SQLcommand 

    FETCH NEXT FROM curAllTables 

    INTO @Table 

  END 

CLOSE curAllTables 

DEALLOCATE curAllTables 

SET NOCOUNT  OFF 

GO