--set nocount on

--create table #file_contents (
-- line_number int identity,
-- line_contents nvarchar(4000)
--)

--declare @file_contents nvarchar(4000)
--declare @new_line char(2)

--set @new_line = char(13) + char(10)

--insert #file_contents
--exec master.dbo.xp_cmdshell 'type C:\reporting_var.bat'

--select @file_contents =
-- isnull(@file_contents, '') + @new_line +
-- isnull(line_contents, '')
--from #file_contents

--drop table #file_contents

--select @file_contents
--WHERE @file_contents like '%set %'

--set nocount off


create table #FileContents 
 (
     LineNumber    int identity
     , LineContents    nvarchar(4000)
 );
 
 declare @FileName    varchar(255);
 declare @NewLine    char(2) = char(13) + char(10);
 declare @CmdLine    varchar(300);
 declare @XSL        varchar(max);
 
 set @FileName = 'C:\reporting_var.bat'
 
 set @CmdLine = 'type ' + @FileName;
 
 insert #FileContents
 exec master.dbo.xp_cmdshell @CmdLine;
 
 select @XSL = isnull(@XSL, '') + @NewLine + isnull(LineContents, '')
 from      #FileContents
 order by LineNumber;



  

  IF (SELECT LineContents FROM #FileContents
  WHERE LineNumber = 3) IN (N'set type_of_load=incremental', N'Sunday')
	EXECUTE [VBSPASDatamartTST].[dbo].[sp_test] 

ELSE 
       SELECT 'Weekday';

	   SELECT count (*) FROM VBSPASDatamartTST.dbo.INSDOC_ARCHIVE