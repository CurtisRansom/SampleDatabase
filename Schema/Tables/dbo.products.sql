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
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products] ADD CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED  ([productCode]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products] ADD CONSTRAINT [FK_products_productlines] FOREIGN KEY ([productLine]) REFERENCES [dbo].[productlines] ([productLine])
GO
