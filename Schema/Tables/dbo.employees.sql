CREATE TABLE [dbo].[employees]
(
[employeeNumber] [smallint] NOT NULL,
[lastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[firstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[extension] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[officeCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[reportsTo] [smallint] NULL CONSTRAINT [DF__employees__repor__3A81B327] DEFAULT (NULL),
[jobTitle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED  ([employeeNumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [FK_employees_employees1] FOREIGN KEY ([reportsTo]) REFERENCES [dbo].[employees] ([employeeNumber])
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [FK_employees_offices] FOREIGN KEY ([officeCode]) REFERENCES [dbo].[offices] ([officeCode])
GO
EXEC sp_addextendedproperty N'MS_Description', N'stores all employee information as well as the organization structure such as who reports to whom', 'SCHEMA', N'dbo', 'TABLE', N'employees', NULL, NULL
GO
