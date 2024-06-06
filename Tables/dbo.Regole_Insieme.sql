CREATE TABLE [dbo].[Regole_Insieme]
(
[Id_Insieme_Regole] [int] NOT NULL IDENTITY(1, 1),
[Descrizione] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Insieme] ADD CONSTRAINT [PK_Regole_Elenco] PRIMARY KEY CLUSTERED ([Id_Insieme_Regole]) ON [PRIMARY]
GO
