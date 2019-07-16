CREATE TABLE [dbo].[payments]
(
[customerNumber] [smallint] NOT NULL,
[checkNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[paymentDate] [date] NOT NULL,
[amount] [decimal] (10, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED  ([customerNumber], [checkNumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK_payments_customers] FOREIGN KEY ([customerNumber]) REFERENCES [dbo].[customers] ([customerNumber])
GO
