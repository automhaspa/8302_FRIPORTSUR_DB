CREATE TABLE [dbo].[Adiacenze_Gruppi_Dettaglio]
(
[Id_Gruppo_Adiacenza_Dettaglio] [int] NOT NULL IDENTITY(1, 1),
[Id_Gruppo_Adiacenza] [int] NOT NULL,
[Id_Adiacenza] [int] NOT NULL,
[Min_Lu_No] [int] NULL,
[Max_Lu_No] [int] NULL,
[Ordine] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Gruppi_Dettaglio] ADD CONSTRAINT [PK_Adiacenze_Gruppi] PRIMARY KEY CLUSTERED ([Id_Gruppo_Adiacenza_Dettaglio]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Adiacenze_Gruppi_Dettaglio] ON [dbo].[Adiacenze_Gruppi_Dettaglio] ([Id_Adiacenza], [Id_Gruppo_Adiacenza]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adiacenze_Gruppi_Dettaglio] ADD CONSTRAINT [FK_Adiacenze_Gruppi_Adiacenze] FOREIGN KEY ([Id_Adiacenza]) REFERENCES [dbo].[Adiacenze] ([Id_Adiacenza])
GO
ALTER TABLE [dbo].[Adiacenze_Gruppi_Dettaglio] ADD CONSTRAINT [FK_Adiacenze_Gruppi_Dettaglio_Adiacenze_Gruppi_Testata] FOREIGN KEY ([Id_Gruppo_Adiacenza]) REFERENCES [dbo].[Adiacenze_Gruppi_Testata] ([Id_Gruppo_Adiacenza])
GO
