USE [master]
GO
ALTER LOGIN [webadmin] WITH CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

GO
ALTER LOGIN [webadmin] WITH CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO