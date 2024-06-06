CREATE TABLE [dbo].[Liste_Dettaglio]
(
[Id_Lista_Dettaglio] [int] NOT NULL IDENTITY(1, 1),
[Id_Lista] [int] NOT NULL,
[Codice] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Codice_Udc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id_Articolo] [int] NULL,
[Id_Lotto] [int] NULL,
[Id_Azienda_Cliente] [int] NULL,
[Id_Azienda_Fornitore] [int] NULL,
[Id_Imbalaggio] [int] NULL,
[Matricola] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Data_Scadenza] [datetime] NULL,
[Id_Tipo_Unita_Misura] [int] NULL,
[Id_Tipo_Logica_Selezione] [int] NULL,
[Qta_Richiesta] [numeric] (18, 4) NOT NULL,
[Qta_Accettata] [numeric] (18, 4) NULL,
[Qta_Evasa] [numeric] (18, 4) NOT NULL,
[Jolly1] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Jolly2] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Pezzi_Per_Collo] [int] NULL,
[Sequenza] [int] NULL,
[Data_Creazione] [datetime] NULL,
[Data_Aggiornamento] [datetime] NULL,
[Label_Aggiuntive] [xml] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [PK_Liste_Dettaglio] PRIMARY KEY CLUSTERED ([Id_Lista_Dettaglio]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Liste_Dettaglio] ON [dbo].[Liste_Dettaglio] ([Codice], [Id_Lista]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [FK_Liste_Dettaglio_Articoli] FOREIGN KEY ([Id_Articolo]) REFERENCES [dbo].[Articoli] ([Id_Articolo])
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [FK_Liste_Dettaglio_Aziende_Cliente] FOREIGN KEY ([Id_Azienda_Cliente]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [FK_Liste_Dettaglio_Aziende_Fornitore] FOREIGN KEY ([Id_Azienda_Fornitore]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [FK_Liste_Dettaglio_Imballaggi] FOREIGN KEY ([Id_Imbalaggio]) REFERENCES [dbo].[Imballaggi] ([Id_Imballaggio])
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [FK_Liste_Dettaglio_Liste] FOREIGN KEY ([Id_Lista]) REFERENCES [dbo].[Liste] ([Id_Lista])
GO
ALTER TABLE [dbo].[Liste_Dettaglio] ADD CONSTRAINT [FK_Liste_Dettaglio_Lotti] FOREIGN KEY ([Id_Lotto]) REFERENCES [dbo].[Lotti] ([Id_Lotto])
GO
