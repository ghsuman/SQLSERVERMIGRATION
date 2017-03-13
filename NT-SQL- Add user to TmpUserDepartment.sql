--PSQL05B\PSQL05B

USE [TRUSTMARKPORTAL]

INSERT INTO [TRUSTMARKPORTAL].[dbo].[TmpUserDepartment] 
(userId,DepartmentNumber)
VALUES ('L98','P342')
GO

SELECT * FROM [TRUSTMARKPORTAL].[dbo].[TmpUserDepartment] 
WHERE userid in ('R03','K46','L98')


--Begin transaction
--UPDATE [TRUSTMARKPORTAL].[dbo].[TmpUserDepartment] SET DepartmentNumber = 'P342'
--WHERE userid in ('R03','K46','L98')

--commit transaction