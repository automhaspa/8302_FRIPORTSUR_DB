CREATE TABLE [dbo].[Tipo_Baie]
(
[Id_Tipo_Baia] [varchar] (2) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Baie] ADD CONSTRAINT [PK_Tipo_Baie] PRIMARY KEY CLUSTERED ([Id_Tipo_Baia]) ON [PRIMARY]
GO
