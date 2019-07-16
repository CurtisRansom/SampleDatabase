/*
Run this script on:

        dev-babelbox01.babelstreet.com.SourceControlTest    -  This database will be modified

to synchronize it with:

        dev-babelbox01.babelstreet.com.SourceControlTest

You are recommended to back up your database before running this script

Script created by SQL Compare version 13.7.16.11325 from Red Gate Software Ltd at 7/16/2019 1:32:18 PM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_customers]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [FK_customers_customers] FOREIGN KEY ([salesRepEmployeeNumber]) REFERENCES [dbo].[employees] ([employeeNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [FK_employees_employees1] FOREIGN KEY ([reportsTo]) REFERENCES [dbo].[employees] ([employeeNumber])
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [FK_employees_offices] FOREIGN KEY ([officeCode]) REFERENCES [dbo].[offices] ([officeCode])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
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
