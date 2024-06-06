CREATE TABLE [dbo].[Posizioni_Macchine]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [datetime] NOT NULL,
[Id_Partizione_Macchina] [int] NOT NULL,
[Id_Partizione] [int] NULL,
[X] [int] NULL,
[Y] [int] NULL,
[Z] [int] NULL,
[Numero_Posizione] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Posizioni_Macchine] ADD CONSTRAINT [PK_Posizioni_Macchine] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
