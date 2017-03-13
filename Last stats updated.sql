USE ICE_AppData;

GO

  

SELECT name  AS Stats,

STATS_DATE(object_id, stats_id) AS  LastStatsUpdate

FROM sys.stats

WHERE left(name,4)!='_WA_';

  

GO