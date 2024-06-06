CREATE TABLE [dbo].[Partizioni_Redirect]
(
[Id_Partizione_Sorgente] [int] NOT NULL,
[Id_Partizione_Destinazione] [int] NOT NULL,
[Id_Tipo_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partizioni_Redirect] ADD CONSTRAINT [PK_Partizioni_Redirect] PRIMARY KEY CLUSTERED ([Id_Partizione_Sorgente], [Id_Partizione_Destinazione], [Id_Tipo_Missione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partizioni_Redirect] ADD CONSTRAINT [FK_Partizioni_Redirect_Partizioni] FOREIGN KEY ([Id_Partizione_Sorgente]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Partizioni_Redirect] ADD CONSTRAINT [FK_Partizioni_Redirect_Partizioni1] FOREIGN KEY ([Id_Partizione_Destinazione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Partizioni_Redirect] ADD CONSTRAINT [FK_Partizioni_Redirect_Tipo_Missioni] FOREIGN KEY ([Id_Tipo_Missione]) REFERENCES [dbo].[Tipo_Missioni] ([Id_Tipo_Missione])
GO
