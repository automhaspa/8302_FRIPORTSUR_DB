CREATE TABLE [dbo].[Tipo_Autosat]
(
[Id_Tipo_Autosat] [int] NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Autosat] ADD CONSTRAINT [PK_Tipo_Autosat] PRIMARY KEY CLUSTERED ([Id_Tipo_Autosat]) ON [PRIMARY]
GO
