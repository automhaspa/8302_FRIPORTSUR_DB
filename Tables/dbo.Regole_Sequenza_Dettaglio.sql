CREATE TABLE [dbo].[Regole_Sequenza_Dettaglio]
(
[Id_Sequenza_Regole_Dettaglio] [int] NOT NULL IDENTITY(1, 1),
[Id_Sequenza_Regole] [int] NOT NULL,
[Sequenza] [int] NOT NULL,
[Id_Regola] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Sequenza_Dettaglio] ADD CONSTRAINT [PK_Regole_Sequenza_Dettaglio] PRIMARY KEY CLUSTERED ([Id_Sequenza_Regole_Dettaglio]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regole_Sequenza_Dettaglio] ADD CONSTRAINT [FK_Regole_Sequenza_Dettaglio_Regole] FOREIGN KEY ([Id_Regola]) REFERENCES [dbo].[Regole] ([Id_Regola])
GO
ALTER TABLE [dbo].[Regole_Sequenza_Dettaglio] ADD CONSTRAINT [FK_Regole_Sequenza_Dettaglio_Regole_Sequenza_Testata] FOREIGN KEY ([Id_Sequenza_Regole]) REFERENCES [dbo].[Regole_Sequenza_Testata] ([Id_Sequenza_Regole])
GO
