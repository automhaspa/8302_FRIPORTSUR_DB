CREATE TABLE [dbo].[Aziende]
(
[Id_Gruppo] [int] NULL,
[Id_Azienda] [int] NOT NULL IDENTITY(1, 1),
[Codice] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[RagSoc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Fornitore] [bit] NOT NULL,
[Cliente] [bit] NOT NULL,
[Indice_Rotazione] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Priorita] [int] NULL,
[Attributi_Aggiuntivi] [xml] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aziende] ADD CONSTRAINT [PK_Aziende] PRIMARY KEY CLUSTERED ([Id_Azienda]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aziende] ADD CONSTRAINT [FK_Aziende_Gruppi] FOREIGN KEY ([Id_Gruppo]) REFERENCES [dbo].[Gruppi] ([Id_Gruppo])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Id del record della tabella "Azienda"', 'SCHEMA', N'dbo', 'TABLE', N'Aziende', 'COLUMN', N'Id_Azienda'
GO
