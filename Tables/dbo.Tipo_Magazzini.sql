CREATE TABLE [dbo].[Tipo_Magazzini]
(
[Id_Tipo_Magazzino] [int] NOT NULL IDENTITY(1, 1),
[Descrizione] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Selezionabile] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Magazzini] ADD CONSTRAINT [PK_Tipo_Magazzini] PRIMARY KEY CLUSTERED ([Id_Tipo_Magazzino]) ON [PRIMARY]
GO
