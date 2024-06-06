CREATE TABLE [Logs].[Alarms_Percorso]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Id_Log_Alarms] [int] NOT NULL,
[Id_Missione] [int] NOT NULL,
[Id_Sequenza_Percorso] [int] NOT NULL,
[Id_Udc] [int] NULL,
[Id_Adiacenza] [int] NULL,
[Id_Adiacenza_Composta] [int] NULL,
[Id_Partizione_Sorgente] [int] NULL,
[Id_Partizione_Destinazione] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Logs].[Alarms_Percorso] ADD CONSTRAINT [PK_Alarms_Percorso] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
