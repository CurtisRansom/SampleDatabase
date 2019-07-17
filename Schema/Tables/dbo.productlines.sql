CREATE TABLE [dbo].[productlines]
(
[productLine] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[textDescription] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__productli__textD__47DBAE45] DEFAULT (NULL),
[htmlDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[image] [varbinary] (max) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[productlines] ADD CONSTRAINT [PK_productlines] PRIMARY KEY CLUSTERED  ([productLine]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'stores a list of product line categories', 'SCHEMA', N'dbo', 'TABLE', N'productlines', NULL, NULL
GO
