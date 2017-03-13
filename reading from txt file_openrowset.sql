--DECLARE @LotsOfText VARCHAR(MAX)
--SELECT  @LotsOfText = BulkColumn
--FROM    OPENROWSET(BULK 'C:\MyBigfile.txt', SINGLE_BLOB) AS x 

--print @LotsOfText  




DECLARE @FileContents  VARCHAR(MAX)

SELECT @FileContents=BulkColumn
FROM   OPENROWSET(BULK'C:\reporting_var.bat',SINGLE_BLOB,skip = 2) AS x
--where skip = 2

print @FileContents

