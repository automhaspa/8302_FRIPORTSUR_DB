CREATE TABLE [dbo].[Procedure_Personalizzate_Gestione_Messaggi]
(
[Id_Partizione] [int] NOT NULL,
[Id_Tipo_Messaggio] [int] NOT NULL,
[Procedura] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Procedure_Personalizzate_Gestione_Messaggi] ADD CONSTRAINT [PK_Procedure_Personalizzate_Gestione_Messaggi_1] PRIMARY KEY CLUSTERED ([Id_Partizione], [Id_Tipo_Messaggio]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Procedure_Personalizzate_Gestione_Messaggi] ADD CONSTRAINT [FK_Procedure_Personalizzate_Gestione_Messaggi_Partizioni] FOREIGN KEY ([Id_Partizione]) REFERENCES [dbo].[Partizioni] ([ID_PARTIZIONE])
GO
ALTER TABLE [dbo].[Procedure_Personalizzate_Gestione_Messaggi] ADD CONSTRAINT [FK_Procedure_Personalizzate_Gestione_Messaggi_Tipo_Messaggio] FOREIGN KEY ([Id_Tipo_Messaggio]) REFERENCES [dbo].[Tipo_Messaggi] ([Id_Tipo_Messaggio])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identificativo del partizione di riferimento per il componente di associazione alla procedura custom.', 'SCHEMA', N'dbo', 'TABLE', N'Procedure_Personalizzate_Gestione_Messaggi', 'COLUMN', N'Id_Partizione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identificativo univoco al tipo di messaggio da gestire.', 'SCHEMA', N'dbo', 'TABLE', N'Procedure_Personalizzate_Gestione_Messaggi', 'COLUMN', N'Id_Tipo_Messaggio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nome della procedura di gestione del messaggio.', 'SCHEMA', N'dbo', 'TABLE', N'Procedure_Personalizzate_Gestione_Messaggi', 'COLUMN', N'Procedura'
GO
