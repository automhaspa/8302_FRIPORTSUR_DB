CREATE TABLE [dbo].[Regole_Sequenza_Esclusione_Asi]
(
[Id_Sequenza_Regole_Esclusione_Asi] [int] NOT NULL IDENTITY(1, 1),
[Id_Sequenza_Regole] [int] NOT NULL,
[Descrizione] [varchar] (255) COLLATE Latin1_General_CI_AS NULL,
[Asi] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Tipo_Udc] [varchar] (1) COLLATE Latin1_General_CI_AS NULL,
[Id_Articolo] [int] NULL,
[Id_Lotto] [int] NULL,
[Id_Lotto_Produzione] [int] NULL,
[Id_Lotto_Stoccaggio] [int] NULL,
[Id_Cliente] [int] NULL,
[Id_Fornitore] [int] NULL,
[AsiSorgente] [varchar] (20) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Sequenza_Esclusione_Asi] ADD CONSTRAINT [PK_Regola_Sequenza_Esclusione_Asi] PRIMARY KEY CLUSTERED ([Id_Sequenza_Regole_Esclusione_Asi]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Sequenza_Esclusione_Asi] ADD CONSTRAINT [FK_Regole_Sequenza_Esclusione_Asi_Regole_Sequenza_Testata] FOREIGN KEY ([Id_Sequenza_Regole]) REFERENCES [dbo].[Regole_Sequenza_Testata] ([Id_Sequenza_Regole])
GO
