CREATE TABLE [dbo].[Tipo_Liste]
(
[Id_Tipo_Lista] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Liste] ADD CONSTRAINT [PK_Tipo_Liste] PRIMARY KEY CLUSTERED ([Id_Tipo_Lista]) ON [PRIMARY]
GO
