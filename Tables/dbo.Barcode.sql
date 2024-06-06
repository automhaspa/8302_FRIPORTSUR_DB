CREATE TABLE [dbo].[Barcode]
(
[Id_Barcode] [int] NOT NULL IDENTITY(1, 1),
[Barcode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Id_Articolo] [int] NULL,
[Id_Azienda_Cliente] [int] NULL,
[Id_Azienda_Fornitore] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Barcode] ADD CONSTRAINT [PK_Barcode] PRIMARY KEY CLUSTERED ([Id_Barcode]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Barcode] ADD CONSTRAINT [IX_BARCODE] UNIQUE NONCLUSTERED ([Barcode], [Id_Articolo], [Id_Azienda_Cliente], [Id_Azienda_Fornitore]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Barcode] ADD CONSTRAINT [FK_Barcode_Articoli] FOREIGN KEY ([Id_Articolo]) REFERENCES [dbo].[Articoli] ([Id_Articolo])
GO
ALTER TABLE [dbo].[Barcode] ADD CONSTRAINT [FK_Barcode_Clienti] FOREIGN KEY ([Id_Azienda_Cliente]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Barcode] ADD CONSTRAINT [FK_Barcode_Fornitori] FOREIGN KEY ([Id_Azienda_Fornitore]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
