CREATE TABLE [dbo].[Tipo_Stato_Stampante]
(
[Id_Stato_Stampante] [int] NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Stato_Stampante] ADD CONSTRAINT [PK_Tipo_Stato_Stampante] PRIMARY KEY CLUSTERED ([Id_Stato_Stampante]) ON [PRIMARY]
GO
