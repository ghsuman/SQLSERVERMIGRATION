USE DBAS
GO
TRUNCATE TABLE [DBAS].[dbo].[VBSAnalyticsGrants]
GO

USE VBSAnalytics
GO

Insert into [dbas].[dbo].[VBSAnalyticsGrants] (grant_statement)  
   
SELECT 'ALTER ROLE ' + quotename(dpr.name,'[')  + ' ADD MEMBER ' + quotename(dpu.name,'[')
    FROM sys.database_principals dpr
    JOIN sys.database_role_members drm on (dpr.principal_id = drm.role_principal_id)
    JOIN sys.database_principals dpu on (drm.member_principal_id = dpu.principal_id)
    WHERE dpu.principal_id > 4 

GO

Insert into [dbas].[dbo].[VBSAnalyticsGrants] (grant_statement) 

SELECT 'GRANT ' + dp.permission_name collate latin1_general_cs_as
    + ' ON ' + s.name + '.' + o.name + ' TO ' + dpr.name 
    FROM sys.database_permissions AS dp
    INNER JOIN sys.objects AS o ON dp.major_id=o.object_id
    INNER JOIN sys.schemas AS s ON o.schema_id = s.schema_id
    INNER JOIN sys.database_principals AS dpr ON dp.grantee_principal_id=dpr.principal_id
    WHERE dpr.name NOT IN ('public','guest')
