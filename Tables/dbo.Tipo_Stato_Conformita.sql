CREATE TABLE [dbo].[Tipo_Stato_Conformita]
(
[Id_Tipo_Stato_Conformita] [int] NOT NULL,
[Descrizione] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL,
[Non_Conformita_Accettazione] [bit] NOT NULL CONSTRAINT [DF_Tipo_Stato_Conformita_Non_Conformita_Accetta] DEFAULT ((0)),
[Non_Conformita_Spedizione] [bit] NOT NULL CONSTRAINT [DF_Tipo_Stato_Conformita_Non_Conformita_Spedizione] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Stato_Conformita] ADD CONSTRAINT [PK_Tipo_Stato_Conformita] PRIMARY KEY CLUSTERED ([Id_Tipo_Stato_Conformita]) ON [PRIMARY]
GO
