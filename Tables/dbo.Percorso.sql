CREATE TABLE [dbo].[Percorso]
(
[Id_Missione] [int] NOT NULL,
[Id_Sequenza_Percorso] [int] NOT NULL,
[Id_Partizione_Sorgente] [int] NULL,
[Id_Partizione_Destinazione] [int] NULL,
[Descrizione] [varchar] (80) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Stato_Percorso] [int] NOT NULL CONSTRAINT [DF_Percorso_Tipo_Stato_Percorso] DEFAULT ((1)),
[Id_Adiacenza] [int] NULL,
[Id_Adiacenza_Composta] [int] NULL,
[sX] [int] NULL,
[sY] [int] NULL,
[sZ] [int] NULL,
[dX] [int] NULL,
[dY] [int] NULL,
[dZ] [int] NULL,
[Id_Errore_Percorso] [int] NULL,
[Ultima_Esecuzione] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Percorso] ADD CONSTRAINT [PK_Percorso] PRIMARY KEY CLUSTERED ([Id_Missione], [Id_Sequenza_Percorso]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Percorso] ADD CONSTRAINT [FK_Percorso_Errori_Percorso] FOREIGN KEY ([Id_Errore_Percorso]) REFERENCES [dbo].[Errori_Percorso] ([Id_Errore_Percorso])
GO
ALTER TABLE [dbo].[Percorso] ADD CONSTRAINT [FK_Percorso_Missioni] FOREIGN KEY ([Id_Missione]) REFERENCES [dbo].[Missioni] ([Id_Missione])
GO
ALTER TABLE [dbo].[Percorso] ADD CONSTRAINT [FK_Percorso_Partizioni] FOREIGN KEY ([Id_Partizione_Sorgente]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Percorso] ADD CONSTRAINT [FK_Percorso_Partizioni1] FOREIGN KEY ([Id_Partizione_Destinazione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Percorso] ADD CONSTRAINT [FK_Percorso_Tipo_Stato_Percorso] FOREIGN KEY ([Id_Tipo_Stato_Percorso]) REFERENCES [dbo].[Tipo_Stato_Percorso] ([Id_Stato_Percorso])
GO
