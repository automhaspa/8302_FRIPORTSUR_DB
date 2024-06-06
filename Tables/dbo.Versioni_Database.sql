CREATE TABLE [dbo].[Versioni_Database]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Timestamp] [datetime] NOT NULL CONSTRAINT [DF_Versioni_Database_Timestamp] DEFAULT (getdate()),
[Versione] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Versioni_Database] ADD CONSTRAINT [PK_Versioni_Database] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
