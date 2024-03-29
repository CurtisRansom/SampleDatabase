/*
Run this script on:

        dev-babelbox01.babelstreet.com.SourceControlTest    -  This database will be modified

to synchronize it with:

        dev-babelbox01.babelstreet.com.SourceControlTest

You are recommended to back up your database before running this script

Script created by SQL Compare version 13.7.16.11325 from Red Gate Software Ltd at 7/16/2019 2:21:36 PM

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
PRINT N'Creating [dbo].[payments]'
GO
CREATE TABLE [dbo].[payments]
(
[customerNumber] [smallint] NOT NULL,
[checkNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[paymentDate] [date] NOT NULL,
[amount] [decimal] (10, 2) NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_payments] on [dbo].[payments]'
GO
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED  ([customerNumber], [checkNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[productlines]'
GO
CREATE TABLE [dbo].[productlines]
(
[productLine] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[textDescription] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__productli__textD__47DBAE45] DEFAULT (NULL),
[htmlDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[image] [varbinary] (max) NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_productlines] on [dbo].[productlines]'
GO
ALTER TABLE [dbo].[productlines] ADD CONSTRAINT [PK_productlines] PRIMARY KEY CLUSTERED  ([productLine])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[products]'
GO
CREATE TABLE [dbo].[products]
(
[productCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[productName] [varchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[productLine] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[productScale] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[productVendor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[productDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[quantityInStock] [smallint] NOT NULL,
[buyPrice] [decimal] (10, 2) NOT NULL,
[MSRP] [decimal] (10, 2) NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_products] on [dbo].[products]'
GO
ALTER TABLE [dbo].[products] ADD CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED  ([productCode])
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
PRINT N'Adding foreign keys to [dbo].[payments]'
GO
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK_payments_customers] FOREIGN KEY ([customerNumber]) REFERENCES [dbo].[customers] ([customerNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[products]'
GO
ALTER TABLE [dbo].[products] ADD CONSTRAINT [FK_products_productlines] FOREIGN KEY ([productLine]) REFERENCES [dbo].[productlines] ([productLine])
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
