CREATE TABLE [dbo].[Tipo_Stato_Lista]
(
[Id_Tipo_Stato_Lista] [int] NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Stato_Lista] ADD CONSTRAINT [PK_Tipo_Stato_Lista] PRIMARY KEY CLUSTERED ([Id_Tipo_Stato_Lista]) ON [PRIMARY]
GO
