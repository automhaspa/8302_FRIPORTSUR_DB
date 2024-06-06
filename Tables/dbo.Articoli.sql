CREATE TABLE [dbo].[Articoli]
(
[Id_Articolo] [int] NOT NULL IDENTITY(1, 1),
[Codice] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[Barcode] [varchar] (50) COLLATE Latin1_General_CI_AS NULL CONSTRAINT [DF_Articoli_Barcode] DEFAULT ('?'),
[Id_Unita_Misura] [varchar] (3) COLLATE Latin1_General_CI_AS NULL,
[Note] [varchar] (255) COLLATE Latin1_General_CI_AS NULL,
[Qta_Massima_Udc] [numeric] (14, 4) NULL,
[Qta_SottoScorta] [numeric] (14, 4) NULL,
[Classe] [varchar] (1) COLLATE Latin1_General_CI_AS NULL,
[Peso] [numeric] (14, 4) NULL,
[Data_Importazione] [datetime] NULL,
[Data_Creazione] [datetime] NULL,
[Data_Aggiornamento] [datetime] NULL,
[Attributi_Aggiuntivi] [xml] NULL,
[Indice_Rotazione] [char] (1) COLLATE Latin1_General_CI_AS NULL,
[Id_Categoria] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articoli] ADD CONSTRAINT [PK_Articoli] PRIMARY KEY CLUSTERED ([Id_Articolo]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Codice] ON [dbo].[Articoli] ([Codice]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articoli] ADD CONSTRAINT [FK_Articoli_Categorie] FOREIGN KEY ([Id_Categoria]) REFERENCES [dbo].[Categorie] ([Id_Categoria])
GO
