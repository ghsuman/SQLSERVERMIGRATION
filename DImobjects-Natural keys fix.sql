--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimBroker ALTER COLUMN [BrokerId] [varchar] (10) NOT NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimBroker ALTER COLUMN [RowEndDtTm] [datetime]  NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimEnroller ALTER COLUMN [EnrollerId] [varchar] (10) NOT NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimEnroller ALTER COLUMN [RowCheckSum] [int]  NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimEnrollmentCompany ALTER COLUMN [EnrollmentCompanyId] [varchar] (12) NOT NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimPolicy ALTER COLUMN [EnrollmentId] [varchar] (10) NOT NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimProduct ALTER COLUMN [ProductGroupNm] [varchar] (30) NOT NULL ;
--ALTER TABLE VBSAnalytics_PAS_Merge.dbo.DimSubProduct ALTER COLUMN [ProductGroupNm] [varchar] (30) NOT NULL ;


--USE [VBSAnalytics_PAS_Merge]
--GO

--/****** Object:  Index [UN_PolicyId_SourceSystemNm_RowStartDtTm]    Script Date: 3/15/2016 3:08:30 PM ******/
--DROP INDEX [UN_PolicyId_SourceSystemNm_RowStartDtTm] ON [dbo].[DimPolicy]
--GO

--/****** Object:  Index [UN_PolicyId_SourceSystemNm_RowStartDtTm]    Script Date: 3/15/2016 3:08:30 PM ******/
--CREATE UNIQUE NONCLUSTERED INDEX [UN_PolicyId_SourceSystemNm_RowStartDtTm] ON [dbo].[DimPolicy]
--(
--	[PolicyId] ASC,
--	[RowStartDtTm] ASC,
--	[SourceSystemNm] ASC,
--	[ClientId] ASC,
--	[EnrollmentId] ASC,
--	[BusinessBlockNm] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
--GO

