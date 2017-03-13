DECLARE @old sysname, @new sysname, @sql varchar(1000)

SELECT
  @old = 'tmkmhc\tc7'
  , @new = 'dbo'
  , @sql = '
  IF EXISTS (SELECT NULL FROM INFORMATION_SCHEMA.TABLES
  WHERE
      QUOTENAME(TABLE_SCHEMA)+''.''+QUOTENAME(TABLE_NAME) = ''?''
      AND TABLE_SCHEMA = ''' + @old + '''
  )
  EXECUTE sp_changeobjectowner ''?'', ''' + @new + ''''

EXECUTE sp_MSforeachtable @sql