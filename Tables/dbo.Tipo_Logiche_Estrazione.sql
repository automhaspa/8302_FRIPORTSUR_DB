CREATE TABLE [dbo].[Tipo_Logiche_Estrazione]
(
[Id_Tipo_Logica_Estrazione] [int] NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Logiche_Estrazione] ADD CONSTRAINT [PK_Tipo_Logica_Estrazione] PRIMARY KEY CLUSTERED ([Id_Tipo_Logica_Estrazione]) ON [PRIMARY]
GO
