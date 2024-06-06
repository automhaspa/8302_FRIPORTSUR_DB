CREATE TABLE [dbo].[Regole_Sequenza_Testata]
(
[Id_Sequenza_Regole] [int] NOT NULL IDENTITY(1, 1),
[Id_Insieme_Regole] [int] NOT NULL,
[Descrizione] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Missione] [varchar] (3) COLLATE Latin1_General_CI_AS NULL,
[Id_Tipo_Lista] [varchar] (3) COLLATE Latin1_General_CI_AS NULL,
[Data_Creazione] [datetime] NOT NULL,
[Data_Ultima_Modifica] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Sequenza_Testata] ADD CONSTRAINT [PK_Regole_Sequenza_Testata] PRIMARY KEY CLUSTERED ([Id_Sequenza_Regole]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Sequenza_Testata] ADD CONSTRAINT [FK_Regole_Sequenza_Testata_Regole_Insieme] FOREIGN KEY ([Id_Insieme_Regole]) REFERENCES [dbo].[Regole_Insieme] ([Id_Insieme_Regole])
GO
