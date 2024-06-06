CREATE TABLE [dbo].[Configurazioni]
(
[Chiave] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Valore] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Configurazioni] ADD CONSTRAINT [PK_Configurazioni] PRIMARY KEY CLUSTERED ([Chiave]) ON [PRIMARY]
GO
