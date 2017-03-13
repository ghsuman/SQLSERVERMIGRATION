USE master -- Check if CDC is enabled
GO 
SELECT [name], database_id, is_cdc_enabled  
FROM sys.databases       
WHERE is_cdc_enabled = 1
GO 

USE ESWMTMK -- Enable CDC on database
GO 
EXEC sys.sp_cdc_enable_db 
GO  


USE ESWMTMK --Check if CDC on one or more Database Tables
GO 
SELECT [name], is_tracked_by_cdc  
FROM sys.tables 
WHERE is_tracked_by_cdc = 1
GO 

USE ESWMTMK --Enable CDC on table/s
GO 
EXEC sys.sp_cdc_enable_table 
@source_schema = N'dbo', 
@source_name   = N'ATTRIBUTES', 
@role_name     = NULL 
GO


--Disabling CDC 
USE AdventureWorks; -- Check CDC is on/off
GO 
EXEC sys.sp_cdc_help_change_data_capture 
GO


USE AdventureWorks; --Disable CDC on table/s

GO

EXECUTE sys.sp_cdc_disable_table 

    @source_schema = N'HumanResources', 

    @source_name = N'Shift',

    @capture_instance = N'HumanResources_Shift';

GO

USE AdventureWorks -- Disable CDC on database
GO 
EXEC sys.sp_cdc_disable_db 
GO 

--Capture Selected Column
USE AdventureWorks 
GO 
EXEC sys.sp_cdc_enable_db 
GO  

USE AdventureWorks 
GO 
EXEC sys.sp_cdc_enable_table 
@source_schema = N'HumanResources', 
@source_name   = N'Shift', 
@role_name     = NULL, 
@captured_column_list = '[ShiftID],[Name]' 
GO

--column created when CDC for column enabled

USE AdventureWorks 
GO 
SELECT * 
FROM HumanResources.Shift 
GO 
USE AdventureWorks 
GO 
SELECT * 
FROM cdc.HumanResources_Shift_CT 
GO