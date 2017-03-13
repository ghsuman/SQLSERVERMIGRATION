Use VBSAnalytics


GO
CREATE TABLE [dbo].[FactPDMoneyMove] (
    [MoveDateKey]           INT             NOT NULL,
    [CBSTransactionDateKey] INT             NOT NULL,
    [MoveDtTm]              DATETIME        NOT NULL,
    [CBSTransactionDtTm]    DATETIME        NOT NULL,
    [DebitCreditTypeNm]     VARCHAR (20)    NOT NULL,
    [MoveTypeNm]            VARCHAR (200)   NOT NULL,
    [MoveDetail]            VARCHAR (200)   NOT NULL,
    [EffectiveEmployerId]   INT             NOT NULL,
    [EffectiveClientKey]    INT             NOT NULL,
    [EffectivePDPaymentKey] INT             NOT NULL,
    [EffectivePDDepositKey] INT             NOT NULL,
    [ToCarrierKey]          INT             NOT NULL,
    [BillProcessorKey]      INT             NOT NULL,
    [FromTableNm]           VARCHAR (100)   NOT NULL,
    [MoveAmt]               DECIMAL (14, 2) NOT NULL,
    [AbsoluteMoveAmt]       DECIMAL (14, 2) NOT NULL,
    [CheckId]               VARCHAR (50)    NULL,
    [Subledger1]            VARCHAR (100)   NULL,
    [Subledger2]            VARCHAR (100)   NULL,
    [MoveTransactionTypeNm] VARCHAR (20)    NOT NULL,
    [ProcessRecordTypeNm]   VARCHAR (50)    NOT NULL,
    [SourceSystemNm]        VARCHAR (50)    NOT NULL,
    [RowAuditKey]           INT             NOT NULL,
    [RowDeleteInd]          SMALLINT        NOT NULL,
    CONSTRAINT [PK_FactPDMoneyMove] PRIMARY KEY NONCLUSTERED ([MoveDateKey] ASC, [CBSTransactionDateKey] ASC, [MoveDtTm] ASC, [CBSTransactionDtTm] ASC, [DebitCreditTypeNm] ASC, [MoveTypeNm] ASC, [MoveDetail] ASC, [EffectiveEmployerId] ASC, [EffectiveClientKey] ASC, [EffectivePDPaymentKey] ASC, [EffectivePDDepositKey] ASC, [ToCarrierKey] ASC, [BillProcessorKey] ASC, [FromTableNm] ASC) WITH (FILLFACTOR = 90)
);


GO
PRINT N'Creating [dbo].[DimBillProcessor].[IX_DimBillProcessor_RowDeleteInd_BillProcessorKey_BillProcessorReportNm_BillProcessorUserId_BillProcessorId]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimBillProcessor_RowDeleteInd_BillProcessorKey_BillProcessorReportNm_BillProcessorUserId_BillProcessorId]
    ON [dbo].[DimBillProcessor]([RowDeleteInd] ASC, [BillProcessorKey] ASC, [BillProcessorReportNm] ASC, [BillProcessorUserId] ASC, [BillProcessorId] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[DimClient].[IX_DimClient_RowDeleteInd_ClientKey_ClientCompanyNm]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimClient_RowDeleteInd_ClientKey_ClientCompanyNm]
    ON [dbo].[DimClient]([RowDeleteInd] ASC, [ClientKey] ASC, [ClientCompanyNm] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[DimDate].[IX_DimDate_RowDeleteInd_DateDt_DateKey]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimDate_RowDeleteInd_DateDt_DateKey]
    ON [dbo].[DimDate]([RowDeleteInd] ASC, [DateDt] ASC, [DateKey] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[DimPolicy].[IX_DimPolicy_RowDeleteInd_PolicyKey_PolicyId]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimPolicy_RowDeleteInd_PolicyKey_PolicyId]
    ON [dbo].[DimPolicy]([RowDeleteInd] ASC, [PolicyKey] ASC, [PolicyId] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[IX_FactPDCBSPolicyApply_RowDeleteInd_BillProcessorKey_PymtPDApplyPolicyDateKey]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactPDCBSPolicyApply_RowDeleteInd_BillProcessorKey_PymtPDApplyPolicyDateKey]
    ON [dbo].[FactPDCBSPolicyApply]([RowDeleteInd] ASC, [BillProcessorKey] ASC, [PymtPDApplyPolicyDateKey] ASC) WITH (FILLFACTOR = 90)
    ON [PRIMARY];


GO
PRINT N'Creating [dbo].[FactPDNotProcessAmtSnapshot].[IX_RowDeleteInd]...';


GO
CREATE NONCLUSTERED INDEX [IX_RowDeleteInd]
    ON [dbo].[FactPDNotProcessAmtSnapshot]([RowDeleteInd] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[FactPDSuspenseSnapshot].[IX_FactPDSuspenseSnapshot_RowDeleteInd]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactPDSuspenseSnapshot_RowDeleteInd]
    ON [dbo].[FactPDSuspenseSnapshot]([RowDeleteInd] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[FactPDSuspenseSnapshot].[IX_RowDeleteInd]...';


GO
CREATE NONCLUSTERED INDEX [IX_RowDeleteInd]
    ON [dbo].[FactPDSuspenseSnapshot]([RowDeleteInd] ASC) WITH (FILLFACTOR = 90);


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_SourceSystemNm]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_SourceSystemNm] DEFAULT ('Unknown') FOR [SourceSystemNm];


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_RowDeleteInd]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_RowDeleteInd] DEFAULT ((0)) FOR [RowDeleteInd];


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_RowAuditKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_RowAuditKey] DEFAULT ((0)) FOR [RowAuditKey];


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_ProcessRecordTypeNm]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_ProcessRecordTypeNm] DEFAULT ('Unknown') FOR [ProcessRecordTypeNm];


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_MoveTransactionTypeNm]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_MoveTransactionTypeNm] DEFAULT ('Unknown') FOR [MoveTransactionTypeNm];


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_MoveAmt]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_MoveAmt] DEFAULT ((0)) FOR [MoveAmt];


GO
PRINT N'Creating [dbo].[DF_FactPDMoneyMove_AbsoluteMoveAmt]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove]
    ADD CONSTRAINT [DF_FactPDMoneyMove_AbsoluteMoveAmt] DEFAULT ((0)) FOR [AbsoluteMoveAmt];


GO
PRINT N'Creating [dbo].[DimBillProcessor].[DimBillProcessor_BillProcessorReportNm_BillProcessorUserId_BillProcessorId_RowDeleteInd_stat]...';


GO
CREATE STATISTICS [ST_DimBillProcessor_BillProcessorReportNm_BillProcessorUserId_BillProcessorId_RowDeleteInd]
    ON [dbo].[DimBillProcessor]([BillProcessorReportNm], [BillProcessorUserId], [BillProcessorId], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[DimBillProcessor].[DimBillProcessor_RowDeleteInd_BillProcessorReportNm_BillProcessorUserId_BillProcessorId_stat]...';


GO
CREATE STATISTICS [ST_DimBillProcessor_RowDeleteInd_BillProcessorReportNm_BillProcessorUserId_BillProcessorId]
    ON [dbo].[DimBillProcessor]([BillProcessorKey], [RowDeleteInd], [BillProcessorReportNm], [BillProcessorUserId], [BillProcessorId]);


GO
PRINT N'Creating [dbo].[DimClient].[IX_stat_DimClient_ClientCompanyNm_RowDeleteInd]...';


GO
CREATE STATISTICS [ST_DimClient_ClientCompanyNm_RowDeleteInd]
    ON [dbo].[DimClient]([ClientCompanyNm], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[DimDate].[IX_stat_DimDate_DateKey_RowDeleteInd_DateDt]...';


GO
CREATE STATISTICS [ST_DimDate_DateKey_RowDeleteInd_DateDt]
    ON [dbo].[DimDate]([DateKey], [RowDeleteInd], [DateDt]);


GO
PRINT N'Creating [dbo].[DimPolicy].[IX_stat_DimPolicy_PolicyId_RowDeleteInd]...';


GO
CREATE STATISTICS [ST_DimPolicy_PolicyId_RowDeleteInd]
    ON [dbo].[DimPolicy]([PolicyId], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[FactPDCBSPolicyApply_BillProcessorKey_PymtPDApplyPolicyDateKey_RowDeleteInd_stat]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_BillProcessorKey_PymtPDApplyPolicyDateKey_RowDeleteInd]
    ON [dbo].[FactPDCBSPolicyApply]([BillProcessorKey], [PymtPDApplyPolicyDateKey], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[FactPDCBSPolicyApply_PymtPDApplyPolicyDateKey_RowDeleteInd_stat]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_PymtPDApplyPolicyDateKey_RowDeleteInd]
    ON [dbo].[FactPDCBSPolicyApply]([PymtPDApplyPolicyDateKey], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[IX_stat_FactPDCBSPolicyApply_ClientKey_PolicyKey_PymtPDApplyPolicyDateKey]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_ClientKey_PolicyKey_PymtPDApplyPolicyDateKey]
    ON [dbo].[FactPDCBSPolicyApply]([ClientKey], [PolicyKey], [PymtPDApplyPolicyDateKey]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[IX_stat_FactPDCBSPolicyApply_PymtPDApplyPolicyDTTm_RowDeleteInd_PymtPDApplyPolicyDateKey]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_PymtPDApplyPolicyDTTm_RowDeleteInd_PymtPDApplyPolicyDateKey]
    ON [dbo].[FactPDCBSPolicyApply]([PymtPDApplyPolicyDTTm], [RowDeleteInd], [PymtPDApplyPolicyDateKey]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[IX_stat_FactPDCBSPolicyApply_RowDeleteInd_ClientKey_PolicyKey]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_RowDeleteInd_ClientKey_PolicyKey]
    ON [dbo].[FactPDCBSPolicyApply]([RowDeleteInd], [ClientKey], [PolicyKey]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[IX_stat_FactPDCBSPolicyApply_RowDeleteInd_PolicyKey]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_RowDeleteInd_PolicyKey]
    ON [dbo].[FactPDCBSPolicyApply]([RowDeleteInd], [PolicyKey]);


GO
PRINT N'Creating [dbo].[FactPDCBSPolicyApply].[IX_stat_FactPDCBSPolicyApply_RowDeleteInd_PymtPDApplyPolicyDateKey_ClientKey_PolicyKey_PymtPDApplyPolicyDTTm]...';


GO
CREATE STATISTICS [ST_FactPDCBSPolicyApply_RowDeleteInd_PymtPDApplyPolicyDateKey_ClientKey_PolicyKey_PymtPDApplyPolicyDTTm]
    ON [dbo].[FactPDCBSPolicyApply]([RowDeleteInd], [PymtPDApplyPolicyDateKey], [ClientKey], [PolicyKey], [PymtPDApplyPolicyDTTm]);


GO
PRINT N'Creating [dbo].[FactPDNotProcessAmtSnapshot].[FactPDNotProcessAmtSnapshot_MainBillProcessorKey_RowDeleteInd_SnapshotDateKey_stat]...';


GO
CREATE STATISTICS [ST_FactPDNotProcessAmtSnapshot_MainBillProcessorKey_RowDeleteInd_SnapshotDateKey]
    ON [dbo].[FactPDNotProcessAmtSnapshot]([MainBillProcessorKey], [RowDeleteInd], [SnapshotDateKey]);


GO
PRINT N'Creating [dbo].[FactPDNotProcessAmtSnapshot].[FactPDNotProcessAmtSnapshot_SnapshotDateKey_RowDeleteInd_stat]...';


GO
CREATE STATISTICS [ST_FactPDNotProcessAmtSnapshot_SnapshotDateKey_RowDeleteInd]
    ON [dbo].[FactPDNotProcessAmtSnapshot]([SnapshotDateKey], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[FactPDSuspenseSnapshot].[FactPDSuspenseSnapshot_RowDeleteInd_MainBillProcessorKey_SnapshotDateKey_stat]...';


GO
CREATE STATISTICS [ST_FactPDSuspenseSnapshot_RowDeleteInd_MainBillProcessorKey_SnapshotDateKey]
    ON [dbo].[FactPDSuspenseSnapshot]([RowDeleteInd], [MainBillProcessorKey], [SnapshotDateKey]);


GO
PRINT N'Creating [dbo].[FactPDSuspenseSnapshot].[FactPDSuspenseSnapshot_SnapshotDateKey_RowDeleteInd_stat]...';


GO
CREATE STATISTICS [ST_FactPDSuspenseSnapshot_SnapshotDateKey_RowDeleteInd]
    ON [dbo].[FactPDSuspenseSnapshot]([SnapshotDateKey], [RowDeleteInd]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimBillProcessor_BillProcessorKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimBillProcessor_BillProcessorKey] FOREIGN KEY ([BillProcessorKey]) REFERENCES [dbo].[DimBillProcessor] ([BillProcessorKey]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimCarrier_ToCarrierKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimCarrier_ToCarrierKey] FOREIGN KEY ([ToCarrierKey]) REFERENCES [dbo].[DimCarrier] ([CarrierKey]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimClient_EffectiveClientKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimClient_EffectiveClientKey] FOREIGN KEY ([EffectiveClientKey]) REFERENCES [dbo].[DimClient] ([ClientKey]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimDate_MoveDateKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimDate_MoveDateKey] FOREIGN KEY ([MoveDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimDate_CBSTransactionDateKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimDate_CBSTransactionDateKey] FOREIGN KEY ([CBSTransactionDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimPDDeposit_EffectivePDDepositKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimPDDeposit_EffectivePDDepositKey] FOREIGN KEY ([EffectivePDDepositKey]) REFERENCES [dbo].[DimPDDeposit] ([PDDepositKey]);


GO
PRINT N'Creating [dbo].[FK_FactPDMoneyMove_DimPDPayment_EffectivePDPaymentKey]...';


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH NOCHECK
    ADD CONSTRAINT [FK_FactPDMoneyMove_DimPDPayment_EffectivePDPaymentKey] FOREIGN KEY ([EffectivePDPaymentKey]) REFERENCES [dbo].[DimPDPayment] ([PDPaymentKey]);


GO
PRINT N'Altering [dbo].[DailyDeleteFactPDDepositComplete]...';


GO



ALTER procedure [dbo].[DailyDeleteFactPDDepositComplete]
as
begin
	--set 1 balanced		
select  'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId, CDCEffectiveDtTm BalancedDtTm  --9/22 removed min --1/4/16
into	#Balanced
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
where	ACCOUNT_STATUS = 'BALANCED'
		and CDCEffectiveDtTm is not null
		and RowCurrentInd=0
--group by 
-- 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
--			+'_'
--			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
--			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
--			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
--			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
--			+'*'
--			+right('000000'+cast(a.SPLIT_ID as varchar),6)
	--set 2 unbalanced
select 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId, isnull(CDCEffectiveDtTm,'1900-01-01') LastNotBalancedDtTm  --9/22 removed min --1/4/16
into	#NotBalanced
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a

where	ACCOUNT_STATUS <> 'BALANCED' 
		and RowCurrentInd=1
		and CDCEffectiveDtTm is not NULL
--group by 
--			'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
--			+'_'
--			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
--			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
--			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
--			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
--			+'*'
--			+right('000000'+cast(a.SPLIT_ID as varchar),6)

select distinct DP.PDDepositKey ,convert(varchar(8),BalancedDtTm,112) CompleteDateKey from #Balanced b 
inner join #NotBalanced nb on b.DepositId = nb.DepositId 
inner join vbsanalytics.dbo.DimPDDeposit DP on b.DepositId = DP.DepositId
and nb.LastNotBalancedDtTm>b.BalancedDtTm
order by 2
drop table #Balanced
drop table #NotBalanced
end
GO
PRINT N'Altering [dbo].[DailyDimPDBill]...';


GO

ALTER procedure [dbo].[DailyDimPDBill] as

Begin

-------------Find what was added since it ran last time
DECLARE  @AuditKey int
SET @AuditKey =	isnull((select	MIN(RowAuditKey) 
				from	VBSAudit.dbo.VBSDMAudit
				where	CreateDtTm>
						(
							
							select max(cast(CreateDtTm as DATE)) from VBSAudit.dbo.VBSDMAudit --2/9/2015
							where SystemTypeNm = 'ANALYTICS' and TargetTableNm = 'DimPDBill' And SuccessInd=1
						)
				),0)
----------Calculate first bills----------------------------------------

; with FirstBill as 
(
		select EmployerId, min ( BillId ) BillId
		from(
		select 	'B'
					+ right('000000'+cast(Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),BILL_DUE_DATE,112) as BillId,
				Employer_Number as EmployerId
		from	VBSDMOds.dbo.CBS_COMPANY_PAY_TABLE
		--where	RowCurrentInd = 1 
		union all
		select 'B'
					+ right('000000'+cast(Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),BILL_DUE_DATE,112) BillId ,
				Employer_Number
		from	VBSDMODS.dbo.CBS_COMPANY_PAID_INFO_SUMMARY a	
		where	SERVICE_CODE <> 'Suspense'
		--		and RowCurrentInd = 1
		union all
		select 'B'
					+ right('000000'+cast(Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),BILL_DUE_DATE,112) ,
				Employer_Number
		from	VBSDMODS.dbo.CBS_Account_Credits a	
		where	--RowCurrentInd = 1
				--and 
				BILL_DUE_DATE is not NULL
				)	x
		group by 	EmployerId
)

select * into #FirstBill from FirstBill --11/6
create clustered index CX on #FirstBill(BillId) --11/6
-------------------------bill create date----------------------------------------
; with StartDate as
(
				select 'B'
							+	right('000000'+cast(a.Employer_Number as varchar),6)
							+	'_'
							+	convert(varchar(8),BILL_DUE_DATE,112) BillId 
						, min ( CDCEffectiveDtTm ) BillCreateDtTm
				from	VBSDMOds.dbo.CBS_COMPANY_PAY_TABLE a
				where	CDCEffectiveDtTm is not NULL --take active and inactive record to find first insert
				and exists  --11/6
				(select 1 from #FirstBill
				where 
				'B'
							+	right('000000'+cast(a.Employer_Number as varchar),6)
							+	'_'
							+	convert(varchar(8),BILL_DUE_DATE,112) =BillId) --1/6
				group by 
						'B'+right('000000'+cast(a.Employer_Number as varchar),6)
						+'_'
						+convert(varchar(8),BILL_DUE_DATE,112) 
)
-------------------------Final select statement
select * from (
select  
		'B'+right('000000'+cast(a.Employer_Number as varchar),6 )
			+'_'
			+convert(varchar(8),BILL_DUE_DATE,112 ) as BillId,
		a.Employer_Number as EmployerId,
		case when d.BillId is not null then d.BillCreateDtTm else sd.BillCreateDtTm end BillCreateDtTm ,--RowStartDtTm BillCreateDtTm, --not available now, DATE TIME BILL GENERATED or '1900-01-01'  - for initial load
		a.BILLING_PERIOD_START as BillStartDtTm,
		a.BILLING_PERIOD_END as BillEndDtTm,
		DATEDIFF ( dd, a.BILLING_PERIOD_START, a.BILLING_PERIOD_END ) as PeriodDayNo,
		cast ( a.BILL_DUE_DATE as date ) as BillDueDtTm , --remove time to be able to tie back
		isnull ( a.TOTAL_EMPLOYEE_AMOUNT_DUE,0 )
			+ isnull(a.TOTAL_EMPLOYER_AMOUNT_DUE,0 )
			+ isnull(a.TOTAL_EMPLOYEE_FEE_DUE,0 )
			+ isnull(a.TOTAL_EMPLOYER_FEE_DUE,0 ) as BillAmt,
		isnull ( xref.AmtTypeNm,'Unknown' ) BillAmtTypeNm,
		isnull ( xref.AmtTypeDesc,'Unknown' ) BillAmtTypeDesc,
		isnull ( a.NUMBER_OF_PAY_RECORDS,0 ) as PolicyCnt,
		isnull ( x.CountTypeNm,'Unknown' ) PolicyCountTypeNm,
		isnull ( x.CountTypeDesc,'Unknown' ) PolicyCountTypeDesc,
		'CBS' SourceSystemNm,
		--a.RowCurrentInd,
		--a.RowDeleteInd,
		case 
			when ti.TrustmarkInd = 1 then 'Trustmark'
			when ti.TrustmarkInd = 0 then 'Not Trustmark'
			else 'Unknown'
		end TrustmarkOrNotNm,
		case when fb.BillId is NULL then 0 else 1 end FirstBillInd,
		row_number() over(
						partition by 'B'+right('000000'+cast(a.Employer_Number as varchar),6)
										+'_'
										+convert(varchar(8),BILL_DUE_DATE,112) 
						order by	CDCEffectiveDtTm desc , 
									RowNoId desc
						) RN
from	VBSDMOds.dbo.CBS_COMPANY_PAY_TABLE a
-----------Amount Range
		left join VBSDMReference.dbo.AmtTypeXref xref
			on	isnull ( TOTAL_EMPLOYEE_AMOUNT_DUE,0 )
				+ isnull ( TOTAL_EMPLOYER_AMOUNT_DUE,0 )
				+ isnull ( TOTAL_EMPLOYEE_FEE_DUE,0 )
				+ isnull ( TOTAL_EMPLOYER_FEE_DUE,0 ) between MinAmt and MaxAmt
-------Policy Count Range
		left join VBSDMReference.dbo.CountTypeXref x
			on NUMBER_OF_PAY_RECORDS between MinCnt and MaxCnt
------TrustmarkInd
		left join
			(	Select distinct cp.Employer_Number,TrustmarkInd
				From	VBSDMOds.dbo.CBS_Employee_Audit_Table  CP
						inner join VBSDMReference.dbo.CarrierXref CAR
					on CAR.CarrierId = CP.Carrier_Number
				where TrustmarkInd=1 and CP.RowCurrentInd =1
			) ti
			on a.Employer_Number=ti.Employer_Number
----First Bill
		left join #FirstBill fb --11/6
			on	'B'
				+ right('000000'+cast(a.Employer_Number as varchar),6)
				+ '_'
				+ convert(varchar(8),BILL_DUE_DATE,112) = fb.BillId
---- Bill Create Date from CDC
		left join StartDate sd
			on 
				'B'
				+ right('000000'+cast(a.Employer_Number as varchar),6)
			    + '_'
			    + convert(varchar(8),BILL_DUE_DATE,112) = sd.BillId
--Bill Create Date from dimension if there are no CDCs
		left join DimPDBill d
			on 'B'
				+ right('000000'+cast(a.Employer_Number as varchar),6)
				+ '_'
				+ convert(varchar(8),BILL_DUE_DATE,112) = d.BillId
WHERE a.RowAuditKey>@AuditKey --and a.RowCurrentInd = 1
) x 
where	RN = 1 --take the last record from transactions
		and	BillAmt <= 999999999999.99 --we had a record that was greater than max
drop table #FirstBill --11/6
END
GO
PRINT N'Altering [dbo].[DailyDimPDDeposit]...';


GO

ALTER procedure [dbo].[DailyDimPDDeposit] as
BEGIN
----------------Find Last Process AuditKey
DECLARE  @AuditKey int
SET @AuditKey =	isnull((select	MIN(RowAuditKey) 
				from	VBSAudit.dbo.VBSDMAudit
				where	CreateDtTm>
						(
							
							select max(cast(CreateDtTm as DATE)) from VBSAudit.dbo.VBSDMAudit --2/9/2015
							where SystemTypeNm = 'ANALYTICS' and TargetTableNm = 'DimPDDeposit' And SuccessInd=1
						)
				),0)
--print @auditKey
------------------Find records that were effected by last ODS process
----Returns a list of DepositIds
; with CTE_AC as ( 
select distinct 
		'D'
		+ right('000000'+cast(a.Employer_Number as varchar),6)
		+ '_'
		+ convert(varchar(8),a.Deposit_Date,112)
		+ '_'
		+ right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+ right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+ right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+ right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
		+ '*'
		+ right('000000'+cast(isnull(SPLIT_ID,'') as varchar),6) DepositId --12/16
from	VBSDMODS.dbo.CBS_ACCOUNT_CREDITS a
where	a.RowAuditKey>@AuditKey	
		and CDCEffectiveDtTm is not NULL
		and deposit_date between '2013-01-01'	and getdate() --11/13
union 
select 'D'+right('000000'+cast(b.Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),b.Deposit_Date,112)
					+ '_'
					+ right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
					+ right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
					+ '*'
					+ '000000'

from VBSDMODS.dbo.CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE b
where	b.RowAuditKey>@AuditKey	
		and CDCEffectiveDtTm is not NULL	
		and deposit_date between '2013-01-01'	and getdate() --11/13		
)

---------------Find CDC start date for each deposit using CDC Effective date
, CTE_EFF_DT as(
Select 
		cte.DepositId DepositId,
		CDCEffectiveDtTm DepositCreateDtTm
From	CTE_AC CTE
		inner join VBSDMODS.dbo.CBS_ACCOUNT_CREDITS a
			on CTE.depositId = 
								'D'
								+ right('000000'+cast(a.Employer_Number as varchar),6)
								+ '_'
								+ convert(varchar(8),a.Deposit_Date,112)
								+ '_'
								+ right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
								+ right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
								+ right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
								+ right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
								+ '*'
								+ right('000000'+cast(isnull(SPLIT_ID,'') as varchar),6) --12/16
						
where CDCEffectiveDtTm is not NULL
union all
select 'D'+right('000000'+cast(b.Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),b.Deposit_Date,112)
					+ '_'
					+ right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
					+ right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
					+ '*'
					+ '000000'
,
CDCEffectiveDtTm DepositCreateDtTm

from VBSDMODS.dbo.CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE b
inner join CTE_AC CTE
			on CTE.depositId = 
								 'D'+right('000000'+cast(b.Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),b.Deposit_Date,112)
					+ '_'
					+ right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
					+ right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
					+ '*'
					+ '000000'
where CDCEffectiveDtTm is not NULL)
-----------------------min date
,#Start_AC as(
select DepositId, min(DepositCreateDtTm) DepositCreateDtTm 
--into #Start_AC
from  CTE_EFF_DT
group by DepositId)


--------------------Final list for ETL

select DepositId,
	EmployerId	,
	ChangeId	,
	DepositCreateDtTm,	
	DepositAmt	,
	DepositAmtTypeNm,	
	DepositAmtTypeDesc,	
	TrustmarkOrNotNm	,
	SourceSystemNm,
	 DepositDtTm --11/4/2015

 from 
----splits or changes deposits
	(      
			Select distinct
				'D'+right('000000'+cast(b.Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),b.Deposit_Date,112)
					+ '_'
					+ right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
					+ right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
					+ '*'
					+ '000000'
				DepositId , 
				b.Employer_Number EmployerId, 
				0 ChangeId,--cte.Id
				case when dp.DepositId is not NULL then dp.DepositCreateDtTm else sd.DepositCreateDtTm end DepositCreateDtTm,
				b.CHECK_amount DepositAmt,
				x.AmtTypeNm DepositAmtTypeNm,
				x.AmtTypeDesc DepositAmtTypeDesc,
				case 
					when a.TrustmarkInd = 1 then 'Trustmark'
					when a.TrustmarkInd = 0 then 'Not Trustmark'
					else 'Unknown'
				end TrustmarkOrNotNm,
				'CBS' SourceSystemNm,
				row_number() over (partition by 'D'+right('000000'+cast(b.Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),b.Deposit_Date,112)
					+ '_'
					+ right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
					+ right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
					+ '*'
					+ '000000' order by RowNoId desc) RnLast--,
				--b.RowCurrentInd,
				--b.RowDeleteInd
				,b.Deposit_Date DepositDtTm --11/4/2015
				
			From	CTE_AC
					inner join VBSDMODS.dbo.CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE b
						on CTE_AC.DepositId = 'D'+right('000000'+cast(b.Employer_Number as varchar),6)
					+ '_'
					+ convert(varchar(8),b.Deposit_Date,112)
					+ '_'
					+ right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
					+ right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
					+ right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
					+ '*'
					+ '000000'
					left join #Start_AC sd
						on CTE_AC.DepositId  = sd.DepositId
					left join VBSAnalytics..DimPdDeposit dp
						on cte_AC.DepositId  = dp.depositId
					left join VBSDMReference.dbo.AmtTypeXref x
						on b.CHECK_AMOUNT between x.MinAmt and x.MaxAmt
					left join
						(	Select distinct cp.Employer_Number,TrustmarkInd
							From	VBSDMOds.dbo.CBS_Employee_Audit_Table  CP
									inner join VBSDMReference.dbo.CarrierXref CAR
								on CAR.CarrierId = CP.Carrier_Number
							where TrustmarkInd=1 and CP.RowCurrentInd = 1
						) a
							on b.Employer_Number=a.Employer_Number
			Where 
					b.Deposit_Date between '2013-01-01' and getdate()
	) t
where RnLast = 1

union 
------------------account credits deposits
select DepositId,
	EmployerId	,
	ChangeId	,
	DepositCreateDtTm,	
	DepositAmt	,
	DepositAmtTypeNm,	
	DepositAmtTypeDesc,	
	TrustmarkOrNotNm	,
	SourceSystemNm,
	 DepositDtTm --11/4/2015
from (

Select distinct 
	'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
	+'*'
	+right('000000'+cast(isnull(SPLIT_ID,'') as varchar),6) --12/16
	DepositId , 
	a.Employer_Number EmployerId, 
	isnull(cast (SPLIT_ID as int),0) ChangeId,
	isnull(sd1.DepositCreateDtTm,dp.DepositCreateDtTm) DepositCreateDtTm,
	isnull(CHECK_AMOUNT,0)+
	isnull(REVERSAL_POOL,0)+
	isnull(OVER_AND_SHORT,0)+
	isnull(Forgiven_Prem_Amt,0) DepositAmt,
	x.AmtTypeNm DepositAmtTypeNm,
	x.AmtTypeDesc DepositAmtTypeDesc,
	case 
		when b.TrustmarkInd = 1 then 'Trustmark'
		when b.TrustmarkInd = 0 then 'Not Trustmark'
		else 'Unknown'
	end TrustmarkOrNotNm,
	'CBS' SourceSystemNm,
	row_number() over (partition by cte1.DepositID order by RowNoId desc) RnLast--,
	--a.RowCurrentInd,
	--a.RowDeleteInd
	,a.Deposit_Date DepositDtTm --11/4/2015
From	CTE_AC cte1
	inner join  VBSDMODS..CBS_Account_credits a
 	on cte1.DepositId = 	
 		'D'
 		+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
		+'*'
		+right('000000'+cast(isnull(SPLIT_ID,'') as varchar),6) --12/16
	left join #Start_AC sd1
		on cte1.DepositID  = sd1.DepositId
	left join VBSAnalytics..DimPdDeposit dp
		on cte1.DepositId = dp.DepositId
	left join VBSDMReference.dbo.AmtTypeXref x
		on (	isnull(CHECK_AMOUNT,0)+
			isnull(REVERSAL_POOL,0)+
			isnull(OVER_AND_SHORT,0)+
			isnull(Forgiven_Prem_Amt,0)) between x.MinAmt and x.MaxAmt
	left join
		(	Select distinct cp.Employer_Number,TrustmarkInd
			From	VBSDMODS.dbo.CBS_Employee_Audit_Table  CP
					inner join VBSDMReference.dbo.CarrierXref CAR
				on CAR.CarrierId = CP.Carrier_Number
			where TrustmarkInd=1) b
				on a.Employer_Number=b.Employer_Number
Where	--a.CREDIT_RECORD_TYPE <> 'PX'
		--and 
		a.Deposit_Date between '2013-01-01' and getdate()
		and ACCOUNT_STATUS not in 
				(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
		and 'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(SPLIT_ID,'') as varchar),6)--12/16
		not in
			(select depositid from DimPdDeposit)
) t1
where t1.RnLast = 1
END
GO
PRINT N'Altering [dbo].[DailyDimPDSuspense]...';


GO

ALTER procedure [dbo].[DailyDimPDSuspense]
as
begin

DECLARE  @AuditKey int
SET @AuditKey =	isnull((
						select	MIN(RowAuditKey) 
						from	VBSAudit.dbo.VBSDMAudit
						where	CreateDtTm>
						(
							
							select max(cast(CreateDtTm as DATE)) from VBSAudit.dbo.VBSDMAudit --2/9/2015
							where SystemTypeNm = 'ANALYTICS' and TargetTableNm = 'DimPDSuspense' And SuccessInd = 1
						)
				),0)
PRINT @AuditKey
;with ChangedRecords as
(
	select 
			distinct  
			Employer_Number
			,PAYMENT_EFFECTIVE_DATE 
	FROM	VBSDMODS.dbo.CBS_EMPSUSPTRACK a 
	where	RowAuditKey>@AuditKey  
			and CDCEffectiveDtTm is not NULL	
			and PAYMENT_EFFECTIVE_DATE between '2013-01-01' and getdate() --8/4 added
	union 
	select 
			distinct  
			Employer_Number
			,PAYMENT_EFFECTIVE_DATE 
	FROM	VBSDMODS.dbo.CBS_SUSPENSE_TRACKING a 
	where	RowAuditKey>@AuditKey 
			and CDCEffectiveDtTm is not NULL	
			and PAYMENT_EFFECTIVE_DATE between '2013-01-01' and getdate()--8/4 added
	union
	select 
			distinct 
			Employer_Number
			,Deposit_Date 
	FROM VBSDMODS.dbo.CBS_Account_Credits ac
	where	RowAuditKey>@AuditKey 
			and CDCEffectiveDtTm is not NULL	
			and Deposit_Date between '2013-01-01' and getdate()--8/4 added
)

--select * from ChangedRecords
------------SUSPENSE Create Date----------------------------------
, SuspCreate as 
(
	select 'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
			+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) )  SuspenseId, -- isnull added 8/4 a.Service_Code
			min ( a.CDCEffectiveDtTm ) SuspenseCreateDtTm --find first day when suspense was created
	from	VBSDMODS.dbo.CBS_EMPSUSPTRACK 	 a
	where 	CDCEffectiveDtTm is not NULL	
	group by 	
			'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
			+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) ) 
)
-----------------------------final query ------------------------------	
SELECT 
		'S' + right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+ right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+ right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+ right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
			+ '_'
			+ a.Employee_SSN
			+ '_' 
			+ upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) )  SuspenseId, --unique key
		a.Employee_SSN SuspenseNo,--part of NK
		a.Employer_Number as EmployerId,  --part of NK
		a.PAYMENT_EFFECTIVE_DATE as DepositDtTm, --part of NK
		upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) ) as ServiceId, --part of NK
		isnull ( 'B'+right ( '000000' + cast ( b.Employer_Number as varchar ),6 )
							+'_'+convert ( varchar(8),b.Bill_Due_Date,112 ),'Unknown' ) as BillId, --associated BILL
		coalesce ( f.PaymentId,F1.PaymentId,F2.PaymentId,
				'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3) ) as PaymentId, --associated payment
		'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2) 
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3) 
					+'*'
					+right('000000'+cast(isnull(ac.SPLIT_ID,'') as varchar),6) as DepositId, --associated deposit
		isnull ( a.EMPLOYEE_SUSPENSE_PREMIUM,0)+isnull(a.EMPLOYER_SUSPENSE_PREMIUM,0) as SuspenseAmt, --total amount
		coalesce ( sc.SuspenseCreateDtTm,dim.SuspenseCreateDtTm)  as SuspenseCreateDtTm , ----should be replaced with min a.RowStartDtTm SuspenseCreateDtTm
		isnull ( dbo.udf_AddBusinessDayToDate(cast(
		coalesce( 
			f.PaymentReceiveDtTm,
			f1.PaymentReceiveDtTm,
			f2.PaymentReceiveDtTm-- , 
			--a.PAYMENT_EFFECTIVE_DATE 
			)
			 as date),tx.TargetNo),NULL) as ResolutionDueDtTm, --8/31
		dbo.udf_BusinessDayCnt(
			cast
			(coalesce
						(	f.PaymentReceiveDtTm,
							f1.PaymentReceiveDtTm,
							f2.PaymentReceiveDtTm ,
							a.PAYMENT_EFFECTIVE_DATE 
						) 
						as date)
					,coalesce(sc.SuspenseCreateDtTm,dim.SuspenseCreateDtTm)--Payment_Date
			) as CreatePymtReceiveWorkDayCnt,
		case 
			when tr.TrustmarkInd = 1 then 'Trustmark'
			when tr.TrustmarkInd = 0 then 'Not Trustmark'
			else 'Unknown'
		end TrustmarkOrNotNm,
		'CBS' SourceSystemNm
FROM	VBSDMODS.dbo.CBS_EMPSUSPTRACK a 
		left join VBSDMODS.dbo.CBS_SUSPENSE_TRACKING b 
			on	a.Employer_Number=b.Employer_Number
				and a.PAYMENT_EFFECTIVE_DATE=b.PAYMENT_EFFECTIVE_DATE
				and b.RowCurrentInd = 1 
		inner join ChangedRecords cr
			on	a.Employer_Number=cr.Employer_Number
				and a.PAYMENT_EFFECTIVE_DATE=cr.PAYMENT_EFFECTIVE_DATE
		left join SuspCreate sc
			on 	'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
				+'_'
				+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
				+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) ) = sc.SuspenseId
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(b.Employer_Number as varchar),6)
					+'_'+convert(varchar(8),b.Bill_Due_Date,112) = dbb.BillId
		left join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
		left join VBSDMODS.dbo.CBS_Account_Credits ac
					on	a.Employer_Number=ac.Employer_Number
						and a.PAYMENT_EFFECTIVE_DATE=ac.Deposit_Date
						and ac.RowCurrentInd = 1 
		left join DimPDDeposit dd
			on 
				'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
				+'_'
				+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3) 
				+'*'
				+right('000000'+cast(isnull(ac.SPLIT_ID,'') as varchar),6) = dd.DepositId --1/4/16
		left join (
					select 
						ac1.COMBINED_ER_NUMBER,
						ac1.Combined_DEPOSIT_DATE, 
						Deposit_Date, 
						Employer_Number,
						split_id,
						row_number() over (
											partition by ac1.COMBINED_ER_NUMBER,ac1.Combined_DEPOSIT_DATE 
											order by Deposit_Date 
										   ) RN
					from	VBSDMODS.dbo.CBS_Account_Credits ac1
					where	ac1.RowCurrentInd = 1 AND COMBINED_ER_NUMBER>0 
							and ac1.CREDIT_RECORD_TYPE <> 'CM'
							and  isnull( ACCOUNT_STATUS,'') not in
							(select [IgnorePaymentAccountStatus] from [VBSDMReference].[dbo].[IgnorePaymentAccountStatusXref])
							-- ('PENDINGEBILL','EBILLACH','EBILLCHECK','EBILLACHCLIENT','EBILLWIRE') 
				) cd
				on	a.Employer_Number=cd.COMBINED_ER_NUMBER
					and cast(a.PAYMENT_EFFECTIVE_DATE as datetime)=cast(cd.Combined_DEPOSIT_DATE as datetime)
					and cd.RN = 1
		left join VBSAnalytics.dbo.DimPDPayment f1
				on f1.PaymentId = 
					'P'+right('000000'+cast(cd.Employer_Number as varchar),6)+'_'+convert(varchar(8),cd.Deposit_Date,112)
					+'_'
					+right('0'+cast(datepart(hh,cd.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(minute,cd.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(second,cd.Deposit_Date) as varchar),2)
					+right('000'+cast(datepart(millisecond,cd.Deposit_Date) as varchar),3)
		left join VBSDMODS.dbo.CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE ARC
				on	isnull(ac.SPLIT_ID,cd.SPLIT_ID) = arc.id
					and arc.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimPDPayment f2
				on	f2.PaymentId = 
					'P'+right('000000'+cast(arc.Employer_Number as varchar),6)+'_'+convert(varchar(8),arc.Deposit_Date,112)
					+'_'
					+right('0'+cast(datepart(hh,arc.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(minute,arc.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(second,arc.Deposit_Date) as varchar),2)
					+right('000'+cast(datepart(millisecond,arc.Deposit_Date) as varchar),3)
		left join	(	
						Select distinct cp.Employer_Number,TrustmarkInd
						From	VBSDMODS.dbo.CBS_Employee_Audit_Table  CP
								inner join VBSDMReference.dbo.CarrierXref CAR
								on CAR.CarrierId = CP.Carrier_Number
						where TrustmarkInd=1 
						and cp.RowCurrentInd = 1
					) tr
				on a.Employer_Number=tr.Employer_Number
		left join dbo.DimPDSuspense dim
				on 'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
					+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) ) = 
					dim.SuspenseId
		,VBSDMReference.dbo.TargetXref tx
where 
	a.RowCurrentInd = 1 AND 
	isnull( ACCOUNT_STATUS,'') not in 	
	(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
	and tx.TargetNm = 'Suspense From Receive Resolution Duration'
	and getdate() between tx.EffectiveDtTm and tx.ExpireDtTm
--and a.Employer_Number=5930
end
GO
PRINT N'Altering [dbo].[DailyFactPDDepositCBSApplyPolicy]...';


GO

ALTER procedure [dbo].[DailyFactPDDepositCBSApplyPolicy] as
BEGIN

DECLARE  @AuditKey int
SET @AuditKey =	isnull((select	MIN(RowAuditKey) 
				from	VBSAudit.dbo.VBSDMAudit
				where	CreateDtTm>
						(
							
							select max(cast(CreateDtTm as DATE)) from VBSAudit.dbo.VBSDMAudit --2/9/2015
							where SystemTypeNm = 'ANALYTICS' 
							and TargetTableNm = 'FactPDDepositCBSApplyPolicy' 
							and SuccessInd=1
						)
				),0)

; with CTE as
(
	 select * 
	 from  VBSDMODS..[CBS_Account_debits] 
	 where	RowAuditKey>@AuditKey
			and CDCEffectiveDtTm is not NULL
			and RowCurrentInd = 1
 )
, ApplyAmt as --7/22
(
	select 
			PDDepositKey, CarrierKey,PDBillKey,DepositPDApplyPolicyDtTm,

			sum(PDApplyPolicyAmt) TotalApplyAmt 
	from	dbo.FactPDDepositCBSApplyPolicy 			
	group by PDDepositKey,CarrierKey,PDBillKey,DepositPDApplyPolicyDtTm
)
Select 
		case 
			when ApplyAmt.TotalApplyAmt is not null --7/22
			then isnull(dr.DateKey,0)
			else isnull(dd.DateKey,0) 
		end DepositPDApplyPolicyDateKey
		, isnull(ClientKey,0) ClientKey
		, isnull(dbb.PDBillKey,0) PDBillKey ---
		, isnull(b.PDDepositKey,0) PDDepositKey
		, isnull (dbp.BillProcessorKey,0) [MainBillProcessorKey]
		, isnull(db.BrokerKey,0) BrokerKey
		, isnull(car.CarrierKey,0) CarrierKey --
		, [withdrawal_date] DepositPDApplyPolicyDtTm
		, isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
		, isnull(SalesPersonKey,0) SalesPersonKey 
		, case 
			when ApplyAmt.TotalApplyAmt is not null then 1
			when [FirstProcessDate]  = cast( dt.[WITHDRAWAL_DATE] as date) then 1 
		else 0 end FirstPDApplyPolicyDateInd --
		, isnull(dt.[CHECK_AMOUNT],0)- isnull(ApplyAmt.TotalApplyAmt,0) PDApplyPolicyAmt --7/22 --10/21
		, isnull(x.AmtTypeNm,'Unknown') PDApplyPolicyAmtTypeNm
		, isnull(x.AmtTypeDesc,'Unknown') PDApplyPolicyAmtTypeDesc
        , case 
			when datepart (hh,Bill_Due_Date)
				+ datepart (minute,Bill_Due_Date)
				+ datepart (second,Bill_Due_Date)
				+ datepart (millisecond,Bill_Due_Date)>0 
			then NULL
			when ApplyAmt.TotalApplyAmt is not null
			then isnull(dbo.udf_BusinessDayCnt(cast(dt.CDCEffectiveDtTm as date),cast(Bill_Due_Date as date)),0) 
			else 
				isnull(dbo.udf_BusinessDayCnt(cast([withdrawal_date] as date),cast(Bill_Due_Date as date)),0) 
			end PDApplyPolicyBillDueWorkDayCnt --remove isnull
        , case 
			when datepart(hh,Bill_Due_Date)
				+datepart(minute,Bill_Due_Date)
				+datepart(second,Bill_Due_Date)
				+datepart(millisecond,Bill_Due_Date)>0 
			then 'Unknown'        
			when ApplyAmt.TotalApplyAmt is not null
				and cast(dt.CDCEffectiveDtTm as date)<=cast(Bill_Due_Date as date) 
			then 'On Time' 
			when cast([withdrawal_date] as date)<=cast(Bill_Due_Date as date) 
			then 'On Time' 
			else 'Late' 
		end PDApplyPolicyBillDueOnTimeTypeNm
       , case when isnull(dt.[CHECK_AMOUNT],0)=isnull(a.[CHECK_AMOUNT],0) then 1 else 0 end SameReceiveApplyAmtInd
       , case 
			when a.REVERSAL_POOL=0 
				and [over_and_short]=0 
				and Forgiven_Prem_Amt=0 
				AND isnull(a.SPLIT_ID,0)=0
				AND isnull(a.[COMBINED_ER_NUMBER],0)=0
			then 1 
			else 0 
		end [NoManipulationInd]
       , case when isnull(a.SPLIT_ID,0)<>0 then 1 else 0 end [WasSplitInd]
       , case when isnull(a.[COMBINED_ER_NUMBER],0) =0 then 0 else 1 end WasCombineInd
       , case when a.REVERSAL_POOL<>0 then 1 else 0 end [ReversalPoolInd]
       , case when [over_and_short]<>0 then 1 else 0 end [OverAndShortInd]
       , case when Forgiven_Prem_Amt<>0 then 1 else 0 end [ForgivenInd]
       , 'CBS' [SourceSystemNm]
       , 0 RowAuditKey
       , 0 RowDeleteInd
           , dbo.udf_CamelCase(rtrim(ltrim(Payee))) PayeeNm
		   , case 
			when ApplyAmt.TotalApplyAmt is null then 'Process'
			else 'Adjustment'
			end  ProcessTransactionTypeNm
		   , dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
		   , 
		   case 
			when a.[CREDIT_RECORD_TYPE]='PX' then 1
			when a.[ACCOUNT_STATUS] in (select IgnorePaymentAccountStatus from VBSDMReference..IgnorePaymentAccountStatusXref)
			then 1 
			else 0
		   end 		   PendingPaymentProcessInd 
		   , case when dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER)))='' then NULL else  dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER))) end CheckId 
From	VBSDMODS..[CBS_Account_credits] a
		inner join cte dt --VBSDMODS..[CBS_Account_debits] dt --only what was processed
			on a.[Employer_Number]= dt.[Employer_Number] 
			and a.Deposit_Date = dt.Deposit_Date 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.[Employer_Number] 
			and IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
			and d.RowCurrentInd = 1
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		inner join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = DepositId --12/16
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.[Employer_Number] as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = dbb.BillId
--------------Carrier
		left join DimCarrier car
			on dt.Carrier_Number=car.Carrierid
------------  Min Process Date
		inner join (
					select 
						[Employer_Number] 
						, Deposit_Date
						, min(cast([withdrawal_date] as date)) [FirstProcessDate] 
					from VBSDMODS..[CBS_Account_debits] dt --only what was processed
					where dt.RowCurrentInd = 1
					group by [Employer_Number], Deposit_Date
					) mpd
					on	a.[Employer_Number]= mpd.[Employer_Number] 
						and a.Deposit_Date = mpd.Deposit_Date 
----recort type = accounting status
		left join VBSDMODS..[CBS_ACCOUNTING_RECORD_STATUS_CODES] ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1

-------------calculate adjustment --7/22
		left join ApplyAmt				
				on isnull(b.PDDepositKey,0)  = ApplyAmt.PDDepositKey
				and isnull(car.CarrierKey,0) = ApplyAmt.CarrierKey
				and isnull(dbb.PDBillKey,0) = ApplyAmt.PDBillKey
				and [withdrawal_date] = ApplyAmt.DepositPDApplyPolicyDtTm
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on isnull(dt.[CHECK_AMOUNT],0)- isnull(ApplyAmt.TotalApplyAmt,0) between MinAmt and MaxAmt --processed amount type --10/21
----------------------date
		left join DimDate dd
				on cast(dt.[withdrawal_date] as date) = dd.DateDt
		left join DimDate dr
				on cast(dt.CDCEffectiveDtTm as date) = dr.DateDt
				
Where a.RowCurrentInd =1 
	and dt.RowCurrentInd = 1
	and a.Deposit_Date between '2013-01-01' and getdate()
	and dt.CARRIER_NUMBER <>0
	and isnull(dt.[CHECK_AMOUNT],0)<> isnull(ApplyAmt.TotalApplyAmt,0)
end
GO
PRINT N'Altering [dbo].[DailyFactPDNotProcessAmtSnapshot]...';


GO


ALTER procedure [dbo].[DailyFactPDNotProcessAmtSnapshot]
as
BEGIN
;WITH Process as(
select 
		EMPLOYER_NUMBER,
		DEPOSIT_DATE,
		sum(CHECK_AMOUNT) ProcessAmt
from	VBSDMOds.dbo.CBS_ACCOUNT_DEBITS
where	RowCurrentInd= 1 
		AND DEPOSIT_DATE between '2013-01-01' and getdate()
group by 
		EMPLOYER_NUMBER,
		DEPOSIT_DATE
)

select 
           convert(varchar(8), getdate(),112) SnapshotDateKey
           ,isnull(f.PDPaymentKey,0) PDPaymentKey
           ,isnull(dep.PDDepositKey,0)  PDDepositKey
           ,isnull(ClientKey,0) ClientKey 
           ,isnull(dbp.BillProcessorKey,0) [MainBillProcessorKey]
           ,isnull(BrokerKey,0) BrokerKey
           ,isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
           ,isnull(SalesPersonKey,0) SalesPersonKey 
           , isnull(prob.PDProblemKey,0) PDProblemKey
           ,(a.CHECK_AMOUNT+a.REVERSAL_POOL+a.OVER_AND_SHORT+a.FORGIVEN_PREM_AMT) - isnull(ProcessAmt,0) NotProcessPaymentAmt
           , x.AmtTypeNm NotProcessAmtTypeNm
           , x.AmtTypeDesc NotProcessAmtTypeDesc
           ,
           case 
			   when PaymentReceiveDtTm is null then NULL
			   else dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,getdate()-1) --9/9
           end NotProcessWorkDayCnt
           , Cast(case 
			   when PaymentReceiveDtTm is null then NULL
			   when dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,getdate()-1)>tr.TargetNo
			   then 
			   dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,getdate()-1)-tr.TargetNo
			else 0
           end as integer)
				OverProcessDueWorkDayCnt
           , case 
				when a.REVERSAL_POOL=0 
				and a.[over_and_short]=0 
				and a.Forgiven_Prem_Amt=0 
				AND isnull(a.SPLIT_ID,0)=0
				AND isnull(a.[COMBINED_ER_NUMBER],0)=0
				then 1 
				else 0 
			end [NoManipulationInd] 
           , case when ProcessAmt is not null then 'Partially Completed' else 'Not Started' end CompleteTypeNm
           , isnull(susp.PolicyInSuspenseCnt,0) PolicyInSuspenseCnt 
           , 'CBS' SourceSystemNm

From	VBSDMODS..[CBS_Account_Credits] a
		left join Process pr
			on a.Employer_Number = pr.Employer_Number
			and a.Deposit_Date = pr.Deposit_Date
---------------Client
		left join VBSDMReference.dbo.ClientXref c
			on c.SourceId = a.[Employer_Number] 
				and c.IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
----------------Payment
		left join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId=	'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
----------------Amt Range
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on (CHECK_AMOUNT+REVERSAL_POOL+OVER_AND_SHORT+FORGIVEN_PREM_AMT) - isnull(ProcessAmt,0) between MinAmt and MaxAmt
----------find broker
				left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over 
										(
											partition by ClientIntegrationId 
											order by ClientId desc,ClientGroupId desc
										) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	c.SourceSystemNm = 'PIOP' 
							and c.IdTypeNm = 'CASE_ID' 
							and c.RowCurrentInd = 1 
						--	and p.BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId 
						and m.RN=1
				left join DimBroker db
					on m.BrokerId = db.BrokerId
						and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
---------------deposit
		left join DimPDDeposit dep
			on 'D'
			+ right('000000'+cast(a.Employer_Number as varchar),6)
			+ '_'
			+ convert(varchar(8),a.Deposit_Date,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+ right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+ right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+ right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
			+ '*'
			+ right('000000'+cast(isnull(SPLIT_ID,'') as varchar),6)  = dep.DepositId --12/16
--------------Problem
		left join DimPDProblem prob
		on a.PROCESSING_PROBLEM  = prob.PDProblemNm	
---# in suspense
		left join (
		select 
			PDDepositKey,
			count(1) PolicyInSuspenseCnt 
		from dbo.FactPDSuspenseSnapshot
		where SnapshotDateKey = 
			(select max(SnapshotDateKey) from FactPDSuspenseSnapshot)
		group by PDDepositKey
		) susp
		on dep.PDDepositKey = susp.PDDepositKey
		-------------------------Target
		,VBSDMReference.dbo.[TargetXref] tr	

		
Where	a.RowCurrentInd =1 and a.deposit_date between '2013-01-01' and getdate() 
		--and 
		--a.Account_status<>'Balanced'
		and 
		(
			(
				A.[ACCOUNT_BALANCE] <> a.CHECK_AMOUNT+a.REVERSAL_POOL+a.OVER_AND_SHORT+a.FORGIVEN_PREM_AMT
				AND
				A.[ACCOUNT_BALANCE] <> 0
				and
					(
							isnull(a.[COMBINED_ER_NUMBER],0) = 0 
					or
						(
								A.[COMBINED_ER_NUMBER] > 0 
								AND A.[CREDIT_RECORD_TYPE] = 'CM'
							
						)
					)
			)
		or
		
		(
			a.CHECK_AMOUNT+a.REVERSAL_POOL+a.OVER_AND_SHORT+a.FORGIVEN_PREM_AMT <> 0
			--and a.Account_status<>'Balanced'
			and A.[ACCOUNT_BALANCE] = a.CHECK_AMOUNT+a.REVERSAL_POOL+a.OVER_AND_SHORT+a.FORGIVEN_PREM_AMT
			and 
				(
					isnull(A.[COMBINED_ER_NUMBER],0) = 0 
					or
					(
						A.[DEPOSIT_DATE] = A.[COMBINED_DEPOSIT_DATE] 
						AND A.[COMBINED_ER_NUMBER] > 0 
						AND A.[CREDIT_RECORD_TYPE] = 'CM'
					)
				)
			and not exists ---pending statuses
				(
					select 1 
					from VBSDMReference..IgnorePaymentAccountStatusXref pax
					where a.[ACCOUNT_STATUS] =pax.IgnorePaymentAccountStatus
				)
				
		)
		
)
		and tr.TargetNm = 'CBS Apply to Policy Duration'
		and getdate() between tr.EffectiveDtTm and tr.ExpireDtTm

END
GO
PRINT N'Altering [dbo].[DailyFactPDPastDueSnapshot]...';


GO


ALTER PROCEDURE [dbo].[DailyFactPDPastDueSnapshot]
as
BEGIN


--INSERT INTO [dbo].[FactPDPastDueSnapshot]
--           ([SnapshotDateKey]
--           ,[ClientKey]
--           ,[PDBillKey]
--           ,[BrokerKey]
--           ,[BillDueDateKey]
--           ,[MainBillBrocessorKey]
--           ,[EnrollmentCompanyKey]
--           ,[SalesPersonKey]
--           ,[PastDueAmt]
--           ,[PastDueAmtTypeNm]
--           ,[PastDueAmtTypeDesc]
--           ,[PastDueWorkDayCnt]
--           ,[CommunicationAttemptCnt]
--           ,[FirstAttemptBillDueWorkDayCnt]
--           ,[CommunicationOnTimeTypeNm]
--           ,[SourceSystemNm]
--           ,[RowAuditKey]
--           ,[RowDeleteInd]
--           ,[MainCSRBillProcessorKey]
--           ,[LastNote])
select 
           convert ( varchar(8),GETDATE(),112 ) SnapshotDateKey
           , isnull ( d.ClientKey,0 ) ClientKey
           , isnull ( dbb.PDBillKey,0 ) PDBillKey
           , isnull ( db.BrokerKey,0 ) BrokerKey
           , convert ( varchar(8),a.Bill_Due_Date,112 ) BillDueDateKey
           , isnull ( dbp.BillProcessorKey,0 ) MainBillBrocessorKey
		   , isnull ( decn.EnrollmentCompanyKey,0 ) EnrollmentCompanyKey
		   , isnull ( dsp.SalesPersonKey,0 ) SalesPersonKey
           , isnull ( a.TOTAL_EMPLOYEE_AMOUNT_DUE,0 )
					+ isnull ( a.TOTAL_EMPLOYER_AMOUNT_DUE,0 )	
					+ isnull ( a.TOTAL_EMPLOYEE_FEE_DUE,0 )	
					+ isnull ( a.TOTAL_EMPLOYER_FEE_DUE,0 ) PastDueAmt
           , x.AmtTypeNm PastDueAmtTypeNm
           , x.AmtTypeDesc PastDueAmtTypeDesc
           , dbo.udf_BusinessDayCnt ( a.BILL_DUE_DATE, getdate()-1 ) PastDueWorkDayCnt --8/20
           , isnull ( l.AttemptCnt,0 ) CommunicationAttemptCnt
		   , case 
				when FirstAttemptDtTm is NULL then NULL
				else dbo.udf_BusinessDayCnt ( cast ( cast ( a.Bill_Due_Date as date ) as datetime )+1,FirstAttemptDtTm )  --8/20
			end FirstAttemptBillDueWorkDayCnt
		   , case 
				when FirstAttemptDtTm is NULL 
					and dbo.udf_BusinessDayCnt ( cast ( cast ( a.Bill_Due_Date as date ) as datetime ),getdate()-1 ) > tar.TargetNo  --8/20
				then 'Late - No communication'
				when FirstAttemptDtTm is NULL 
					and dbo.udf_BusinessDayCnt ( cast ( cast ( a.Bill_Due_Date as date ) as datetime ),getdate()-1 ) <= tar.TargetNo  --8/20
					then 'Still Not Late - No communication'
				when dbo.udf_BusinessDayCnt ( cast ( cast ( a.Bill_Due_Date as date ) as datetime )+1,FirstAttemptDtTm ) <= tar.TargetNo  --8/20
				then 'On Time' 
				else 'Late' 
			end CommunicationOnTimeTypeNm
		   , 'CBS' SourceSystemNm
		  -- ,-1,
		  -- 0
		   , isnull ( dbp1.BillProcessorKey,0 ) MainCSRBillProcessorKey --added 11/6 --11/30
		   , [dbo].[udf_CamelCase](ln.LastNote) -- added 11/6 --11/18 changed to camel case
from	VBSDMODS..CBS_COMPANY_PAY_TABLE a ---main table
		--------------------------Bill-----------------------------------------
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = dbb.BillId
		---------------------- Client -----------------------------------------
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.Employer_Number 			
				and c.SourceSystemNm = 'CBS'
				and c.IdTypeNm = 'EMPLOYER_NUMBER'
				and c.RowCurrentInd = 1
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
		------------------------------- to find broker, enr company, sales person --------------------------
		left join
				(
					select  
						c.ClientIntegrationId, 
						p.BrokerId,
						p.RSDId,
						p.EnrollmentCompanyId,
						row_number() over (partition by c.ClientIntegrationId order by p.ClientId desc,p.ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
				on  c.ClientIntegrationId = m.ClientIntegrationId 
					and m.RN = 1
		left join	DimBroker db
				on	m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join	DimSalesPerson dsp
				on	m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join	DimEnrollmentCompany decn
				on	m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
		-------------------------- Main Processor --------------------------------------
		left join	VBSDMOds.dbo.CBS_COMPANY cc
				on	a.Employer_Number = cc.EMPLOYER_NUMBER
					and cc.RowCurrentInd = 1
		left join	VBSAnalytics..DimBillProcessor dbp
				on	dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
					and dbp.RowCurrentInd =1 
		left join	VBSAnalytics..DimBillProcessor dbp1 ---added 11/6
				on	dbp1.BillProcessorUserId = cc.CLIENT_SERVICE_REP
					and dbp1.RowCurrentInd =1 
	--------------------- Date ------------------------------------------------
		left join DimDate sdt
				on convert (varchar(8),getdate(),112) = sdt.DateKey
		--------------------Amt Type---------------------------------------------
		left join 	VBSDMReference.dbo.AmtTypeXref x
				on isnull(TOTAL_EMPLOYEE_AMOUNT_DUE,0)
					+ isnull(TOTAL_EMPLOYER_AMOUNT_DUE,0)	
					+ isnull(TOTAL_EMPLOYEE_FEE_DUE,0)	
					+ isnull(TOTAL_EMPLOYER_FEE_DUE,0)
				between MinAmt and MaxAmt
		left join 
		----------------------attempt count--------------------------------------
		(
			select 'B'+right('000000'+cast(a.Employer_Number as varchar),6)
					+'_'+convert(varchar(8),a.Bill_Due_Date,112) BillId, 
					count(1) AttemptCnt , 
					min(ATTEMPT_DATE) FirstAttemptDtTm
			from VBSDMODS.dbo.CBS_PAST_DUE_ATTEMPT_LOG a
			WHERE RowCurrentInd = 1
			group by 'B'+right('000000'+cast(a.Employer_Number as varchar),6)
					+'_'+convert(varchar(8),a.Bill_Due_Date,112)
		) l
			on 'B'+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = l.BillId
		------------------Last note
			inner join (
						select 'B'+right('000000'+cast(a1.Employer_Number as varchar),6)
								+'_'+convert(varchar(8),a1.Bill_Due_Date,112) BillId, 
								a1.notes LastNote,
								row_number () over ( partition by Employer_Number,Bill_Due_Date order by RowIdentityKey desc) RN
						from VBSDMODS.dbo.CBS_PAST_DUE_ATTEMPT_LOG a1
						WHERE RowCurrentInd = 1
						) ln
			on 'B'+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = ln.BillId
				and ln.RN = 1
		-------------------- Target ------------------------------------------
		,[VBSDMReference].[dbo].[TargetXref] tar ---target for first call
where 
		a.RowCurrentInd = 1 AND
		cast(a.Bill_Due_Date as date) < cast(getdate() as date) AND  --due date in the past  ---7/20/2015
		a.RECORD_STATUS not in( 'P','X','Z') AND  --not paid --7/13/2015 Randy's correction
		a.CHECK_AMOUNT = 0 AND --not paid
		tar.TargetNm = 'Past Due First Attempt'               	 

END
--select * from VBSAnalytics.dbo.FactPDPastDueSnapshot
GO
PRINT N'Altering [dbo].[DailyFactPDPaymentCombine]...';


GO




ALTER procedure [dbo].[DailyFactPDPaymentCombine]
as
BEGIN
/*--------------------
If the combination already exists in the fact do not update, only insert new once
FromPDPaymentKey
ToPDDepositKey
CombineDtTm
-----------------------*/
DECLARE  @AuditKey int
SET @AuditKey =	isnull((select	MIN(RowAuditKey) 
				from	VBSAudit.dbo.VBSDMAudit
				where	CreateDtTm>
						(
							
							select max(cast(CreateDtTm as DATE)) from VBSAudit.dbo.VBSDMAudit --2/9/2015
							where SystemTypeNm = 'ANALYTICS' 
							and TargetTableNm = 'FactPDPaymentCombine' 
							and SuccessInd=1
						)
				),0)
				
; with CombineDate as(				
select	'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.[SPLIT_ID],'') as varchar),6) DepositId, --12/16
		min(CDCEffectiveDtTm) CombineDate --when combine happened in reality
From	VBSDMODS..[CBS_Account_credits] a 
Where 
		a.RowAuditKey>@AuditKey
		and a.CDCeffectiveDtTm is not NULL --CDC related records
		and [CREDIT_RECORD_TYPE] not in( 'CM','PX') --not pending  and original payments that were combined
		and a.Deposit_Date between '2013-01-01' and getdate() --take only deposit dates that are in a range
		and isnull(a.[COMBINED_ER_NUMBER],0)<>0 --find combined records
		and a.[ACCOUNT_STATUS] not in  --not pending statuses
				(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
		and a.Deposit_Date<>a.Combined_deposit_date --added 11/6
Group by 
			'D'
			+right('000000'+cast(a.[Employer_Number] as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.[SPLIT_ID],'') as varchar),6) --12/16
)

, LastRecord as --find last updated record to find how split looked like at the end, RN=1
(
	select 
			a.[Employer_Number],
			a.Deposit_Date, 
			b.CombineDate, 
			b.DepositId,
			a.[CHECK_amount],
			a.COMBINED_ER_NUMBER,
			a.[User_id],
			'P'+right('000000'+cast([Employer_Number] as varchar),6)+'_'+convert(varchar(8),Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,Deposit_Date) as varchar),2)
				+right('000'+cast(datepart(millisecond,Deposit_Date) as varchar),3) PaymentId,
			row_number() over(partition by b.DepositId order by a.RowNoId desc)  RN
	from	VBSDMODS..[CBS_Account_credits] a
			inner join CombineDate b
				on 
				'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+cast(isnull(a.[SPLIT_ID],'') as varchar),6) = b.DepositId --12/16
	where	a.RowAuditKey>@AuditKey
)

select * from 
(
	Select 
			convert(varchar(8),a.[CombineDate],112) CombineDateKey,--8/10
			isnull(d.ClientKey,0)FromClienKey,
			isnull(d1.ClientKey,0) ToClientKey,
			isnull(f.PDPaymentKey,0) FromPDPaymentKey,
			isnull(dep.PdDepositKey,0) ToPDDepositKey,
			isnull(dbp.BillProcessorKey,0) BillProcessorKey,
			isnull(db.BrokerKey,0) FromBrokerKey,
			isnull(pk.PaymentPdProblemKey,0)LastPaymentPDProblemKey,
			a.[CombineDate] CombineDtTm,
			isnull(EnrollmentCompanyKey,0) FromEnrollmentCompanyKey , 
			isnull(SalesPersonKey,0) FromSalesPersonKey ,
			a.[CHECK_amount] CombinePaymentAmt,
			x.AmtTypeNm CombineAmtTypeNm,
			x.AmtTypeDesc CombineAmtTypeDesc,
			case 
				when a.[CombineDate] is NULL then NULL
				else dbo.udf_BusinessDayCnt(f.PaymentReceiveDtTm,a.[CombineDate])
			end  CombineReceiveWorkDayCnt,
			case 
				when a.[CombineDate] is NULL then NULL		
				else dbo.udf_BusinessDayCnt(pr.LastProblemDtTm,a.[CombineDate]) 
			end CombineLastProblemWorkDayCnt,
			isnull(pr.[ProblemCnt],0)PaymentProblemCnt,
			'CBS' SourceSystemNm,
			0 as RN
	From	LastRecord a 
	------------------combined from--------------------------
			left join VBSDMReference.dbo.ClientXref c
				on 
					 c.SourceId = cast(a.[Employer_Number]  as varchar)
					 and c.IdTypeNm = 'Employer_Number' 
					 and c.RowCurrentInd = 1
			left join VBSAnalytics.dbo.DimClient d
				on c.ClientIntegrationId = d.ClientIntegrationId
					and d.RowCurrentInd = 1
	---------------combined to-------------------------------
			left join VBSDMReference.dbo.ClientXref c1
				on 
					 c1.SourceId = cast(a.[COMBINED_ER_NUMBER]  as varchar)
					 and c1.IdTypeNm = 'Employer_Number' and c1.RowCurrentInd = 1
			left join VBSAnalytics.dbo.DimClient d1
				on	c1.ClientIntegrationId = d1.ClientIntegrationId
					and d1.RowCurrentInd = 1
	----------------TO DEPOSIT-------------------------------
			inner join VBSAnalytics..DimPDDeposit dep
				on	a.DepositId=dep.DepositId
	---------------FROM Payment---------------------------------
			inner join VBSAnalytics.dbo.DimPDPayment f --only if a payment can be found
				on	f.PaymentId=a.PaymentId
	-----------------Bill Processor-----------------------------
			left join dbo.DimBillProcessor dbp
				on	BillProcessorUserId = a.[User_id]
					and dbp.RowCurrentInd = 1
	-----------------------Amt Range ---------------------------
			left join 	VBSDMReference.dbo.AmtTypeXref x
				on	isnull(a.[Check_amount],0)  between MinAmt and MaxAmt	
	---------------------Broker --------------------------------
			left join
					(
						select  
							ClientIntegrationId, 
							BrokerId,
							RSDId,
							EnrollmentCompanyId,
							row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
						from	VBSDMReference.dbo.ClientXref c  
								inner join VBSDMReference.dbo.ClientProducerXref p
									on c.SourceId = p.ClientId
						where	SourceSystemNm = 'PIOP' 
								and IdTypeNm = 'CASE_ID' 
								and RowCurrentInd = 1 
								--and BrokerId is not NULL
					) m
					on	c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
			left join DimBroker db
					on	m.BrokerId = db.BrokerId
						and db.RowCurrentInd = 1
			left join DimSalesPerson dsp
					on	m.RSDId = dsp.SalesPersonId
						and dsp.RowCurrentInd = 1
			left join DimEnrollmentCompany decn
					on	m.EnrollmentCompanyId = decn.EnrollmentCompanyId
						and decn.RowCurrentInd = 1
	--------------------------------Last ProblemKey------------------
			left join 	
				(
					select	PDPaymentKey, 
							PaymentPdProblemKey, 
							row_number() over (partition by PDPaymentKey order by ProblemDtTm desc,PaymentPdProblemKey desc)  rn 
					from dbo.FactPDPaymentProblem 
				) pk
					on	f.PDPaymentKey = pk.PDPaymentKey 	
						and pk.rn=1		
	-------------Problem count--------------------------------
			left join 	
					(
						select	PDPaymentKey, 
								max(ProblemDtTm) LastProblemDtTm, 
								COUNT(1)  ProblemCnt 
						from	dbo.FactPDPaymentProblem 
						group by PDPaymentKey
					) pr
					on	f.PDPaymentKey = pr.PDPaymentKey 
	Where a.RN = 1  --8/17
) t
WHERE 
		Not Exists 
			(
				Select 'X' 
				from VBSAnalytics.[dbo].[FactPDPaymentCombine] b 
				Where 
					t.[FromPDPaymentKey]=b.[FromPDPaymentKey] 
					AND
					t.[ToPDDepositKey]=b.[ToPDDepositKey]
					)
END
GO
PRINT N'Altering [dbo].[DailyFactPDPaymentSplit]...';


GO


ALTER procedure [dbo].[DailyFactPDPaymentSplit] as
BEGIN

DECLARE  @AuditKey int
SET @AuditKey =	isnull((select	MIN(RowAuditKey) 
				from	VBSAudit.dbo.VBSDMAudit
				where	CreateDtTm>
						(
							
							select	max(cast(CreateDtTm as DATE)) 
							from	VBSAudit.dbo.VBSDMAudit --2/9/2015
							where	SystemTypeNm = 'ANALYTICS' 
									and TargetTableNm = 'FactPDPaymentProblem' And SuccessInd=1
						)
				),0)
; with SplitDate as(				
select	Id,
		min(CDCEffectiveDtTm) SplitDate --when split happened in reality
From	VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] z --split record
Where 
		z.RowAuditKey>@AuditKey
		and z.[SPLIT_CHECK] = 1 --take only split records
		and z.Deposit_Date between  '2013-01-01'  and getdate()
		and z.CDCEffectiveDtTm is not NULL-- and  --only CDC related changes
Group by Id
)
, LastRecord as --find last updated record to find how split looked like at the end 
(
	select 
			z.*, 
			row_number() over(partition by z.id order by z.RowNoId desc)  RN
	from	VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] z
			inner join SplitDate b
			on z.id = b.id
	where	z.RowAuditKey>@AuditKey
			and z.[SPLIT_CHECK] = 1
			and z.Deposit_Date between  '2013-01-01'  and getdate()
			and z.CDCEffectiveDtTm is not NULL
)
, DepositSplit as
(
select	split_id
		, 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.[SPLIT_ID],'') as varchar),6) DepositId
		, row_number() over (partition by 
				id,'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+cast(isnull(a.[SPLIT_ID],'') as varchar),6)
				order by RowNoId desc) RN
		, [Check_amount]
from	VBSDMODS..[CBS_Account_credits] a 
		inner join SplitDate b
			on a.split_id = b.id
Where	a.[CREDIT_RECORD_TYPE] <> 'PX'
		and [ACCOUNT_STATUS] not in 
			(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
)
--select * from DepositSplit

Select  SplitDateKey,
		FromClientKey,
		ToClientKey,
		FromPDPaymentKey,
		ToPdDepositKey,
		BillProcessorKey,
		[FromBrokerKey],
		[LastPaymentPDProblemKey],
		[SplitDtTm] ,
		FromEnrollmentCompanyKey , 
        FromSalesPersonKey , 
		SplitSeqNo, 
		[SplitPaymentAmt],
		[SplitAmtTypeNm],
		SplitAmtTypeDesc,
		[SplitReceiveWorkDayCnt],
		SplitLastPymtProblemWorkDayCnt,
		PaymentProblemCnt,
		'CBS' SourceSystemNm from (
Select 
		isnull(convert(varchar(8),sd.SplitDate,112),'0') SplitDateKey,
		isnull(orig.ClientKey,0) FromClientKey,
		isnull(dep.ClientKey,0) ToClientKey,
		isnull(p.PDPaymentKey,0) FromPDPaymentKey,
		isnull(PDDepositKey,0)  ToPdDepositKey,
		isnull(dbp.BillProcessorKey,0) BillProcessorKey,
		isnull([BrokerKey],0) [FromBrokerKey],
		isnull(pk.PaymentPdProblemKey,0) [LastPaymentPDProblemKey],
		sd.SplitDate [SplitDtTm] ,---should be z.RowStartDtTm
		isnull(EnrollmentCompanyKey,0) FromEnrollmentCompanyKey , 
        isnull(SalesPersonKey,0) FromSalesPersonKey , 
		case 
			when Split3.SplitNo3 is not null then 3
			when Split2.SplitNo2 is not null then 2
			else 1
		end SplitSeqNo, 
		isnull(a.[Check_amount],0) [SplitPaymentAmt],
		x.[AmtTypeNm] [SplitAmtTypeNm],
		x.AmtTypeDesc  SplitAmtTypeDesc,
		dbo.udf_BusinessDayCnt(p.PaymentReceiveDtTm,sd.SplitDate) [SplitReceiveWorkDayCnt],
		dbo.udf_BusinessDayCnt(pr.LastProblemDtTm,sd.SplitDate) SplitLastPymtProblemWorkDayCnt,
		isnull(pr.[ProblemCnt],0) PaymentProblemCnt,
		'CBS' SourceSystemNm
From DepositSplit a
	--VBSDMODS..[CBS_Account_credits] a ---deposit split record
	inner join 
	LastRecord z--VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] z --split record
		on [SPLIT_ID]=z.[ID]
	inner join 	SplitDate sd
		on z.Id = sd.Id	
	left join (
					select distinct b.[Previous_Split_Id]  SplitNo3
					from	VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] a 
							inner join
								VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] b
									on a.[Previous_Split_Id] = b.id
					where	b.[Previous_Split_Id] >0
							and a.RowCurrentInd =1 
							and b.RowCurrentInd = 1
				) Split3
		on z.Id = Split3.SplitNo3
	left join(		
					select distinct [Previous_Split_Id] SplitNo2
					from	VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE]
					where  [Previous_Split_Id]>0 
							and RowCurrentInd = 1
				) Split2
		on z.Id = Split2.SplitNo2
	left join VBSDMReference.dbo.ClientXref c --Xref to find Integration ID
		on  SourceId = cast(z.[Employer_Number]  as varchar) 
			and c.IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
	left join VBSAnalytics.dbo.DimClient orig
		on	c.ClientIntegrationId = orig.ClientIntegrationId 
			and orig.RowCurrentInd = 1
	left join VBSDMReference.dbo.ClientXref depx --Xref to find Integration ID
		on  depx.SourceId = cast(z.[Employer_Number]  as varchar) 
			and depx.IdTypeNm = 'Employer_Number' 
			and depx.RowCurrentInd = 1 
	left join VBSAnalytics.dbo.DimClient dep
		on	depx.ClientIntegrationId = dep.ClientIntegrationId 
			and dep.RowCurrentInd = 1
	left join VBSAnalytics..DimPDDeposit b
		on b.changeId=z.Id
			and a.DepositId = b.DepositId
	inner join DimPDPayment p ---only if a payment can be found
		on 'P'+right('000000'+cast(z.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),z.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,z.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,z.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,z.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,z.Deposit_Date) as varchar),3) = PaymentId
-------------Processor
	left join DimBillProcessor dbp
		on Z.[USER_name]=BillProcessorUserId
		and dbp.RowCurrentInd = 1
-------------Problem count
	left join 	
		(
		select PDPaymentKey, max(ProblemDtTm) LastProblemDtTm, COUNT(1)  ProblemCnt 
		from dbo.FactPDPaymentProblem 
		group by PDPaymentKey
		) pr
		on p.PDPaymentKey = pr.PDPaymentKey 
--------------------------------Last ProblemKey
	left join 	
		(
		select PDPaymentKey, PaymentPdProblemKey, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc,PaymentPdProblemKey desc)  rn 
		from dbo.FactPDPaymentProblem 
		) pk
		on p.PDPaymentKey = pk.PDPaymentKey 	
			and pk.rn=1		
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1
---------------------------AMT
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on isnull(a.[Check_amount],0)  between MinAmt and MaxAmt				
Where a.RN = 1 and z.RN = 1
) a Where Not Exists (Select 'X' from VBSAnalytics.[dbo].[FactPDPaymentSplit] b Where a.[FromPDPaymentKey]=b.[FromPDPaymentKey] AND
a.[ToPdDepositKey]=b.[ToPdDepositKey])
END
GO
PRINT N'Altering [dbo].[DailyFactPDPymtCBSApplyPolicy]...';


GO

ALTER procedure [dbo].[DailyFactPDPymtCBSApplyPolicy] as
BEGIN

DECLARE  @AuditKey int
SET @AuditKey =	isnull((select	MIN(RowAuditKey) 
				from	VBSAudit.dbo.VBSDMAudit
				where	CreateDtTm>
						(
							
							select max(cast(CreateDtTm as DATE)) from VBSAudit.dbo.VBSDMAudit --2/9/2015
							where SystemTypeNm = 'ANALYTICS' 
							and TargetTableNm = 'FactPDPymtCBSApplyPolicy' 
							and SuccessInd=1
						)
				),0)
; with CTE as(
 select * from
 VBSDMODS..[CBS_Account_debits] 
 where RowAuditKey>@AuditKey
 and CDCEffectiveDtTm is not NULL
 and RowCurrentInd = 1
 )
 , ApplyAmt as
(
	select 
			PDDepositKey, CarrierKey,PDPaymentKey,PymtPDApplyPolicyDtTm,PDBillKey,

			sum(TotalPDApplyPolicyAmt) TotalApplyAmt 
	from	FactPDPymtCBSApplyPolicy			
	group by PDDepositKey,CarrierKey,PDPaymentKey,PymtPDApplyPolicyDtTm,PDBillKey
)
Select 
		case 
			when ApplyAmt.TotalApplyAmt is not null
			then isnull(dr.DateKey,0)
			else isnull(dd.DateKey,0) 
		end PymtPDApplyPolicyDateKey
		, isnull(ClientKey,0) ClientKey
		, isnull(dbb.PDBillKey,0) PDBillKey ---
		, isnull(f.PDPaymentKey,0) PDPaymentKey
		, isnull(b.PDDepositKey,0) PDDepositKey
		, isnull (dbp.BillProcessorKey,0) [BillProcessorKey]
		, isnull(db.BrokerKey,0) BrokerKey
		, isnull(car.CarrierKey,0) CarrierKey --
		, isnull(lpc.PaymentPDProblemKey,0) LastPdProblemKey--
		, [withdrawal_date] PymtPDApplyPolicyDtTm
		, isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
		, isnull(SalesPersonKey,0) SalesPersonKey 
		, case 
			when ApplyAmt.TotalApplyAmt is not null then 1
			when [FirstProcessDate]  = cast( dt.[WITHDRAWAL_DATE] as date) then 1 
			else 0 
		end FirstPDApplyPolicyDateInd --
		, isnull(dt.[CHECK_AMOUNT],0)- isnull(ApplyAmt.TotalApplyAmt,0) TotalPDApplyPolicyAmt
		, isnull(x.AmtTypeNm,'Unknown') PDApplyPolicyAmtTypeNm
		, isnull(x.AmtTypeDesc,'Unknown') PDApplyPolicyAmtTypeDesc
		, CASE
			when dt.CDCEffectiveDtTm  is not null and PaymentReceiveDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast(dt.CDCEffectiveDtTm as date)) ,0)
			when dt.CDCEffectiveDtTm  is not null and [withdrawal_date] is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast([withdrawal_date] as date)) ,0)
			else NULL
		end PDApplyPolicyReceiveWorkDayCnt ---remove isnull
        , case 
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then NULL
			when BillDueDtTm is not null and dt.CDCEffectiveDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(dt.CDCEffectiveDtTm as date),cast(BillDueDtTm as date)),0) 
			when BillDueDtTm is not null and [withdrawal_date] is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast([withdrawal_date] as date),cast(BillDueDtTm as date)),0) 
			else NULL
			end PDApplyPolicyBillDueWorkDayCnt --remove isnull
        , case 
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then 'Unknown' 
			when BillDueDtTm is NULL or PaymentReceiveDtTm is NULL
			then 'Unknown' --8/7
			when cast(PaymentReceiveDtTm as date) <=cast(BillDueDtTm as date) 
			then 'On Time' 
			else 'Late' 
		 end [ReceiveOnTimeTypeNm]
        , case 
			when PaymentProcessDueDtTm is NULL 
			then 'Unknown'--8/7
			when [withdrawal_date] is null and dt.CDCEffectiveDtTm is null
			then 'Unknown'
			when PaymentProcessDueDtTm is not null 
				and dt.CDCEffectiveDtTm is not NULL
				and cast(dt.CDCEffectiveDtTm as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time'
			when [withdrawal_date] is not null 
				and PaymentProcessDueDtTm is not null
				and cast([withdrawal_date] as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time' 
			else 'Late' 
		 end PDApplyPolicyOnTimeTypeNm
        , case 
			when BillDueDtTm is NULL 
			then 'Unknown'--8/7
			when dt.CDCEffectiveDtTm is  NULL and [withdrawal_date] is NULL 
			then 'Unknown'
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then 'Unknown'        
			when cast([withdrawal_date] as date)<=cast(BillDueDtTm as date) 
			then 'On Time' 			
			when ApplyAmt.PDDepositKey is not null
			and  cast(dt.CDCEffectiveDtTm as date)<=cast(BillDueDtTm as date)
			then 'On Time' 

			else 'Late' 
		end PDApplyPolicyBillDueOnTimeTypeNm
       , case when isnull(dt.[CHECK_AMOUNT],0)=isnull(a.[CHECK_AMOUNT],0) then 1 else 0 end SameReceiveApplyAmtInd
       , case 
			when a.REVERSAL_POOL=0 
				and [over_and_short]=0 
				and Forgiven_Prem_Amt=0 
			then 1 
			else 0 
		end [NoManipulationInd]
       , 0 [WasSplitInd]
       , case when a.REVERSAL_POOL<>0 then 1 else 0 end [ReversalPoolInd]
       , case when [over_and_short]<>0 then 1 else 0 end [OverAndShortInd]
       , case when Forgiven_Prem_Amt<>0 then 1 else 0 end [ForgivenInd]
       , isnull(pc.PaymentProblemCnt,0) [PaymentProblemCnt]
       , dbo.udf_CamelCase(rtrim(ltrim(Payee))) PayeeNm
       , case 
			when ApplyAmt.TotalApplyAmt is null then 'Process'
			else 'Adjustment'
			end  ProcessTransactionTypeNm
	   , dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
	   , 
		   case 
			when a.[CREDIT_RECORD_TYPE]='PX' then 1
			when a.[ACCOUNT_STATUS] in (select IgnorePaymentAccountStatus from VBSDMReference..IgnorePaymentAccountStatusXref)
			then 1 
			else 0
    	   end PendingPaymentProcessInd 
	   , dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER))) CheckId 
       , 'CBS' [SourceSystemNm]
       , 0 RowAuditKey
       , 0 RowDeleteInd
		   /*
		   			and ac.[CREDIT_RECORD_TYPE] not in( 'PX','CM') --not payments
			and isnull(ac.[split_id],0)=0 
			and ac.[CHECK_AMOUNT]<>0
			and not exists ---pending statuses
				(
					select 1 
					from VBSDMReference..IgnorePaymentAccountStatusXref pax
					where ac.[ACCOUNT_STATUS] =pax.IgnorePaymentAccountStatus)
				)
		   */
		   		 --  , case when dt.CARRIER_NUMBER <>0 then 1 else 0 END ProcessToCarrierInd
From	VBSDMODS..[CBS_Account_credits] a
		inner join cte dt --VBSDMODS..[CBS_Account_debits] dt --only what was processed --main table
			on a.[Employer_Number]= dt.[Employer_Number] 
			and a.Deposit_Date = dt.Deposit_Date 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.[Employer_Number] 
			and IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
			and d.RowCurrentInd = 1
--------------payment
		inner join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = DepositId --1/4/16
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.[Employer_Number] as varchar),6)
				+'_'+convert(varchar(8),Bill_Due_date,112) = dbb.BillId
--------------Carrier
		left join DimCarrier car
			on dt.Carrier_Number=car.Carrierid
------------  Min Process Date
		inner join (
					select 
						[Employer_Number] 
						, Deposit_Date
						, min(cast([withdrawal_date] as date)) [FirstProcessDate] 
					from VBSDMODS..[CBS_Account_debits] dt --only what was processed
					where dt.RowCurrentInd = 1
					group by [Employer_Number], Deposit_Date
					) mpd
					on	a.[Employer_Number]= mpd.[Employer_Number] 
						and a.Deposit_Date = mpd.Deposit_Date 
-------------Number of Problems
		left join 
			(
				select 
					PDPaymentKey
					, count(1) PaymentProblemCnt 
				from dbo.FactPDPaymentProblem
				GROUP BY PDPaymentKey
			) pc
				on f.PDPaymentKey  = pc.PDPaymentKey
		left join 
			(
				select 
					PDPaymentKey
					, PaymentPDProblemKey
					, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc) rn  
				from dbo.FactPDPaymentProblem
			) lpc
				on	f.PDPaymentKey  = lpc.PDPaymentKey
					and lpc.rn = 1
----recort type = accounting status
		left join VBSDMODS..[CBS_ACCOUNTING_RECORD_STATUS_CODES] ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1
-------------calculate adjustment
		left join ApplyAmt				
				on isnull(b.PDDepositKey,0)  = ApplyAmt.PDDepositKey --7/23
				and isnull(car.CarrierKey,0) = ApplyAmt.CarrierKey
				and isnull(f.PDPaymentKey,0) = ApplyAmt.PDPaymentKey
				and [withdrawal_date] = ApplyAmt.PymtPDApplyPolicyDtTm
				and isnull(dbb.PDBillKey,0) = ApplyAmt.PDBillKey
----------------------date
		left join DimDate dd
				on cast(dt.[withdrawal_date] as date) = dd.DateDt
		left join DimDate dr
				on cast(dt.CDCEffectiveDtTm as date) = dr.DateDt
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on dt.[CHECK_AMOUNT]- - isnull(ApplyAmt.TotalApplyAmt,0) between MinAmt and MaxAmt --processed amount type				
Where	a.RowCurrentInd =1 
		and dt.RowCurrentInd = 1
		and a.Deposit_Date between '2013-01-01' and getdate()
		and a.[CREDIT_RECORD_TYPE] not in( 'CM')
		and isnull(a.[COMBINED_ER_NUMBER],0) =0
		and isnull(a.SPLIT_ID,0)=0
		and dt.CARRIER_NUMBER <>0
		and isnull(dt.[CHECK_AMOUNT],0)<> isnull(ApplyAmt.TotalApplyAmt,0) --7/22

union 
Select 
		isnull(convert(varchar(8),dt.[withdrawal_date],112),0) [SimplePaymentProcessDateKey]
		, isnull(ClientKey,0) ClientKey
		, isnull(dbb.PDBillKey,0) PDBillKey ---
		, isnull(f.PDPaymentKey,0) PDPaymentKey
		, isnull(b.PDDepositKey,0) PDDepositKey
		, isnull (dbp.BillProcessorKey,0) [BillProcessorKey]
		, isnull(db.BrokerKey,0) BrokerKey
		, isnull(car.CarrierKey,0) CarrierKey --
		, isnull(lpc.PaymentPDProblemKey,0) LastPdProblemKey--
		, [withdrawal_date] [SimplePaymentProcessDtTm]
		, isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
		, isnull(SalesPersonKey,0) SalesPersonKey 
		, case when [FirstProcessDate]  = cast( dt.[withdrawal_date] as date) then 1 else 0 end FirstProcessDateInd --
		, isnull(dt.[CHECK_AMOUNT],0) - isnull(ApplyAmt.TotalApplyAmt,0) ProcessAmt
		, isnull(x.AmtTypeNm,'Unknown')
		, isnull(x.AmtTypeDesc,'Unknown')
		, CASE
			when	dt.CDCEffectiveDtTm  is not null 
					and PaymentReceiveDtTm is not NULL
			then	isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast(dt.CDCEffectiveDtTm as date)) ,0)
			when	PaymentReceiveDtTm  is not null 
					and [withdrawal_date] is not NULL
			then	isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast([withdrawal_date] as date)) ,0)
			else	NULL
		end PDApplyPolicyReceiveWorkDayCnt ---remove isnull
        , case 
			when datepart(hh,dbb.BillDueDtTm)
				+datepart(minute,dbb.BillDueDtTm)
				+datepart(second,dbb.BillDueDtTm)
				+datepart(millisecond,dbb.BillDueDtTm)>0 
			then NULL
			when	dbb.BillDueDtTm is not null 
					and dt.CDCEffectiveDtTm is not NULL
			then	isnull(dbo.udf_BusinessDayCnt(cast(dt.CDCEffectiveDtTm as date),cast(dbb.BillDueDtTm as date)),0) 
			when	dbb.BillDueDtTm is not null 
					and [withdrawal_date] is not NULL
			then	isnull(dbo.udf_BusinessDayCnt(cast([withdrawal_date] as date),cast(dbb.BillDueDtTm as date)),0) 
			else	NULL
			end PDApplyPolicyBillDueWorkDayCnt --remove isnull
        , case 
			when	dbb.BillDueDtTm is NULL 
					or PaymentReceiveDtTm is NULL --no data to calculate
			then	'Unknown' --8/7			
			when	datepart(hh,dbb.BillDueDtTm) 
					+ datepart(minute,dbb.BillDueDtTm)
					+ datepart(second,dbb.BillDueDtTm)
					+ datepart(millisecond,dbb.BillDueDtTm)>0 
			then	'Unknown'  --bill due date is dummy
			when	cast(PaymentReceiveDtTm as date) <= cast(dbb.BillDueDtTm as date) 
			then	'On Time' 
			else	'Late' 
		 end [ReceiveOnTimeTypeNm]
        , case 
			when PaymentProcessDueDtTm is NULL  --no payment is found
			then 'Unknown'--8/7
			when [withdrawal_date] is null and dt.CDCEffectiveDtTm is null
			then 'Unknown'
			when PaymentProcessDueDtTm is not null 
				and dt.CDCEffectiveDtTm is not NULL
				and cast(dt.CDCEffectiveDtTm as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time'
			when [withdrawal_date] is not null 
				and PaymentProcessDueDtTm is not null
				and cast([withdrawal_date] as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time' 
			else 'Late' 
		 end PDApplyPolicyOnTimeTypeNm
        , case 
			when dbb.BillDueDtTm is NULL 
			then 'Unknown'--8/7
			when dt.CDCEffectiveDtTm is  NULL and [withdrawal_date] is NULL 
			then 'Unknown'
			when datepart(hh,dbb.BillDueDtTm)
				+datepart(minute,dbb.BillDueDtTm)
				+datepart(second,dbb.BillDueDtTm)
				+datepart(millisecond,dbb.BillDueDtTm)>0 
			then 'Unknown'        
			when cast(dt.CDCEffectiveDtTm as date)<=cast(dbb.BillDueDtTm as date)
			then 'On Time' 
			when cast([withdrawal_date] as date)<=cast(dbb.BillDueDtTm as date) 
			then 'On Time' 
			else 'Late' 
		end PDApplyPolicyBillDueOnTimeTypeNm	   , 
		
		
		case when isnull(dt.[CHECK_AMOUNT],0)=isnull(a.[CHECK_AMOUNT],0) then 1 else 0 end[SamePaymentProcessAmtInd]
       , 0 [NoManipulationInd]
       , 1 [WasSplitInd]
       , case when a.REVERSAL_POOL<>0 then 1 else 0 end [ReversalPoolInd]
       , case when [over_and_short]<>0 then 1 else 0 end [OverAndShortInd]
       , case when Forgiven_Prem_Amt<>0 then 1 else 0 end [ForgivenInd]
       , isnull(pc.PaymentProblemCnt,0) [PaymentProblemCnt]
       , dbo.udf_CamelCase(rtrim(ltrim(Payee))) PayeeNm
	   , case 
			when ApplyAmt.TotalApplyAmt is null then 'Process'
			else 'Adjustment'
			end  ProcessTransactionTypeNm
	   , dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
	   , 
		   case 
			when a.[CREDIT_RECORD_TYPE]='PX' then 1
			when a.[ACCOUNT_STATUS] in (select IgnorePaymentAccountStatus from VBSDMReference..IgnorePaymentAccountStatusXref)
			then 1 
			else 0
		   end 		   PendingPaymentProcessInd 
	   , dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER))) CheckId 
       , 'CBS' [SourceSystemNm]
       , 0 RowAuditKey
       , 0 RowDeleteInd
From	VBSDMODS..[CBS_Account_credits] a
		inner join VBSDMODS.dbo.[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] ch
			on a.[Split_id]=ch.id
		inner join cte dt -- VBSDMODS..[CBS_Account_debits] dt --only what was processed
			on a.[Employer_Number]= dt.[Employer_Number] 
			and a.Deposit_Date = dt.Deposit_Date 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.[Employer_Number] 
			and IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
			and d.RowCurrentInd = 1
--------------payment
		inner join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(ch.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),ch.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,ch.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,ch.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,ch.Deposit_Date) as varchar),2)
			+right('000'+cast(datepart(millisecond,ch.Deposit_Date) as varchar),3)

----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and db.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.BrokerId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1					
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = DepositId --1/4/16
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.[Employer_Number] as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_date,112) = dbb.BillId
--------------Carrier
		left join DimCarrier car
			on dt.Carrier_Number=car.Carrierid
------------  Min Process Date
		inner join (
					select 
						[Employer_Number] 
						, Deposit_Date
						, min(cast([withdrawal_date] as date)) [FirstProcessDate] 
					from VBSDMODS..[CBS_Account_debits] dt --only what was processed
					group by [Employer_Number], Deposit_Date
				) mpd
				on a.[Employer_Number]= mpd.[Employer_Number] 
					and a.Deposit_Date = mpd.Deposit_Date 
-------------Number of Problems
		left join 
			(
				select 
					PDPaymentKey
					, count(1) PaymentProblemCnt 
				from	dbo.FactPDPaymentProblem
				GROUP BY PDPaymentKey
			) pc
				on f.PDPaymentKey  = pc.PDPaymentKey
		left join 
			(
				select 
					PDPaymentKey
					,PaymentPDProblemKey
					, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc) rn  
				from	dbo.FactPDPaymentProblem
			) lpc
			on	f.PDPaymentKey = lpc.PDPaymentKey
				and lpc.rn = 1
--recort type = accounting status
		left join VBSDMODS..[CBS_ACCOUNTING_RECORD_STATUS_CODES] ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1 
----adjustment
		left join ApplyAmt				
				on isnull(b.PDDepositKey,0)  = ApplyAmt.PDDepositKey
				and isnull(car.CarrierKey,0) = ApplyAmt.CarrierKey
				and isnull(f.PDPaymentKey,0) = ApplyAmt.PDPaymentKey
				and [withdrawal_date] = ApplyAmt.PymtPDApplyPolicyDtTm
				and isnull(dbb.PDBillKey,0) = ApplyAmt.PDBillKey
----------------------date
		left join DimDate dd
				on cast(dt.[withdrawal_date] as date) = dd.DateDt
		left join DimDate dr
				on cast(dt.CDCEffectiveDtTm as date) = dr.DateDt
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on dt.[CHECK_AMOUNT]- isnull(ApplyAmt.TotalApplyAmt,0) between MinAmt and MaxAmt --processed amount type
Where	a.RowCurrentInd =1 
		and dt.RowCurrentInd = 1
		and ch.RowCurrentInd = 1
		and ch.Deposit_Date between '2013-01-01' and getdate()
		and dt.[WITHDRAWAL_DATE] between '1900-01-01' and getdate()
		and a.[CREDIT_RECORD_TYPE] not in( 'CM')
		and isnull(a.[combined_er_number],0) =0
		and isnull(a.[split_id],0)>0
		and dt.CARRIER_NUMBER<>0
		and isnull(dt.[CHECK_AMOUNT],0)<> isnull(ApplyAmt.TotalApplyAmt,0) --7/22

--------------------------------
end
GO
PRINT N'Altering [dbo].[DailyInsertFactPDDepositComplete]...';


GO


ALTER procedure [dbo].[DailyInsertFactPDDepositComplete]
AS
BEGIN
DECLARE  @AuditKey int
SET @AuditKey =	isnull((SELECT	MIN(RowAuditKey) 
				FROM	VBSAudit.dbo.VBSDMAudit
				WHERE	CreateDtTm>
						(
							SELECT max(cast(CreateDtTm as DATE)) FROM VBSAudit.dbo.VBSDMAudit --2/9/2015
							WHERE SystemTypeNm = 'ANALYTICS' 
							and TargetTableNm = 'FactPDDepositComplete' 
							and SuccessInd=1
						)
				),(select max(RowAuditKey)-1 from VBSAudit.dbo.VBSDMAudit WHERE TargetTableNm = 'CBS_ACCOUNT_CREDITS' )) --added 9/23

---Find Trustmark vs. Not Trustmark data--------------------
SELECT 
		EMPLOYER_NUMBER EMPLOYER_NUMBER,
		PAYMENT_EFFECTIVE_DATE DEPOSIT_DATE, 
		sum ( case when TrustmarkOrNotNm= 'Trustmark' then EMPLOYEE_PAID_PREMIUM+EMPLOYER_PAID_PREMIUM else 0 end )  ApplyTrustmarkAmt,
		sum ( case when TrustmarkOrNotNm= 'Not Trustmark' then  EMPLOYEE_PAID_PREMIUM+EMPLOYER_PAID_PREMIUM else 0 end )  ApplyToNotTrustmarkAmt,
		count ( distinct (case when TrustmarkOrNotNm= 'Trustmark' then  POLICY_NO else NULL end ) )  TrustmarkApplyPolicyCnt,
		count ( distinct case when TrustmarkOrNotNm= 'Not Trustmark' then  POLICY_NO else NULL end )  NotTrustmarkApplyPolicyCnt,
		count ( distinct case when TrustmarkOrNotNm= 'Unknown' then  POLICY_NO else NULL end )  UnknownApplyPolicyCnt,
		count ( distinct  POLICY_NO )  TotalApplyPolicyCnt
INTO	#ApplyDetails
FROM	VBSDMODS.dbo.CBS_ARCHIVED_NIGHT_BATCH_TABLE
		inner join DimCarrier car
			on Carrier_Number=car.Carrierid
WHERE 
		PAYMENT_EFFECTIVE_DATE between '2013-01-01'  and getdate ()
		and STATUS_CODE not in ('VO','ND','BL') --voided statuses
		and RowCurrentInd =1 
GROUP BY 
		EMPLOYER_NUMBER,
		PAYMENT_EFFECTIVE_DATE
ORDER BY 
		EMPLOYER_NUMBER,
		PAYMENT_EFFECTIVE_DATE
---------------------------Index--------------------
create clustered index CX on #ApplyDetails ( EMPLOYER_NUMBER, DEPOSIT_DATE )
---------------Apply duration--------------------

SELECT 
		EMPLOYER_NUMBER,
		DEPOSIT_DATE,
		min ( withdrawal_date ) FirstApplyCompleteDate,
		max ( withdrawal_date ) LastApplyCompleteDate,
		dbo.udf_BusinessDayCnt( min ( withdrawal_date ) , max ( withdrawal_date )  ) ApplyDurationWorkDayCnt
INTO	#ApplyTotal
FROM	VBSDMODS..CBS_Account_debits
WHERE	DEPOSIT_DATE between '2013-01-01'  and getdate ()
		and RowCurrentInd = 1 AND CARRIER_NUMBER<>0 --9/11
GROUP BY 
		EMPLOYER_NUMBER,
		DEPOSIT_DATE
ORDER BY
		EMPLOYER_NUMBER,
		DEPOSIT_DATE
-----------------------Index--------------------
create clustered index CX on #ApplyTotal ( EMPLOYER_NUMBER, DEPOSIT_DATE )
-----------------------------------------------_
SELECT  'D'
			+ right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)
			+ '_'
			+ convert(varchar(8),a.DEPOSIT_DATE,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+ right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+ '*'
			+ right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId, min(CDCEffectiveDtTm) BalancedDtTm --1/4/2016
INTO	#Balanced
FROM	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a 
		left join DimPDDeposit dd
		on 
		 'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = dd.depositId --1/4/2016
--------------------check if the record is already in the fact table and active-----------
		left join FactPDDepositComplete d
		on	dd.PDDepositKey = d.PDDepositKey
			and d.RowDeleteInd = 0	---not deleted
WHERE	d.PDDepositKey is null  --- not in the fact already
		and ACCOUNT_STATUS = 'BALANCED'
		and CDCEffectiveDtTm is not null
		and a.RowAuditKey> @AuditKey 
GROUP BY 
			'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) --1/4/2016

------------------------Index
create clustered index CX on #Balanced(DepositId)			
--SELECT * FROM #Balanced

--SELECT * FROM FactPDDepositComplete
---------------------------
SELECT 'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId, max(isnull(CDCEffectiveDtTm,'1900-01-01')) LastNotBalancedDtTm  --1/4/2016
INTO	#NotBalanced
FROM	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
WHERE	ACCOUNT_STATUS <> 'BALANCED' 
		and RowCurrentInd=0 
		and CDCExpireDtTm is not NULL
		and a.RowAuditKey> @AuditKey 
GROUP BY 
		'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
		+'_'
		+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
		+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
		+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
		+'*'
		+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) --1/4/2016


create clustered index CX on #NotBalanced(DepositId)		

-------------------------
SELECT 
		convert(varchar(8),BalancedDtTm,112) CompleteDateKey
       , isnull(F.PDPaymentKey,0) PDPaymentKey
       , isnull(b.PDDepositKey,0) PDDepositKey
       , isnull(ClientKey,0) ClientKey
       , isnull(dbb.PDBillKey,0) PDBillKey
       , isnull (dbp.BillProcessorKey,0) MainBillProcessorKey
	   , isnull(db.BrokerKey,0) BrokerKey
       , isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
       , isnull(SalesPersonKey,0) SalesPersonKey 
       , case 
		when a.REVERSAL_POOL=0 
			and over_and_short=0 
			and Forgiven_Prem_Amt=0 
			AND isnull(a.SPLIT_ID,0)=0
			AND isnull(a.COMBINED_ER_NUMBER,0)=0
		then 1 
		else 0 
		end NoManipulationInd
       , 
	    case 
		   when PaymentReceiveDtTm is Null or BalancedDtTm is NULL --9/11
		   then NULL
		   else dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,BalancedDtTm) 
		end CompleteReceiveWorkDayCnt
       , case 
		   when PaymentReceiveDtTm is Null or BalancedDtTm is NULL
		   then 'Unknown'
		   when dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,BalancedDtTm) <=TargetNo  --9/11
		   then 'On time' 
		   else 'Late'  
       end CompleteOnTimeTypeNm
       ,  dbo.udf_BusinessDayCnt ( FirstApplyCompleteDate,BalancedDtTm ) CompleteFirstApplyWorkDayCnt --9/11
       ,  dbo.udf_BusinessDayCnt ( LastApplyCompleteDate,BalancedDtTm )  CompleteLastApplyWorkDayCnt --9/11
       ,	ApplyDurationWorkDayCnt
       , case 
			when ApplyTrustmarkAmt <> 0 and ApplyToNotTrustmarkAmt <> 0 then 'Both'
			when ApplyTrustmarkAmt <> 0  then 'Trustmark' 
			when ApplyToNotTrustmarkAmt <> 0  then 'Not Trustmark'
			else 'Unknown' 
			end TrustmarkOrNotNm
       , isnull(ApplyTrustmarkAmt,0) ApplyTrustmarkAmt
       , isnull(ApplyToNotTrustmarkAmt,0) ApplyToNotTrustmarkAmt
       , CHECK_AMOUNT + a.REVERSAL_POOL + OVER_AND_SHORT + FORGIVEN_PREM_AMT - isnull(ApplyTrustmarkAmt,0) - isnull(ApplyToNotTrustmarkAmt,0) ApplyUnknownAmt
       , CHECK_AMOUNT + a.REVERSAL_POOL + OVER_AND_SHORT + FORGIVEN_PREM_AMT TotalCompleteAmt
       , isnull(TrustmarkApplyPolicyCnt,0) TrustmarkApplyPolicyCnt
       , isnull(NotTrustmarkApplyPolicyCnt,0) NotTrustmarkApplyPolicyCnt
       , isnull(UnknownApplyPolicyCnt,0) UnknownApplyPolicyCnt
       , isnull(TotalApplyPolicyCnt,0) TotalApplyPolicyCnt
       , 'CBS' SourceSystemNm
 FROM	#balanced bl 
		inner join #notbalanced n
			on bl.depositId = n.depositId
		inner join VBSDMODS..CBS_Account_credits a
			on bl.DepositId = 
			'D'
			+ right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)
			+ '_'
			+ convert(varchar(8),a.DEPOSIT_DATE,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+ right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+ '*'
			+ right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6)  --1/4/2016
		inner join #ApplyDetails ad --9/11 at least one debit record should exist, changed FROM left join to inner join
			on a.EMPLOYER_NUMBER= ad.EMPLOYER_NUMBER 
				and a.DEPOSIT_DATE = ad.DEPOSIT_DATE
		left join #ApplyTotal dt --VBSDMODS..CBS_Account_debits dt --only what was processed
			on a.EMPLOYER_NUMBER = dt.EMPLOYER_NUMBER 
				and a.DEPOSIT_DATE = dt.DEPOSIT_DATE 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.EMPLOYER_NUMBER 
				and IdTypeNm = 'EMPLOYER_NUMBER' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on CHECK_AMOUNT+REVERSAL_POOL+OVER_AND_SHORT+FORGIVEN_PREM_AMT between MinAmt and MaxAmt --processed amount type
----------find broker
		left join
				(
					SELECT  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId ORDER BY ClientId desc,ClientGroupId desc) RN
					FROM	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					WHERE	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.EMPLOYER_NUMBER = cc.EMPLOYER_NUMBER
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = b.DepositId --1/4/2016
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = dbb.BillId
--------------payment
		left join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3)
			,VBSDMReference..TargetXref
			
WHERE a.RowCurrentInd =1 
--	and dt.RowCurrentInd = 1
	and a.DEPOSIT_DATE between '2013-01-01' and getdate()
--	and a.CHECK_AMOUNT<>0
--	and dt.CARRIER_NUMBER <>0
--	and dt.CHECK_AMOUNT <>0
and n.LastNotBalancedDtTm<bl.BalancedDtTm
and TargetNm = 'Deposit Completion Duration'
and convert(varchar(8),BalancedDtTm,112) between EffectiveDtTm and ExpireDtTm


drop table #ApplyDetails
drop table #ApplyTotal
drop table #Balanced
drop table #NotBalanced
END
GO
PRINT N'Altering [dbo].[DailyLoadFactPremiumPayment]...';


GO

ALTER PROCEDURE [dbo].[DailyLoadFactPremiumPayment] --(@StartDate date, @EndDate date)
AS
BEGIN

--declare @StartDate date,--='2014-10-01', 
--@EndDate date-- ='2014-10-05'

--truncate table [VBSAnalytics].[dbo].[FactPremiumPayment]
-- find first application  - for initial sale and first enroller from application
	select 
		a.POLICY_NO
		,a.Case_id,a.Case_Group_id 
		, b.AGENT_RENEWAL_NO Enroller
		, ROW_NUMBER() over 
			(
			partition by a.POLICY_NO,a.Case_id,a.Case_Group_id 
			order by 
					case when a.POLICY_IND ='NEW'  then '1900-01-01' else a.RECEIVED_DATE end, 
					a.LAST_UPDATE_TMSP desc,
					a.RowIdentityKey
			) RowNumber
			,SIGNATURE_DATE
	into	#CTE_Application
	FROM	VBSDMOds..WAMT_APP_POL_XREF a
			inner join	VBSDMOds..WAMT_APPLICATION b 
					on	a.APPLICATION_ID=b.APPLICATION_ID 
						AND a.CASE_ID = b.CASE_ID
						and a.Case_Group_id = b.Case_group_id
						and a.RowCurrentInd = 1
						and b.RowCurrentInd = 1
	where	a.POLICY_NO>'' 
			AND a.Policy_Ind is not NULL --if NULL do not take because it is invalid
---order Enrollers from Policy Change, use it if there is no application
SELECT 
		a.POLICY_NO,
		a.ENROLLER_REN_NO Enroller,
		row_number() over (partition by a.POLICY_NO order by  ENTRY_TMSP,a.RowIdentityKey) RowNumber
INTO	#EnrollerFromPolicyChange
FROM	VBSDMOds..PIOP_POLICY_CHANGE a
where	CHANGE_STATUS='F'
		and a.RowCurrentInd = 1

create clustered index CX on #EnrollerFromPolicyChange(POLICY_NO)

--order all Enrollers from Policy Change, use it if there is no application or 'NEW record'
SELECT 
		a.POLICY_NO,
		a.ENROLLER_REN_NO Enroller,
		row_number() over (partition by a.POLICY_NO order by  ENTRY_TMSP,a.RowIdentityKey) RowNumber
INTO	#FirstAvailableEnroller 
FROM	VBSDMOds..PIOP_POLICY_CHANGE a
WHERE	a.RowCurrentInd = 1

create clustered index CX on  #FirstAvailableEnroller(POLICY_NO)

 
--drop table #revenue


--declare @StartDate date='2014-10-01', 
--@EndDate date ='2014-10-05'
SELECT 
	a.Policy_NO PolicyId, 
	c.CASE_ID ClientId,
	Activity_date ApplyDate,
	datediff(dd,PREMIUM_DUE_DATE,activity_date)  DueApplyDurationDayNo,
	AMOUNT PaymentAmount,
	d.EnrollmentCompanyId,
	d.BrokerId,
	d.RSDId,
	pp.FM_POL_FORM_PLAN PlanId,
	coalesce(en1.Enroller, en2.Enroller, en3.Enroller) EnrollerId,
	Batch,
	year(pp.POL_EFF_DATE) PolicyEffectiveDateYearNo
	,dbo.udf_CamelCase(ACTIVITY_TYPE) ActivityTypeNm
	,SEQ_NO PremiumNo
into	#revenue
FROM	VBSDMOds..STG_VBSO_QPTR_PREM_REFUND a --12/5/2014 
		inner join VBSDMODS.dbo.PIOP_POLICY pp
			on a.Policy_no = pp.Policy_no
		inner join VBSDMODS.dbo.PIOP_NWB_POLICIES  c
			on a.Policy_no = c.Policy_no
		left join VBSDMReference..ClientProducerXref d
			on c.CASE_ID = d.ClientId
				and c.CASE_GROUP_ID = d.ClientGroupId
				--and d.RelationDt = a.Activity_date
				--and d.RowCurrentInd = 1 --1/8/2015
		left join #CTE_Application en1
			on	a.Policy_no = en1.Policy_no
				and en1.RowNumber = 1
				and c.Case_id=en1.Case_id
				and c.Case_group_Id = en1.Case_group_id
		left join  #EnrollerFromPolicyChange en2
			on	a.Policy_no = en2.Policy_no
				and en2.RowNumber = 1
		left join    #FirstAvailableEnroller en3
			on	a.Policy_no = en3.Policy_no
				and en3.RowNumber = 1
WHERE --Activity_date between @StartDate and @EndDate
--and 
pp.RowCurrentInd=1
and c.RowCurrentInd=1

create clustered index CX on #revenue(PolicyId)

 select 
		isnull(dp.PolicyKey ,0 ) PolicyKey,
		isnull(dpl.PlanKey,0) PlanKey,
		isnull(dsp.SubProductKey,0) SubProductKey,
		isnull(dpr.ProductKey,0) ProductKey,
		isnull(dc.ClientKey,0) ClientKey,
		isnull(SalesPerson.SalesPersonKey,0) SalesPersonKey,
		isnull(db.BrokerKey,0) BrokerKey,
		isnull(dec.EnrollmentCompanyKey,0) EnrollmentCompanyKey,
		isnull(EnrollerKey,0) InitialEnrollerKey,
		isnull(cast(year(ApplyDate) as varchar)+right('0'+cast(month(ApplyDate) as varchar),2),0) [PaymentReceiveMonthKey],
		isnull(DateKey,0)  [PaymentReceiveDateKey],
		'Worksite' BusinessBlockNm,
		'VBSO' SourceSystemNm,
		isnull(r.ActivityTypeNm,'Unknown') ActivityTypeNm,
		isnull(pmx.PaymentMethodNm,'Unknown') PaymentMethodNm,
		isnull
			(
			case 
				when dp.PolicyEffectiveDt<>'9999-12-31'	
				then datediff
					(
						yy,
						dateadd(dd,-1,dateadd(yy,1,dp.PolicyEffectiveDt)),
						r.ApplyDate)
					+1
				else 0 
				end,0)
		PolicyYearCycleNo,
		isnull(r.PolicyEffectiveDateYearNo,0),
		isnull(r.PaymentAmount,0) RevenuePremiumAmt,
		isnull(r.DueApplyDurationDayNo,0),
		isnull(r.PremiumNo,1) PremiumNo

 from #revenue r
		left join VBSAnalytics.dbo.DimPolicy dp
			on r.PolicyId = dp.PolicyId
				and RowCurrentInd=1
		left join VBSAnalytics.dbo.DimPlan dpl
			on r.PlanId=dpl.PlanId
			and 'Worksite' = dpl.BusinessBlockNm
			--and SourceSystemNm='PIOP'
		left join VBSAnalytics.dbo.DimSubProduct dsp
			on dpl.SubProductId = dsp.SubProductId
			and 'Worksite'=dsp.BusinessBlockNm
		left join VBSAnalytics.dbo.DimProduct dpr
			on dpl.ProductId = dpr.ProductId
			and 'Worksite'=dpr.BusinessBlockNm	
		left join VBSDMReference.dbo.ClientXref cx
			on cx.SourceId=r.ClientId
				and cx.RowCurrentInd=1 
				and IdTypeNm = 'CASE_ID'
		left join VBSAnalytics..DimClient dc
			on cx.ClientIntegrationId= dc.ClientIntegrationId
				and dc.RowCurrentInd=1
		left join VBSAnalytics..DimSalesPerson SalesPerson
			on r.RSDId = SalesPerson.SalesPersonId
			and ApplyDate between SalesPerson.RowStartDtTm and SalesPerson.RowEndDtTm
		left join VBSAnalytics..DimBroker db
			on r.BrokerId=db.BrokerId
			and db.RowCurrentInd=1
		left join VBSAnalytics.dbo.DimEnrollmentCompany dec
			on r.EnrollmentCompanyId=dec.EnrollmentCompanyId
			and dec.RowCurrentInd=1
		left join VBSAnalytics.dbo.DimEnroller de
			on r.EnrollerId = de.EnrollerId
			and de.RowCurrentInd = 1
		left join VBSDMReference.dbo.PaymentMethodXref pmx
			on Batch=BatchId
		left join VBSAnalytics.dbo.DimDate
			on ApplyDate = DateDt
		---11/19/15 ADDITION TO PREVENT DUPLICATES IF RUNS TWICE ON THE SAME DATE----------------------------
		left join [dbo].[FactPremiumPayment] pr
			on isnull(dp.PolicyKey ,0 ) = pr.PolicyKey
			and DateKey = pr.[PaymentReceiveDateKey]
			and isnull(r.PremiumNo,1)= pr.[PaymentNo]
		where pr.PolicyKey is null

		DROP TABLE #revenue
		DROP TABLE #CTE_Application
		DROP TABLE #FirstAvailableEnroller
		DROP TABLE #EnrollerFromPolicyChange

		-----------------------------------------------------------------------------------------------------
END
--374393
GO
PRINT N'Altering [dbo].[InitialDimPDDeposit]...';


GO

ALTER procedure [dbo].[InitialDimPDDeposit] as 
BEGIN
delete from [VBSAnalytics].[dbo].[DimPDDeposit]
where PDDepositKey>0
----------------------------SPLITS and CHANGES
INSERT INTO [VBSAnalytics].[dbo].[DimPDDeposit]
           ([DepositId]
           ,[EmployerId]
           ,[ChangeId]
           ,[DepositCreateDtTm]
           ,[DepositAmt]
           ,[DepositAmtTypeNm]
           ,DepositAmtTypeDesc
           ,TrustmarkOrNotNm
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
		   ,DepositDtTm --11/4/15 added
		   )
select 
           [DepositId]
           ,[EmployerId]
           ,[ChangeId]
           ,[DepositCreateDtTm]
           ,[DepositAmt]
           ,[DepositAmtTypeNm]
           ,DepositAmtTypeDesc
           ,TrustmarkOrNotNm
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
		   ,DepositDtTm --11/4/15 added
from(

Select distinct

	'D'+right('000000'+cast(b.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),b.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
		+right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
		+'*'
		+'000000'
	DepositId , 
	b.[Employer_Number] EmployerId, 
	0 ChangeId,
	coalesce(b.[SPLIT_DATE],b.Deposit_Date) DepositCreateDtTm, --we need to use RowStartDate on initial record because there is no real start date in the system
	[CHECK_amount] DepositAmt,
	x.[AmtTypeNm] DepositAmtTypeNm,
	x.AmtTypeDesc DepositAmtTypeDesc,
				case 
					when a.TrustmarkInd = 1 then 'Trustmark'
					when a.TrustmarkInd = 0 then 'Not Trustmark'
					else 'Unknown'
				end TrustmarkOrNotNm,
	'CBS' SourceSystemNm,
	0 RowAuditKey,
	0 RowDeleteInd
	, row_number() over (partition by 	'D'+right('000000'+cast(b.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),b.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,b.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,b.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,b.Deposit_Date) as varchar),2)
		+right('000'+cast(datepart(millisecond,b.Deposit_Date) as varchar),3)
		+'*'
		+'000000' order by coalesce(b.[SPLIT_DATE],b.Deposit_Date)) RN,
		b.Deposit_Date DepositDtTm --11/4/15 added
		
From	VBSDMODS..[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] b
		left join
		VBSDMReference.dbo.AmtTypeXref x
			on b.[CHECK_AMOUNT] between x.MinAmt and x.MaxAmt
		left join
		(	Select distinct cp.Employer_Number,TrustmarkInd
			From	VBSDMODS.dbo.[CBS_Employee_Audit_Table]  CP
					inner join VBSDMReference.dbo.CarrierXref CAR
				on CAR.CarrierId = CP.[Carrier_Number]
			where TrustmarkInd=1 and CP.RowCurrentInd = 1) a
				on b.[Employer_Number]=a.Employer_Number
Where b.RowCurrentInd = 1 AND 
		b.Deposit_Date between '2013-01-01' and getdate()--and [SPLIT CHECK]=1
		--or isnull(b.[split DATE],'1900-01-01')>='2011-01-01'
)f
where RN = 1

------------------------ALL Account credits
INSERT INTO [VBSAnalytics].[dbo].[DimPDDeposit]
           ([DepositId]
           ,[EmployerId]
           ,[ChangeId]
           ,[DepositCreateDtTm]
           ,[DepositAmt]
           ,[DepositAmtTypeNm]
           ,DepositAmtTypeDesc
           ,TrustmarkOrNotNm
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
		   ,DepositDtTm) --11/4/15 added
Select distinct 
	'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
	+'*'
	+right('000000'+cast(isnull([SPLIT_ID],'') as varchar),6) --12/16
	DepositId , 
	a.[Employer_Number] EmployerId, 
	isnull(cast ([SPLIT_ID] as int),0) SplitId,
	a.Deposit_Date DateWhenDepositWasCreatedfromPayment, --we need to use RowStartDate on initial record because there is no real start date in the system
	isnull([CHECK_AMOUNT],0)+
	isnull([REVERSAL_POOL],0)+
	isnull([OVER_AND_SHORT],0)+
	isnull(Forgiven_Prem_Amt,0) DepositAmt,
	x.[AmtTypeNm],
	x.AmtTypeDesc,
	case 
					when b.TrustmarkInd = 1 then 'Trustmark'
					when b.TrustmarkInd = 0 then 'Not Trustmark'
					else 'Unknown'
				end TrustmarkOrNotNm,
	'CBS' SourceSystemNm,
	0 RowAuditKey,
	0 RowDeleteInd,
	a.Deposit_Date--11/4/15 added

 From	VBSDMODS..[CBS_Account_credits] a --left join VBSDMODS..[ACCOUNT CREDITS CHANGES ARCHIVE] b
--on a.[SPLIT ID]=b.ID
		left join
		VBSDMReference.dbo.AmtTypeXref x
		on (	isnull([CHECK_AMOUNT],0)+
			isnull([REVERSAL_POOL],0)+
			isnull([OVER_AND_SHORT],0)+
			isnull(Forgiven_Prem_Amt,0)) between x.MinAmt and x.MaxAmt
		left join
		(	Select distinct cp.Employer_Number,TrustmarkInd
			From	VBSDMODS.dbo.[CBS_Employee_Audit_Table]  CP
					inner join VBSDMReference.dbo.CarrierXref CAR
				on CAR.CarrierId = CP.[Carrier_Number]
			where TrustmarkInd=1 and CP.RowCurrentInd = 1) b
				on a.[Employer_Number]=b.Employer_Number
Where	a.RowCurrentInd = 1 
		--AND a.[CREDIT_RECORD_TYPE] <> 'PX'
		and a.Deposit_Date between '2013-01-01' and getdate()
		--and [ACCOUNT_STATUS] not in 
		--		(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
		and 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+cast(isnull([SPLIT_ID],'') as varchar),6) --12/16
		not in
			(select DepositId from DimPdDeposit)

------------------Deposits before split
INSERT INTO [VBSAnalytics].[dbo].[DimPDDeposit]
           ([DepositId]
           ,[EmployerId]
           ,[ChangeId]
           ,[DepositCreateDtTm]
           ,[DepositAmt]
           ,[DepositAmtTypeNm]
           ,DepositAmtTypeDesc
           ,TrustmarkOrNotNm
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
		   ,DepositDtTm --11/4/15 added
		   )
Select distinct 
	'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
	+'*000000'
	DepositId , 
	a.[Employer_Number] EmployerId, 
	isnull(cast ([SPLIT_ID] as int),0) SplitId,
	a.Deposit_Date DateWhenDepositWasCreatedfromPayment, --we need to use RowStartDate on initial record because there is no real start date in the system
	isnull([CHECK_AMOUNT],0)+
	isnull([REVERSAL_POOL],0)+
	isnull([OVER_AND_SHORT],0)+
	isnull(Forgiven_Prem_Amt,0) DepositAmt,
	x.[AmtTypeNm],
	x.AmtTypeDesc,
				case 
					when b.TrustmarkInd = 1 then 'Trustmark'
					when b.TrustmarkInd = 0 then 'Not Trustmark'
					else 'Unknown'
				end TrustmarkOrNotNm,
	'CBS' SourceSystemNm,
	0 RowAuditKey,
	0 RowDeleteInd,
	a.Deposit_Date --11/4/15 added

 From	VBSDMODS..[CBS_Account_credits] a --left join VBSDMODS..[ACCOUNT CREDITS CHANGES ARCHIVE] b
--on a.[SPLIT ID]=b.ID
		left join
		VBSDMReference.dbo.AmtTypeXref x
		on (	isnull([CHECK_AMOUNT],0)+
			isnull([REVERSAL_POOL],0)+
			isnull([OVER_AND_SHORT],0)+
			isnull(Forgiven_Prem_Amt,0)) between x.MinAmt and x.MaxAmt
		left join
		(	Select distinct cp.Employer_Number,TrustmarkInd
			From	VBSDMODS.dbo.[CBS_Employee_Audit_Table]  CP
					inner join VBSDMReference.dbo.CarrierXref CAR
				on CAR.CarrierId = CP.[Carrier_Number]
			where TrustmarkInd=1 and cp.RowCurrentInd = 1) b
				on a.[Employer_Number]=b.Employer_Number
Where	a.RowCurrentInd = 1 
		AND a.[CREDIT_RECORD_TYPE] <> 'PX'
		and a.Deposit_Date between '2013-01-01' and getdate()
		--and [ACCOUNT_STATUS] not in 
		--		(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
		and 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*000000'
		not in
			(select DepositId from DimPdDeposit)

END
GO
PRINT N'Altering [dbo].[InitialDimPDSuspense]...';


GO

ALTER procedure [dbo].[InitialDimPDSuspense]
as
begin
delete from VBSAnalytics.dbo.DimPDSuspense where PDSuspenseKey>0
INSERT INTO VBSAnalytics.dbo.DimPDSuspense
           (
           SuspenseId
           ,SuspenseNo
           ,EmployerId
           ,DepositDtTm
           ,ServiceId
           ,BillId
           ,PaymentId
           ,DepositId
           ,SuspenseAmt
           ,SuspenseCreateDtTm
           ,ResolutionDueDtTm
           ,CreatePymtReceiveWorkDayCnt
           ,TrustmarkOrNotNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
SELECT 
		'S'
		+ right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
		+ '_'
		+ right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
		+ right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
		+ right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
		+ right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
		+ '_'
		+ a.Employee_SSN
		+ '_'
		+ upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) )  SuspenseId, --8/4 isnull added
		a.Employee_SSN SuspenseNo,
		a.Employer_Number EmployerId,
		a.PAYMENT_EFFECTIVE_DATE DepositDtTm,
		upper ( ltrim ( rtrim ( a.Service_Code ) ) ) ServiceId,
		isnull ( 'B'+right ( '000000' + cast ( a.Employer_Number as varchar ),6 )
							+'_'+convert ( varchar(8),b.Bill_Due_Date,112 ),'Unknown' ) BillId,
		coalesce (	f.PaymentId,
					F1.PaymentId,
					F2.PaymentId,
					'Unknown' --8/27
					--'P'
					--+ right ( '000000'+cast(a.Employer_Number as varchar ),6)
					--+ '_'
					--+ convert ( varchar(8),a.PAYMENT_EFFECTIVE_DATE,112 )
					--+ '_'
					--+ right ( '0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE ) as varchar ),2 )
					--+ right ( '0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE ) as varchar ),2 )
					--+ right ( '0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE ) as varchar ),2)
					--+ right ( '000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE ) as varchar ),3 )
					 ) PaymentId,
		'D'	
			+ right('000000'+cast(a.Employer_Number as varchar),6)
			+ '_'
			+ convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+ right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+ right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2) 
			+ right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3) 
			+ '*'
			+ right('000000'+cast(isnull(ac.SPLIT_ID,'') as varchar),6) DepositId,
		isnull ( a.EMPLOYEE_SUSPENSE_PREMIUM,0 ) + isnull ( a.EMPLOYER_SUSPENSE_PREMIUM,0 ) SuspenseAmt,
		NULL SuspenseCreateDtTm, --coalesce ( a.PAYMENT_EFFECTIVE_DATE,Payment_Date,'1900-01-01')  SuspenseCreateDtTm , ----should be replaced with min a.RowStartDtTm SuspenseCreateDtTm
		isnull ( dbo.udf_AddBusinessDayToDate(cast(coalesce( f.PaymentReceiveDtTm,
														f1.PaymentReceiveDtTm,
														f2.PaymentReceiveDtTm--, 8/27
														--a.PAYMENT_EFFECTIVE_DATE
														) as date),tx.TargetNo),NULL) ResolutionDueDtTm,
		--dbo.udf_BusinessDayCnt(
		--								cast(coalesce
		--									(	f.PaymentReceiveDtTm,
		--										f1.PaymentReceiveDtTm,
		--										f2.PaymentReceiveDtTm,
		--										a.PAYMENT_EFFECTIVE_DATE
		--									) as date)
		--								,Payment_Date
		--							)
		NULL CreatePymtReceiveWorkDayCnt, --not correct -- workday count needs a function
				case 
					when tr.TrustmarkInd = 1 then 'Trustmark'
					when tr.TrustmarkInd = 0 then 'Not Trustmark'
					else 'Unknown'
				end TrustmarkOrNotNm,
		'CBS' SourceSystemNm,
		0 RowAuditKey,
		0 RowDeleteInd
FROM	VBSDMODS.dbo.CBS_EMPSUSPTRACK a 
		left join VBSDMODS.dbo.CBS_SUSPENSE_TRACKING b 
			on	a.Employer_Number=b.Employer_Number
				and a.PAYMENT_EFFECTIVE_DATE=b.PAYMENT_EFFECTIVE_DATE
				and b.RowCurrentInd = 1
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(b.Employer_Number as varchar),6)
					+'_'+convert(varchar(8),b.Bill_Due_Date,112) = dbb.BillId
		left join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
		left join VBSDMODS.dbo.CBS_Account_Credits ac
					on	a.Employer_Number=ac.Employer_Number
						and a.PAYMENT_EFFECTIVE_DATE=ac.Deposit_Date
						and ac.RowCurrentInd = 1
		left join DimPDDeposit dd
			on 
				'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
				+'_'
				+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
				+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3) 
				+'*'
				+right('000000'+cast(isnull(ac.SPLIT_ID,'') as varchar),6) = dd.DepositId --1/4/16
		left join (
					select 
						ac1.COMBINED_ER_NUMBER,
						ac1.Combined_DEPOSIT_DATE, 
						Deposit_Date, 
						Employer_Number,
						split_id,
						row_number() over (
											partition by ac1.COMBINED_ER_NUMBER,ac1.Combined_DEPOSIT_DATE 
											order by Deposit_Date 
										   ) RN
					from	VBSDMODS.dbo.CBS_Account_Credits ac1
					where	ac1.RowCurrentInd = 1
							and COMBINED_ER_NUMBER>0 
							and ac1.CREDIT_RECORD_TYPE <> 'CM'
							and  isnull( ACCOUNT_STATUS,'') not in ('PENDINGEBILL','EBILLACH','EBILLCHECK','EBILLACHCLIENT','EBILLWIRE') 
				) cd
				on	a.Employer_Number=cd.COMBINED_ER_NUMBER
					and cast(a.PAYMENT_EFFECTIVE_DATE as datetime)=cast(cd.Combined_DEPOSIT_DATE as datetime)
					and cd.RN = 1
		left join VBSAnalytics.dbo.DimPDPayment f1
			on f1.PaymentId='P'+right('000000'+cast(cd.Employer_Number as varchar),6)+'_'+convert(varchar(8),cd.Deposit_Date,112)
					+'_'
					+right('0'+cast(datepart(hh,cd.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(minute,cd.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(second,cd.Deposit_Date) as varchar),2)
					+right('000'+cast(datepart(millisecond,cd.Deposit_Date) as varchar),3)
		left join VBSDMODS.dbo.CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE ARC
			on	isnull(ac.SPLIT_ID,cd.SPLIT_ID) = arc.id
			and ARC.RowCurrentInd = 1
---------------Payment			
		left join VBSAnalytics.dbo.DimPDPayment f2
			on f2.PaymentId='P'+right('000000'+cast(arc.Employer_Number as varchar),6)+'_'+convert(varchar(8),arc.Deposit_Date,112)
					+'_'
					+right('0'+cast(datepart(hh,arc.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(minute,arc.Deposit_Date) as varchar),2)
					+right('0'+cast(datepart(second,arc.Deposit_Date) as varchar),2)
					+right('000'+cast(datepart(millisecond,arc.Deposit_Date) as varchar),3)
---------------Trustmark					
		left join(	Select distinct cp.Employer_Number,TrustmarkInd
			From	VBSDMODS.dbo.CBS_Employee_Audit_Table  CP
					inner join VBSDMReference.dbo.CarrierXref CAR
				on CAR.CarrierId = CP.Carrier_Number
				and cp.RowCurrentInd = 1
			where TrustmarkInd=1) tr
				on a.Employer_Number=tr.Employer_Number
		,VBSDMReference.dbo.TargetXref tx
where 
	a.RowCurrentInd = 1 AND
	isnull( ACCOUNT_STATUS,'') 
	not in (select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
	and TargetNm = 'Suspense From Receive Resolution Duration'
	and getdate() between tx.EffectiveDtTm and tx.ExpireDtTm
--and a.Employer_Number=5930
end
GO
PRINT N'Altering [dbo].[InitialFactPDDepositCBSApplyPolicy]...';


GO

ALTER procedure [dbo].[InitialFactPDDepositCBSApplyPolicy] as
BEGIN
truncate  table [VBSAnalytics].[dbo].[FactPDDepositCBSApplyPolicy]
INSERT INTO [VBSAnalytics].[dbo].[FactPDDepositCBSApplyPolicy]
           (DepositPDApplyPolicyDateKey
           ,[ClientKey]
           ,[PDBillKey]
           ,[PDDepositKey]
           ,[MainBillProcessorKey]
           ,[BrokerKey]
           ,[CarrierKey]
           ,DepositPDApplyPolicyDtTm
           ,EnrollmentCompanyKey
           ,SalesPersonKey
           ,FirstPDApplyPolicyDateInd
           ,PDApplyPolicyAmt
           ,PDApplyPolicyAmtTypeNm
           ,PDApplyPolicyAmtTypeDesc
           ,PDApplyPolicyBillDueWorkDayCnt
           ,PDApplyPolicyBillDueOnTimeTypeNm
           ,SameReceiveApplyAmtInd
           ,[NoManipulationInd]
           ,[WasSplitInd]
           ,WasCombineInd--
           ,[ReversalPoolInd]
           ,[OverAndShortInd]
           ,[ForgivenInd]
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
           , PayeeNm
		   , ProcessTransactionTypeNm
		   , ProcessRecordTypeNm 
		   , PendingPaymentProcessInd 
		   , CheckId 
           )
Select 
		isnull(dd.DateKey,0) DepositPDApplyPolicyDateKey
		, isnull(ClientKey,0) ClientKey
		, isnull(dbb.PDBillKey,0) PDBillKey ---
		, isnull(b.PDDepositKey,0) PDDepositKey
		, isnull (dbp.BillProcessorKey,0) [MainBillProcessorKey]
		, isnull(db.BrokerKey,0) BrokerKey
		, isnull(car.CarrierKey,0) CarrierKey --
		, [withdrawal_date] DepositPDApplyPolicyDtTm
		, isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
		, isnull(SalesPersonKey,0) SalesPersonKey 
		, case when [FirstProcessDate]  = cast( dt.[WITHDRAWAL_DATE] as date) then 1 else 0 end FirstPDApplyPolicyDateInd --
		, isnull(dt.[CHECK_AMOUNT],0) PDApplyPolicyAmt
		, isnull(x.AmtTypeNm,'Unknown') PDApplyPolicyAmtTypeNm
		, isnull(x.AmtTypeDesc,'Unknown') PDApplyPolicyAmtTypeDesc
        , case 
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then NULL
			when [withdrawal_date] is not NULL and BillDueDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast([withdrawal_date] as date),cast(BillDueDtTm as date)),0) 
			else NULL
			end PDApplyPolicyBillDueWorkDayCnt --remove isnull
        , case 
			when [withdrawal_date] is  NULL or BillDueDtTm is  NULL  
			then 'Unknown'  
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then 'Unknown' 
			when [withdrawal_date] is not NULL and BillDueDtTm is not NULL       
			and cast([withdrawal_date] as date)<=cast(BillDueDtTm as date) 
			then 'On Time' 
			else 'Late' 
		end PDApplyPolicyBillDueOnTimeTypeNm
       , case when isnull(dt.[CHECK_AMOUNT],0)=isnull(a.[CHECK_AMOUNT],0) then 1 else 0 end SameReceiveApplyAmtInd
       , case 
			when a.REVERSAL_POOL=0 
				and [over_and_short]=0 
				and Forgiven_Prem_Amt=0 
				AND isnull(a.SPLIT_ID,0)=0
				AND isnull(a.[COMBINED_ER_NUMBER],0)=0
			then 1 
			else 0 
		end [NoManipulationInd]
       , case when isnull(a.SPLIT_ID,0)<>0 then 1 else 0 end [WasSplitInd]
       , case when isnull(a.[COMBINED_ER_NUMBER],0) =0 then 0 else 1 end WasCombineInd
       , case when a.REVERSAL_POOL<>0 then 1 else 0 end [ReversalPoolInd]
       , case when [over_and_short]<>0 then 1 else 0 end [OverAndShortInd]
       , case when Forgiven_Prem_Amt<>0 then 1 else 0 end [ForgivenInd]
       , 'CBS' [SourceSystemNm]
       , 0 RowAuditKey
       , 0 RowDeleteInd
           , dbo.udf_CamelCase(rtrim(ltrim(Payee))) PayeeNm
		   , 'Process' ProcessTransactionTypeNm
		   , dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
		   , 
		   case 
			when a.[CREDIT_RECORD_TYPE]='PX' then 1
			when a.[ACCOUNT_STATUS] in (select IgnorePaymentAccountStatus from VBSDMReference..IgnorePaymentAccountStatusXref)
			then 1 
			else 0
		   end 		   PendingPaymentProcessInd 
		   , case when dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER)))='' then NULL else  dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER))) end CheckId 
From	VBSDMODS..[CBS_Account_credits] a
		inner join VBSDMODS..[CBS_Account_debits] dt --only what was processed
			on a.[Employer_Number]= dt.[Employer_Number] 
			and a.Deposit_Date = dt.Deposit_Date 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.[Employer_Number] 
			and IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
			and d.RowCurrentInd = 1
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on dt.[CHECK_AMOUNT] between MinAmt and MaxAmt --processed amount type
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
	left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
	left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		inner join VBSAnalytics..DimPDDeposit b --7/21/2015
			on 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = DepositId --12/16
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.[Employer_Number] as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = dbb.BillId
--------------Carrier
		left join DimCarrier car
			on dt.Carrier_Number=car.Carrierid
------------  Min Process Date
		inner join (
					select 
						[Employer_Number] 
						, Deposit_Date
						, min(cast([withdrawal_date] as date)) [FirstProcessDate] 
					from VBSDMODS..[CBS_Account_debits] dt --only what was processed
					where dt.RowCurrentInd = 1
					group by [Employer_Number], Deposit_Date
					) mpd
					on	a.[Employer_Number]= mpd.[Employer_Number] 
						and a.Deposit_Date = mpd.Deposit_Date 
----recort type = accounting status
		left join VBSDMODS..[CBS_ACCOUNTING_RECORD_STATUS_CODES] ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1
				----------------------date
				left join DimDate dd
				on cast(dt.[withdrawal_date] as date) = dd.DateDt
Where a.RowCurrentInd =1 
	and dt.RowCurrentInd = 1
	and a.Deposit_Date between '2013-01-01' and getdate()
--	and a.[CHECK_AMOUNT]<>0
	and dt.CARRIER_NUMBER <>0
	and dt.[CHECK_AMOUNT] <>0
end
GO
PRINT N'Altering [dbo].[InitialFactPDDepositComplete]...';


GO

ALTER procedure [dbo].[InitialFactPDDepositComplete]
AS
BEGIN

truncate table FactPDDepositComplete
---Find Trustmark vs. Not Trustmark data--------------------
SELECT 
		EMPLOYER_NUMBER EMPLOYER_NUMBER,
		PAYMENT_EFFECTIVE_DATE DEPOSIT_DATE, 
		sum ( case when TrustmarkOrNotNm= 'Trustmark' then EMPLOYEE_PAID_PREMIUM+EMPLOYER_PAID_PREMIUM else 0 end )  ApplyTrustmarkAmt,
		sum ( case when TrustmarkOrNotNm= 'Not Trustmark' then  EMPLOYEE_PAID_PREMIUM+EMPLOYER_PAID_PREMIUM else 0 end )  ApplyToNotTrustmarkAmt,
		count ( distinct (case when TrustmarkOrNotNm= 'Trustmark' then  POLICY_NO else NULL end ) )  TrustmarkApplyPolicyCnt,
		count ( distinct case when TrustmarkOrNotNm= 'Not Trustmark' then  POLICY_NO else NULL end )  NotTrustmarkApplyPolicyCnt,
		count ( distinct case when TrustmarkOrNotNm= 'Unknown' then  POLICY_NO else NULL end )  UnknownApplyPolicyCnt,
		count ( distinct  POLICY_NO )  TotalApplyPolicyCnt
INTO	#ApplyDetails
FROM	VBSDMODS.dbo.CBS_ARCHIVED_NIGHT_BATCH_TABLE
		inner join DimCarrier car
			on Carrier_Number=car.Carrierid
WHERE 
		PAYMENT_EFFECTIVE_DATE between '2013-01-01'  and getdate ()
		and STATUS_CODE not in ('VO','ND','BL') --voided statuses
		and RowCurrentInd =1 
GROUP BY 
		EMPLOYER_NUMBER,
		PAYMENT_EFFECTIVE_DATE
ORDER BY 
		EMPLOYER_NUMBER,
		PAYMENT_EFFECTIVE_DATE
---------------------------Index--------------------
create clustered index CX on #ApplyDetails ( EMPLOYER_NUMBER, DEPOSIT_DATE )
---------------Apply duration--------------------

SELECT 
		EMPLOYER_NUMBER,
		DEPOSIT_DATE,
		min ( withdrawal_date ) FirstApplyCompleteDate,
		max ( withdrawal_date ) LastApplyCompleteDate,
		dbo.udf_BusinessDayCnt( min ( withdrawal_date ) , max ( withdrawal_date )  ) ApplyDurationWorkDayCnt
INTO	#ApplyTotal
FROM	VBSDMODS..CBS_Account_debits
WHERE	DEPOSIT_DATE between '2013-01-01'  and getdate ()
		and RowCurrentInd = 1 AND CARRIER_NUMBER<>0 --9/11
GROUP BY 
		EMPLOYER_NUMBER,
		DEPOSIT_DATE
ORDER BY
		EMPLOYER_NUMBER,
		DEPOSIT_DATE
-----------------------Index--------------------
create clustered index CX on #ApplyTotal ( EMPLOYER_NUMBER, DEPOSIT_DATE )
-----------------------------------------------_
SELECT  'D'
			+ right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)
			+ '_'
			+ convert(varchar(8),a.DEPOSIT_DATE,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+ right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+ '*'
			+ right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId, --12/16
			min(CDCEffectiveDtTm) BalancedDtTm 
INTO	#Balanced
FROM	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a 
		left join DimPDDeposit dd
		on 
		 'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = dd.depositId --12/16
--------------------check if the record is already in the fact table and active-----------
		left join FactPDDepositComplete d
		on	dd.PDDepositKey = d.PDDepositKey
			and d.RowDeleteInd = 0	---not deleted
WHERE	d.PDDepositKey is null  --- not in the fact already
		and ACCOUNT_STATUS = 'BALANCED'
		and CDCEffectiveDtTm is not null

GROUP BY 
			'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6)

------------------------Index
create clustered index CX on #Balanced(DepositId)			
--SELECT * FROM #Balanced

--SELECT * FROM FactPDDepositComplete
---------------------------
SELECT 'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId, max(isnull(CDCEffectiveDtTm,'1900-01-01')) LastNotBalancedDtTm 
INTO	#NotBalanced
FROM	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
WHERE	ACCOUNT_STATUS <> 'BALANCED' 
		and RowCurrentInd=0 
		and CDCExpireDtTm is not NULL

GROUP BY 
		'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
		+'_'
		+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
		+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
		+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
		+'*'
		+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6)


create clustered index CX on #NotBalanced(DepositId)		

INSERT INTO [dbo].[FactPDDepositComplete]
           ([CompleteDateKey]
           ,[PDPaymentKey]
           ,[PDDepositKey]
           ,[ClientKey]
           ,[PDBillKey]
           ,[MainBillProcessorKey]
           ,[BrokerKey]
           ,[EnrollmentCompanyKey]
           ,[SalesPersonKey]
           ,[NoManipulationInd]
           ,[CompleteReceiveWorkDayCnt]
           ,[CompleteOnTimeTypeNm]
           ,[CompleteFirstApplyWorkDayCnt]
           ,[CompleteLastApplyWorkDayCnt]
           ,[ApplyDurationWorkDayCnt]
           ,[TrustmarkOrNotNm]
           ,[ApplyTrustmarkAmt]
           ,[ApplyNonTrustmarkAmt]
           ,[ApplyUnknownAmt]
           ,[TotalCompleteAmt]
           ,[TrustmarkApplyPolicyCnt]
           ,[NonTrustmarkApplyPolicyCnt]
           ,[UnknownApplyPolicyCnt]
           ,[TotalApplyPolicyCnt]
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd])
 
-------------------------
SELECT 
		convert(varchar(8),BalancedDtTm,112) CompleteDateKey
       , isnull(F.PDPaymentKey,0) PDPaymentKey
       , isnull(b.PDDepositKey,0) PDDepositKey
       , isnull(ClientKey,0) ClientKey
       , isnull(dbb.PDBillKey,0) PDBillKey
       , isnull (dbp.BillProcessorKey,0) MainBillProcessorKey
	   , isnull(db.BrokerKey,0) BrokerKey
       , isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
       , isnull(SalesPersonKey,0) SalesPersonKey 
       , case 
		when a.REVERSAL_POOL=0 
			and over_and_short=0 
			and Forgiven_Prem_Amt=0 
			AND isnull(a.SPLIT_ID,0)=0
			AND isnull(a.COMBINED_ER_NUMBER,0)=0
		then 1 
		else 0 
		end NoManipulationInd
       , 
	    case 
		   when PaymentReceiveDtTm is Null or BalancedDtTm is NULL --9/11
		   then NULL
		   else dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,BalancedDtTm) 
		end CompleteReceiveWorkDayCnt
       , case 
		   when PaymentReceiveDtTm is Null or BalancedDtTm is NULL
		   then 'Unknown'
		   when dbo.udf_BusinessDayCnt(PaymentReceiveDtTm,BalancedDtTm) <=TargetNo  --9/11
		   then 'On time' 
		   else 'Late'  
       end CompleteOnTimeTypeNm
       ,  dbo.udf_BusinessDayCnt ( FirstApplyCompleteDate,BalancedDtTm ) CompleteFirstApplyWorkDayCnt --9/11
       ,  dbo.udf_BusinessDayCnt ( LastApplyCompleteDate,BalancedDtTm )  CompleteLastApplyWorkDayCnt --9/11
       ,	ApplyDurationWorkDayCnt
       , case 
			when ApplyTrustmarkAmt <> 0 and ApplyToNotTrustmarkAmt <> 0 then 'Both'
			when ApplyTrustmarkAmt <> 0  then 'Trustmark' 
			when ApplyToNotTrustmarkAmt <> 0  then 'Not Trustmark'
			else 'Unknown' 
			end TrustmarkOrNotNm
       , isnull(ApplyTrustmarkAmt,0) ApplyTrustmarkAmt
       , isnull(ApplyToNotTrustmarkAmt,0) ApplyToNotTrustmarkAmt
       , CHECK_AMOUNT + a.REVERSAL_POOL + OVER_AND_SHORT + FORGIVEN_PREM_AMT - isnull(ApplyTrustmarkAmt,0) - isnull(ApplyToNotTrustmarkAmt,0) ApplyUnknownAmt
       , CHECK_AMOUNT + a.REVERSAL_POOL + OVER_AND_SHORT + FORGIVEN_PREM_AMT TotalCompleteAmt
       , isnull(TrustmarkApplyPolicyCnt,0) TrustmarkApplyPolicyCnt
       , isnull(NotTrustmarkApplyPolicyCnt,0) NotTrustmarkApplyPolicyCnt
       , isnull(UnknownApplyPolicyCnt,0) UnknownApplyPolicyCnt
       , isnull(TotalApplyPolicyCnt,0) TotalApplyPolicyCnt
       , 'CBS' SourceSystemNm
	   ,0
	   ,0
 FROM	#balanced bl 
		inner join #notbalanced n
			on bl.depositId = n.depositId
		inner join VBSDMODS..CBS_Account_credits a
			on bl.DepositId = 
			'D'
			+ right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)
			+ '_'
			+ convert(varchar(8),a.DEPOSIT_DATE,112)
			+ '_'
			+ right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+ right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+ right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+ '*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6)
		inner join #ApplyDetails ad --9/11 at least one debit record should exist, changed FROM left join to inner join
			on a.EMPLOYER_NUMBER= ad.EMPLOYER_NUMBER 
				and a.DEPOSIT_DATE = ad.DEPOSIT_DATE
		left join #ApplyTotal dt --VBSDMODS..CBS_Account_debits dt --only what was processed
			on a.EMPLOYER_NUMBER = dt.EMPLOYER_NUMBER 
				and a.DEPOSIT_DATE = dt.DEPOSIT_DATE 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.EMPLOYER_NUMBER 
				and IdTypeNm = 'EMPLOYER_NUMBER' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on CHECK_AMOUNT+REVERSAL_POOL+OVER_AND_SHORT+FORGIVEN_PREM_AMT between MinAmt and MaxAmt --processed amount type
----------find broker
		left join
				(
					SELECT  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId ORDER BY ClientId desc,ClientGroupId desc) RN
					FROM	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					WHERE	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.EMPLOYER_NUMBER = cc.EMPLOYER_NUMBER
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = b.DepositId
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = dbb.BillId
--------------payment
		left join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(a.EMPLOYER_NUMBER as varchar),6)+'_'+convert(varchar(8),a.DEPOSIT_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.DEPOSIT_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.DEPOSIT_DATE) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.DEPOSIT_DATE) as varchar),3)
			,VBSDMReference..TargetXref
			
WHERE a.RowCurrentInd =1 
	and a.DEPOSIT_DATE between '2013-01-01' and getdate()
	and n.LastNotBalancedDtTm<bl.BalancedDtTm
	and TargetNm = 'Deposit Completion Duration'
	and convert(varchar(8),BalancedDtTm,112) between EffectiveDtTm and ExpireDtTm


drop table #ApplyDetails
drop table #ApplyTotal
drop table #Balanced
drop table #NotBalanced
END
GO
PRINT N'Altering [dbo].[InitialFactPDPaymentCombine]...';


GO

ALTER procedure [dbo].[InitialFactPDPaymentCombine]
as
BEGIN
delete from [VBSAnalytics].[dbo].[FactPDPaymentCombine]

INSERT INTO [VBSAnalytics].[dbo].[FactPDPaymentCombine]
           ([CombineDateKey]
           ,[FromClientKey]
           ,[ToClientKey]
           ,[FromPDPaymentKey]
           ,[ToPDDepositKey]
           ,[BillProcessorKey]
           ,[FromBrokerKey]
           ,[LastPaymentPDProblemKey]
           ,[CombineDtTm]
           ,FromEnrollmentCompanyKey
           ,FromSalesPersonKey
           ,[CombinePaymentAmt]
           ,[CombineAmtTypeNm]
           ,[CombineAmtTypeDesc]
           ,[CombineReceiveWorkDayCnt]
           ,[CombineLastProblemWorkDayCnt]
           ,[PaymentProblemCnt]
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd])

Select 
		convert(varchar(8),[Combined_Deposit_Date],112) CombineDateKey,
		isnull(d.ClientKey,0)FromClientKey,
		isnull(d1.ClientKey,0) ToClientKey,
		isnull(f.PDPaymentKey,0) FromPDPaymentKey,
		isnull(PdDepositKey,0) ToPDDepositKey,
		isnull(BillProcessorKey,0) BillProcessorKey,
		isnull(db.BrokerKey,0) FromBrokerKey,
		isnull(pk.PaymentPdProblemKey,0)LastPaymentPDProblemKey,
		a.[Combined_Deposit_Date] CombineDtTm,
		isnull(EnrollmentCompanyKey,0) FromEnrollmentCompanyKey , 
        isnull(SalesPersonKey,0) FromSalesPersonKey ,
		a.[CHECK_amount] CombinePaymentAmt,
		x.AmtTypeNm CombineAmtTypeNm,
		x.AmtTypeDesc CombineAmtTypeDesc,
		dbo.udf_BusinessDayCnt(f.PaymentReceiveDtTm,a.[Combined_Deposit_Date]) CombineReceiveWorkDayCnt,
		dbo.udf_BusinessDayCnt(pr.LastProblemDtTm,a.[Combined_Deposit_Date]) CombineLastProblemWorkDayCnt,
		isnull(pr.[ProblemCnt],0)PaymentProblemCnt,
		'CBS' SourceSystemNm,
		0 RowAuditKey,
		0 RowDeleteInd
From	VBSDMODS..[CBS_Account_credits] a   
------------------combined from--------------------------
		left join VBSDMReference.dbo.ClientXref c
			on 
				 c.SourceId = cast(a.[Employer_Number]  as varchar)
				 and c.IdTypeNm = 'Employer_Number' 
				 and c.RowCurrentInd = 1
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
---------------combined to-------------------------------

		left join VBSDMReference.dbo.ClientXref c1
			on 
				 c1.SourceId = cast(a.[COMBINED_ER_NUMBER]  as varchar)
				 and c1.IdTypeNm = 'Employer_Number' and c1.RowCurrentInd = 1
		left join VBSAnalytics.dbo.DimClient d1
			on c1.ClientIntegrationId = d1.ClientIntegrationId
			 and d1.RowCurrentInd = 1
----------------TO DEPOSIT-------------------------------
		inner join VBSAnalytics..DimPDDeposit
			on 'D'+right('000000'+cast(a.[COMBINED_ER_NUMBER] as varchar),6)+'_'+convert(varchar(8),a.[Combined_Deposit_Date],112)
			+'_'
			+right('0'+cast(datepart(hh,a.[Combined_Deposit_Date]) as varchar),2)
			+right('0'+cast(datepart(minute,a.[Combined_Deposit_Date]) as varchar),2)
			+right('0'+cast(datepart(second,a.[Combined_Deposit_Date]) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.[Combined_Deposit_Date]) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull([SPLIT_ID],'') as varchar),6)=DepositId --12/16
---------------FROM Payment---------------------------------
		inner join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast([Employer_Number] as varchar),6)+'_'+convert(varchar(8),Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,Deposit_Date) as varchar),2)
				+right('000'+cast(datepart(millisecond,Deposit_Date) as varchar),3)
-----------------Bill Processor-----------------------------
		left join dbo.DimBillProcessor dbp
			on BillProcessorUserId = a.[User_id]
			and dbp.RowCurrentInd = 1
-----------------------Amt Range ---------------------------
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on isnull(a.[Check_amount],0)  between MinAmt and MaxAmt	
---------------------Broker --------------------------------
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1
--------------------------------Last ProblemKey------------------
		left join 	
			(
			select PDPaymentKey, PaymentPdProblemKey, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc,PaymentPdProblemKey desc)  rn 
			from dbo.FactPDPaymentProblem 
			) pk
					on f.PDPaymentKey = pk.PDPaymentKey 	
						and pk.rn=1		
-------------Problem count--------------------------------
		left join 	
			(
			select PDPaymentKey, max(ProblemDtTm) LastProblemDtTm, COUNT(1)  ProblemCnt 
			from dbo.FactPDPaymentProblem 
			group by PDPaymentKey
			) pr
			on f.PDPaymentKey = pr.PDPaymentKey 
Where	a.RowCurrentInd = 1 
		and [CREDIT_RECORD_TYPE] not in( 'CM','PX') --not pending  and original payments that were combined
		and a.Deposit_Date between '2013-01-01' and getdate()
		and isnull(a.[COMBINED_ER_NUMBER],0)<>0
		and a.[ACCOUNT_STATUS] not in  --not pending
				(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
END

--select * from [VBSAnalytics].[dbo].[FactPDPaymentCombine]
GO
PRINT N'Altering [dbo].[InitialFactPDPaymentSplit]...';


GO

ALTER procedure [dbo].[InitialFactPDPaymentSplit] as
BEGIN
delete from FactPDPaymentSplit

INSERT INTO [VBSAnalytics].[dbo].[FactPDPaymentSplit]
           ([SplitDateKey]
           ,[FromClientKey]
           ,[ToClientKey]
           ,[FromPDPaymentKey]
           ,[ToPDDepositKey]
           ,[BillProcessorKey]
           ,[FromBrokerKey]
           ,[LastPaymentPDProblemKey]
           ,[SplitDtTm]
           ,FromEnrollmentCompanyKey
           ,FromSalesPersonKey
           ,[SplitPaymentAmt]
           ,[SplitAmtTypeNm]
           ,SplitAmtTypeDesc        
           ,SplitSeqNo
           ,[SplitReceiveWorkDayCnt]
           ,[SplitLastPymtProblemWorkDayCnt]
           ,[PaymentProblemCnt]
           ,[RowAuditKey]
           ,[RowDeleteInd]
           ,[SourceSystemNm])
Select 
		isnull(convert(varchar(8),isnull([SPLIT_DATE],z.Deposit_Date),112),'0') SplitDateKey,
		isnull(orig.ClientKey,0) OriginalClientKey,
		isnull(dep.ClientKey,0) DepositClientKey,
		isnull(p.PDPaymentKey,0) PDPaymentKey,
		isnull(PDDepositKey,0)  PDDepositKey,
		isnull(dbp.BillProcessorKey,0) BillProcessorKey,
		isnull([BrokerKey],0) [BrokerKey],
		isnull(pk.PaymentPdProblemKey,0) [LastPDProblemKey],
		isnull([SPLIT_DATE],z.Deposit_Date) [SplitDtTm] ,---should be z.RowStartDtTm
		isnull(EnrollmentCompanyKey,0) FromEnrollmentCompanyKey , 
        isnull(SalesPersonKey,0) FromSalesPersonKey , 
		isnull(a.[Check_amount],0) [SplitPaymentAmt],
		x.[AmtTypeNm] [SplitAmtTypeNm],
		x.AmtTypeDesc SplitAmtTypeDesc,
		case when Split3.SplitNo3 is not null then 3
		when Split2.SplitNo2 is not null then 2
		else 1
		end SplitSeqNo, 
		dbo.udf_BusinessDayCnt(p.PaymentReceiveDtTm,isnull([SPLIT_DATE],z.Deposit_Date)) [SplitReceiveWorkDayCnt],
		dbo.udf_BusinessDayCnt(pr.LastProblemDtTm,isnull([SPLIT_DATE],z.Deposit_Date)) SplitLastPymtProblemWorkDayCnt,
		isnull(pr.[ProblemCnt],0) ProblemCnt,
		--case when a.[Employer_Number] =907 or z.[Employer_Number] =907 then 1 else 0 end [AbnormalInd],
		0 [RowAuditKey],
		0 [RowDeleteInd],
		'CBS' [SourceSystemNm]

From 
	VBSDMODS..[CBS_Account_credits] a ---deposit split record
	inner join VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] z --split record
		on [SPLIT_ID]=[ID]
			and z.RowCurrentInd = 1
	left join (
					select distinct b.[Previous_Split_Id]  SplitNo3
					from	VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] a 
							inner join
								VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] b
									on a.[Previous_Split_Id] = b.id
					where	b.[Previous_Split_Id] >0
							and a.RowCurrentInd =1 
							and b.RowCurrentInd = 1
				) Split3
		on z.id = Split3.SplitNo3
	left join(		
					select distinct [Previous_Split_Id] SplitNo2
					from	VBSDMODS.[dbo].[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE]
					where  [Previous_Split_Id]>0 
							and RowCurrentInd = 1
				) Split2
		on z.id = Split2.SplitNo2
	left join VBSDMReference.dbo.ClientXref c --Xref to find Integration ID
		on  SourceId = cast(z.[Employer_Number]  as varchar) 
			and c.IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
	left join VBSAnalytics.dbo.DimClient orig
		on	c.ClientIntegrationId = orig.ClientIntegrationId 
			and orig.RowCurrentInd = 1
	left join VBSDMReference.dbo.ClientXref depx --Xref to find Integration ID
		on  depx.SourceId = cast(a.[Employer_Number]  as varchar) 
			and depx.IdTypeNm = 'Employer_Number' 
			and depx.RowCurrentInd = 1 
	left join VBSAnalytics.dbo.DimClient dep
		on	depx.ClientIntegrationId = dep.ClientIntegrationId 
			and dep.RowCurrentInd = 1
	left join VBSAnalytics..DimPDDeposit b
		on b.changeId=a.[split_id]
			and 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.[SPLIT_ID],'') as varchar),6) = DepositId --12/16
	inner join DimPDPayment p -- only if a payment can be found
		on 'P'+right('000000'+cast(z.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),z.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,z.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,z.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,z.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,z.Deposit_Date) as varchar),3) = PaymentId
-------------Processor
	left join DimBillProcessor dbp
		on Z.[USER_name]=BillProcessorUserId
		and dbp.RowCurrentInd = 1
-------------Problem count
	left join 	
		(
		select PDPaymentKey, max(ProblemDtTm) LastProblemDtTm, COUNT(1)  ProblemCnt 
		from dbo.FactPDPaymentProblem 
		group by PDPaymentKey
		) pr
		on p.PDPaymentKey = pr.PDPaymentKey 
--------------------------------Last ProblemKey
	left join 	
		(
		select PDPaymentKey, PaymentPdProblemKey, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc,PaymentPdProblemKey desc)  rn 
		from dbo.FactPDPaymentProblem 
		) pk
		on p.PDPaymentKey = pk.PDPaymentKey 	
			and pk.rn=1		
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1
---------------------------AMT
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on isnull(a.[Check_amount],0)  between MinAmt and MaxAmt				
Where a.RowCurrentInd = 1 
	and z.[SPLIT_CHECK] = 1
	and z.Deposit_Date between  '2013-01-01'  and getdate()
	and a.[CREDIT_RECORD_TYPE] <> 'PX'
	and [ACCOUNT_STATUS] not in 
	(select IgnorePaymentAccountStatus from VBSDMReference.dbo.IgnorePaymentAccountStatusXref)
order by 1

END
--select * from FactPDPaymentSplit
GO
PRINT N'Altering [dbo].[InitialFactPDPymtCBSApplyPolicy]...';


GO

ALTER procedure [dbo].[InitialFactPDPymtCBSApplyPolicy] as
BEGIN
truncate  table [VBSAnalytics].[dbo].[FactPDPymtCBSApplyPolicy]
INSERT INTO [VBSAnalytics].[dbo].[FactPDPymtCBSApplyPolicy]
           (PymtPDApplyPolicyDateKey
           ,[ClientKey]
           ,[PDBillKey]
           ,[PDPaymentKey]
           ,[PDDepositKey]
           ,[MainBillProcessorKey]
           ,[BrokerKey]
           ,[CarrierKey]
           ,[LastPdProblemKey]
           ,PymtPDApplyPolicyDtTm
           ,EnrollmentCompanyKey
           ,SalesPersonKey
           ,FirstPDApplyPolicyDateInd
           ,TotalPDApplyPolicyAmt
           ,PDApplyPolicyAmtTypeNm
           ,PDApplyPolicyAmtTypeDesc
           ,PDApplyPolicyReceiveWorkDayCnt
           ,PDApplyPolicyBillDueWorkDayCnt
           ,[ReceiveOnTimeTypeNm]
           ,PDApplyPolicyOnTimeTypeNm
           ,PDApplyPolicyBillDueOnTimeTypeNm
           ,SameReceiveApplyAmtInd
           ,[NoManipulationInd]
           ,[WasSplitInd]
           ,[ReversalPoolInd]
           ,[PaymentProblemCnt]
           ,[OverAndShortInd]
           ,[ForgivenInd]
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
           , PayeeNm
		   , ProcessTransactionTypeNm
		   , ProcessRecordTypeNm 
		   , PendingPaymentProcessInd 
		   , CheckId 
           )
Select 
		isnull(convert(varchar(8),dt.[withdrawal_date],112),0) PymtPDApplyPolicyDateKey
		, isnull(ClientKey,0) ClientKey
		, isnull(dbb.PDBillKey,0) PDBillKey ---
		, isnull(f.PDPaymentKey,0) PDPaymentKey
		, isnull(b.PDDepositKey,0) PDDepositKey
		, isnull (dbp.BillProcessorKey,0) [BillProcessorKey]
		, isnull(db.BrokerKey,0) BrokerKey
		, isnull(car.CarrierKey,0) CarrierKey --
		, isnull(lpc.PaymentPDProblemKey,0) LastPdProblemKey--
		, [withdrawal_date] PymtPDApplyPolicyDtTm
		, isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
		, isnull(SalesPersonKey,0) SalesPersonKey 
		, case when [FirstProcessDate]  = cast( dt.[WITHDRAWAL_DATE] as date) then 1 else 0 end FirstPDApplyPolicyDateInd --
		, isnull(dt.[CHECK_AMOUNT],0) TotalPDApplyPolicyAmt
		, isnull(x.AmtTypeNm,'Unknown') PDApplyPolicyAmtTypeNm
		, isnull(x.AmtTypeDesc,'Unknown') PDApplyPolicyAmtTypeDesc
		, CASE
			when dt.CDCEffectiveDtTm  is not null and PaymentReceiveDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast(dt.CDCEffectiveDtTm as date)) ,0)
			when PaymentReceiveDtTm  is not null and [withdrawal_date] is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast([withdrawal_date] as date)) ,0)
			else NULL
		end PDApplyPolicyReceiveWorkDayCnt ---remove isnull
        , case 
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then NULL
			when BillDueDtTm is not null and dt.CDCEffectiveDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(dt.CDCEffectiveDtTm as date),cast(BillDueDtTm as date)),0) 
			when BillDueDtTm is not null and [withdrawal_date] is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast([withdrawal_date] as date),cast(BillDueDtTm as date)),0) 
			else NULL
			end PDApplyPolicyBillDueWorkDayCnt --remove isnull
        , case 
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then 'Unknown' 
			when BillDueDtTm is NULL or PaymentReceiveDtTm is NULL
			then 'Unknown' --8/7
			when cast(PaymentReceiveDtTm as date) <=cast(BillDueDtTm as date) 
			then 'On Time' 
			else 'Late' 
		 end [ReceiveOnTimeTypeNm]
        , case 
			when PaymentProcessDueDtTm is NULL 
			then 'Unknown'--8/7
			when [withdrawal_date] is null and dt.CDCEffectiveDtTm is null
			then 'Unknown'
			when PaymentProcessDueDtTm is not null 
				and dt.CDCEffectiveDtTm is not NULL
				and cast(dt.CDCEffectiveDtTm as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time'
			when [withdrawal_date] is not null 
				and PaymentProcessDueDtTm is not null
				and cast([withdrawal_date] as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time' 
			else 'Late' 
		 end PDApplyPolicyOnTimeTypeNm
        , case 
			when BillDueDtTm is NULL 
			then 'Unknown'--8/7
			when dt.CDCEffectiveDtTm is  NULL and [withdrawal_date] is NULL 
			then 'Unknown'
			when datepart(hh,BillDueDtTm)
				+datepart(minute,BillDueDtTm)
				+datepart(second,BillDueDtTm)
				+datepart(millisecond,BillDueDtTm)>0 
			then 'Unknown'        
			when cast([withdrawal_date] as date)<=cast(BillDueDtTm as date) 
			then 'On Time' 			
			when cast(dt.CDCEffectiveDtTm as date)<=cast(BillDueDtTm as date)
			then 'On Time' 

			else 'Late' 
		end PDApplyPolicyBillDueOnTimeTypeNm
       , case when isnull(dt.[CHECK_AMOUNT],0)=isnull(a.[CHECK_AMOUNT],0) then 1 else 0 end SameReceiveApplyAmtInd
       , case 
			when a.REVERSAL_POOL=0 
				and [over_and_short]=0 
				and Forgiven_Prem_Amt=0 
			then 1 
			else 0 
		end [NoManipulationInd]
       , 0 [WasSplitInd]
       , case when a.REVERSAL_POOL<>0 then 1 else 0 end [ReversalPoolInd]
       , isnull(pc.PaymentProblemCnt,0) [PaymentProblemCnt]
       , case when [over_and_short]<>0 then 1 else 0 end [OverAndShortInd]
       , case when Forgiven_Prem_Amt<>0 then 1 else 0 end [ForgivenInd]
       , 'CBS' [SourceSystemNm]
       , -1 RowAuditKey
       , 0 RowDeleteInd
           , dbo.udf_CamelCase(rtrim(ltrim(Payee))) PayeeNm
		   , 'Process' ProcessTransactionTypeNm
		   , dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
		   , 
		   case 
			when a.[CREDIT_RECORD_TYPE]='PX' then 1
			when a.[ACCOUNT_STATUS] in (select IgnorePaymentAccountStatus from VBSDMReference..IgnorePaymentAccountStatusXref)
			then 1 
			else 0
		   end 		   PendingPaymentProcessInd 
		   , dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER))) CheckId 
From	VBSDMODS..[CBS_Account_credits] a
		inner join VBSDMODS..[CBS_Account_debits] dt --only what was processed
			on a.[Employer_Number]= dt.[Employer_Number] 
			and a.Deposit_Date = dt.Deposit_Date 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.[Employer_Number] 
			and IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
			and d.RowCurrentInd = 1
--------------payment
		inner join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3)
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on dt.[CHECK_AMOUNT] between MinAmt and MaxAmt --processed amount type
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							--and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and dsp.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.EnrollmentCompanyId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1		
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		inner join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = DepositId --12/16
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.[Employer_Number] as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_date,112) = dbb.BillId
--------------Carrier
		left join DimCarrier car
			on dt.Carrier_Number=car.Carrierid
------------  Min Process Date
		inner join (
					select 
						[Employer_Number] 
						, Deposit_Date
						, min(cast([withdrawal_date] as date)) [FirstProcessDate] 
					from VBSDMODS..[CBS_Account_debits] dt --only what was processed
					where dt.RowCurrentInd = 1
					group by [Employer_Number], Deposit_Date
					) mpd
					on	a.[Employer_Number]= mpd.[Employer_Number] 
						and a.Deposit_Date = mpd.Deposit_Date 
-------------Number of Problems
		left join 
			(
				select 
					PDPaymentKey
					, count(1) PaymentProblemCnt 
				from dbo.FactPDPaymentProblem
				GROUP BY PDPaymentKey
			) pc
				on f.PDPaymentKey  = pc.PDPaymentKey
		left join 
			(
				select 
					PDPaymentKey
					, PaymentPDProblemKey
					, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc) rn  
				from dbo.FactPDPaymentProblem
			) lpc
				on	f.PDPaymentKey  = lpc.PDPaymentKey
					and lpc.rn = 1
----recort type = accounting status
		left join VBSDMODS..[CBS_ACCOUNTING_RECORD_STATUS_CODES] ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1
Where a.RowCurrentInd =1 
	and dt.RowCurrentInd = 1
	and a.Deposit_Date between '2013-01-01' and getdate()
	and a.[CREDIT_RECORD_TYPE] not in( 'CM')
	and isnull(a.[COMBINED_ER_NUMBER],0) =0
	and isnull(a.SPLIT_ID,0)=0
	and a.[CHECK_AMOUNT]<>0
	and dt.CARRIER_NUMBER <>0
----------------------------------
INSERT INTO [VBSAnalytics].[dbo].[FactPDPymtCBSApplyPolicy]
           (PymtPDApplyPolicyDateKey
           ,[ClientKey]
           ,[PDBillKey]
           ,[PDPaymentKey]
           ,[PDDepositKey]
           ,[MainBillProcessorKey]
           ,[BrokerKey]
           ,[CarrierKey]
           ,[LastPdProblemKey]
           ,PymtPDApplyPolicyDtTm
           ,EnrollmentCompanyKey
           ,SalesPersonKey
           ,FirstPDApplyPolicyDateInd
           ,TotalPDApplyPolicyAmt
           ,PDApplyPolicyAmtTypeNm
           ,PDApplyPolicyAmtTypeDesc
           ,PDApplyPolicyReceiveWorkDayCnt
           ,PDApplyPolicyBillDueWorkDayCnt
           ,[ReceiveOnTimeTypeNm]
           ,PDApplyPolicyOnTimeTypeNm
           ,PDApplyPolicyBillDueOnTimeTypeNm
           ,SameReceiveApplyAmtInd
           ,[NoManipulationInd]
           ,[WasSplitInd]
           ,[ReversalPoolInd]
           ,[PaymentProblemCnt]
           ,[OverAndShortInd]
           ,[ForgivenInd]
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd]
           , PayeeNm
		   , ProcessTransactionTypeNm
		   , ProcessRecordTypeNm 
		   , PendingPaymentProcessInd 
		   , CheckId 
           )
Select 
		isnull(convert(varchar(8),dt.[withdrawal_date],112),0) [SimplePaymentProcessDateKey]
		, isnull(ClientKey,0) ClientKey
		, isnull(dbb.PDBillKey,0) PDBillKey ---
		, isnull(f.PDPaymentKey,0) PDPaymentKey
		, isnull(b.PDDepositKey,0) PDDepositKey
		, isnull (dbp.BillProcessorKey,0) [BillProcessorKey]
		, isnull(db.BrokerKey,0) BrokerKey
		, isnull(car.CarrierKey,0) CarrierKey --
		, isnull(lpc.PaymentPDProblemKey,0) LastPdProblemKey--
		, [withdrawal_date] [SimplePaymentProcessDtTm]
		, isnull(EnrollmentCompanyKey,0) EnrollmentCompanyKey 
		, isnull(SalesPersonKey,0) SalesPersonKey 
		, case when [FirstProcessDate]  = cast( dt.[withdrawal_date] as date) then 1 else 0 end FirstProcessDateInd --
		, isnull(dt.[CHECK_AMOUNT],0) ProcessAmt
		, isnull(x.AmtTypeNm,'Unknown')
		, isnull(x.AmtTypeDesc,'Unknown')
		, CASE
			when dt.CDCEffectiveDtTm  is not null and PaymentReceiveDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast(dt.CDCEffectiveDtTm as date)) ,0)
			when PaymentReceiveDtTm  is not null and [withdrawal_date] is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(PaymentReceiveDtTm as date),cast([withdrawal_date] as date)) ,0)
			else NULL
		end PDApplyPolicyReceiveWorkDayCnt ---remove isnull
        , case 
			when datepart(hh,dbb.BillDueDtTm)
				+datepart(minute,dbb.BillDueDtTm)
				+datepart(second,dbb.BillDueDtTm)
				+datepart(millisecond,dbb.BillDueDtTm)>0 
			then NULL
			when dbb.BillDueDtTm is not null and dt.CDCEffectiveDtTm is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast(dt.CDCEffectiveDtTm as date),cast(dbb.BillDueDtTm as date)),0) 
			when dbb.BillDueDtTm is not null and [withdrawal_date] is not NULL
			then isnull(dbo.udf_BusinessDayCnt(cast([withdrawal_date] as date),cast(dbb.BillDueDtTm as date)),0) 
			else NULL
			end PDApplyPolicyBillDueWorkDayCnt --remove isnull
        , case 
			when datepart(hh,dbb.BillDueDtTm)
				+datepart(minute,dbb.BillDueDtTm)
				+datepart(second,dbb.BillDueDtTm)
				+datepart(millisecond,dbb.BillDueDtTm)>0 
			then 'Unknown' 
			when dbb.BillDueDtTm is NULL or PaymentReceiveDtTm is NULL
			then 'Unknown' --8/7
			when cast(PaymentReceiveDtTm as date) <=cast(dbb.BillDueDtTm as date) 
			then 'On Time' 
			else 'Late' 
		 end [ReceiveOnTimeTypeNm]
        , case 
			when PaymentProcessDueDtTm is NULL 
			then 'Unknown'--8/7
			when [withdrawal_date] is null and dt.CDCEffectiveDtTm is null
			then 'Unknown'
			when PaymentProcessDueDtTm is not null 
				and dt.CDCEffectiveDtTm is not NULL
				and cast(dt.CDCEffectiveDtTm as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time'
			when [withdrawal_date] is not null 
				and PaymentProcessDueDtTm is not null
				and cast([withdrawal_date] as date)<=cast(PaymentProcessDueDtTm as date)
			then 'On Time' 
			else 'Late' 
		 end PDApplyPolicyOnTimeTypeNm
        , case 
			when dbb.BillDueDtTm is NULL 
			then 'Unknown'--8/7
			when dt.CDCEffectiveDtTm is  NULL and [withdrawal_date] is NULL 
			then 'Unknown'
			when datepart(hh,dbb.BillDueDtTm)
				+datepart(minute,dbb.BillDueDtTm)
				+datepart(second,dbb.BillDueDtTm)
				+datepart(millisecond,dbb.BillDueDtTm)>0 
			then 'Unknown'        
			when cast(dt.CDCEffectiveDtTm as date)<=cast(dbb.BillDueDtTm as date)
			then 'On Time' 
			when cast([withdrawal_date] as date)<=cast(dbb.BillDueDtTm as date) 
			then 'On Time' 
			else 'Late' 
		end PDApplyPolicyBillDueOnTimeTypeNm	   ,  
		case when isnull(dt.[CHECK_AMOUNT],0)=isnull(a.[CHECK_AMOUNT],0) then 1 else 0 end[SamePaymentProcessAmtInd]
       , 0 [NoManipulationInd]
       , 1 [WasSplitInd]
       , case when a.REVERSAL_POOL<>0 then 1 else 0 end [ReversalPoolInd]
       , isnull(pc.PaymentProblemCnt,0) [PaymentProblemCnt]
       , case when [over_and_short]<>0 then 1 else 0 end [OverAndShortInd]
       , case when Forgiven_Prem_Amt<>0 then 1 else 0 end [ForgivenInd]
       , 'CBS' [SourceSystemNm]
       , -2 RowAuditKey
       , 0 RowDeleteInd
           , dbo.udf_CamelCase(rtrim(ltrim(Payee))) PayeeNm
		   , 'Process' ProcessTransactionTypeNm
		   , dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
		   , 
		   case 
			when a.[CREDIT_RECORD_TYPE]='PX' then 1
			when a.[ACCOUNT_STATUS] in (select IgnorePaymentAccountStatus from VBSDMReference..IgnorePaymentAccountStatusXref)
			then 1 
			else 0
		   end 		   PendingPaymentProcessInd 
		   , dbo.udf_CamelCase(ltrim(rtrim(dt.CASHIERS_CHECK_NUMBER))) CheckId 
		  -- , case when dt.CARRIER_NUMBER <>0 then 1 else 0 END ProcessToCarrierInd

From	VBSDMODS..[CBS_Account_credits] a
		inner join VBSDMODS.dbo.[CBS_ACCOUNT_CREDITS_CHANGES_ARCHIVE] ch
			on a.[Split_id]=ch.id
		inner join VBSDMODS..[CBS_Account_debits] dt --only what was processed
			on a.[Employer_Number]= dt.[Employer_Number] 
			and a.Deposit_Date = dt.Deposit_Date 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.[Employer_Number] 
			and IdTypeNm = 'Employer_Number' 
			and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
			and d.RowCurrentInd = 1
--------------payment
		inner join VBSAnalytics.dbo.DimPDPayment f
			on f.PaymentId='P'+right('000000'+cast(ch.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),ch.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,ch.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,ch.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,ch.Deposit_Date) as varchar),2)
			+right('000'+cast(datepart(millisecond,ch.Deposit_Date) as varchar),3)
-------------amt xref
		left join 	VBSDMReference.dbo.AmtTypeXref x
			on dt.[CHECK_AMOUNT] between MinAmt and MaxAmt --processed amount type
----------find broker
		left join
				(
					select  
						ClientIntegrationId, 
						BrokerId,
						RSDId,
						EnrollmentCompanyId,
						row_number() over (partition by ClientIntegrationId order by ClientId desc,ClientGroupId desc) RN
					from	VBSDMReference.dbo.ClientXref c  
							inner join VBSDMReference.dbo.ClientProducerXref p
								on c.SourceId = p.ClientId
					where	SourceSystemNm = 'PIOP' 
							and IdTypeNm = 'CASE_ID' 
							and RowCurrentInd = 1 
							and BrokerId is not NULL
				) m
					on c.ClientIntegrationId=m.ClientIntegrationId and m.RN=1
		left join DimBroker db
					on m.BrokerId = db.BrokerId
					and db.RowCurrentInd = 1
		left join DimSalesPerson dsp
					on m.RSDId = dsp.SalesPersonId
					and db.RowCurrentInd = 1
		left join DimEnrollmentCompany decn
					on m.BrokerId = decn.EnrollmentCompanyId
					and decn.RowCurrentInd = 1					
--------------------------Processor--------------------------------------
		left join VBSDMOds.dbo.CBS_COMPANY cc
			on a.[Employer_Number] = cc.[EMPLOYER_NUMBER]
				and cc.RowCurrentInd = 1
		
		left join DimBillProcessor dbp
			on dbp.BillProcessorUserId = cc.BILLING_PROCESSOR
			and dbp.RowCurrentInd = 1
----------------- Deposit
		inner join VBSAnalytics..DimPDDeposit b
			on 'D'+right('000000'+cast(a.[Employer_Number] as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) = DepositId
--------------BILL
		left join  DimPDBill dbb
			on 'B'+right('000000'+cast(a.[Employer_Number] as varchar),6)
				+'_'+convert(varchar(8),a.Bill_Due_Date,112) = dbb.BillId
--------------Carrier
		left join DimCarrier car
			on dt.Carrier_Number=car.Carrierid
------------  Min Process Date
		inner join (
					select 
						[Employer_Number] 
						, Deposit_Date
						, min(cast([withdrawal_date] as date)) [FirstProcessDate] 
					from VBSDMODS..[CBS_Account_debits] dt --only what was processed
					group by [Employer_Number], Deposit_Date
				) mpd
				on a.[Employer_Number]= mpd.[Employer_Number] 
					and a.Deposit_Date = mpd.Deposit_Date 
-------------Number of Problems
		left join 
			(
				select 
					PDPaymentKey
					, count(1) PaymentProblemCnt 
				from	dbo.FactPDPaymentProblem
				GROUP BY PDPaymentKey
			) pc
				on f.PDPaymentKey  = pc.PDPaymentKey
		left join 
			(
				select 
					PDPaymentKey
					,PaymentPDProblemKey
					, row_number() over (partition by PDPaymentKey order by ProblemDtTm desc) rn  
				from	dbo.FactPDPaymentProblem
			) lpc
			on	f.PDPaymentKey = lpc.PDPaymentKey
				and lpc.rn = 1
--recort type = accounting status
		left join VBSDMODS..[CBS_ACCOUNTING_RECORD_STATUS_CODES] ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1 
Where a.RowCurrentInd =1 
	and dt.RowCurrentInd = 1
	and ch.RowCurrentInd = 1
	and ch.Deposit_Date between '2013-01-01' and getdate()
	and dt.[WITHDRAWAL_DATE] between '1900-01-01' and getdate()
	and a.[CREDIT_RECORD_TYPE] not in( 'CM')
	and isnull(a.[combined_er_number],0) =0
	and isnull(a.[split_id],0)>0
	and a.[CHECK_AMOUNT]<>0
	and dt.CARRIER_NUMBER<>0
end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveCombinePymt]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveCombinePymt]
/********************************************************/
/*					Combined payments					*/
/*	Creates 2 records, delete payment and insert deposit*/
/********************************************************/
as
begin

--removed payments
select 
		b.CombineDateKey MoveDateKey
		,a.CBSTransactionDateKey CBSTransactionDateKey
		,CombineDtTm MoveDtTm
		,pp.PaymentReceiveDtTm CBSTransactionDtTm
		,'Other' DebitCreditTypeNm
		,'Combined' MoveTypeNm
		,'Combined With DepositId ' + d.DepositId MoveDetail
		,a.EffectiveEmployerId
		,a.EffectiveClientKey
		,a.EffectivePDPaymentKey
		,a.EffectivePDDepositKey
		,0 ToCarrierKey
		,b.BillProcessorKey BillProcessorKey
		,'CBS_ACCOUNT_CREDITS' FromTableNm
		, -1 * a.MoveAmt MoveAmt
		, a.MoveAmt AbsoluteMoveAmt
		,'' CheckId
		,isnull(Subledger1,'') Subledger1
		,isnull(Subledger2,'') Subledger2
		,MoveTransactionTypeNm
		,'Combined' ProcessRecordTypeNm
		,'CBS'SourceSystemNm
from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentCombine b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	d.EMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' =  MoveTypeNm
		and not exists
		(select 1 from FactPDMoneyMove m 
		where 'Combined With DepositId ' + d.DepositId =m.MoveDetail
		and a.EffectivePDDepositKey=m.EffectivePDDepositKey
		and 'Combined' = MoveTypeNm
		)
union all
select 
	b.CombineDateKey MoveDateKey
	,convert(varchar(8),DepositCreateDtTm,112) CBSTransactionDateKey
	,CombineDtTm MoveDtTm
	,DepositCreateDtTm CBSTransactionDtTm ---should be changed to deposit date from deposit
	,'Other' DebitCreditTypeNm
	,'Combined' MoveTypeNm
	,'Combined From PaymentId ' +pp.PaymentId MoveDetail
	,d.EmployerId EffectiveEmployerId
	,isnull(d1.ClientKey,0) EffectiveClientKey --12/8
	,0 EffectivePDPaymentKey
	,b.ToPDDepositKey EffectivePDDepositKey
	,0 ToCarrierKey
	,b.BillProcessorKey BillProcessorKey
	,'CBS_ACCOUNT_CREDITS' FromTableNm
	, a.MoveAmt MoveAmt
	, a.MoveAmt AbsoluteMoveAmt
	,'' CheckId
	,isnull(cast(d.EmployerId as varchar)+replace(substring(convert(varchar(8),DepositCreateDtTm,3),4,9),'/',''),'') Subledger1
	,'' Subledger2
	,MoveTransactionTypeNm
	,'Combined'ProcessRecordTypeNm
	,'CBS'SourceSystemNm
from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentCombine b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	a.EffectiveEMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
		----------------------------- client -12/08
		left join VBSDMReference.dbo.ClientXref c1
			on	c1.SourceId = d.EmployerId
				and c1.IdTypeNm = 'Employer_Number' 
				and c1.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d1
			on	c1.ClientIntegrationId = d1.ClientIntegrationId
				and d1.RowCurrentInd = 1
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' =  a.MoveTypeNm
		and not exists
		(
			select 1 
			from FactPDMoneyMove m 
			where	'Combined From PaymentId ' + PaymentId =m.MoveDetail
					and b.ToPDDepositKey=m.EffectivePDDepositKey
					and 'Combined' = MoveTypeNm
		)

end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveCredit]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveCredit]
/********************************************************/
/*					CREDIT								*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
-----------------REVERSAL POOL FROM ACCOUNT CREDITS TABLE
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER EmployerId,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			a.REVERSAL_POOL MoneyMoveAmt,
			'Reversal Pool' MoveTypeNm	,							
			--'From Reversal Pool' MoneyMoveTypeNm,
			a.USER_ID,
			isnull(CHECK_NUMBER,'') CheckId, 
			'From Employer''s Reversal Pool to Employer '+cast(a.employer_number as varchar) MoveDetail,
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			a.REVERSAL_POOL, --12/9/2015
			a.OVER_AND_SHORT --12/9/2015
	from	VBSDMODS..CBS_Account_credits a
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 --and a.REVERSAL_POOL<>0 
			and a.DEPOSIT_DATE between '2013-01-01' and getdate()
union all
-----------------OVER AND SHORT FROM ACCOUNT CREDITS TABLE
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			a.OVER_AND_SHORT MoneyMoveAmt,
			'Over And Short' MoneyTypeNm	,							
			--'From Over And Short' MoneyMoveTypeNm,
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId, --11/30
			'From Over And Short to Employer '+cast(a.employer_number as varchar) MoveDetail,
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			a.REVERSAL_POOL, --12/9/2015
			a.OVER_AND_SHORT --12/9/2015
	from	VBSDMODS..CBS_Account_credits a
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 --and a.OVER_AND_SHORT<>0 
			and a.DEPOSIT_DATE between '2013-01-01' and getdate()
 )

--------------------------------DATE WHEN AMOUNT APPEARED IN THE SYSTEM
, FirstDate as
(
	----------------------REV POOL
	select 
			'D'
				+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'
				+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			REVERSAL_POOL MoneyMoveAmt,
			min(CDCEffectiveDtTm) MoneyMoveDtTm,
			'Reversal Pool' MoveTypeNm
	from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
	where	REVERSAL_POOL <> 0
			and 
			a.DEPOSIT_DATE between '2013-01-01' and getdate()
	group by 
			REVERSAL_POOL,
			'D'
				+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'
				+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6) 
	---------------------OVER AND SHORT
	union all
	select 

			'D'
				+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'
				+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,

			OVER_AND_SHORT MoneyMoveAmt,
			min(CDCEffectiveDtTm) FirstDate,
			'Over And Short' MoneyMoveNm
	from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
	where	OVER_AND_SHORT <> 0
			and a.DEPOSIT_DATE between '2013-01-01' and getdate()
	group by 
			OVER_AND_SHORT,
			'D'
				+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'
				+convert(varchar(8),a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6) 
)

----------------------PREVIOUSLY ENTERED AMOUNT IN FACT TABLE
, ApplyAmt as 
(
	select 
			EffectivePDDepositKey,
			MoveTypeNm,
			sum(MoveAmt) TotalMoneyMoveAmt ,
			max(MoveDtTm) MaxMoveDtTm
	from	dbo.FactPDMoneyMove 	
	where 	
			'CBS_ACCOUNT_CREDITS' = FromTableNm 
			and MoveTypeNm in ('Over And Short','Reversal Pool')
	group by EffectivePDDepositKey, MoveTypeNm
)
----final 
Select 
case when ApplyAmt.TotalMoneyMoveAmt is NULL then 'New'  else 'Update' end InsertUpdateTypeNm,
	case 
		when ApplyAmt.TotalMoneyMoveAmt is NULL 
		then convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.Deposit_DATE),112) 
		else NULL 
	end MoveDateKey
	, convert(varchar(8),a.Deposit_DATE,112) CBSTransactionDateKey
	, case 
		when ApplyAmt.TotalMoneyMoveAmt is NULL 
		then isnull(fd.MoneyMoveDtTm,a.Deposit_DATE) 
		else NULL 
	end MoveDtTm
	, a.Deposit_DATE CBSTransactionDtTm
	, 'Other' DebitCreditTypeNm
	, a.MoveTypeNm
	, MoveDetail
	, a.EmployerId EffectiveEmployerId
	, isnull(ClientKey,0) EffectiveClientKey
	, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
	, isnull(b.PDDepositKey,0) EffectivePDDepositKey
	, 0 ToCarrierKey
	, isnull (dbp.BillProcessorKey,0) BillProcessorKey
	,'CBS_ACCOUNT_CREDITS' FromTableNm
	, isnull(a.MoneyMoveAmt,0)-isnull(ApplyAmt.TotalMoneyMoveAmt,0) MoveAmt
	, isnull(a.MoneyMoveAmt,0)-isnull(ApplyAmt.TotalMoneyMoveAmt,0) AbsoluteMoveAmt
	, isnull(CheckId,'') CheckId --12/10
	, isnull(cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.DEPOSIT_DATE,3),4,9),'/',''),'') Subledger1  --12/10
	, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2  --12/10
	, case when ApplyAmt.TotalMoneyMoveAmt is NULL then 'Initial' else 'Adjustment' end MoveTransactionTypeNm
	, dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
	, 'CBS'SourceSystemNm
	--, a.MoneyMoveAmt  OriginalAmt
	, a.EmployerId EMPLOYER_NUMBER
	, a.DEPOSIT_DATE
	, ApplyAmt.MaxMoveDtTm MAXMOVEDTTM
	, a.REVERSAL_POOL --12/9/2015
	, a.OVER_AND_SHORT --12/9/2015
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
			--and a.WITHDRAWAL_DATE = fd.WITHDRAWAL_DATE
				and a.MoneyMoveAmt = fd.MoneyMoveAmt
				and a.MoveTypeNm = fd.MoveTypeNm
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on a.DepositId = b.DepositId
----recort type = accounting status
		left join VBSDMODS..CBS_ACCOUNTING_RECORD_STATUS_CODES ars
			on Credit_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1
-------------calculate adjustment --7/22
		left join ApplyAmt				
				on isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
		left join DimPDPayment dp
				on a.PaymentId = dp.PaymentId
where	isnull(ApplyAmt.TotalMoneyMoveAmt,0)<>isnull(a.MoneyMoveAmt,0)
end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveCreditDelete]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveCreditDelete]
/********************************************************/
/*					CREDIT								*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER EmployerId,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			a.REVERSAL_POOL MoneyMoveAmt,
			'Reversal Pool' MoveTypeNm	,							
			--'From Reversal Pool' MoneyMoveTypeNm,
			a.USER_ID,
			isnull(CHECK_NUMBER,'') CheckId, 
			'From Employer''s Reversal Pool to Employer '+cast(a.employer_number as varchar) MoveDetail,
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId
			, a.CDCExpireDtTm MoveDtTm
	from	VBSDMODS..CBS_Account_credits a
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
				and b.RowCurrentInd = 1
	where	a.RowDeleteInd = 1
			and a.REVERSAL_POOL<>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate()
			or b.CDCExpireDtTm >='2015-11-01')
			and not
			exists 
			(select 1 from VBSDMODS..CBS_Account_credits c
			where  a.DEPOSIT_DATE=c.DEPOSIT_DATE
			and a.EMPLOYER_NUMBER=c.EMPLOYER_NUMBER
			and RowCurrentInd = 1)

			
union all

	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			a.OVER_AND_SHORT MoneyMoveAmt,
			'Over And Short' MoneyTypeNm	,							
			--'From Over And Short' MoneyMoveTypeNm,
			a.USER_ID,
			isnull(CHECK_NUMBER,'') CheckId, 
			'From Over And Short to Employer '+cast(a.employer_number as varchar) MoveDetail,
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId
			, a.CDCExpireDtTm MoveDtTm
	from	VBSDMODS..CBS_Account_credits a
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowDeleteInd = 1
			and a.OVER_AND_SHORT<>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate()
			or b.CDCExpireDtTm >='2015-11-01')
			and not
			exists 
			(select 1 from VBSDMODS..CBS_Account_credits c
			where  a.DEPOSIT_DATE=c.DEPOSIT_DATE
			and a.EMPLOYER_NUMBER=c.EMPLOYER_NUMBER
			and RowCurrentInd = 1)
 )

, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,MoveTypeNm,
			sum(MoveAmt) TotalMoneyMoveAmt , sum(AbsoluteMoveAmt) TotalAbsoluteMoveAmt
	from	dbo.FactPDMoneyMove 	
	where 	'CBS_ACCOUNT_CREDITS' = FromTableNm and MoveTypeNm in('Over And Short','Reversal Pool')
	group by EffectivePDDepositKey, MoveTypeNm
)
----final insert 


Select 

		convert(varchar(8),a.MoveDtTm,112) MoveDateKey
		, convert(varchar(8),a.Deposit_DATE,112) CBSTransactionDateKey
		, a.MoveDtTm MoveDtTm
		, a.Deposit_DATE CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, a.MoveTypeNm
		, 'Deleted DepositId ' +a.DepositId+' '+ MoveDetail
		, a.EmployerId EffectiveEmployerId
		, isnull(ClientKey,0) EffectiveClientKey
		, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
		, isnull(b.PDDepositKey,0) EffectivePDDepositKey
		, 0 ToCarrierKey
		, isnull (dbp.BillProcessorKey,0) BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS' FromTableNm
		, (-1)*ApplyAmt.TotalMoneyMoveAmt MoveAmt
		, ApplyAmt.TotalAbsoluteMoveAmt AbsoluteMoveAmt
		, isnull(CheckId,'') CheckId
		, isnull(cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.DEPOSIT_DATE,3),4,9),'/',''),'') Subledger1
		, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
		,'Adjustment' MoveTransactionTypeNm
		, dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
		, 'CBS'SourceSystemNm
From	ChangedDeposits a
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on	a.DepositId = b.DepositId
----recort type = accounting status
		left join VBSDMODS..CBS_ACCOUNTING_RECORD_STATUS_CODES ars
			on	Credit_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1

-------------calculate adjustment --7/22
		inner join ApplyAmt				
			on isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
		left join DimPDPayment dp
			on a.PaymentId = dp.PaymentId
where TotalMoneyMoveAmt<>0 --12/10
end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveCreditPymt]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveCreditPymt]
/********************************************************/
/*					CREDIT								*/
/********************************************************/
as


select 
	convert(varchar(8), p.PaymentAssociateDtTm,112) MoveDateKey
	, convert(varchar(8), p.PaymentReceiveDtTm,112) [CBSTransactionDateKey]
	, p.PaymentAssociateDtTm MoveDtTm
	, p.PaymentReceiveDtTm CBSTransactionDtTm
	, 'Credit' DebitCreditTypeNm
	, 'Payment Entered' [MoveTypeNm]
	, 'Payment From EmployerId '+cast(p.EmployerId as varchar) [MoveDetail]
	, p.EmployerId [EffectiveEmployerId]
	, f.ClientKey [EffectiveClientKey]
	, p.PDPaymentKey [EffectivePDPaymentKey]
	, PDDepositKey [EffectivePDDepositKey]
	, 0 [ToCarrierKey]
	, MainBillProcessorKey BillProcessorKey
	, 'CBS_ACCOUNT_CREDITS' FromTableNm
	, f.[PaymentAmt] [MoveAmt]
	, f.[PaymentAmt] AbsoluteMoveAmt
	, isnull(TransactionId,'') [CheckId]
	, cast(p.EMPLOYERID as varchar)+replace(substring(convert(varchar(8),p.PaymentReceiveDtTm,3),4,9),'/','') [Subledger1]
	, p.BatchId+' '+p.ItemId [Subledger2]
	, 'Initial'  MoveTransactionTypeNm
	, 'Payment Entered' ProcessRecordTypeNm
	, 'CBS' [SourceSystemNm]
from	[dbo].[FactPDBankPaymentReceive] f  
		inner join DimPDPayment p
			on f.PDPaymentKey = p.PDPaymentKey
		left join DimPDDeposit dd
			on 'D'+substring(PaymentId,2,25)+'*000000' = dd.DepositId
		left join FactPDMoneyMove mm
			on	f.PDPaymentKey = mm.EffectivePDPaymentKey 
				and 'Payment Entered' = ProcessRecordTypeNm
where mm.EffectivePDPaymentKey is NULL
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveDebit]...';


GO

CREATE procedure [dbo].[DailyFactPDMoneyMoveDebit] as
BEGIN

/********************************************************/
/*					DEBIT								*/
/********************************************************/

; with ChangedDeposits as
(
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER,
			dt.WITHDRAWAL_DATE,
			isnull(dc.CarrierKey,0) CarrierKey,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6) DepositId,
			dt.CHECK_AMOUNT MoneyMoveAmt,
			dt.RowCurrentInd
			,case 
				when dt.Carrier_Number <>0 then 'Apply to Carrier'
				when dt.employee_SSN is not NULL					then 'Return'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%' and a.Employer_Number = 1833	 then 'Reversal Pool'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%'	 then 'Reversal Pool'
				when PAYEE = 'Rev Pool Xfer To Trustmark Over and Short account' then 'Over And Short'
				when PAYEE = 'Xfer To Client Reversal Pool'		then 'Reversal Pool'
				when PAYEE like 'Rev Pool Xfer%'				then 'Reversal Pool'
				when PAYEE like '%Reversal Pool%'				then 'Reversal Pool'
				when PAYEE like 'Over And Short Xfer%' and a.Employer_Number = 1833			then 'Over And Short'
				when PAYEE like 'Offset%'						then 'Offset'
				when PAYEE like 'NSF%'							then 'Return'
				when PAYEE like 'Pending Ebill Split To%'		then 'Ebill' 
				when patindex('%'+cast(a.employer_number as varchar)+'%',payee)>=1	then 'Return'
				when PAYEE like 'To Client For%'									then 'Return'
				when Full_name  = PAYEE												then 'Return'
				else 'Unknown' 
			end MoveTypeNm			
		,case 
				when dt.Carrier_Number <>0 then 'Debit'
				when dt.employee_SSN is not NULL then 'Debit'
				--2/12/2015
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%' and a.Employer_Number = 1833	 then 'Other'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%'	 then 'Other'
				when PAYEE = 'Rev Pool Xfer To Trustmark Over and Short account' then 'Other'
				when PAYEE = 'Xfer To Client Reversal Pool'		then 'Other'
				when PAYEE like 'Rev Pool Xfer%'				then 'Other'
				when PAYEE like '%Reversal Pool%'				then 'Other'
				when PAYEE like 'Over And Short Xfer%' and a.Employer_Number = 1833			then 'Other'
				when PAYEE like 'Offset%'						then 'Other'
				when PAYEE like 'Pending Ebill Split To%'		then 'Other' 
				---
				when patindex('%'+cast(a.employer_number as varchar)+'%',payee)>=1	then 'Debit'
				when PAYEE like 'To Client For%'									then 'Debit'
				when Full_name  = PAYEE												then 'Debit'
				when PAYEE like 'NSF%'												then 'Debit'
				else 'Other' 
			end DebitCreditTypeNm	,					
			dbo.udf_CamelCase(PAYEE)	MoveDetail,
			dt.USER_ID,
			isnull(CASHIERS_CHECK_NUMBER,'') CheckId, 
			isnull(dc.CarrierNm,dbo.udf_CamelCase(Payee)) PayeeNm,
			DEBIT_RECORD_TYPE,
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Carrier_Number
	from	VBSDMODS..CBS_Account_credits a
			inner join VBSDMODS..CBS_Account_debits dt --only what was processed
				on a.Employer_Number= dt.Employer_Number 
					and a.Deposit_Date = dt.Deposit_Date 
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	dt.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
			left join DimCarrier dc
				on dt.CARRIER_NUMBER  = dc.CarrierId
					and dt.CARRIER_NUMBER<>0
	where	dt.RowCurrentInd = 1 
			and a.RowCurrentInd = 1
			--and dt.Carrier_Number = 0
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or dt.WITHDRAWAL_DATE between '2015-11-01' and getdate())
 )

 ----first amount appearance date to populate Money Move Date
 , FirstDate as
 (
	 select 
			dt.CHECK_AMOUNT,
			WITHDRAWAL_DATE,
			'D'+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'
				+convert(varchar(8), a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
				Carrier_Number,
				min(dt.CDCEffectiveDtTm) MoveDtTm
	 from	VBSDMODS..CBS_Account_credits a
			inner join VBSDMODS..CBS_Account_debits dt --only what was processed
				on a.Employer_Number= dt.Employer_Number 
				and a.Deposit_Date = dt.Deposit_Date 
	where	(a.DEPOSIT_DATE between '2013-01-01' and getdate() or dt.WITHDRAWAL_DATE between'2015-11-01' and getdate())
	group by	dt.CHECK_AMOUNT,
				WITHDRAWAL_DATE,
				'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8), a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6) ,
				Carrier_Number
)

----Money moved that were recorded befor by natural key
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,FromTableNm,CBSTransactionDtTm,ToCarrierKey,
			sum(MoveAmt) TotalMoneyMoveAmt , sum(AbsoluteMoveAmt) TotalAbsoluteMoveAmt, max(MoveDtTm) MaxMoveDtTm
	from	dbo.FactPDMoneyMove 	
	group by EffectivePDDepositKey,FromTableNm,CBSTransactionDtTm, DebitCreditTypeNm,ToCarrierKey
)
----final insert 
Select 
	case when ApplyAmt.TotalMoneyMoveAmt is NULL then 'New'  else 'Update' end InsertUpdateTypeNm
	, case when ApplyAmt.TotalMoneyMoveAmt is NULL then isnull(dd1.DateKey,0) else NULL end MoveDateKey
	, isnull(dd2.DateKey,0) CBSTransactionDateKey
	, case when ApplyAmt.TotalMoneyMoveAmt is NULL then isnull(fd.MoveDtTm,a.WITHDRAWAL_DATE) else NULL end MoveDtTm
	, a.WITHDRAWAL_DATE CBSTransactionDtTm
	,  a.DebitCreditTypeNm
	, a.MoveTypeNm MoveTypeNm
	, case when isnull(b.PDDepositKey,0) = 0 then  a.MoveDetail+ ' From DepositId ' +a.DepositId else a.MoveDetail end MoveDetail
	, a.EMPLOYER_NUMBER EffectiveEmployerId
	, isnull(ClientKey,0) EffectiveClientKey
	, isnull(dp.PDPaymentKey,0) EffectivePDPaymentKey
	, isnull(b.PDDepositKey,0)  EffectivePDDepositKey
	, a.CarrierKey ToCarrierKey
	, isnull (dbp.BillProcessorKey,0) BillProcessorKey
	,'CBS_ACCOUNT_DEBITS' FromTableNm
	, case when ApplyAmt.TotalMoneyMoveAmt is NULL then (-1) * MoneyMoveAmt else isnull(a.MoneyMoveAmt*(-1),0)- isnull(ApplyAmt.TotalMoneyMoveAmt,0) End MoveAmt
	, case when ApplyAmt.TotalAbsoluteMoveAmt is NULL then  MoneyMoveAmt else isnull(MoneyMoveAmt,0)-isnull(TotalAbsoluteMoveAmt,0) End AbsoluteMoveAmt
	,isnull(CheckId,'') CheckId
	,isnull(cast(a.EMPLOYER_NUMBER as varchar)+replace(substring(convert(varchar(8),a.DEPOSIT_DATE,3),4,9),'/',''),'') Subledger1
	,isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
	,case when ApplyAmt.TotalMoneyMoveAmt is NULL then'Initial' else 'Adjustment' END MoveTransactionTypeNm
	,dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
	, 'CBS'SourceSystemNm
	, MoneyMoveAmt OriginalAmt
	, EMPLOYER_NUMBER
	, DEPOSIT_DATE
	, a.WITHDRAWAL_DATE
	, MaxMoveDtTm MAXMOVEDTTM
	, a.Carrier_Number CARRIER_NUMBER
From	ChangedDeposits a
		left join FirstDate fd
			on a.DepositId = fd.DepositId
				and a.WITHDRAWAL_DATE = fd.WITHDRAWAL_DATE
				and a.MoneyMoveAmt = fd.CHECK_AMOUNT
				and a.Carrier_Number = fd.Carrier_Number
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.Employer_Number 
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b --??
			on a.DepositId = b.DepositId
----recort type = accounting status
		left join VBSDMODS..CBS_ACCOUNTING_RECORD_STATUS_CODES ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1

-------------calculate adjustment --7/22
		left join ApplyAmt				
			on isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and 'CBS_ACCOUNT_DEBITS' = ApplyAmt.FromTableNm
				and a.withdrawal_date = ApplyAmt.CBSTransactionDtTm
				and a.CarrierKey = ApplyAmt.ToCarrierKey
		left join DimPDPayment dp
				on a.PaymentId = dp.PaymentId
		left join DimDate dd1
				on convert(varchar(8),isnull(fd.MoveDtTm,a.WITHDRAWAL_DATE),112)  =dd1.DateKey
		left join DimDate dd2
				on convert(varchar(8),a.WITHDRAWAL_DATE,112)  = dd2.DateKey
Where isnull(a.MoneyMoveAmt*(-1),0)<> isnull(ApplyAmt.TotalMoneyMoveAmt,0)

end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveDebitDelete]...';


GO

CREATE procedure [dbo].[DailyFactPDMoneyMoveDebitDelete] as
BEGIN

/********************************************************/
/*					DEBIT								*/
/********************************************************/

; with ChangedDeposits as
(
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER,
			dt.WITHDRAWAL_DATE,
			isnull(dc.CarrierKey,0) CarrierKey,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			dt.CHECK_AMOUNT MoneyMoveAmt,
			dt.RowCurrentInd
			,case 
				when dt.Carrier_Number <>0 then 'Apply to Carrier'
				when dt.employee_SSN is not NULL					then 'Return'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%' and a.Employer_Number = 1833	 then 'Reversal Pool'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%'	 then 'Reversal Pool'
				when PAYEE = 'Rev Pool Xfer To Trustmark Over and Short account' then 'Over And Short'
				when PAYEE = 'Xfer To Client Reversal Pool'		then 'Reversal Pool'
				when PAYEE like 'Rev Pool Xfer%'				then 'Reversal Pool'
				when PAYEE like '%Reversal Pool%'				then 'Reversal Pool'
				when PAYEE like 'Over And Short Xfer%' and a.Employer_Number = 1833			then 'Over And Short'
				when PAYEE like 'Offset%'						then 'Offset'
				when PAYEE like 'NSF%'							then 'Return'
				when PAYEE like 'Pending Ebill Split To%'		then 'Ebill' 
				when patindex('%'+cast(a.employer_number as varchar)+'%',payee)>=1	then 'Return'
				when PAYEE like 'To Client For%'									then 'Return'
				when Full_name  = PAYEE												then 'Return'
				else 'Unknown' 
			end MoveTypeNm			
		,case 
				when dt.Carrier_Number <>0 then 'Debit'
				when dt.employee_SSN is not NULL then 'Debit'
				when patindex('%'+cast(a.employer_number as varchar)+'%',payee)>=1	then 'Debit'
				when PAYEE like 'To Client For%'									then 'Debit'
				when Full_name  = PAYEE												then 'Debit'
				when PAYEE like 'NSF%'							then 'Debit'
				else 'Other' 
			end DebitCreditTypeNm	,					
			dbo.udf_CamelCase(PAYEE)	MoveDetail,
			dt.USER_ID,
			isnull(CASHIERS_CHECK_NUMBER,'') CheckId, 
			isnull(dc.CarrierNm,dbo.udf_CamelCase(Payee)) PayeeNm,
			DEBIT_RECORD_TYPE,
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId
			,Carrier_Number
			,dt.CDCExpireDtTm
	from	VBSDMODS..CBS_Account_credits a
			inner join VBSDMODS..CBS_Account_debits dt --only what was processed
				on a.Employer_Number= dt.Employer_Number 
					and a.Deposit_Date = dt.Deposit_Date 
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	dt.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
			left join DimCarrier dc
				on dt.CARRIER_NUMBER  = dc.CarrierId
					and dt.CARRIER_NUMBER<>0
	where	dt.RowDeleteInd = 1
			and a.RowCurrentInd = 1
			--and dt.Carrier_Number = 0
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or dt.WITHDRAWAL_DATE between '2015-11-01' and getdate())
			and 
			not exists 
			(select 1 from VBSDMODS..CBS_Account_debits dt1
			where  a.Employer_Number= dt1.Employer_Number 
					and a.Deposit_Date = dt1.Deposit_Date 
					and dt.WITHDRAWAL_DATE=dt1.WITHDRAWAL_DATE
					and dt.Carrier_Number=dt1.Carrier_Number
					and RowCurrentInd =1 )
 )


----Money moved that were recorded befor by natural key
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,FromTableNm,CBSTransactionDtTm,ToCarrierKey,
			sum(MoveAmt) TotalMoneyMoveAmt , sum(AbsoluteMoveAmt) TotalAbsoluteMoveAmt, max(MoveDtTm) MaxMoveDtTm
	from	dbo.FactPDMoneyMove 	
	group by EffectivePDDepositKey,FromTableNm,CBSTransactionDtTm, DebitCreditTypeNm,ToCarrierKey
)
Select 
--	'Delete' InsertUpdateTypeNm
	convert(varchar(8),a.CDCExpireDtTm,112) MoveDateKey
	, convert(varchar(8),a.WITHDRAWAL_DATE,112) CBSTransactionDateKey
	, CDCExpireDtTm  MoneyMoveDtTm
	, a.WITHDRAWAL_DATE CBSTransactionDtTm
	, a.DebitCreditTypeNm
	, a.MoveTypeNm MoveTypeNm
	, 'Deleted From Debit DepositId ' +a.DepositId MoveDetail
	, a.EMPLOYER_NUMBER EffectiveEmployerId
	, isnull(ClientKey,0) EffectiveClientKey
	, isnull(dp.PDPaymentKey,0) EffectivePDPaymentKey
	, isnull(b.PDDepositKey,0)  EffectivePDDepositKey
	, a.CarrierKey ToCarrierKey
	, isnull (dbp.BillProcessorKey,0) BillProcessorKey
	,'CBS_ACCOUNT_DEBITS' FromTableNm
	, -1*TotalMoneyMoveAmt MoveAmt
	, TotalAbsoluteMoveAmt AbsoluteMoveAmt
	,isnull(CheckId,'') CheckId
	,isnull(cast(a.EMPLOYER_NUMBER as varchar)+replace(substring(convert(varchar(8),a.DEPOSIT_DATE,3),4,9),'/',''),'') Subledger1
	,isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
	,'Adjustment' MoveTransactionTypeNm
	,dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
	, 'CBS'SourceSystemNm

From	ChangedDeposits a
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on SourceId = a.Employer_Number 
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b --??
			on a.DepositId = b.DepositId
----recort type = accounting status
		left join VBSDMODS..CBS_ACCOUNTING_RECORD_STATUS_CODES ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1

-------------calculate adjustment --7/22
		inner join ApplyAmt				
			on isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and 'CBS_ACCOUNT_DEBITS' = ApplyAmt.FromTableNm
				and a.withdrawal_date = ApplyAmt.CBSTransactionDtTm
				and a.CarrierKey = ApplyAmt.ToCarrierKey
		left join DimPDPayment dp
				on a.PaymentId = dp.PaymentId
where TotalMoneyMoveAmt<>0 --12/10

end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveRPOS]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveRPOS]
/********************************************************/
/*					CREDIT	FROM							*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
---------------------------Reversal Transfer
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.FROM_CLIENT EmployerId,
			'D'
			+right('000000'+cast(a.FROM_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) DepositId, 
			REVERSAL_TRANSFER MoneyMoveAmt,
			'Reversal Pool Transfer' MoveTypeNm	,							
			a.USER_ID,
			CHECK_NUMBER CheckId, 
			'To EmployerId '
			+ cast(a.To_CLIENT as varchar)
			+ ' Reversal Pool' --12/10
			MoveDetail,
			'P'+right('000000'+cast(a.FROM_CLIENT as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm
			, [FROM_CLIENT]
			, [TO_CLIENT]
			, [DATE_PROCESSED]
			, PROCESS
			, REVERSAL_TRANSFER
			, OVER_AND_SHORT_TRANSFER
			, a.ACCOUNT_BALANCE
	from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
				on	a.From_client = ac.EMPLOYER_NUMBER
					and a.Deposit_date = ac.Deposit_date
					and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 
			and a.REVERSAL_TRANSFER<>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())

union all
----------------------------Over and Short
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.FROM_CLIENT EmployerId,
			'D'
			+right('000000'+cast(a.FROM_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)DepositId, 
			OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
			'Over And Short Transfer' MoveTypeNm	,							
			a.USER_ID,
			CHECK_NUMBER CheckId, 
			case 
				when from_client = 1833 
				then 'From Over and Short to EmployerId '+cast(a.To_CLIENT as varchar)
				when from_client= to_client
				then 'Over And Short From/To Same Client ' + +cast(a.FROM_CLIENT as varchar)
				else 'Over And Short to EmployerId '+cast(a.TO_CLIENT as varchar)--12/10
				end  MoveDetail,
			'P'+right('000000'+cast(a.FROM_CLIENT as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm
			, [FROM_CLIENT]
			, [TO_CLIENT]
			, [DATE_PROCESSED]
			, PROCESS
			, REVERSAL_TRANSFER
			, OVER_AND_SHORT_TRANSFER
			, a.ACCOUNT_BALANCE
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.OVER_AND_SHORT_TRANSFER<>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
			and isnull(a.To_Deposit_date,'9999-12-31')<>a.Deposit_Date --12/17
union all
----------------------------Transfer Between Employers
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.FROM_CLIENT EmployerId,
			'D'
			+right('000000'+cast(a.FROM_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)DepositId,
			a.ACCOUNT_BALANCE MoneyMoveAmt,
			'Transfer Between Employers' MoveTypeNm	,							
			a.USER_ID,
			CHECK_NUMBER CheckId, 
			'Transfer Between Employers To EmployerId '+cast(a.To_CLIENT as varchar) MoveDetail,
			'P'+right('000000'+cast(a.FROM_CLIENT as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm
			, [FROM_CLIENT]
			, [TO_CLIENT]
			, [DATE_PROCESSED]
			, PROCESS
			, REVERSAL_TRANSFER
			, OVER_AND_SHORT_TRANSFER
			, a.ACCOUNT_BALANCE
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.ACCOUNT_BALANCE <>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())	
			and process = 'EmployerNumberChange'
			and from_client <> to_client 
			and from_client<>0 and to_client<>0	
			--and from_client = 1653 and to_client = 4847
			--and isnull(a.To_Deposit_date,'9999-12-31')<>a.Deposit_Date --12/17
)

, FirstDate as(
----------------------Reversal Transfer
select a.FROM_CLIENT, --12/16
		'D'
			+right('000000'+cast(a.From_Client as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)DepositId,
		REVERSAL_TRANSFER MoneyMoveAmt,
		min ( a.CDCEffectiveDtTm )  MoneyMoveDtTm,
		'Reversal Pool Transfer' MoveTypeNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	--a.RowCurrentInd = 1 --12/1/15
		--and 
		REVERSAL_TRANSFER<>0
		and ( 
				a.DEPOSIT_DATE between '2013-01-01' and getdate() 
				or Date_Processed between '2015-11-01' and getdate()
			)
		and a.CDCEffectiveDtTm is not NULL
group by a.FROM_CLIENT, --12/16
		REVERSAL_TRANSFER,
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6),
		Date_Processed
union
-------------------Over and Short
select a.FROM_CLIENT, --12/16
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)DepositId, 
		OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
		min(a.CDCEffectiveDtTm) FirstDate,
		'Over And Short Transfer' MoneyMoveNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	--a.RowCurrentInd = 1 --12/1/15
		--and 
		OVER_AND_SHORT_TRANSFER<>0
		and (
				a.DEPOSIT_DATE between '2013-01-01' and getdate() 
				or Date_Processed between '2015-11-01' and getdate()
			)
		and a.CDCEffectiveDtTm is not NULL
group by a.FROM_CLIENT, --12/16
		OVER_AND_SHORT_TRANSFER,
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) , 
		Date_Processed

union
--------------------Transfer Between Employers
select a.FROM_CLIENT, --12/16
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)DepositId, 
		a.ACCOUNT_BALANCE MoneyMoveAmt,
		min(a.CDCEffectiveDtTm) FirstDate,
		'Transfer Between Employers' MoneyMoveNm, --11/30
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	--a.RowCurrentInd = 1 --12/1/15
		--and 
		a.ACCOUNT_BALANCE<>0
		and 
			(
				a.DEPOSIT_DATE between '2013-01-01' and getdate() 
				or Date_Processed between '2015-11-01' and getdate()
			)
		and a.CDCEffectiveDtTm is not NULL
		and process = 'EmployerNumberChange'
		and from_client <> to_client 
		and from_client <> 0
		and to_client<>0	
group by a.FROM_CLIENT, --12/16
		a.ACCOUNT_BALANCE,
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6), 
		Date_Processed
		)
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,EffectiveEmployerId,MoveTypeNm,CBSTransactionDtTm,MoveDetail,
			sum(AbsoluteMoveAmt) TotalAbsoluteMoneyMoveAmt , sum(MoveAmt) TotalMoveAmt
			,max(MoveDtTm) MaxMoveDtTm   --11/24/15
	from	dbo.FactPDMoneyMove 	
	where 	'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' = FromTableNm 
	and MoveTypeNm in('Over And Short Transfer','Reversal Pool Transfer','Transfer Between Employers')
	group by EffectivePDDepositKey, EffectiveEmployerId, MoveTypeNm,CBSTransactionDtTm, MoveDetail
)
--final insert 

Select 
		case when ApplyAmt.TotalMoveAmt is NULL then 'New'  else 'Update' end InsertUpdateTypeNm
		, case 
		when ApplyAmt.TotalAbsoluteMoneyMoveAmt is null 
		then convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm),112) 
		else NULL
		end MoveDateKey
		, convert(varchar(8),a.Deposit_DATE,112) CBSTransactionDateKey
		, 
		case 
			when ApplyAmt.TotalAbsoluteMoneyMoveAmt is null 
			then isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm) 
			else NULL
		end MoveDtTm
		, a.CBSTransactionDtTm CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, a.MoveTypeNm
		, a.MoveDetail
		, a.EmployerId EffectiveEmployerId
		, isnull(ClientKey,0) EffectiveClientKey
		, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
		, isnull(b.PDDepositKey,0) EffectivePDDepositKey
		, 0 ToCarrierKey
		, isnull (dbp.BillProcessorKey,0) BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' FromTableNm
		, isnull( a.MoneyMoveAmt,0 ) - isnull ( TotalMoveAmt,0 ) MoveAmt
		, isnull( a.MoneyMoveAmt,0 ) - isnull ( TotalAbsoluteMoneyMoveAmt,0 ) AbsoluteMoveAmt
		, isnull(CheckId,'') CheckId
		, isnull(cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.CBSTransactionDtTm,3),4,9),'/',''),'') Subledger1
		, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
		, case when  TotalMoveAmt is NULL then  'Initial'  else 'Adjustment' end MoveTransactionTypeNm
		, a.PROCESS ProcessRecordTypeNm 
		, 'CBS'SourceSystemNm
		, a.[FROM_CLIENT]
		, [TO_CLIENT]
		, a.[DATE_PROCESSED]
		, ApplyAmt.MaxMoveDtTm MAXMOVEDTTM    ---11/24/15
		, REVERSAL_TRANSFER --11/30
		, OVER_AND_SHORT_TRANSFER --11/30
		, a.ACCOUNT_BALANCE --11/30
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
				and a.CBSTransactionDtTm = fd.Date_Processed
				and a.MoneyMoveAmt = fd.MoneyMoveAmt
				and a.MoveTypeNm = fd.MoveTypeNm
				and a.FROM_CLIENT = fd.FROM_CLIENT --12/16 
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on	a.DepositId = b.DepositId
-------------calculate adjustment --7/22
		left join ApplyAmt				
			on	isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.CBSTransactionDtTm = ApplyAmt.CBSTransactionDtTm
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
				and a.MoveDetail = ApplyAmt.MoveDetail
		left join DimPDPayment dp
			on a.PaymentId = dp.PaymentId
where isnull(ApplyAmt.TotalMoveAmt ,0)<>isnull(a.MoneyMoveAmt,0) --12/18
end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveRPOSTo]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveRPOSTo]
/********************************************************/
/*					CREDIT	TO							*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
	 select  
			distinct 
			a.To_Deposit_date,
			a.TO_CLIENT EmployerId,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)
			
			end DepositId,
			REVERSAL_TRANSFER MoneyMoveAmt,
			'Reversal Pool Transfer' MoveTypeNm	,							
			a.USER_ID,
			CHECK_NUMBER CheckId, 
			'From EmployerId '
			+ cast(a.FROM_CLIENT as varchar)
			+ ' Reversal Pool' --12/15
			MoveDetail,
			'P'+right('000000'+cast(a.TO_CLIENT as varchar),6)+'_'+convert(varchar(8),a.To_Deposit_date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm
			, [FROM_CLIENT]
			, [TO_CLIENT]
			, [DATE_PROCESSED]
			, PROCESS
			, REVERSAL_TRANSFER
			, OVER_AND_SHORT_TRANSFER
			, a.ACCOUNT_BALANCE
	from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
				on	a.TO_CLIENT = ac.EMPLOYER_NUMBER
					and a.To_Deposit_date = ac.Deposit_date
					and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.TO_CLIENT = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 
			and a.REVERSAL_TRANSFER<>0 
			and 
			(Date_Processed between '2015-11-01' and getdate()
			or a.deposit_date between '2013-01-01' and getdate()
			)
union all

	 select  
			distinct 
			a.To_Deposit_date,
			a.TO_CLIENT EmployerId,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)
			end DepositId,
			OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
			'Over And Short Transfer' MoveTypeNm	,							
			a.USER_ID,
			CHECK_NUMBER CheckId, 
			case 
				when from_client = 1833 
				then 'From Over and Short EmployerId '+cast(a.FROM_CLIENT as varchar)
				when from_client= to_client
				then 'Over And Short From/To Same Client ' + +cast(a.FROM_CLIENT as varchar)
				else 'Over And Short From EmployerId ' + cast(a.FROM_CLIENT as varchar)
			end  MoveDetail,	--12/15
			'P'+right('000000'+cast(a.TO_CLIENT as varchar),6)+'_'+convert(varchar(8),a.To_Deposit_date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm
			, [FROM_CLIENT]
			, [TO_CLIENT]
			, [DATE_PROCESSED]
			, PROCESS
			, REVERSAL_TRANSFER
			, OVER_AND_SHORT_TRANSFER
			, a.ACCOUNT_BALANCE
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.TO_CLIENT = ac.EMPLOYER_NUMBER
				and a.To_Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.TO_CLIENT = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.OVER_AND_SHORT_TRANSFER<>0 
			and (a.Deposit_date between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
			and isnull(a.To_Deposit_date,'9999-12-31')<>a.Deposit_Date --12/17

union all

	 select  
			distinct 
			a.To_Deposit_date,
			a.TO_CLIENT EmployerId,
			case when To_Deposit_date is NULL 
			then '0' 
			else 
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)
			end DepositId,
			a.ACCOUNT_BALANCE MoneyMoveAmt,
			'Transfer Between Employers' MoveTypeNm	,							
			a.USER_ID,
			CHECK_NUMBER CheckId, 
			'Transfer Between Employers From EmployerId '+cast(a.From_CLIENT as varchar) MoveDetail,
			'P'+right('000000'+cast(a.TO_CLIENT as varchar),6)+'_'+convert(varchar(8),a.To_Deposit_date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm
			, [FROM_CLIENT]
			, [TO_CLIENT]
			, [DATE_PROCESSED]
			, PROCESS
			, REVERSAL_TRANSFER
			, OVER_AND_SHORT_TRANSFER
			, a.ACCOUNT_BALANCE
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.ACCOUNT_BALANCE <>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())	
			and process = 'EmployerNumberChange'
			and from_client <> to_client 
			and from_client<>0 and to_client<>0	
			
)

, FirstDate as(
select 
			a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)
			end DepositId,
		REVERSAL_TRANSFER MoneyMoveAmt,
		min ( a.CDCEffectiveDtTm )  MoneyMoveDtTm,
		'Reversal Pool Transfer' MoveTypeNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.TO_CLIENT = ac.EMPLOYER_NUMBER
				and a.To_Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	REVERSAL_TRANSFER<>0
		and (a.Deposit_date between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
group by 
		REVERSAL_TRANSFER,
		a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) end,
		Date_Processed
union
select 
a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) end DepositId,
		OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
		min(a.CDCEffectiveDtTm) FirstDate,
		'Over And Short Transfer' MoneyMoveNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.TO_CLIENT = ac.EMPLOYER_NUMBER
				and a.To_Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	OVER_AND_SHORT_TRANSFER<>0
		and (a.Deposit_date between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
group by 
		OVER_AND_SHORT_TRANSFER,
		a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) end,
		Date_Processed
union
select 

		a.TO_CLIENT,
		case when To_Deposit_date is NULL 
		then '0' 
		else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)
		end DepositId,
		a.ACCOUNT_BALANCE MoneyMoveAmt,
		min(a.CDCEffectiveDtTm) FirstDate,
		'Transfer Between Employers' MoneyMoveNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	a.ACCOUNT_BALANCE<>0
		and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
		and process = 'EmployerNumberChange'
		and from_client <> to_client 
		and from_client <> 0
		and to_client<>0	
group by 
a.TO_CLIENT,
		a.ACCOUNT_BALANCE,
			case when To_Deposit_date is NULL 
			then '0' 
			else'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) end,
		Date_Processed
		)
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,EffectiveEmployerId,MoveTypeNm,CBSTransactionDtTm,MoveDetail,
			sum(AbsoluteMoveAmt) TotalAbsoluteMoneyMoveAmt,sum(MoveAmt) TotalMoveAmt
				,max(MoveDtTm) MaxMoveDtTm   --11/24/15
	from	dbo.FactPDMoneyMove 	
	where 	'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' = FromTableNm and MoveTypeNm in('Over And Short Transfer','Reversal Pool Transfer','Transfer Between Employers')
	group by EffectivePDDepositKey,EffectiveEmployerId, MoveTypeNm,CBSTransactionDtTm,MoveDetail
)
--final insert 

Select 
		case when ApplyAmt.TotalMoveAmt is NULL then 'New'  else 'Update' end InsertUpdateTypeNm
		, 
		case 
		when ApplyAmt.TotalAbsoluteMoneyMoveAmt is null 
		then convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm),112) 
		else NULL
		end MoveDateKey
		, convert(varchar(8),a.CBSTransactionDtTm,112) CBSTransactionDateKey
		, 
		case 
		when ApplyAmt.TotalAbsoluteMoneyMoveAmt is null 
		then isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm) 
		else NULL
		end MoveDtTm
		, a.CBSTransactionDtTm CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, a.MoveTypeNm
		, a.MoveDetail
		, a.EmployerId EffectiveEmployerId
		, isnull(ClientKey,0) EffectiveClientKey
		, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
		, isnull(b.PDDepositKey,0) EffectivePDDepositKey
		, 0 ToCarrierKey
		, isnull (dbp.BillProcessorKey,0) BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' FromTableNm
		, isnull( (-1)*a.MoneyMoveAmt,0) - isnull(TotalMoveAmt,0) MoveAmt
		, isnull(a.MoneyMoveAmt,0) - isnull(TotalMoveAmt,0) AbsoluteMoveAmt --12/18
		, isnull(CheckId,'') CheckId
		, isnull(cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.CBSTransactionDtTm,3),4,9),'/',''),'') Subledger1
		, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
		, case when ApplyAmt.TotalMoveAmt is NULL then 'Initial' else 'Adjustment' End MoveTransactionTypeNm
		, a.PROCESS ProcessRecordTypeNm 
		, 'CBS'SourceSystemNm
		, a.[FROM_CLIENT]
		, a.[TO_CLIENT]
		, a.[DATE_PROCESSED]
		, ApplyAmt.MaxMoveDtTm MAXMOVEDTTM    ---11/24/15,
		, REVERSAL_TRANSFER
		, OVER_AND_SHORT_TRANSFER
		, a.ACCOUNT_BALANCE
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
				and a.CBSTransactionDtTm = fd.Date_Processed
				and a.MoneyMoveAmt = fd.MoneyMoveAmt
				and a.MoveTypeNm = fd.MoveTypeNm
				and  fd.To_client = a.EmployerId
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on	a.DepositId = b.DepositId
-------------calculate adjustment --7/22
		left join ApplyAmt				
			on	isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.CBSTransactionDtTm = ApplyAmt.CBSTransactionDtTm
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
				and a.MoveDetail = ApplyAmt.MoveDetail
				and  ApplyAmt.EffectiveEmployerId = a.EmployerId
		left join DimPDPayment dp
			on a.PaymentId = dp.PaymentId
where isnull(ApplyAmt.TotalMoveAmt ,0)<>isnull((-1)*a.MoneyMoveAmt,0) --12/18
end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveSplitPymt]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveSplitPymt]
/********************************************************/
/*					Split payments					*/
/*	Creates 2 records, delete payment and insert deposit*/
/********************************************************/
as


select 

	b.SplitDateKey MoveDateKey
	, a.CBSTransactionDateKey CBSTransactionDateKey
	, SplitDtTm MoveDtTm
	, pp.PaymentReceiveDtTm CBSTransactionDtTm
	, 'Other' DebitCreditTypeNm
	, 'Split' MoveTypeNm
	, 'Split To DepositId ' + DepositId MoveDetail
	, a.EffectiveEmployerId
	, a.EffectiveClientKey
	, a.EffectivePDPaymentKey
	, a.EffectivePDDepositKey
	, 0 ToCarrierKey
	, b.BillProcessorKey BillProcessorKey
	, 'CBS_ACCOUNT_CREDITS' FromTableNm
	, -1 * SplitPaymentAmt MoveAmt
	, SplitPaymentAmt AbsoluteMoveAmt
	, '' CheckId
	, isnull(Subledger1,'') Subledger1
	, isnull(Subledger2,'') Subledger2
	, MoveTransactionTypeNm
	, 'Split' ProcessRecordTypeNm
	, 'CBS'SourceSystemNm
from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentSplit b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	d.EMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' =  MoveTypeNm
		and not exists
		(
		select 1 from FactPDMoneyMove m 
		where 'Split To DepositId ' + DepositId =m.MoveDetail
		and a.EffectivePDDepositKey=m.EffectivePDDepositKey
		and 'Split' = MoveTypeNm
		)
union all
select 
	b.SplitDateKey MoveDateKey
	, convert(varchar(8),DepositCreateDtTm,112) CBSTransactionDateKey
	, SplitDtTm MoveDtTm
	, DepositCreateDtTm CBSTransactionDtTm
	, 'Other' DebitCreditTypeNm
	, 'Split' MoveTypeNm
	, 'Split From PaymentId ' + PaymentId MoveDetail
	, d.EmployerId EffectiveEmployerId
	,isnull(d1.ClientKey,0) EffectiveClientKey --12/8
	, 0  EffectivePDPaymentKey
	, b.ToPDDepositKey EffectivePDDepositKey
	, 0 ToCarrierKey
	, b.BillProcessorKey BillProcessorKey
	, 'CBS_ACCOUNT_CREDITS' FromTableNm
	, SplitPaymentAmt MoveAmt
	, SplitPaymentAmt AbsoluteMoveAmt
	, '' CheckId
	, isnull(cast(d.EmployerId as varchar)+replace(substring(convert(varchar(8),DepositCreateDtTm,3),4,9),'/',''),'') Subledger1
	, '' Subledger2
	, MoveTransactionTypeNm
	, 'Split'ProcessRecordTypeNm
	, 'CBS'SourceSystemNm

from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentSplit b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	a.EffectiveEMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
				----------------------------- client
		left join VBSDMReference.dbo.ClientXref c1
			on	c1.SourceId = d.EmployerId
				and c1.IdTypeNm = 'Employer_Number' 
				and c1.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d1
			on	c1.ClientIntegrationId = d1.ClientIntegrationId
				and d1.RowCurrentInd = 1
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' = MoveTypeNm
		and not exists
		(select 1 from FactPDMoneyMove m 
		where 'Split To DepositId ' + DepositId =m.MoveDetail
		and a.EffectivePDDepositKey=m.EffectivePDDepositKey
		and 'Split' = MoveTypeNm
		)
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveSuspenseCreate]...';


GO
CREATE procedure dbo.DailyFactPDMoneyMoveSuspenseCreate
/********************************************************/
/*					Suspense Created					*/
/*  													*/
/********************************************************/
as
begin

select 
			MoveDateKey
           , CBSTransactionDateKey
           , MoveDtTm
           , CBSTransactionDtTm
           , DebitCreditTypeNm
           , MoveTypeNm
           , MoveDetail
           , EffectiveEmployerId
           , EffectiveClientKey
           , EffectivePDPaymentKey
           , EffectivePDDepositKey
           , ToCarrierKey
		   , BillProcessorKey
		   , FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           , CheckId
           , Subledger1
           , Subledger2
           , MoveTransactionTypeNm
           , ProcessRecordTypeNm
           , 'CBS'SourceSystemNm

from(
		select 
				   convert(varchar(8),isnull(SuspenseCreateDtTm,DepositDtTm),112) MoveDateKey
				   , convert(varchar(8),DepositDtTm,112) CBSTransactionDateKey
				   , isnull(SuspenseCreateDtTm,DepositDtTm) MoveDtTm
				   , DepositDtTm CBSTransactionDtTm
				   , 'Other' DebitCreditTypeNm
				   , 'Suspense' MoveTypeNm
				   , 'Suspense Created SuspenseId ' +b.SuspenseId MoveDetail
				   , b.EmployerId EffectiveEmployerId
				   , a.ClientKey EffectiveClientKey
				   , a.PDPaymentKey EffectivePDPaymentKey
				   , a.PDDepositKey EffectivePDDepositKey
				   , 0 ToCarrierKey
				   , a.MainBillProcessorKey BillProcessorKey
				   , 'CBS_EMPSUSPTRACK' FromTableNm
				   , (-1)*RemainingSuspenseAmt MoveAmt
				   , RemainingSuspenseAmt AbsoluteMoveAmt
				   , '' CheckId
				   , isnull(cast(b.EmployerId as varchar)+replace(substring(convert(varchar(8),b.DepositDtTm,3),4,9),'/',''),'') Subledger1
				   , isnull(c.BatchId+' '+c.ItemId,'') Subledger2
				   , 'Initial' MoveTransactionTypeNm
				   , 'Suspense Created' ProcessRecordTypeNm
				   , row_number() over (partition by a.PDSuspenseKey order by SnapshotDateKey) RN
		from	dbo.FactPDSuspenseSnapshot a 
				inner join dbo.DimPDSuspense b
					on a.PDSuspenseKey=b.PDSuspenseKey
				inner join DimPDPayment c
					on a.PdPaymentKey =c.PdPaymentKey
)x 
where	RN=1
		and not exists
		(
			select 1 
			from FactPDMoneyMove m
			where x.MoveDetail = m.MoveDetail
		)
end
GO
PRINT N'Creating [dbo].[DailyFactPDMoneyMoveSuspenseResolve]...';


GO
CREATE procedure [dbo].[DailyFactPDMoneyMoveSuspenseResolve]
/********************************************************/
/*					Suspense Resolved					*/
/*  													*/
/********************************************************/
as
begin
;with CTE as
(
		SELECT 'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
					+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) ) SuspenseId, 
				min(cast(CDCExpireDtTm as datetime)) SuspenseDeleteDtTm
		FROM	VBSDMOds.dbo.CBS_EMPSUSPTRACK a
		where 
				RowDeleteInd=1 
				and CDCExpireDtTm is not NULL 
				and CDCExpireDtTm>'1900-01-01'
		group by 'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
					+'_'
					+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
					+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
					+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) )
)
select 
			MoveDateKey
           , CBSTransactionDateKey
           , MoveDtTm
           , CBSTransactionDtTm
           , DebitCreditTypeNm
           , MoveTypeNm
           , MoveDetail
           , EffectiveEmployerId
           , EffectiveClientKey
           , EffectivePDPaymentKey
           , EffectivePDDepositKey
           , ToCarrierKey
		   , BillProcessorKey
		   , FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           , CheckId
           , Subledger1
           , Subledger2
           , MoveTransactionTypeNm
           , ProcessRecordTypeNm
		   ,'CBS' SorceSystemNm

from(
		select 
				   convert(varchar(8),isnull(SuspenseDeleteDtTm,DepositDtTm),112) MoveDateKey
				   , convert(varchar(8),DepositDtTm,112) CBSTransactionDateKey
				   , isnull(SuspenseDeleteDtTm,DepositDtTm) MoveDtTm
				   , DepositDtTm CBSTransactionDtTm
				   , 'Other' DebitCreditTypeNm
				   , 'Suspense' MoveTypeNm
				   , 'Suspense Resolved SuspenseId ' +b.SuspenseId MoveDetail
				   , b.EmployerId EffectiveEmployerId
				   , a.ClientKey EffectiveClientKey
				   , a.PDPaymentKey EffectivePDPaymentKey
				   , a.PDDepositKey EffectivePDDepositKey
				   , 0 ToCarrierKey
				   , a.MainBillProcessorKey BillProcessorKey
				   , 'CBS_EMPSUSPTRACK' FromTableNm
				   , RemainingSuspenseAmt MoveAmt
				   , RemainingSuspenseAmt AbsoluteMoveAmt
				   , '' CheckId
				   , isnull(isnull(cast(b.EmployerId as varchar)+replace(substring(convert(varchar(8),b.DepositDtTm,3),4,9),'/',''),''),'') Subledger1
				   , isnull(c.BatchId+' '+c.ItemId,'') Subledger2
				   , 'Initial' MoveTransactionTypeNm
				   , 'Suspense Resolved' ProcessRecordTypeNm
				   , row_number() over (partition by a.PDSuspenseKey order by SnapshotDateKey Desc) RN
		from	dbo.FactPDSuspenseSnapshot a 
				inner join dbo.DimPDSuspense b
					on a.PDSuspenseKey=b.PDSuspenseKey
				inner join DimPDPayment c
					on a.PdPaymentKey =c.PdPaymentKey
				inner join CTE
					on b.SuspenseId = CTE.SuspenseId
)x 
where	RN=1
		and not exists
		(
			select 1 
			from FactPDMoneyMove m
			where	x.MoveDetail = m.MoveDetail
					and 'Suspense Resolved' = ProcessRecordTypeNm)

end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveCombinePymt]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveCombinePymt]
/********************************************************/
/*					Combined payments					*/
/*	Creates 2 records, delete payment and insert deposit*/
/********************************************************/
as
begin
INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           ,MoveAmt
		   ,AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
--removed payments
select 
		b.CombineDateKey MoveDateKey
		, a.CBSTransactionDateKey CBSTransactionDateKey
		, CombineDtTm MoveDtTm
		, pp.PaymentReceiveDtTm CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, 'Combined' MoveTypeNm
		, 'Combined With DepositId ' + d.DepositId MoveDetail
		, a.EffectiveEmployerId
		, a.EffectiveClientKey
		, a.EffectivePDPaymentKey
		, a.EffectivePDDepositKey
		, 0 ToCarrierKey
		, b.BillProcessorKey BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS' FromTableNm
		, -1 * a.MoveAmt MoveAmt
		, a.MoveAmt AbsoluteMoveAmt
		, ''CheckId
		, Subledger1
		, Subledger2
		, MoveTransactionTypeNm
		, 'Combined' ProcessRecordTypeNm
		, 'CBS'SourceSystemNm
		, -1 RowAuditKey
		, 0 RowDeleteInd

from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentCombine b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	d.EMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' =  MoveTypeNm


--added deposits
INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
--removed payments
select 
	b.CombineDateKey MoveDateKey
	, convert(varchar(8),DepositCreateDtTm,112) CBSTransactionDateKey
	, CombineDtTm MoveDtTm
	, DepositCreateDtTm CBSTransactionDtTm ---should be changed to deposit date from deposit
	, 'Other' DebitCreditTypeNm
	, 'Combined' MoveTypeNm
	, 'Combined From PaymentId ' + PaymentId MoveDetail --11/30
	, d.EmployerId EffectiveEmployerId
	,isnull(d1.ClientKey,0) EffectiveClientKey --12/8
	, 0 EffectivePDPaymentKey
	, b.ToPDDepositKey EffectivePDDepositKey
	, 0 ToCarrierKey
	, b.BillProcessorKey BillProcessorKey
	,'CBS_ACCOUNT_CREDITS' FromTableNm
	, a.MoveAmt MoveAmt
	, a.MoveAmt AbsoluteMoveAmt
	,'' CheckId
	, cast(d.EmployerId as varchar)+replace(substring(convert(varchar(8),DepositCreateDtTm,3),4,9),'/','') Subledger1
	, '' Subledger2
	, MoveTransactionTypeNm
	, 'Combined' ProcessRecordTypeNm
	, 'CBS'SourceSystemNm
	, -2 RowAuditKey
	, 0 RowDeleteInd
from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentCombine b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	a.EffectiveEMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
				----------------------------- client
		left join VBSDMReference.dbo.ClientXref c1
			on	c1.SourceId = d.EmployerId
				and c1.IdTypeNm = 'Employer_Number' 
				and c1.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d1
			on	c1.ClientIntegrationId = d1.ClientIntegrationId
				and d1.RowCurrentInd = 1
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' =  a.MoveTypeNm

end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveCredit]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveCredit]
/********************************************************/
/*					CREDIT								*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER EmployerId,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			a.REVERSAL_POOL MoneyMoveAmt,
			'Reversal Pool' MoveTypeNm	,							
			--'From Reversal Pool' MoneyMoveTypeNm,
			a.USER_ID,
			isnull(CHECK_NUMBER,'') CheckId, 
			'From Employer''s Reversal Pool to EmployerId '+cast(a.employer_number as varchar) MoveDetail, --12/1
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId
	from	VBSDMODS..CBS_Account_credits a
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.REVERSAL_POOL<>0 
			and a.DEPOSIT_DATE between '2013-01-01' and getdate()

union all

	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			a.OVER_AND_SHORT MoneyMoveAmt,
			'Over And Short' MoneyTypeNm	,							
			--'From Over And Short' MoneyMoveTypeNm,
			a.USER_ID,
			isnull(CHECK_NUMBER,'') CheckId, 
			'From Over And Short to EmployerId '+cast(a.employer_number as varchar) MoveDetail, --12/1
			CREDIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId
	from	VBSDMODS..CBS_Account_credits a
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.OVER_AND_SHORT<>0 
			and a.DEPOSIT_DATE between '2013-01-01' and getdate()

 )

, FirstDate as(
select 
		'D'
		+right('000000'+cast(a.Employer_Number as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
		REVERSAL_POOL MoneyMoveAmt,
		min(case when CDCEffectiveDtTm is NULL then a.DEPOSIT_DATE else CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Reversal Pool' MoveTypeNm
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
where	REVERSAL_POOL<>0
		and a.DEPOSIT_DATE between '2013-01-01' and getdate()
group by 
		REVERSAL_POOL,
		'D'
		+right('000000'+cast(a.Employer_Number as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6) 
union
select 

		'D'
		+right('000000'+cast(a.Employer_Number as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,

		OVER_AND_SHORT MoneyMoveAmt,
		min(case when CDCEffectiveDtTm is NULL then a.DEPOSIT_DATE else CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Over And Short' MoneyMoveNm
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS a
where	OVER_AND_SHORT<>0
		and a.DEPOSIT_DATE between '2013-01-01' and getdate()
group by 
		OVER_AND_SHORT,
		'D'
		+right('000000'+cast(a.Employer_Number as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6) 
		)


, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,MoveTypeNm,
			sum(MoveAmt) TotalMoneyMoveAmt 
	from	dbo.FactPDMoneyMove 	
	where 	'CBS_ACCOUNT_CREDITS' = FromTableNm and MoveTypeNm in('Over And Short','Reversal Pool')
	group by EffectivePDDepositKey, MoveTypeNm
)
----final insert 
INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           ,MoveAmt
		   ,AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)

Select 

		convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.Deposit_DATE),112) MoveDateKey
		, convert(varchar(8),a.Deposit_DATE,112) CBSTransactionDateKey
		, isnull(fd.MoneyMoveDtTm,a.Deposit_DATE) MoveDtTm
		, a.Deposit_DATE CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, a.MoveTypeNm
		, MoveDetail
		, a.EmployerId EffectiveEmployerId
		, isnull(ClientKey,0) EffectiveClientKey
		, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
		, isnull(b.PDDepositKey,0) EffectivePDDepositKey
		, 0 ToCarrierKey
		, isnull (dbp.BillProcessorKey,0) BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS' FromTableNm
		, a.MoneyMoveAmt MoveAmt
		, a.MoneyMoveAmt AbsoluteMoveAmt
		, isnull(CheckId,'') CheckId
		, isnull(cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.DEPOSIT_DATE,3),4,9),'/',''),'') Subledger1
		, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
		,'Initial' MoveTransactionTypeNm
		, dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
		, 'CBS'SourceSystemNm
		, -3 RowAuditKey
		, 0 RowDeleteInd
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
				and a.MoneyMoveAmt = fd.MoneyMoveAmt
				and a.MoveTypeNm = fd.MoveTypeNm
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on	a.DepositId = b.DepositId
----recort type = accounting status
		left join VBSDMODS..CBS_ACCOUNTING_RECORD_STATUS_CODES ars
			on	Credit_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1

-------------calculate adjustment --7/22
		left join ApplyAmt				
			on isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
		left join DimPDPayment dp
			on a.PaymentId = dp.PaymentId
where isnull(ApplyAmt.TotalMoneyMoveAmt,0)<>isnull(a.MoneyMoveAmt,0)
end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveCreditPymt]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveCreditPymt]
/********************************************************/
/*					CREDIT								*/
/********************************************************/
as

INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
select 
            isnull(date1.datekey,0) MoneyMoveDateKey --11/25/15
			,isnull(date2.datekey,0) CBSTransactionDateKey --11/25/15
			,p.PaymentAssociateDtTm
			,p.PaymentReceiveDtTm
           ,'Credit' DebitCreditTypeNm
		   ,'Payment Entered' MoveTypeNm
           ,'Payment From EmployerId '+cast(p.EmployerId as varchar) MoveDetail
           ,p.EmployerId EffectiveEmployerId
           ,f.ClientKey EffectiveClientKey
           ,p.PDPaymentKey EffectivePDPaymentKey
           ,isnull(PDDepositKey,0) EffectivePDDepositKey
           ,0 ToCarrierKey
		   ,MainBillProcessorKey BillProcessorKey
		   ,'CBS_ACCOUNT_CREDITS' FromTableNm
           , f.PaymentAmt MoveAmt
		   , f.PaymentAmt AbsoluteMoveAmt
           ,isnull(TransactionId,'') CheckId
			,isnull(cast(p.EMPLOYERID as varchar)+replace(substring(convert(varchar(8),p.PaymentReceiveDtTm,3),4,9),'/',''),'') Subledger1
			,isnull(p.BatchId+' '+p.ItemId,'') Subledger2
           ,'Initial'  MoveTransactionTypeNm
           ,'Payment Entered' ProcessRecordTypeNm
           ,'CBS' SourceSystemNm
           ,-4 RowAuditKey
           ,0 RowDeleteInd

from	dbo.FactPDBankPaymentReceive f  
		inner join DimPDPayment p
			on f.PDPaymentKey = p.PDPaymentKey
		left join DimPDDeposit dd
			on 'D'+substring(PaymentId,2,25)+'*000000' = dd.DepositId
		left join DimDate date1--11/25/15
			on date1.DateKey = convert(varchar(8), p.PaymentAssociateDtTm,112) --11/25/15
		left join DimDate date2--11/25/15
			on date2.DateKey = convert(varchar(8), p.PaymentReceiveDtTm,112) --11/25/15
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveDebit]...';


GO

CREATE procedure [dbo].[InitialFactPDMoneyMoveDebit] as
BEGIN

/********************************************************/
/*					DEBIT								*/
/********************************************************/

; with ChangedDeposits as
(
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.EMPLOYER_NUMBER,
			dt.WITHDRAWAL_DATE,
			isnull(dc.CarrierKey,0) CarrierKey,
			'D'
			+right('000000'+cast(a.Employer_Number as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(a.SPLIT_ID as varchar),''),6)  DepositId,
			dt.CHECK_AMOUNT MoneyMoveAmt,
			dt.RowCurrentInd
			,case 
				when dt.Carrier_Number <>0 then 'Apply to Carrier'
				when dt.employee_SSN is not NULL					then 'Return'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%' and a.Employer_Number = 1833	 then 'Reversal Pool'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%'	 then 'Reversal Pool'
				when PAYEE = 'Rev Pool Xfer To Trustmark Over and Short account' then 'Over And Short'
				when PAYEE = 'Xfer To Client Reversal Pool'		then 'Reversal Pool'
				when PAYEE like 'Rev Pool Xfer%'				then 'Reversal Pool'
				when PAYEE like '%Reversal Pool%'				then 'Reversal Pool'
				when PAYEE like 'Over And Short Xfer%' and a.Employer_Number = 1833			then 'Over And Short'
				when PAYEE like 'Offset%'						then 'Offset'
				when PAYEE like 'NSF%'							then 'Return'
				when PAYEE like 'Pending Ebill Split To%'		then 'Ebill' 
				when patindex('%'+cast(a.employer_number as varchar)+'%',payee)>=1	then 'Return'
				when PAYEE like 'To Client For%'									then 'Return'
				when Full_name  = PAYEE												then 'Return'
				else 'Unknown' 
			end MoveTypeNm			
	,case 
				when dt.Carrier_Number <>0 then 'Debit'
				when dt.employee_SSN is not NULL then 'Debit'
				--2/12/2015
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%' and a.Employer_Number = 1833	 then 'Other'
				when PAYEE like 'Xfer To Client #%' and PAYEE like '%Reversal Pool%'	 then 'Other'
				when PAYEE = 'Rev Pool Xfer To Trustmark Over and Short account' then 'Other'
				when PAYEE = 'Xfer To Client Reversal Pool'		then 'Other'
				when PAYEE like 'Rev Pool Xfer%'				then 'Other'
				when PAYEE like '%Reversal Pool%'				then 'Other'
				when PAYEE like 'Over And Short Xfer%' and a.Employer_Number = 1833			then 'Other'
				when PAYEE like 'Offset%'						then 'Other'
				when PAYEE like 'Pending Ebill Split To%'		then 'Other' 
				---
				when patindex('%'+cast(a.employer_number as varchar)+'%',payee)>=1	then 'Debit'
				when PAYEE like 'To Client For%'									then 'Debit'
				when Full_name  = PAYEE												then 'Debit'
				when PAYEE like 'NSF%'												then 'Debit'
				else 'Other'  
			end DebitCreditTypeNm	,					
			dbo.udf_CamelCase(PAYEE)	MoveDetail,
			dt.USER_ID,
			isnull(CASHIERS_CHECK_NUMBER,'') CheckId, 
			isnull(dc.CarrierNm,dbo.udf_CamelCase(Payee)) PayeeNm,
			DEBIT_RECORD_TYPE,
			ACCOUNT_STATUS,
			'P'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId
	from	VBSDMODS..CBS_Account_credits a
			inner join VBSDMODS..CBS_Account_debits dt --only what was processed
				on a.Employer_Number= dt.Employer_Number 
					and a.Deposit_Date = dt.Deposit_Date 
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	dt.EMPLOYER_NUMBER = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
			left join DimCarrier dc
				on dt.CARRIER_NUMBER  = dc.CarrierId
					and dt.CARRIER_NUMBER<>0
	where	dt.RowCurrentInd = 1 
			and a.RowCurrentInd = 1
			--and dt.Carrier_Number = 0
			and a.DEPOSIT_DATE between '2013-01-01' and getdate()
 )

 ----first amount appearance date to populate Money Move Date
 , FirstDate as
 (
	 select 
			dt.CHECK_AMOUNT,
			WITHDRAWAL_DATE,
			'D'+right('000000'+cast(a.Employer_Number as varchar),6)
				+'_'
				+convert(varchar(8), a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6) DepositId,
				min(case when dt.CDCEffectiveDtTm is NULL then a.DEPOSIT_DATE else dt.CDCEffectiveDtTm end ) MoneyMoveDtTm --12/7/2015
	 from	VBSDMODS..CBS_Account_credits a
			inner join VBSDMODS..CBS_Account_debits dt --only what was processed
				on a.Employer_Number= dt.Employer_Number 
				and a.Deposit_Date = dt.Deposit_Date 
	where	a.DEPOSIT_DATE between '2013-01-01' and getdate()
	group by	dt.CHECK_AMOUNT,
				WITHDRAWAL_DATE,
				'D'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8), a.Deposit_Date,112)
				+'_'
				+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
				+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
				+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
				+'*'
				+right('000000'+cast(isnull(a.SPLIT_ID,'') as varchar),6)
)

----Money moved that were recorded befor by natural key
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,FromTableNm,CBSTransactionDtTm,ToCarrierKey,
			sum(MoveAmt) TotalMoneyMoveAmt 
	from	dbo.FactPDMoneyMove 	
	--where DebitCreditTypeNm='Debit'
		
	group by EffectivePDDepositKey,FromTableNm,CBSTransactionDtTm, DebitCreditTypeNm,ToCarrierKey
)
----final insert 
INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
Select 

	isnull(dd1.DateKey,0) MoveDateKey
	, isnull(dd2.DateKey,0) CBSTransactionDateKey
	, isnull(fd.MoneyMoveDtTm,a.WITHDRAWAL_DATE) MoneyMoveDtTm
	, a.WITHDRAWAL_DATE CBSTransactionDtTm
	,  a.DebitCreditTypeNm
	, a.MoveTypeNm MoveTypeNm
	, case when isnull(b.PDDepositKey,0) = 0 then  a.MoveDetail+ ' From DepositId ' +a.DepositId else a.MoveDetail end MoveDetail
	, a.EMPLOYER_NUMBER EffectiveEmployerId
	, isnull(ClientKey,0) EffectiveClientKey
	, isnull(dp.PDPaymentKey,0) EffectivePDPaymentKey
	, isnull(b.PDDepositKey,0)  EffectivePDDepositKey
	, a.CarrierKey ToCarrierKey
	, isnull (dbp.BillProcessorKey,0) BillProcessorKey
	,'CBS_ACCOUNT_DEBITS' FromTableNm
	, (-1) * MoneyMoveAmt MoveAmt
	, MoneyMoveAmt AbsoluteMoveAmt
	,isnull(CheckId,'') CheckId
	,isnull(cast(a.EMPLOYER_NUMBER as varchar)+replace(substring(convert(varchar(8),a.DEPOSIT_DATE,3),4,9),'/',''),'') Subledger1
	,isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
	,'Initial'  MoveTransactionTypeNm
	,dbo.udf_CamelCase(rtrim(ltrim(RECORD_DESC))) ProcessRecordTypeNm 
	, 'CBS'SourceSystemNm
	, -5 RowAuditKey
	, 0 RowDeleteInd
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
				and a.WITHDRAWAL_DATE = fd.WITHDRAWAL_DATE
				and a.MoneyMoveAmt = fd.CHECK_AMOUNT
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.Employer_Number 
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on a.User_Id = dbp.BillProcessorUserId
			and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b --??
			on a.DepositId = b.DepositId
----recort type = accounting status
		left join VBSDMODS..CBS_ACCOUNTING_RECORD_STATUS_CODES ars
			on DEBIT_RECORD_TYPE = ars.RECORD_CODE
				and ars.RowCurrentInd = 1

-------------calculate adjustment --7/22
		left join ApplyAmt				
				on isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and 'CBS_ACCOUNT_DEBITS' = ApplyAmt.FromTableNm
				and a.withdrawal_date = ApplyAmt.CBSTransactionDtTm
				and a.CarrierKey = ApplyAmt.ToCarrierKey
		left join DimPDPayment dp
				on a.PaymentId = dp.PaymentId
		left join DimDate dd1
				on convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.WITHDRAWAL_DATE),112)  =dd1.DateKey
		left join DimDate dd2
				on convert(varchar(8),a.WITHDRAWAL_DATE,112)  =dd2.DateKey
Where isnull(a.MoneyMoveAmt*(-1),0)<> isnull(ApplyAmt.TotalMoneyMoveAmt,0)

end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveRPOS]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveRPOS]
/********************************************************/
/*					CREDIT								*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.FROM_CLIENT EmployerId,
			'D'
			+right('000000'+cast(a.FROM_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6)  DepositId,
			REVERSAL_TRANSFER MoneyMoveAmt,
			'Reversal Pool Transfer' MoveTypeNm	,							
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId, 
			'To EmployerId '
			+ cast(a.To_CLIENT as varchar)
			+ ' Reversal Pool' --12/10
			MoveDetail,
			'P'+right('000000'+cast(a.FROM_CLIENT as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm,
			PROCESS
	from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
				on	a.From_client = ac.EMPLOYER_NUMBER
					and a.Deposit_date = ac.Deposit_date
					and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 
			and a.REVERSAL_TRANSFER<>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
union all

	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.FROM_CLIENT EmployerId,
			'D'
			+right('000000'+cast(a.FROM_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6)  DepositId,
			OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
			'Over And Short Transfer' MoveTypeNm	,							
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId,
			case 
				when from_client = 1833 
				then 'From Over and Short to EmployerId '+cast(a.To_CLIENT as varchar)
				when from_client= to_client
				then 'Over And Short From/To Same Client ' + +cast(a.FROM_CLIENT as varchar)
				else 'Over And Short to EmployerId '+cast(a.TO_CLIENT as varchar) --12/10
				end  MoveDetail,
			'P'+right('000000'+cast(a.FROM_CLIENT as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm,
			PROCESS
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.OVER_AND_SHORT_TRANSFER<>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
			and isnull(a.To_Deposit_date,'9999-12-31')<>a.Deposit_Date --12/17

union all

	 select  
			distinct 
			a.DEPOSIT_DATE,
			a.FROM_CLIENT EmployerId,
			'D'
			+right('000000'+cast(a.FROM_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6)  DepositId,
			a.ACCOUNT_BALANCE MoneyMoveAmt,
			'Transfer Between Employers' MoveTypeNm	,							
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId,
			'Transfer Between Employers To EmployerId '+cast(a.To_CLIENT as varchar) MoveDetail,
			'P'+right('000000'+cast(a.FROM_CLIENT as varchar),6)+'_'+convert(varchar(8),a.Deposit_Date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
						+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm,
			PROCESS
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.ACCOUNT_BALANCE <>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())	
			and process = 'EmployerNumberChange'
			and from_client <> to_client 
			and from_client<>0 and to_client<>0	
		
)

, FirstDate as(
select 
		'D'
			+right('000000'+cast(a.From_Client as varchar),6)
			+'_'
			+convert(varchar(8),a.Deposit_Date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
			+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6)  DepositId,
		REVERSAL_TRANSFER MoneyMoveAmt,
		min(case when a.CDCEffectiveDtTm is NULL then Date_Processed else a.CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Reversal Pool Transfer' MoveTypeNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	REVERSAL_TRANSFER<>0
		and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
group by 
		REVERSAL_TRANSFER,
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) ,
		Date_Processed
union
select 
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6)  DepositId,
		OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
		min(case when a.CDCEffectiveDtTm is NULL then Date_Processed else a.CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Over And Short Transfer' MoneyMoveNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	OVER_AND_SHORT_TRANSFER<>0
		and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
group by 
		OVER_AND_SHORT_TRANSFER,
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) ,
		Date_Processed
union
select 
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6)  DepositId,
		a.ACCOUNT_BALANCE MoneyMoveAmt,
		min(case when a.CDCEffectiveDtTm is NULL then Date_Processed else a.CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Transfer Between Employers' MoneyMoveNm, --11/30
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	a.ACCOUNT_BALANCE <> 0
		and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
		and process = 'EmployerNumberChange'
		and from_client <> to_client 
		and from_client <> 0
		and to_client <> 0	
group by 
		a.ACCOUNT_BALANCE,
		'D'
		+right('000000'+cast(a.From_Client as varchar),6)
		+'_'
		+convert(varchar(8),a.Deposit_Date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(minute,a.Deposit_Date) as varchar),2)
		+right('0'+cast(datepart(second,a.Deposit_Date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.Deposit_Date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) ,
		Date_Processed
		)
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,
			EffectiveEmployerId,
			MoveTypeNm,
			CBSTransactionDtTm,
			MoveDetail,
			sum(AbsoluteMoveAmt) TotalAbsoluteMoneyMoveAmt 
	from	dbo.FactPDMoneyMove 	
	where 	'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' = FromTableNm 
			and MoveTypeNm in('Over And Short Transfer','Reversal Pool Transfer','Transfer Between Employers')
	group by EffectivePDDepositKey, EffectiveEmployerId, MoveTypeNm,CBSTransactionDtTm, MoveDetail
)
--final insert 
INSERT INTO dbo.FactPDMoneyMove
(
	MoveDateKey
	,CBSTransactionDateKey
	,MoveDtTm
	,CBSTransactionDtTm
	,DebitCreditTypeNm
	,MoveTypeNm
	,MoveDetail
	,EffectiveEmployerId
	,EffectiveClientKey
	,EffectivePDPaymentKey
	,EffectivePDDepositKey
	,ToCarrierKey
	,BillProcessorKey
	,FromTableNm
	,MoveAmt
	,AbsoluteMoveAmt
	,CheckId
	,Subledger1
	,Subledger2
	,MoveTransactionTypeNm
	,ProcessRecordTypeNm
	,SourceSystemNm
	,RowAuditKey
	,RowDeleteInd
)

Select 

		convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm),112) MoveDateKey
		, convert(varchar(8),a.Deposit_DATE,112) CBSTransactionDateKey
		, isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm) MoveDtTm
		, a.CBSTransactionDtTm CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, a.MoveTypeNm
		, a.MoveDetail
		, a.EmployerId EffectiveEmployerId
		, isnull(ClientKey,0) EffectiveClientKey
		, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
		, isnull(b.PDDepositKey,0) EffectivePDDepositKey
		, 0 ToCarrierKey
		, isnull (dbp.BillProcessorKey,0) BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' FromTableNm
		, a.MoneyMoveAmt MoveAmt
		, a.MoneyMoveAmt AbsoluteMoveAmt
		, CheckId CheckId
		, cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.CBSTransactionDtTm,3),4,9),'/','') Subledger1
		, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
		, 'Initial' MoveTransactionTypeNm
		, a.PROCESS ProcessRecordTypeNm 
		, 'CBS'SourceSystemNm
		, -6 RowAuditKey
		, 0 RowDeleteInd
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
				and a.CBSTransactionDtTm = fd.Date_Processed
				and a.MoneyMoveAmt = fd.MoneyMoveAmt
				and a.MoveTypeNm = fd.MoveTypeNm
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on	a.DepositId = b.DepositId
-------------calculate adjustment --7/22
		left join ApplyAmt				
			on	isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.CBSTransactionDtTm = ApplyAmt.CBSTransactionDtTm
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
				and a.MoveDetail = ApplyAmt.MoveDetail
		left join DimPDPayment dp
			on a.PaymentId = dp.PaymentId
where isnull(ApplyAmt.TotalAbsoluteMoneyMoveAmt ,0)<>isnull(a.MoneyMoveAmt,0)
end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveRPOSTo]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveRPOSTo]
/********************************************************/
/*					CREDIT								*/
/* Reversal Pool, Over and Short					    */
/********************************************************/
as
begin
; with ChangedDeposits as
(
	 select  
			distinct 
			a.To_Deposit_date,
			a.TO_CLIENT EmployerId,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) 
			
			end DepositId,
			REVERSAL_TRANSFER MoneyMoveAmt,
			'Reversal Pool Transfer' MoveTypeNm	,							
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId,
			'From EmployerId '
			+ cast(a.FROM_CLIENT as varchar)
			+ ' Reversal Pool' --12/10/15
			MoveDetail,
			'P'+right('000000'+cast(a.TO_CLIENT as varchar),6)+'_'+convert(varchar(8),a.To_Deposit_date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm,
			PROCESS
	from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
				on	a.TO_CLIENT = ac.EMPLOYER_NUMBER
					and a.To_Deposit_date = ac.Deposit_date
					and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.TO_CLIENT = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 
			and a.REVERSAL_TRANSFER<>0 
			and 
			(Date_Processed between '2015-11-01' and getdate()
			or a.deposit_date between '2013-01-01' and getdate()
			)
union all

	 select  
			distinct 
			a.To_Deposit_date,
			a.TO_CLIENT EmployerId,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) 
			end DepositId,
			OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
			'Over And Short Transfer' MoveTypeNm	,							
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId, 
			case 
				when from_client = 1833 
				then 'From Over and Short EmployerId '+cast(a.FROM_CLIENT as varchar)
				when from_client= to_client
				then 'Over And Short From/To Same Client ' + +cast(a.FROM_CLIENT as varchar)
				else 'Over And Short From EmployerId ' + cast(a.FROM_CLIENT as varchar)
			end  MoveDetail,	--12/15		
			'P'+right('000000'+cast(a.TO_CLIENT as varchar),6)+'_'+convert(varchar(8),a.To_Deposit_date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm,
			PROCESS
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.TO_CLIENT = ac.EMPLOYER_NUMBER
				and a.To_Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.TO_CLIENT = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.OVER_AND_SHORT_TRANSFER<>0 
			and (a.Deposit_date between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
			and isnull(a.To_Deposit_date,'9999-12-31')<>a.Deposit_Date --12/17
union all

	 select  
			distinct 
			a.To_Deposit_date,
			a.TO_CLIENT EmployerId,
			case when To_Deposit_date is NULL 
			then '0' 
			else 
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) 
			end DepositId,
			a.ACCOUNT_BALANCE MoneyMoveAmt,
			'Transfer Between Employers' MoveTypeNm	,							
			a.USER_ID,
			isnull(CHECK_NUMBER,0) CheckId,
			'Transfer Between Employers From EmployerId '+cast(a.From_CLIENT as varchar) MoveDetail, --11/30
			'P'+right('000000'+cast(a.TO_CLIENT as varchar),6)+'_'+convert(varchar(8),a.To_Deposit_date,112)
						+'_'
						+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
						+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2)
						+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) PaymentId,
			Date_Processed CBSTransactionDtTm,
			PROCESS
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a 
			left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
			left join VBSDMOds.dbo.CBS_COMPANY b
				on	a.From_client = b.EMPLOYER_NUMBER 
					and b.RowCurrentInd = 1
	where	a.RowCurrentInd = 1 and a.ACCOUNT_BALANCE <>0 
			and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())	
			and process = 'EmployerNumberChange'
			and from_client <> to_client 
			and from_client <> 0 
			and to_client <> 0	
		
)

, FirstDate as(
select 
			a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) 
			end DepositId,
		REVERSAL_TRANSFER MoneyMoveAmt,
		min(case when a.CDCEffectiveDtTm is NULL then Date_Processed else a.CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Reversal Pool Transfer' MoveTypeNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.TO_CLIENT = ac.EMPLOYER_NUMBER
				and a.To_Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	REVERSAL_TRANSFER<>0
		and (a.Deposit_date between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
group by 
		REVERSAL_TRANSFER,
		a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) end,
		Date_Processed
union
select 
a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) end DepositId,
		OVER_AND_SHORT_TRANSFER MoneyMoveAmt,
		min(case when a.CDCEffectiveDtTm is NULL then Date_Processed else a.CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Over And Short Transfer' MoneyMoveNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.TO_CLIENT = ac.EMPLOYER_NUMBER
				and a.To_Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	OVER_AND_SHORT_TRANSFER<>0
		and (a.Deposit_date between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
group by 
		OVER_AND_SHORT_TRANSFER,
		a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
		'D'
		+right('000000'+cast(a.TO_CLIENT as varchar),6)
		+'_'
		+convert(varchar(8),a.To_Deposit_date,112)
		+'_'
		+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
		+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
		+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
		+'*'
		+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) end,
		Date_Processed
union
select 

a.TO_CLIENT,
			case when To_Deposit_date is NULL 
			then '0' 
			else
			'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.SPLIT_ID as varchar),''),6) 
		end DepositId,
		a.ACCOUNT_BALANCE MoneyMoveAmt,
		min(case when a.CDCEffectiveDtTm is NULL then Date_Processed else a.CDCEffectiveDtTm end ) MoneyMoveDtTm, --12/7/2015
		'Transfer Between Employers' MoneyMoveNm,
		Date_Processed
from	VBSDMOds.dbo.CBS_ACCOUNT_CREDITS_RP_OS_TRACKING a
		left join VBSDMODS..CBS_Account_credits ac
			on a.From_client = ac.EMPLOYER_NUMBER
				and a.Deposit_date = ac.Deposit_date
				and ac.RowCurrentInd = 1
where	a.ACCOUNT_BALANCE<>0
		and (a.DEPOSIT_DATE between '2013-01-01' and getdate() or Date_Processed between '2015-11-01' and getdate())
		and a.CDCEffectiveDtTm is not NULL
		and process = 'EmployerNumberChange'
		and from_client <> to_client 
		and from_client <> 0
		and to_client <> 0	
group by 
a.TO_CLIENT,
		a.ACCOUNT_BALANCE,
			case when To_Deposit_date is NULL 
			then '0' 
			else'D'
			+right('000000'+cast(a.TO_CLIENT as varchar),6)
			+'_'
			+convert(varchar(8),a.To_Deposit_date,112)
			+'_'
			+right('0'+cast(datepart(hh,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(minute,a.To_Deposit_date) as varchar),2)
			+right('0'+cast(datepart(second,a.To_Deposit_date) as varchar),2) 
			+right('000'+cast(datepart(millisecond,a.To_Deposit_date) as varchar),3) 
			+'*'
			+right('000000'+isnull(cast(ac.Split_id as varchar),''),6) end,
		Date_Processed
		)
, ApplyAmt as --7/22
(
	select 
			EffectivePDDepositKey,EffectiveEmployerId,MoveTypeNm,CBSTransactionDtTm,MoveDetail,
			sum(AbsoluteMoveAmt) TotalAbsoluteMoneyMoveAmt 
	from	dbo.FactPDMoneyMove 	
	where 	'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' = FromTableNm and MoveTypeNm in('Over And Short Transfer','Reversal Pool Transfer','Transfer Between Employers')
	group by EffectivePDDepositKey, MoveTypeNm,CBSTransactionDtTm,MoveDetail,EffectiveEmployerId
)
--final insert 
INSERT INTO dbo.FactPDMoneyMove
(
	MoveDateKey
	,CBSTransactionDateKey
	,MoveDtTm
	,CBSTransactionDtTm
	,DebitCreditTypeNm
	,MoveTypeNm
	,MoveDetail
	,EffectiveEmployerId
	,EffectiveClientKey
	,EffectivePDPaymentKey
	,EffectivePDDepositKey
	,ToCarrierKey
	,BillProcessorKey
	,FromTableNm
	,MoveAmt
	,AbsoluteMoveAmt
	,CheckId
	,Subledger1
	,Subledger2
	,MoveTransactionTypeNm
	,ProcessRecordTypeNm
	,SourceSystemNm
	,RowAuditKey
	,RowDeleteInd
)

Select 

		convert(varchar(8),isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm),112) MoveDateKey
		, convert(varchar(8),a.CBSTransactionDtTm,112) CBSTransactionDateKey
		, isnull(fd.MoneyMoveDtTm,a.CBSTransactionDtTm) MoveDtTm
		, a.CBSTransactionDtTm CBSTransactionDtTm
		, 'Other' DebitCreditTypeNm
		, a.MoveTypeNm
		, a.MoveDetail
		, a.EmployerId EffectiveEmployerId
		, isnull(ClientKey,0) EffectiveClientKey
		, isnull(dp.PDPaymentKey,0)EffectivePDPaymentKey
		, isnull(b.PDDepositKey,0) EffectivePDDepositKey
		, 0 ToCarrierKey
		, isnull (dbp.BillProcessorKey,0) BillProcessorKey
		, 'CBS_ACCOUNT_CREDITS_RP_OS_TRACKING' FromTableNm
		, (-1)*a.MoneyMoveAmt MoveAmt
		, a.MoneyMoveAmt AbsoluteMoveAmt
		, isnull(CheckId,'') CheckId
		, isnull(cast(a.EMPLOYERId as varchar)+replace(substring(convert(varchar(8),a.CBSTransactionDtTm,3),4,9),'/',''),'') Subledger1
		, isnull(dp.BatchId+' '+dp.ItemId,'') Subledger2
		, 'Initial' MoveTransactionTypeNm
		, a.PROCESS ProcessRecordTypeNm 
		, 'CBS'SourceSystemNm
		, -7 RowAuditKey
		, 0 RowDeleteInd
From	ChangedDeposits a
		left join FirstDate fd
			on	a.DepositId = fd.DepositId
				and a.CBSTransactionDtTm = fd.Date_Processed
				and a.MoneyMoveAmt = fd.MoneyMoveAmt
				and a.MoveTypeNm = fd.MoveTypeNm
				and  fd.To_client = a.EmployerId
----------------------------- client
		left join VBSDMReference.dbo.ClientXref c
			on	SourceId = a.EmployerId
				and IdTypeNm = 'Employer_Number' 
				and c.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d
			on	c.ClientIntegrationId = d.ClientIntegrationId
				and d.RowCurrentInd = 1
--------------------------Processor--------------------------------------
		left join DimBillProcessor dbp
			on	a.User_Id = dbp.BillProcessorUserId
				and dbp.RowCurrentInd = 1
----------------- Deposit
		left join VBSAnalytics..DimPDDeposit b
			on	a.DepositId = b.DepositId
-------------calculate adjustment --7/22
		left join ApplyAmt				
			on	isnull(b.PDDepositKey,0)  = ApplyAmt.EffectivePDDepositKey
				and a.CBSTransactionDtTm = ApplyAmt.CBSTransactionDtTm
				and a.MoveTypeNm=ApplyAmt.MoveTypeNm
				and a.MoveDetail = ApplyAmt.MoveDetail
				and  ApplyAmt.EffectiveEmployerId = a.EmployerId
		left join DimPDPayment dp
			on a.PaymentId = dp.PaymentId
where isnull(ApplyAmt.TotalAbsoluteMoneyMoveAmt ,0) <> isnull(a.MoneyMoveAmt,0)
end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveSplitPymt]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveSplitPymt]
/********************************************************/
/*					Split payments					*/
/*	Creates 2 records, delete payment and insert deposit*/
/********************************************************/
as

INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
--removed payments
select 

b.SplitDateKey MoveDateKey
,a.CBSTransactionDateKey CBSTransactionDateKey
,SplitDtTm MoveDtTm
,pp.PaymentReceiveDtTm CBSTransactionDtTm
,'Other' DebitCreditTypeNm
,'Split' MoveTypeNm
,'Split To DepositId ' + DepositId MoveDetail
,a.EffectiveEmployerId
,a.EffectiveClientKey
,a.EffectivePDPaymentKey
,a.EffectivePDDepositKey
,0 ToCarrierKey
,b.BillProcessorKey BillProcessorKey
,'CBS_ACCOUNT_CREDITS' FromTableNm
, -1 * SplitPaymentAmt MoveAmt
, SplitPaymentAmt AbsoluteMoveAmt
,''CheckId
,Subledger1
,Subledger2
, MoveTransactionTypeNm
,'Split' ProcessRecordTypeNm
,'CBS',-8,0
from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentSplit b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	d.EMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' =  MoveTypeNm
--and a.EmployerId = 6246

--added deposits

INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
--removed payments
select 

b.SplitDateKey MoveDateKey
,convert(varchar(8),DepositCreateDtTm,112) CBSTransactionDateKey
,SplitDtTm MoveDtTm
,DepositCreateDtTm CBSTransactionDtTm
,'Other' DebitCreditTypeNm
,'Split' MoveTypeNm
,'Split From PaymentId ' + PaymentId MoveDetail
,d.EmployerId EffectiveEmployerId
,isnull(d1.ClientKey,0) EffectiveClientKey --12/8
,0 EffectivePDPaymentKey
,b.ToPDDepositKey EffectivePDDepositKey
,0 ToCarrierKey
,b.BillProcessorKey BillProcessorKey
,'CBS_ACCOUNT_CREDITS' FromTableNm
, SplitPaymentAmt MoveAmt
, SplitPaymentAmt AbsoluteMoveAmt
,''CheckId
,cast(d.EmployerId as varchar)+replace(substring(convert(varchar(8),DepositCreateDtTm,3),4,9),'/','') Subledger1
,'' Subledger2
,MoveTransactionTypeNm
,'Split'ProcessRecordTypeNm
,'CBS'SourceSystemNm
,0 RowAuditKey
,0 RowDeleteInd

from	FactPDMoneyMove a 
		inner join dbo.FactPDPaymentSplit b
			on EffectivePDPaymentKey = FromPDPaymentKey
		inner join DimPDDeposit d
			on b.ToPDDepositKey = d.PDDepositKey
		left join VBSDMOds.dbo.CBS_COMPANY c
			on	a.EffectiveEMPLOYERID = c.EMPLOYER_NUMBER 
				and c.RowCurrentInd = 1
		inner join DimPDPayment pp
			on FromPDPaymentKey= pp.PDPaymentKey
				----------------------------- client
		left join VBSDMReference.dbo.ClientXref c1
			on	c1.SourceId = d.EmployerId
				and c1.IdTypeNm = 'Employer_Number' 
				and c1.RowCurrentInd = 1 
		left join VBSAnalytics.dbo.DimClient d1
			on	c1.ClientIntegrationId = d1.ClientIntegrationId
				and d1.RowCurrentInd = 1
where	'Credit' = DebitCreditTypeNm
		and 'Payment Entered' = MoveTypeNm
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveSuspenseCreate]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveSuspenseCreate]
/********************************************************/
/*					Suspense Created					*/
/*  													*/
/********************************************************/
as
begin
INSERT INTO [dbo].[FactPDMoneyMove]
           ([MoveDateKey]
           ,[CBSTransactionDateKey]
           ,[MoveDtTm]
           ,[CBSTransactionDtTm]
           ,[DebitCreditTypeNm]
           ,[MoveTypeNm]
           ,[MoveDetail]
           ,[EffectiveEmployerId]
           ,[EffectiveClientKey]
           ,[EffectivePDPaymentKey]
           ,[EffectivePDDepositKey]
           ,[ToCarrierKey]
		   ,BillProcessorKey
		   ,FromTableNm
           , [MoveAmt]
		   , AbsoluteMoveAmt
           ,[CheckId]
           ,[Subledger1]
           ,[Subledger2]
           ,[MoveTransactionTypeNm]
           ,[ProcessRecordTypeNm]
           ,[SourceSystemNm]
           ,[RowAuditKey]
           ,[RowDeleteInd])
select 
			[MoveDateKey]
           ,[CBSTransactionDateKey]
           ,[MoveDtTm]
           ,[CBSTransactionDtTm]
           ,[DebitCreditTypeNm]
           ,[MoveTypeNm]
           ,[MoveDetail]
           ,[EffectiveEmployerId]
           ,[EffectiveClientKey]
           ,[EffectivePDPaymentKey]
           ,[EffectivePDDepositKey]
           ,[ToCarrierKey]
		   ,BillProcessorKey
		   ,FromTableNm
           , [MoveAmt]
		   , AbsoluteMoveAmt
           ,[CheckId]
           ,[Subledger1]
           ,[Subledger2]
           ,[MoveTransactionTypeNm]
           ,[ProcessRecordTypeNm]
           ,'CBS'[SourceSystemNm]
           ,0 [RowAuditKey]
           ,0 [RowDeleteInd]
		   from(
select 
           convert(varchar(8),isnull(SuspenseCreateDtTm,DepositDtTm),112) [MoveDateKey]
           ,convert(varchar(8),DepositDtTm,112) [CBSTransactionDateKey]
           ,isnull(SuspenseCreateDtTm,DepositDtTm) [MoveDtTm]
           ,DepositDtTm [CBSTransactionDtTm]
           ,'Other' [DebitCreditTypeNm]
           ,'Suspense' [MoveTypeNm]
           ,'Suspense Created SuspenseId ' +SuspenseId [MoveDetail]
           ,b.EmployerId [EffectiveEmployerId]
           ,a.ClientKey [EffectiveClientKey]
           ,a.PDPaymentKey [EffectivePDPaymentKey]
           ,a.PDDepositKey [EffectivePDDepositKey]
           ,0 [ToCarrierKey]
		   ,a.MainBillProcessorKey BillProcessorKey
		   ,'CBS_EMPSUSPTRACK' FromTableNm
           , (-1)*RemainingSuspenseAmt [MoveAmt]
		   , RemainingSuspenseAmt AbsoluteMoveAmt
           ,''[CheckId]
           ,isnull(cast(b.EmployerId as varchar)+replace(substring(convert(varchar(8),b.DepositDtTm,3),4,9),'/',''),'') [Subledger1]
           ,isnull(c.BatchId+' '+c.ItemId,'') [Subledger2]
           ,'Initial' [MoveTransactionTypeNm]
           ,'Suspense Created' [ProcessRecordTypeNm]
		   ,row_number() over (partition by a.PDSuspenseKey order by SnapshotDateKey) RN

from [dbo].[FactPDSuspenseSnapshot] a 
inner join [dbo].[DimPDSuspense] b
on a.PDSuspenseKey=b.PDSuspenseKey
inner join DimPDPayment c
on a.PdPaymentKey =c.PdPaymentKey
)x where RN=1

end
GO
PRINT N'Creating [dbo].[InitialFactPDMoneyMoveSuspenseResolve]...';


GO
CREATE procedure [dbo].[InitialFactPDMoneyMoveSuspenseResolve]
/********************************************************/
/*					Suspense Resolved					*/
/*  													*/
/********************************************************/
as
begin
;with CTE as(
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
			+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) ) SuspenseId, min(cast(CDCExpireDtTm as datetime)) SuspenseDeleteDtTm
  FROM VBSDMOds.dbo.CBS_EMPSUSPTRACK a
  where RowDeleteInd=1 and CDCExpireDtTm is not NULL and CDCExpireDtTm>'1900-01-01'
  group by 'S'+right('000000'+cast(a.Employer_Number as varchar),6)+'_'+convert(varchar(8),a.PAYMENT_EFFECTIVE_DATE,112)
			+'_'
			+right('0'+cast(datepart(hh,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(minute,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('0'+cast(datepart(second,a.PAYMENT_EFFECTIVE_DATE) as varchar),2)
			+right('000'+cast(datepart(millisecond,a.PAYMENT_EFFECTIVE_DATE) as varchar),3)
			+'_'+a.Employee_SSN+'_'+upper ( ltrim ( rtrim ( isnull(a.Service_Code,'') ) ) )
			)

INSERT INTO dbo.FactPDMoneyMove
           (MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
           ,SourceSystemNm
           ,RowAuditKey
           ,RowDeleteInd)
select 
			MoveDateKey
           ,CBSTransactionDateKey
           ,MoveDtTm
           ,CBSTransactionDtTm
           ,DebitCreditTypeNm
           ,MoveTypeNm
           ,MoveDetail
           ,EffectiveEmployerId
           ,EffectiveClientKey
           ,EffectivePDPaymentKey
           ,EffectivePDDepositKey
           ,ToCarrierKey
		   ,BillProcessorKey
		   ,FromTableNm
           , MoveAmt
		   , AbsoluteMoveAmt
           ,CheckId
           ,Subledger1
           ,Subledger2
           ,MoveTransactionTypeNm
           ,ProcessRecordTypeNm
		   ,'CBS'
		   ,-9
		   ,0

from(
select 
           convert(varchar(8),isnull(SuspenseDeleteDtTm,DepositDtTm),112) MoveDateKey
           ,convert(varchar(8),DepositDtTm,112) CBSTransactionDateKey
           ,isnull(SuspenseDeleteDtTm,DepositDtTm) MoveDtTm
           ,DepositDtTm CBSTransactionDtTm
           ,'Other' DebitCreditTypeNm
           ,'Suspense' MoveTypeNm
           ,'Suspense Resolved SuspenseId ' +b.SuspenseId MoveDetail
           ,b.EmployerId EffectiveEmployerId
           ,a.ClientKey EffectiveClientKey
           ,a.PDPaymentKey EffectivePDPaymentKey
           ,a.PDDepositKey EffectivePDDepositKey
           ,0 ToCarrierKey
		   ,a.MainBillProcessorKey BillProcessorKey
		   ,'CBS_EMPSUSPTRACK' FromTableNm
           , RemainingSuspenseAmt MoveAmt
		   , RemainingSuspenseAmt AbsoluteMoveAmt
           ,''CheckId
           ,isnull(cast(b.EmployerId as varchar)+replace(substring(convert(varchar(8),b.DepositDtTm,3),4,9),'/',''),'') Subledger1
           ,isnull(c.BatchId+' '+c.ItemId,'') Subledger2
           ,'Initial' MoveTransactionTypeNm
           ,'Suspense Resolved' ProcessRecordTypeNm
		   ,row_number() over (partition by a.PDSuspenseKey order by SnapshotDateKey Desc) RN
from dbo.FactPDSuspenseSnapshot a 
	inner join dbo.DimPDSuspense b
		on a.PDSuspenseKey=b.PDSuspenseKey
	inner join DimPDPayment c
		on a.PdPaymentKey =c.PdPaymentKey
	inner join CTE
		on b.SuspenseId = CTE.SuspenseId
)x where RN=1

end
GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyDeleteFactPDDepositComplete] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactIssueNoFirstApplySnapshot] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactPDBillCreate] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactPDBillPolicyCntChange] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactPDCBSPolicyApply] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactPDClientPymtScore] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactPDDirectBillSwitchRequest] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyFactPDNotProcessAmtSnapshot] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyInsertFactPDDepositComplete] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DailyLoadFactPremiumPayment] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[InitialFactPDBillCreate] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[InitialFactPDBillPolicyCntChange] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[InitialFactPDCBSPolicyApply] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[InitialFactPDClientPymtScore] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[InitialFactPDDepositComplete] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Creating Permission...';


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[InitialLoadDimEnrollmentCompany] TO [DS_QVBS]
    AS [dbo];


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE VBSAnalytics;


GO
ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimBillProcessor_BillProcessorKey];

ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimCarrier_ToCarrierKey];

ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimClient_EffectiveClientKey];

ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimDate_MoveDateKey];

ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimDate_CBSTransactionDateKey];

ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimPDDeposit_EffectivePDDepositKey];

ALTER TABLE [dbo].[FactPDMoneyMove] WITH CHECK CHECK CONSTRAINT [FK_FactPDMoneyMove_DimPDPayment_EffectivePDPaymentKey];


GO
PRINT N'Update complete.';


GO
