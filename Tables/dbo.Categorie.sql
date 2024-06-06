CREATE TABLE [dbo].[Categorie]
(
[Id_Categoria] [int] NOT NULL IDENTITY(1, 1),
[Codice] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id_Categoria_Padre] [int] NULL,
[Descrizione] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Data_Importazione] [datetime] NULL,
[Data_Creazione] [datetime] NULL,
[Data_Aggiornamento] [datetime] NULL,
[Attributi_Aggiuntivi] [xml] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categorie] ADD CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED ([Id_Categoria]) ON [PRIMARY]
GO
