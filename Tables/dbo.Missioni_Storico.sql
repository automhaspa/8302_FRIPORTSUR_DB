CREATE TABLE [dbo].[Missioni_Storico]
(
[Id_Missione] [int] NOT NULL,
[Id_Udc] [int] NULL,
[Codice_Udc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id_Tipo_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Partizione_Sorgente] [int] NOT NULL,
[Id_Partizione_Destinazione] [int] NOT NULL,
[Stato_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Data_Storicizzazione] [datetime] NOT NULL CONSTRAINT [DF_Missioni_Storico_Data] DEFAULT (getdate()),
[Data_Creazione] [datetime] NOT NULL,
[Motivo_Cancellazione] [varchar] (255) COLLATE Latin1_General_CI_AS NULL,
[sX] [int] NULL,
[sY] [int] NULL,
[sZ] [int] NULL,
[dX] [int] NULL,
[dY] [int] NULL,
[dZ] [int] NULL,
[Utente] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Data_Esecuzione] [datetime] NULL,
[Configurazione] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Missioni_Storico] WITH NOCHECK ADD CONSTRAINT [FK_Missioni_Storico_Tipo_Missioni] FOREIGN KEY ([Id_Tipo_Missione]) REFERENCES [dbo].[Tipo_Missioni] ([Id_Tipo_Missione])
GO
ALTER TABLE [dbo].[Missioni_Storico] WITH NOCHECK ADD CONSTRAINT [FK_Missioni_Storico_Tipo_Stato_Missioni] FOREIGN KEY ([Stato_Missione]) REFERENCES [dbo].[Tipo_Stato_Missioni] ([Id_Stato_Missione])
GO
