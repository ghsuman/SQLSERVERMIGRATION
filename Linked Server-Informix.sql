USE [master]
GO


EXEC master.dbo.sp_addlinkedserver @server = N'AVAYA125', @srvproduct=N'INFORMIX', @provider=N'iFXOLEDBC', @datasrc=N'10.254.11.235'
 
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'AVAYA125',@useself=N'False',@locallogin=NULL,@rmtuser=N'odbc',@rmtpassword='Odbc!#$%'

GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'AVAYA125', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO

