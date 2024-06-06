CREATE TABLE [dbo].[Lotti]
(
[Id_Lotto] [int] NOT NULL IDENTITY(1, 1),
[Id_Articolo] [int] NULL,
[Codice_Lotto] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Tipo_Lotto] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Tipo_Stato_Lotto] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Data_Inserimento] [datetime] NULL,
[Data_Produzione] [datetime] NULL,
[Data_Scadenza] [datetime] NULL,
[Nr_Bancali] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lotti] ADD CONSTRAINT [PK_Lotti] PRIMARY KEY CLUSTERED ([Id_Lotto]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lotti] ADD CONSTRAINT [IX_Lotti] UNIQUE NONCLUSTERED ([Codice_Lotto], [Id_Tipo_Lotto], [Id_Articolo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lotti] ADD CONSTRAINT [FK_Lotti_Articoli] FOREIGN KEY ([Id_Articolo]) REFERENCES [dbo].[Articoli] ([Id_Articolo])
GO
ALTER TABLE [dbo].[Lotti] ADD CONSTRAINT [FK_Lotti_Lotti] FOREIGN KEY ([Id_Tipo_Stato_Lotto]) REFERENCES [dbo].[Tipo_Stato_Lotto] ([Id_Tipo_Stato_Lotto])
GO
ALTER TABLE [dbo].[Lotti] ADD CONSTRAINT [FK_Lotti_Tipo_Lotti] FOREIGN KEY ([Id_Tipo_Lotto]) REFERENCES [dbo].[Tipo_Lotti] ([Id_Tipo_Lotto])
GO
