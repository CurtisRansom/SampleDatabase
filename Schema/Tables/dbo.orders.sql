CREATE TABLE [dbo].[orders]
(
[orderNumber] [smallint] NOT NULL,
[orderDate] [date] NOT NULL,
[requiredDate] [date] NOT NULL,
[shippedDate] [date] NULL CONSTRAINT [DF__orders__shippedD__59063A47] DEFAULT (NULL),
[status] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[comments] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[customerNumber] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders] ADD CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED  ([orderNumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders] ADD CONSTRAINT [FK_orders_customers] FOREIGN KEY ([customerNumber]) REFERENCES [dbo].[customers] ([customerNumber])
GO
