CREATE TABLE [dbo].[Regole]
(
[Id_Regola] [int] NOT NULL IDENTITY(1, 1),
[Nome] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Id_Insieme_Regole] [int] NOT NULL,
[Ordinamento] [bit] NOT NULL,
[Descrizione] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole] ADD CONSTRAINT [PK_Regole] PRIMARY KEY CLUSTERED ([Id_Regola]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Regole] ON [dbo].[Regole] ([Nome], [Id_Insieme_Regole]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole] ADD CONSTRAINT [FK_Regole_Regole_Insieme] FOREIGN KEY ([Id_Insieme_Regole]) REFERENCES [dbo].[Regole_Insieme] ([Id_Insieme_Regole])
GO
