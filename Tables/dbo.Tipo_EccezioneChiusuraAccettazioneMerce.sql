CREATE TABLE [dbo].[Tipo_EccezioneChiusuraAccettazioneMerce]
(
[Id] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Label] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Categoria] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_EccezioneChiusuraAccettazioneMerce] ADD CONSTRAINT [PK_Tipo_EccezioneChiusuraAccettazioneMerce] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
