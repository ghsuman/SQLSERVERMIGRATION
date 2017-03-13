/*
Run this script on:

        LKF-DSQL04\DEV.VBSMasterData    -  This database will be modified

to synchronize it with:

        LKF-DSQL04\DEV.VBSMasterData_test

You are recommended to back up your database before running this script

Script created by SQL Compare version 11.3.0 from Red Gate Software Ltd at 4/11/2016 6:10:23 PM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[AgentBankDetail]'
GO
ALTER TABLE [dbo].[AgentBankDetail] DROP CONSTRAINT [PK_AgentBankKey_AccountNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[AgentDetail]'
GO
ALTER TABLE [dbo].[AgentDetail] DROP CONSTRAINT [PK_AgentDetail]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[AgentOriginalNumber]'
GO
ALTER TABLE [dbo].[AgentOriginalNumber] DROP CONSTRAINT [PK_AgentOriginalNumber]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_AgentBankKey] on [dbo].[AgentBankDetail]'
GO
ALTER TABLE [dbo].[AgentBankDetail] ADD CONSTRAINT [PK_AgentBankKey] PRIMARY KEY CLUSTERED  ([AgentBankKey])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_OriginalAgentNumber] on [dbo].[AgentOriginalNumber]'
GO
ALTER TABLE [dbo].[AgentOriginalNumber] ADD CONSTRAINT [PK_OriginalAgentNumber] PRIMARY KEY CLUSTERED  ([OriginalAgentNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_AgentDetailKey] on [dbo].[AgentDetail]'
GO
ALTER TABLE [dbo].[AgentDetail] ADD CONSTRAINT [PK_AgentDetailKey] PRIMARY KEY NONCLUSTERED  ([AgentDetailKey])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_AgentNumber] on [dbo].[AgentNumber]'
GO
--ALTER TABLE [dbo].[AgentNumber] ADD CONSTRAINT [PK_AgentNumber] PRIMARY KEY NONCLUSTERED  ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentAddressXref]'
GO
ALTER TABLE [dbo].[AgentAddressXref] ADD CONSTRAINT [FK_AgentAddressXref_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentBankDetail]'
GO
ALTER TABLE [dbo].[AgentBankDetail] ADD CONSTRAINT [FK_AgentBankDetail_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentDetail]'
GO
ALTER TABLE [dbo].[AgentDetail] ADD CONSTRAINT [FK_AgentNumberDetail_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentFollowUp]'
GO
ALTER TABLE [dbo].[AgentFollowUp] ADD CONSTRAINT [FK_AgentFollowUp_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentNumber]'
GO
ALTER TABLE [dbo].[AgentNumber] ADD CONSTRAINT [FK_AgentNumberDetail_AgentNPN_NPN] FOREIGN KEY ([NPN]) REFERENCES [dbo].[AgentNPN] ([NPN])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentOriginalNumber]'
GO
ALTER TABLE [dbo].[AgentOriginalNumber] ADD CONSTRAINT [FK_AgentOriginalNumber_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentPhoneXref]'
GO
ALTER TABLE [dbo].[AgentPhoneXref] ADD CONSTRAINT [FK_AgentPhoneXref_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO