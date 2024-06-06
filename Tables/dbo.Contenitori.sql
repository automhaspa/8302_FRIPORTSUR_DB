CREATE TABLE [dbo].[Contenitori]
(
[Id_Contenitore] [int] NOT NULL IDENTITY(1, 1),
[Codice] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Id_Udc] [int] NULL,
[X] [int] NULL,
[Y] [int] NULL,
[Z] [int] NULL,
[Altezza] [int] NULL,
[Larghezza] [int] NULL,
[Profondita] [int] NULL,
[Peso] [int] NULL,
[Jolly1] [varchar] (250) COLLATE Latin1_General_CI_AS NULL,
[Jolly2] [varchar] (250) COLLATE Latin1_General_CI_AS NULL,
[Jolly3] [varchar] (250) COLLATE Latin1_General_CI_AS NULL,
[Jolly4] [varchar] (250) COLLATE Latin1_General_CI_AS NULL,
[Bloccato] [bit] NULL,
[Id_Contenitore_Schema] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contenitori] ADD CONSTRAINT [PK_Contenitori] PRIMARY KEY CLUSTERED ([Id_Contenitore]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contenitori] ADD CONSTRAINT [IX_Contenitori] UNIQUE NONCLUSTERED ([Codice]) ON [PRIMARY]
GO
