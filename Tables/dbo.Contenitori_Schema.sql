CREATE TABLE [dbo].[Contenitori_Schema]
(
[Id_Contenitore_Schema] [int] NOT NULL,
[Codice] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contenitori_Schema] ADD CONSTRAINT [PK_Contenitori_Schema] PRIMARY KEY CLUSTERED ([Id_Contenitore_Schema]) ON [PRIMARY]
GO
