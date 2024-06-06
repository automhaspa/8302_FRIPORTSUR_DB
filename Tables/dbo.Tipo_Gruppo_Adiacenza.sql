CREATE TABLE [dbo].[Tipo_Gruppo_Adiacenza]
(
[Id_Tipo_Gruppo_Adiacenza] [int] NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Gruppo_Adiacenza] ADD CONSTRAINT [PK_Tipo_Gruppo_Adiacenza] PRIMARY KEY CLUSTERED ([Id_Tipo_Gruppo_Adiacenza]) ON [PRIMARY]
GO
