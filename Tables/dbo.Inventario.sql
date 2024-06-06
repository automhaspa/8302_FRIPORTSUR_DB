CREATE TABLE [dbo].[Inventario]
(
[Id_Inventario] [int] NOT NULL IDENTITY(1, 1),
[SubjectId] [nvarchar] (25) COLLATE Latin1_General_CI_AS NOT NULL,
[Id_Partizione] [int] NOT NULL,
[Id_Udc] [int] NOT NULL,
[Codice_Udc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Anomalia_Posizione] [bit] NOT NULL CONSTRAINT [DF_Inventario_Anomalia_Posizione] DEFAULT ((0)),
[Data_Registrazione] [datetime] NOT NULL CONSTRAINT [DF_Inventario_Data_Registrazione] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventario] ADD CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED ([Id_Inventario]) ON [PRIMARY]
GO
