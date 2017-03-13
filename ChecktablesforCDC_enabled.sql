USE [VBSPASDatamartRPT]
 GO
 SELECT s.name AS Schema_Name, tb.name AS Table_Name
 , tb.object_id, tb.type, tb.type_desc, tb.is_tracked_by_cdc
 FROM sys.tables tb
 INNER JOIN sys.schemas s on s.schema_id = tb.schema_id
 WHERE tb.is_tracked_by_cdc = 1


 --for CDC tables and records check in system tables of database where CDC is enabled.
 SELECT * FROM cdc.dbo_GroupReasonCodeMapping_CT
 SELECT * FROM [cdc].[dbo_ACCOUNT_CT]