CREATE TABLE [dbo].[Gruppi]
(
[Id_Gruppo] [int] NOT NULL IDENTITY(1, 1),
[Codice] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[RagSoc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gruppi] ADD CONSTRAINT [PK_Gruppi] PRIMARY KEY CLUSTERED ([Id_Gruppo]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Id del record della tabella "Gruppo"', 'SCHEMA', N'dbo', 'TABLE', N'Gruppi', 'COLUMN', N'Id_Gruppo'
GO
