CREATE TABLE [dbo].[Stabilimenti]
(
[Id_Azienda] [int] NOT NULL,
[Id_Stabilimento] [int] NOT NULL IDENTITY(1, 1),
[Codice_Abbreviato] [varchar] (4) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stabilimenti] ADD CONSTRAINT [PK_Stabilimenti] PRIMARY KEY CLUSTERED ([Id_Stabilimento]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stabilimenti] ADD CONSTRAINT [FK_Stabilimenti_Aziende] FOREIGN KEY ([Id_Azienda]) REFERENCES [dbo].[Aziende] ([Id_Azienda])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Associazione all''azienda proprietaria.', 'SCHEMA', N'dbo', 'TABLE', N'Stabilimenti', 'COLUMN', N'Id_Azienda'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identificativo univoco dello stabilimento.', 'SCHEMA', N'dbo', 'TABLE', N'Stabilimenti', 'COLUMN', N'Id_Stabilimento'
GO
