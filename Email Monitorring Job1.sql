USE [BillDataSQL]
GO
/****** Object:  StoredProcedure [dbo].[EmailVBSInsightsLoadNotCompleted]    Script Date: 1/23/2017 10:38:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[EmailCDCJobPSQL05BFailed]
as
BEGIN
declare
@rec varchar(255),
@mes varchar(8000),
@sub varchar(255),
@copy_recipients varchar(255),
@importance varchar(6) = 'High'

set @rec='sdevineni@trustmarkins.com'
set @copy_recipients = 'VBSAnalytics@trustmarkins.com;dbascell@trustmarkins.com; EAITeam@trustmarkins.com''ITHelp@trustmarkins.com;'
set @mes = 'Important! '+Cast (getdate() as varchar)+' Please assign to the DBA Group as a Priority 2 ticket.  
The CDC Process on PSQL05B has either stopped running or has failed.  The process should be restarted immediately. '
set @sub = Cast (getdate() as varchar)+' - Production Issue PSQL05B\PSQL05B'

EXEC  msdb.dbo.sp_send_dbmail  @recipients = @rec,  @body  = @mes,
                  @subject = @sub, @importance=@importance,@copy_recipients = @copy_recipients
END



USE [BillDataSQL]
GO

DECLARE @RC int

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[EmailCDCJobPSQL05BFailed] 
GO

