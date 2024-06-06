CREATE TABLE [dbo].[Esito_Passi_Mappatura]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Id_Piano_Mappatura] [int] NOT NULL,
[Id_Missione] [int] NOT NULL,
[Id_Partizione_Sorgente] [int] NOT NULL,
[Id_Partizione_Destinazione] [int] NOT NULL,
[Id_Sequenza] [int] NULL,
[Id_Tipo_Stato_Percorso] [int] NOT NULL,
[Id_errore_Percorso] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Data_Esecuzione] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Esito_Passi_Mappatura] ADD CONSTRAINT [PK_Esito_Passi_Mappatura] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
