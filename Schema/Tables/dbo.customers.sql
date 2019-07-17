CREATE TABLE [dbo].[customers]
(
[customerNumber] [smallint] NOT NULL,
[customerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[contactLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[contactFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[addressLine1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[addressLine2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[state] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[postalCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[salesRepEmployeeNumber] [smallint] NULL,
[creditLimit] [decimal] (10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED  ([customerNumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [FK_customers_customers] FOREIGN KEY ([salesRepEmployeeNumber]) REFERENCES [dbo].[employees] ([employeeNumber])
GO
EXEC sp_addextendedproperty N'MS_Description', N'stores customer’s data', 'SCHEMA', N'dbo', 'TABLE', N'customers', NULL, NULL
GO
