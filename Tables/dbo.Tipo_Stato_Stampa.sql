CREATE TABLE [dbo].[Tipo_Stato_Stampa]
(
[ID_Tipo_Stato_Stampa] [int] NOT NULL,
[Descrizione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Stato_Stampa] ADD CONSTRAINT [PK_Tipo_Stato_Stampa] PRIMARY KEY CLUSTERED ([ID_Tipo_Stato_Stampa]) ON [PRIMARY]
GO
