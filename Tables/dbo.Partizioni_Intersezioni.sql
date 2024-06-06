CREATE TABLE [dbo].[Partizioni_Intersezioni]
(
[Id_Partizione] [int] NOT NULL,
[Id_Tipo_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partizioni_Intersezioni] ADD CONSTRAINT [PK_Partizioni_Intersezioni] PRIMARY KEY CLUSTERED ([Id_Partizione], [Id_Tipo_Missione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partizioni_Intersezioni] ADD CONSTRAINT [FK_Partizioni_Intersezioni_Partizioni] FOREIGN KEY ([Id_Partizione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Partizioni_Intersezioni] ADD CONSTRAINT [FK_Partizioni_Intersezioni_Tipo_Missioni] FOREIGN KEY ([Id_Tipo_Missione]) REFERENCES [dbo].[Tipo_Missioni] ([Id_Tipo_Missione])
GO
