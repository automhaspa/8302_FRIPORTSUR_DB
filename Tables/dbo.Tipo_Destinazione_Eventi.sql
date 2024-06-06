CREATE TABLE [dbo].[Tipo_Destinazione_Eventi]
(
[Id] [int] NOT NULL,
[Descrizione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Destinazione_Eventi] ADD CONSTRAINT [PK_Tipo_Destinazione_Eventi] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
