CREATE TABLE [dbo].[Tipo_Lotti]
(
[Id_Tipo_Lotto] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tipo_Lotti] ADD CONSTRAINT [PK_Tipo_Lotti] PRIMARY KEY CLUSTERED ([Id_Tipo_Lotto]) ON [PRIMARY]
GO
