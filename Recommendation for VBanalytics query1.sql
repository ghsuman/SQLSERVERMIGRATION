use [VBSAnalytics]
go

CREATE NONCLUSTERED INDEX [IX_RowDeleteInd_PolicyKey] ON [dbo].[DimPolicy] 
(
	[RowDeleteInd] ASC,
	[PolicyKey] ASC
)
INCLUDE ( [PolicyId],
[SourceSystemNm],
[BusinessBlockNm]) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE NONCLUSTERED INDEX [IX_SnapshotMonthKey_PolicyKey_RowDeleteInd] ON [dbo].[FactAnnualPremiumSnapshot] 
(
	[SnapshotMonthKey] ASC,
	[PolicyKey] ASC,
	[RowDeleteInd] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [IX_SnapshotMonthKey] ON [dbo].[FactAnnualPremiumSnapshot]([PolicyKey], [SnapshotMonthKey])
go

CREATE STATISTICS [IX_SnapshotMonthKey_PolicyKey_SubProductKey] ON [dbo].[FactAnnualPremiumSnapshot]([SubProductKey], [PolicyKey], [SnapshotMonthKey])
go

CREATE STATISTICS [IX_SnapshotMonthKey_PolicyKey_RowDeleteInd] ON [dbo].[FactAnnualPremiumSnapshot]([RowDeleteInd], [PolicyKey], [SnapshotMonthKey])
go

CREATE STATISTICS [IX_SnapshotMonthKey_PolicyKey_RowDeleteInd_SubProductKey] ON [dbo].[FactAnnualPremiumSnapshot]([RowDeleteInd], [SubProductKey], [PolicyKey], [SnapshotMonthKey])
go

-----------------------------------------------------------------------------------------------------


Clustered index - CX + ‘_’+ field1+’_’+field2+…	CX_PolicyNo_RowStartDt
Non-Clustered index - NX + ‘_’+ field1+’_’+field2+…	IX_PolicyNo_RowStartDt

USE [VBSAnalytics]
GO

/****** Object:  Index [IX_RowDeleteInd]    Script Date: 11/16/2015 10:10:05 AM ******/
CREATE NONCLUSTERED INDEX [IX_RowDeleteInd] ON [dbo].[DimPolicy]
(
	[RowDeleteInd] ASC
)
INCLUDE ( 	[PolicyKey],
	[PolicyId],
	[SourceSystemNm],
	[OwnerCityNm],
	[OwnerStateNm],
	[OwnerStateGeoId],
	[OwnerZip],
	[IssueStateNm],
	[IssueStateGeoId],
	[EmployeeBirthDt],
	[EmployeeHireDt],
	[EmployeeGenderNm],
	[BusinessBlockNm]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


