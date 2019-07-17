/*
Run this script on:

        dev-babelbox01.babelstreet.com.SourceControlTest    -  This database will be modified

to synchronize it with:

        dev-babelbox01.babelstreet.com.SourceControlTest

You are recommended to back up your database before running this script

Script created by SQL Compare version 13.7.16.11325 from Red Gate Software Ltd at 7/16/2019 9:01:55 PM

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
PRINT N'Creating [dbo].[orders]'
GO
CREATE TABLE [dbo].[orders]
(
[orderNumber] [smallint] NOT NULL,
[orderDate] [date] NOT NULL,
[requiredDate] [date] NOT NULL,
[shippedDate] [date] NULL CONSTRAINT [DF__orders__shippedD__59063A47] DEFAULT (NULL),
[status] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[comments] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[customerNumber] [smallint] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_orders] on [dbo].[orders]'
GO
ALTER TABLE [dbo].[orders] ADD CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED  ([orderNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[orderdetails]'
GO
CREATE TABLE [dbo].[orderdetails]
(
[orderNumber] [smallint] NOT NULL,
[productCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[quantityOrdered] [smallint] NOT NULL,
[priceEach] [decimal] (10, 2) NOT NULL,
[orderLineNumber] [smallint] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_orderdetails] on [dbo].[orderdetails]'
GO
ALTER TABLE [dbo].[orderdetails] ADD CONSTRAINT [PK_orderdetails] PRIMARY KEY CLUSTERED  ([orderNumber], [productCode])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[orderdetails]'
GO
ALTER TABLE [dbo].[orderdetails] ADD CONSTRAINT [FK_orderdetails_orderdetails] FOREIGN KEY ([orderNumber]) REFERENCES [dbo].[orders] ([orderNumber])
GO
ALTER TABLE [dbo].[orderdetails] ADD CONSTRAINT [FK_orderdetails_products] FOREIGN KEY ([productCode]) REFERENCES [dbo].[products] ([productCode])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[orders]'
GO
ALTER TABLE [dbo].[orders] ADD CONSTRAINT [FK_orders_customers] FOREIGN KEY ([customerNumber]) REFERENCES [dbo].[customers] ([customerNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating extended properties'
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores customer’s data', 'SCHEMA', N'dbo', 'TABLE', N'customers', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores all employee information as well as the organization structure such as who reports to whom', 'SCHEMA', N'dbo', 'TABLE', N'employees', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores sales office data', 'SCHEMA', N'dbo', 'TABLE', N'offices', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores sales order line items for each sales order', 'SCHEMA', N'dbo', 'TABLE', N'orderdetails', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores sales orders placed by customers', 'SCHEMA', N'dbo', 'TABLE', N'orders', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores payments made by customers based on their accounts', 'SCHEMA', N'dbo', 'TABLE', N'payments', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores a list of product line categories', 'SCHEMA', N'dbo', 'TABLE', N'productlines', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'stores a list of scale model cars', 'SCHEMA', N'dbo', 'TABLE', N'products', NULL, NULL
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
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
