CREATE TABLE [dbo].[Baie]
(
[Id_Partizione] [int] NOT NULL,
[Id_Pc] [int] NOT NULL,
[Id_Tipo_Baia] [varchar] (2) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Baie] ADD CONSTRAINT [PK_Baie] PRIMARY KEY CLUSTERED ([Id_Partizione], [Id_Pc], [Id_Tipo_Baia]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Baie] ADD CONSTRAINT [FK_Baie_Partizioni] FOREIGN KEY ([Id_Partizione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Baie] ADD CONSTRAINT [FK_Baie_Pc] FOREIGN KEY ([Id_Pc]) REFERENCES [dbo].[Pc] ([Id_Pc])
GO
ALTER TABLE [dbo].[Baie] ADD CONSTRAINT [FK_Baie_Tipo_Baie] FOREIGN KEY ([Id_Tipo_Baia]) REFERENCES [dbo].[Tipo_Baie] ([Id_Tipo_Baia])
GO
