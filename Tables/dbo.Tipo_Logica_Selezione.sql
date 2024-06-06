CREATE TABLE [dbo].[Tipo_Logica_Selezione]
(
[Id_Tipo_Logica_Selezione] [int] NOT NULL,
[Descrizione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Logica_Selezione] ADD CONSTRAINT [PK_Tipo_Logica_Selezione_Id] PRIMARY KEY CLUSTERED ([Id_Tipo_Logica_Selezione]) ON [PRIMARY]
GO
