CREATE TABLE [dbo].[Tipo_EccezionePreparazioneSpedizione]
(
[Id] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Label] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Categoria] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_EccezionePreparazioneSpedizione] ADD CONSTRAINT [PK_Tipo_EccezionePreparazioneSpedizione] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
