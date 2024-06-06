CREATE TABLE [dbo].[Liste]
(
[Id_Lista] [int] NOT NULL IDENTITY(1, 1),
[Codice] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Lista] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Tipo_Stato_Lista] [int] NOT NULL,
[Id_Lista_Padre] [int] NULL,
[Priorita] [int] NOT NULL,
[Data_Creazione] [datetime] NOT NULL,
[Data_Importazione] [datetime] NULL,
[Data_Esecuzione] [datetime] NULL,
[Data_Evasione] [datetime] NULL,
[Data_Previsione] [datetime] NULL,
[Id_Azienda_Cliente] [int] NULL,
[Id_Azienda_Fornitore] [int] NULL,
[Label_Aggiuntive] [xml] NULL,
[Utente_Creazione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Utente_Esecuzione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Ordine_Estrazione] [int] NULL,
[Id_Tipo_Logica_Estrazione] [int] NULL,
[Id_Partizione_Destinazione] [int] NULL,
[Destinazione] [varchar] (20) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [PK_Liste] PRIMARY KEY CLUSTERED ([Id_Lista]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Liste] ON [dbo].[Liste] ([Codice], [Id_Tipo_Lista]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Aziende_Clienti] FOREIGN KEY ([Id_Azienda_Cliente]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Aziende_Fornitori] FOREIGN KEY ([Id_Azienda_Fornitore]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Liste] FOREIGN KEY ([Id_Tipo_Lista]) REFERENCES [dbo].[Tipo_Liste] ([Id_Tipo_Lista])
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Liste_Padre] FOREIGN KEY ([Id_Lista_Padre]) REFERENCES [dbo].[Liste] ([Id_Lista])
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Partizioni] FOREIGN KEY ([Id_Partizione_Destinazione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Tipo_Logica_Estrazione] FOREIGN KEY ([Id_Tipo_Logica_Estrazione]) REFERENCES [dbo].[Tipo_Logiche_Estrazione] ([Id_Tipo_Logica_Estrazione])
GO
ALTER TABLE [dbo].[Liste] ADD CONSTRAINT [FK_Liste_Tipo_Stato_Lista] FOREIGN KEY ([Id_Tipo_Stato_Lista]) REFERENCES [dbo].[Tipo_Stato_Lista] ([Id_Tipo_Stato_Lista])
GO
