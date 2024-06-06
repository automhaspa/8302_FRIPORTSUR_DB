CREATE TABLE [dbo].[Linee]
(
[Id_Linea] [int] NOT NULL,
[Id_Partizione] [int] NOT NULL,
[Id_Progressivo] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linee] ADD CONSTRAINT [PK_Linee] PRIMARY KEY CLUSTERED ([Id_Linea], [Id_Partizione], [Id_Progressivo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linee] ADD CONSTRAINT [FK_Linee_Partizioni] FOREIGN KEY ([Id_Partizione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
