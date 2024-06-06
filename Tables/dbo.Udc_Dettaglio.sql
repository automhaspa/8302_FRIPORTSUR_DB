CREATE TABLE [dbo].[Udc_Dettaglio]
(
[Id_UdcDettaglio] [int] NOT NULL IDENTITY(1, 1),
[Id_Udc] [int] NOT NULL,
[Id_Articolo] [int] NOT NULL,
[Id_Lotto_Produzione] [int] NULL,
[Id_Lotto_Stoccaggio] [int] NULL,
[Id_Imballaggio] [int] NULL,
[Matricola] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Id_Azienda_Cliente] [int] NULL,
[Id_Azienda_Fornitore] [int] NULL,
[Id_Contenitore] [int] NULL,
[Id_Unita_Misura] [varchar] (3) COLLATE Latin1_General_CI_AS NULL,
[Data_Inserimento] [datetime] NOT NULL,
[Data_Produzione] [datetime] NULL,
[Data_Scadenza] [datetime] NULL,
[Quantita_Pezzi] [numeric] (18, 4) NOT NULL CONSTRAINT [DF_Saldi_Dettaglio_QT_PEZZI] DEFAULT ((0)),
[Qta_Massima] [numeric] (18, 4) NULL,
[Flag_Persistenza] [bit] NOT NULL,
[Label_Aggiuntive] [xml] NULL,
[Pezzi_Per_Collo] [int] NULL,
[DaPackagingKit] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [CK_Udc_Dettaglio] CHECK (([Quantita_Pezzi]>=(0)))
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [PK__Udc_Dett__A000DB8866B4C6D1] PRIMARY KEY CLUSTERED ([Id_UdcDettaglio]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [IX_Udc_Dettaglio_1] UNIQUE NONCLUSTERED ([Id_Articolo], [Id_Lotto_Produzione], [Id_Lotto_Stoccaggio], [Matricola], [Id_Imballaggio], [Id_Udc], [Id_Azienda_Cliente], [Id_Azienda_Fornitore], [Id_Contenitore]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Articoli] FOREIGN KEY ([Id_Articolo]) REFERENCES [dbo].[Articoli] ([Id_Articolo])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Aziende_Clienti] FOREIGN KEY ([Id_Azienda_Cliente]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Aziende_Fornitori] FOREIGN KEY ([Id_Azienda_Fornitore]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Contenitori] FOREIGN KEY ([Id_Contenitore]) REFERENCES [dbo].[Contenitori] ([Id_Contenitore])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Imballaggi] FOREIGN KEY ([Id_Imballaggio]) REFERENCES [dbo].[Imballaggi] ([Id_Imballaggio])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Lotti_Produzione] FOREIGN KEY ([Id_Lotto_Produzione]) REFERENCES [dbo].[Lotti] ([Id_Lotto])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Lotti_Stoccaggio] FOREIGN KEY ([Id_Lotto_Stoccaggio]) REFERENCES [dbo].[Lotti] ([Id_Lotto])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Tipo_Unita_Misura] FOREIGN KEY ([Id_Unita_Misura]) REFERENCES [dbo].[Tipo_Unita_Misura] ([Id_Unita_Misura])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Udc_Dettaglio] FOREIGN KEY ([Id_UdcDettaglio]) REFERENCES [dbo].[Udc_Dettaglio] ([Id_UdcDettaglio])
GO
ALTER TABLE [dbo].[Udc_Dettaglio] ADD CONSTRAINT [FK_Udc_Dettaglio_Udc_Testata] FOREIGN KEY ([Id_Udc]) REFERENCES [dbo].[Udc_Testata] ([Id_Udc])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Campo ke indica la persistenza dell''articolo se è a zero;la persistenza e la qta massima caricabile d quell''articolo se è maggiore di zero;neinte se è a null.', 'SCHEMA', N'dbo', 'TABLE', N'Udc_Dettaglio', 'COLUMN', N'Qta_Massima'
GO
