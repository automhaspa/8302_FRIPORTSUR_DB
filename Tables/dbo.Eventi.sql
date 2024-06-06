CREATE TABLE [dbo].[Eventi]
(
[Id_Evento] [int] NOT NULL IDENTITY(1, 1),
[Id_Tipo_Evento] [int] NOT NULL,
[Id_Tipo_Stato_Evento] [int] NOT NULL,
[Id_Partizione] [int] NULL,
[Id_Udc] [int] NULL,
[Id_Missione] [int] NULL,
[Id_Sequenza_Percorso] [int] NULL,
[Id_Utente] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Destinazione_Eventi] [int] NULL,
[Sorgente] [varchar] (255) COLLATE Latin1_General_CI_AS NULL,
[DataCreazione] [datetime] NULL CONSTRAINT [DF_Eventi_Date] DEFAULT (getdate()),
[Persistente] [bit] NULL,
[Priorita] [int] NULL,
[JsonParams] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Id_Utente_Presa_In_Carico] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Eventi] ADD CONSTRAINT [PK_Eventi] PRIMARY KEY CLUSTERED ([Id_Evento]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Eventi] ADD CONSTRAINT [FK_Eventi_Eventi] FOREIGN KEY ([Id_Evento]) REFERENCES [dbo].[Eventi] ([Id_Evento])
GO
ALTER TABLE [dbo].[Eventi] ADD CONSTRAINT [FK_Eventi_Partizioni] FOREIGN KEY ([Id_Partizione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Eventi] ADD CONSTRAINT [FK_Eventi_Tipo_Destinazione_Eventi] FOREIGN KEY ([Id_Tipo_Destinazione_Eventi]) REFERENCES [dbo].[Tipo_Destinazione_Eventi] ([Id])
GO
ALTER TABLE [dbo].[Eventi] ADD CONSTRAINT [FK_Eventi_Tipo_Stato_Evento] FOREIGN KEY ([Id_Tipo_Stato_Evento]) REFERENCES [dbo].[Tipo_Stato_Evento] ([Id_Tipo_Stato_Evento])
GO
