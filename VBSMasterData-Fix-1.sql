/*
Run this script on:

        LKF-DSQL04\DEV.VBSMasterData    -  This database will be modified

to synchronize it with:

        LKF-DSQL04\DEV.VBSMasterData_test

You are recommended to back up your database before running this script

Script created by SQL Compare version 11.3.0 from Red Gate Software Ltd at 4/12/2016 9:21:31 AM

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
PRINT N'Dropping foreign keys from [dbo].[AgentAddressXref]'
GO
ALTER TABLE [dbo].[AgentAddressXref] DROP CONSTRAINT [FK_AgentAddressXref_AgentNumber_AgentNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[AgentBankDetail]'
GO
ALTER TABLE [dbo].[AgentBankDetail] DROP CONSTRAINT [FK_AgentBankDetail_AgentNumber_AgentNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[AgentFollowUp]'
GO
ALTER TABLE [dbo].[AgentFollowUp] DROP CONSTRAINT [FK_AgentFollowUp_AgentNumber_AgentNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[AgentDetail]'
GO
ALTER TABLE [dbo].[AgentDetail] DROP CONSTRAINT [FK_AgentNumberDetail_AgentNumber_AgentNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[AgentOriginalNumber]'
GO
ALTER TABLE [dbo].[AgentOriginalNumber] DROP CONSTRAINT [FK_AgentOriginalNumber_AgentNumber_AgentNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[AgentPhoneXref]'
GO
ALTER TABLE [dbo].[AgentPhoneXref] DROP CONSTRAINT [FK_AgentPhoneXref_AgentNumber_AgentNo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[AgentNumber]'
GO
ALTER TABLE [dbo].[AgentNumber] DROP CONSTRAINT [PK_AgentNumber]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_AgentNumber] on [dbo].[AgentNumber]'
GO
ALTER TABLE [dbo].[AgentNumber] ADD CONSTRAINT [PK_AgentNumber] PRIMARY KEY NONCLUSTERED  ([AgentNo])
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
PRINT N'Adding foreign keys to [dbo].[AgentFollowUp]'
GO
ALTER TABLE [dbo].[AgentFollowUp] ADD CONSTRAINT [FK_AgentFollowUp_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[AgentDetail]'
GO
ALTER TABLE [dbo].[AgentDetail] ADD CONSTRAINT [FK_AgentNumberDetail_AgentNumber_AgentNo] FOREIGN KEY ([AgentNo]) REFERENCES [dbo].[AgentNumber] ([AgentNo])
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