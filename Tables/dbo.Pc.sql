CREATE TABLE [dbo].[Pc]
(
[Id_Pc] [int] NOT NULL IDENTITY(1, 1),
[Descrizione] [varchar] (30) COLLATE Latin1_General_CI_AS NOT NULL,
[Ip] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (15) COLLATE Latin1_General_CI_AS NULL,
[Configurazione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pc] ADD CONSTRAINT [PK_Pc] PRIMARY KEY CLUSTERED ([Id_Pc]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Pc] ON [dbo].[Pc] ([Ip]) ON [PRIMARY]
GO
