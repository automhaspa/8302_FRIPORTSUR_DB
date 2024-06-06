CREATE TABLE [dbo].[Errori_Percorso]
(
[Id_Errore_Percorso] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [datetime] NOT NULL,
[Sorgente] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Asi] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_ErrorCode] [int] NULL,
[Errore] [varchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Id_Missione] [int] NULL,
[Id_Sequenza_Percorso] [int] NULL,
[Id_Udc] [int] NULL,
[Id_Partizione_Sorgente] [int] NULL,
[Id_Partizione_Destinazione] [int] NULL,
[Id_Adiacenza] [int] NULL,
[Id_Adiacenza_Composta] [int] NULL,
[sX] [int] NULL,
[sY] [int] NULL,
[sZ] [int] NULL,
[dX] [int] NULL,
[dY] [int] NULL,
[dZ] [int] NULL,
[Data_Chiusura] [datetime] NULL,
[Azione_Chiusura] [varchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ErrorCode] [varchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Errori_Percorso] ADD CONSTRAINT [PK_Errori_Missione] PRIMARY KEY CLUSTERED ([Id_Errore_Percorso]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Errori_Percorso] ADD CONSTRAINT [FK_Adiacenze_Composte_Errori_Perc] FOREIGN KEY ([Id_Adiacenza_Composta]) REFERENCES [dbo].[Adiacenze_Composte] ([Id_Adiacenza_Composta])
GO
ALTER TABLE [dbo].[Errori_Percorso] ADD CONSTRAINT [FK_Adiacenze_Errori_Perc] FOREIGN KEY ([Id_Adiacenza]) REFERENCES [dbo].[Adiacenze] ([Id_Adiacenza])
GO
ALTER TABLE [dbo].[Errori_Percorso] ADD CONSTRAINT [FK_Destinazione_Errori_Perc] FOREIGN KEY ([Id_Partizione_Destinazione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Errori_Percorso] ADD CONSTRAINT [FK_Errori_Percorso_Errori_Percorso] FOREIGN KEY ([Id_Errore_Percorso]) REFERENCES [dbo].[Errori_Percorso] ([Id_Errore_Percorso])
GO
ALTER TABLE [dbo].[Errori_Percorso] ADD CONSTRAINT [FK_Sorgente_Errori_Perc] FOREIGN KEY ([Id_Partizione_Sorgente]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
