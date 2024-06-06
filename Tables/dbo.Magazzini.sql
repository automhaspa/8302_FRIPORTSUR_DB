CREATE TABLE [dbo].[Magazzini]
(
[Id_Stabilimento] [int] NOT NULL,
[Id_Magazzino] [int] NOT NULL IDENTITY(1, 1),
[Codice_Abbreviato] [varchar] (4) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Tipo_Magazzino] [int] NOT NULL,
[Ricerca_Destinazione] [varchar] (1) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Magazzini] ADD CONSTRAINT [PK_Magazzini] PRIMARY KEY CLUSTERED ([Id_Magazzino]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Magazzini] ADD CONSTRAINT [FK_Magazzini_Stabilimenti] FOREIGN KEY ([Id_Stabilimento]) REFERENCES [dbo].[Stabilimenti] ([Id_Stabilimento])
GO
