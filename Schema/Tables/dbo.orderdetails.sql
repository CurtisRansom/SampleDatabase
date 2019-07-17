CREATE TABLE [dbo].[orderdetails]
(
[orderNumber] [smallint] NOT NULL,
[productCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[quantityOrdered] [smallint] NOT NULL,
[priceEach] [decimal] (10, 2) NOT NULL,
[orderLineNumber] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orderdetails] ADD CONSTRAINT [PK_orderdetails] PRIMARY KEY CLUSTERED  ([orderNumber], [productCode]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orderdetails] ADD CONSTRAINT [FK_orderdetails_orderdetails] FOREIGN KEY ([orderNumber]) REFERENCES [dbo].[orders] ([orderNumber])
GO
ALTER TABLE [dbo].[orderdetails] ADD CONSTRAINT [FK_orderdetails_products] FOREIGN KEY ([productCode]) REFERENCES [dbo].[products] ([productCode])
GO
EXEC sp_addextendedproperty N'MS_Description', N'stores sales order line items for each sales order', 'SCHEMA', N'dbo', 'TABLE', N'orderdetails', NULL, NULL
GO
