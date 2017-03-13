USE [ICE_TravisFlex]
GO
CREATE USER [TMKMHC\M89] FOR LOGIN [TMKMHC\M89]
GO
EXEC sp_addrolemember N'db_datareader', N'TMKMHC\M89'
GO
CREATE USER [TMKMHC\R90] FOR LOGIN [TMKMHC\R90]
GO
EXEC sp_addrolemember N'db_datareader', N'TMKMHC\R90'
GO
CREATE USER [TMKMHC\U21] FOR LOGIN [TMKMHC\U21]
GO
EXEC sp_addrolemember N'db_datareader', N'TMKMHC\U21'
GO