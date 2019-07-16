CREATE TABLE [dbo].[offices]
(
[officeCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[addressLine1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[addressLine2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__offices__address__3D5E1FD2] DEFAULT (NULL),
[state] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__offices__state__3E52440B] DEFAULT (NULL),
[country] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[postalCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[territory] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[offices] ADD CONSTRAINT [PK_offices] PRIMARY KEY CLUSTERED  ([officeCode]) ON [PRIMARY]
GO
