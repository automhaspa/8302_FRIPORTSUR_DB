CREATE TABLE [dbo].[Tipo_Stato_Lotto]
(
[Id_Tipo_Stato_Lotto] [varchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Stato_Lotto] ADD CONSTRAINT [PK_Tipo_Stato_Lotto] PRIMARY KEY CLUSTERED ([Id_Tipo_Stato_Lotto]) ON [PRIMARY]
GO
