CREATE TABLE [dbo].[Tipo_Messaggi]
(
[Id_Tipo_Messaggio] [int] NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Messaggi] ADD CONSTRAINT [PK_Tipo_Messaggio] PRIMARY KEY CLUSTERED ([Id_Tipo_Messaggio]) ON [PRIMARY]
GO
